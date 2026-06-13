import { Navbar } from '@/components/nav/Navbar'
import { PracticeSim } from './PracticeSim'
import { createClient } from '@/lib/supabase/server'

export const metadata = {
  title: 'Practice — Trenduoso',
  description: 'Paper trade on simulated market data. No risk, real discipline.',
}

export default async function PracticePage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  let plan = 'free'
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('plan')
      .eq('id', user.id)
      .single()
    plan = profile?.plan ?? 'free'
  }

  return (
    <>
      <Navbar />
      <PracticeSim plan={plan} isLoggedIn={!!user} />
    </>
  )
}
