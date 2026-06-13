import { redirect } from 'next/navigation'
import { Navbar } from '@/components/nav/Navbar'
import { createClient } from '@/lib/supabase/server'
import { JournalClient } from './JournalClient'

export const metadata = { title: 'Trade Journal — Trenduoso' }

export default async function JournalPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Gracefully handle missing table (before migration is run)
  let entries: object[] = []
  try {
    const { data } = await supabase
      .from('journal_entries')
      .select('id, trade_date, instrument, direction, entry_price, exit_price, size, pnl, rating, notes')
      .eq('user_id', user.id)
      .order('trade_date', { ascending: false })
    entries = data ?? []
  } catch {
    entries = []
  }

  return (
    <>
      <Navbar />
      <main className="px-6 md:px-16 py-12 max-w-4xl">
        <div className="mb-8">
          <h1 className="font-display font-bold text-3xl text-chalk mb-1">Trade Journal</h1>
          <p className="text-ghost font-body text-sm">
            Log every trade. Review your process. Build real edge.
          </p>
        </div>
        <JournalClient initialEntries={entries as Parameters<typeof JournalClient>[0]['initialEntries']} />
      </main>
    </>
  )
}
