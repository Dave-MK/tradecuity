import { Navbar } from '@/components/nav/Navbar'
import { WaitlistForm } from './WaitlistForm'

export const metadata = {
  title: 'Community — Trenduoso',
  description: 'Join the Trenduoso community of analytical traders.',
}

const FEATURES = [
  { icon: '💬', title: 'Trade discussions', desc: 'Share setups, get feedback, and discuss ideas with other analytical traders.' },
  { icon: '📊', title: 'Journal sharing', desc: 'Opt-in to share your trade journal and learn from others\' processes.' },
  { icon: '🏆', title: 'Weekly challenges', desc: 'Compete on graded chart exercises and see how you rank.' },
  { icon: '👥', title: 'Study groups', desc: 'Join small cohorts working through the same course level as you.' },
]

export default function CommunityPage() {
  return (
    <>
      <Navbar />
      <main className="px-6 md:px-16 py-20 max-w-4xl mx-auto">
        {/* Coming soon badge */}
        <div className="inline-flex items-center gap-2 bg-amber/10 border border-amber/20 rounded-full px-3 py-1 mb-8">
          <span className="w-1.5 h-1.5 rounded-full bg-amber" />
          <span className="text-[11px] font-display font-medium tracking-widest text-amber uppercase">Coming soon</span>
        </div>

        <h1 className="font-display font-bold text-4xl md:text-5xl text-chalk mb-4 leading-tight">
          Trade with a community<br />
          <span className="text-acuity-blue">of serious learners.</span>
        </h1>

        <p className="text-ghost font-body text-base md:text-lg max-w-xl leading-relaxed mb-12">
          The Trenduoso community is where analytical traders share work, challenge each other, and accelerate progress together. We&apos;re building it now.
        </p>

        {/* Feature grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-14">
          {FEATURES.map((f) => (
            <div key={f.title} className="bg-slate border border-steel rounded-xl p-5">
              <span className="text-2xl mb-3 block">{f.icon}</span>
              <h3 className="font-display font-semibold text-chalk text-sm mb-1">{f.title}</h3>
              <p className="text-ghost font-body text-[13px] leading-relaxed">{f.desc}</p>
            </div>
          ))}
        </div>

        {/* Waitlist */}
        <div className="bg-slate border border-steel rounded-2xl p-8 max-w-md">
          <h2 className="font-display font-bold text-chalk text-xl mb-1">Get early access</h2>
          <p className="text-ghost text-sm font-body mb-6 leading-relaxed">
            Join the waitlist and we&apos;ll let you in first when it launches.
          </p>
          <WaitlistForm />
        </div>
      </main>
    </>
  )
}
