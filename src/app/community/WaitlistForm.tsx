'use client'
import { useState, useTransition } from 'react'
import { joinWaitlist } from '@/app/actions/waitlist'

export function WaitlistForm() {
  const [email, setEmail] = useState('')
  const [done, setDone] = useState(false)
  const [error, setError] = useState('')
  const [isPending, startTransition] = useTransition()

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError('')
    startTransition(async () => {
      const result = await joinWaitlist(email)
      if (result.error) {
        setError(result.error)
      } else {
        setDone(true)
      }
    })
  }

  if (done) {
    return (
      <div className="text-center py-4">
        <div className="w-10 h-10 rounded-full bg-acuity-teal/20 flex items-center justify-center mx-auto mb-3">
          <span className="text-acuity-teal text-lg">✓</span>
        </div>
        <p className="font-display font-semibold text-chalk text-sm">You&apos;re on the list!</p>
        <p className="text-ghost text-[12px] font-body mt-1">We&apos;ll email you as soon as community access opens.</p>
      </div>
    )
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-2">
      <div className="flex gap-2">
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
          disabled={isPending}
          placeholder="you@example.com"
          className="flex-1 bg-obsidian border border-steel rounded-lg px-4 py-2.5 text-chalk text-sm font-body placeholder:text-muted focus:outline-none focus:border-acuity-blue transition-colors disabled:opacity-50"
        />
        <button
          type="submit"
          disabled={isPending}
          className="bg-acuity-blue text-white font-display font-medium text-sm px-4 py-2.5 rounded-lg hover:bg-acuity-blue/90 transition-colors flex-shrink-0 disabled:opacity-50"
        >
          {isPending ? 'Joining…' : 'Join'}
        </button>
      </div>
      {error && <p className="text-bear-red text-[12px] font-body">{error}</p>}
    </form>
  )
}
