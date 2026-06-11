import Image from 'next/image'
import Link from 'next/link'
import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { levelFromXp } from '@/lib/xp'

const DAYS = ['M', 'T', 'W', 'T', 'F', 'S', 'S']

const NAV_ITEMS = [
  { label: 'Dashboard', href: '/dashboard', active: true,  icon: '⬛' },
  { label: 'Courses',   href: '/courses',   active: false, icon: '📚' },
  { label: 'Practice',  href: '#',          active: false, icon: '🎯' },
  { label: 'Journal',   href: '#',          active: false, icon: '📓' },
  { label: 'Settings',  href: '#',          active: false, icon: '⚙' },
]

const WATCHLIST = [
  { symbol: 'EURUSD', price: '1.0847', change: '+0.23%', bull: true },
  { symbol: 'SPX',    price: '5,241',  change: '−0.41%', bull: false },
  { symbol: 'BTCUSD', price: '67,430', change: '+1.07%', bull: true },
  { symbol: 'GOLD',   price: '2,318',  change: '+0.56%', bull: true },
]

function getInitials(name: string): string {
  return name.split(' ').map(n => n[0]).join('').slice(0, 2).toUpperCase()
}

function shortName(name: string): string {
  const parts = name.trim().split(' ')
  if (parts.length < 2) return name
  return `${parts[0]} ${parts[1][0]}.`
}

function relativeTime(iso: string): string {
  const diffH = Math.floor((Date.now() - new Date(iso).getTime()) / 3_600_000)
  if (diffH < 1) return 'Just now'
  if (diffH < 24) return `${diffH}h ago`
  const d = Math.floor(diffH / 24)
  return d === 1 ? 'Yesterday' : `${d} days ago`
}

export default async function DashboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const [
    { data: profile },
    { data: recentRows },
    { data: allProgress },
    { data: weekRows },
  ] = await Promise.all([
    supabase
      .from('profiles')
      .select('display_name, xp, streak, plan')
      .eq('id', user.id)
      .single(),
    supabase
      .from('user_progress')
      .select('score, completed_at, lessons(title, courses(title))')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })
      .limit(5),
    supabase
      .from('user_progress')
      .select('completed, lessons(course_id, courses(id, title, slug, track, lesson_count))')
      .eq('user_id', user.id),
    supabase
      .from('user_progress')
      .select('completed_at, lessons(xp_value)')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .gte('completed_at', new Date(Date.now() - 7 * 86_400_000).toISOString()),
  ])

  const xp = profile?.xp ?? 0
  const streak = profile?.streak ?? 0
  const displayName = profile?.display_name ?? user.email?.split('@')[0] ?? 'Learner'
  const { level, progress: levelProgress } = levelFromXp(xp)

  // Weekly XP bar data (Mon=0 … Sun=6)
  const xpByDay = [0, 0, 0, 0, 0, 0, 0]
  for (const row of (weekRows ?? [])) {
    if (!row.completed_at) continue
    const day = (new Date(row.completed_at).getDay() + 6) % 7
    const lesson = row.lessons as unknown as { xp_value: number } | null
    xpByDay[day] += lesson?.xp_value ?? 50
  }
  const maxDayXp = Math.max(...xpByDay, 1)

  // Course progress aggregation
  type CourseRow = { id: string; title: string; slug: string; track: string; lesson_count: number; completed: number }
  const courseMap = new Map<string, CourseRow>()
  for (const p of (allProgress ?? [])) {
    const lesson = p.lessons as unknown as { course_id: string; courses: CourseRow } | null
    if (!lesson?.courses) continue
    const c = lesson.courses
    const existing = courseMap.get(c.id)
    if (!existing) {
      courseMap.set(c.id, { ...c, completed: p.completed ? 1 : 0 })
    } else if (p.completed) {
      existing.completed++
    }
  }
  const courseList = Array.from(courseMap.values())
  const inProgress   = courseList.filter(c => c.completed > 0 && c.completed < c.lesson_count)
  const completedCourses = courseList.filter(c => c.lesson_count > 0 && c.completed >= c.lesson_count)

  // Activity feed
  type ActivityRow = {
    title: string
    course: string
    score: number | null
    completedAt: string
  }
  const activity: ActivityRow[] = (recentRows ?? []).map((r) => {
    const lesson = r.lessons as unknown as { title: string; courses: { title: string } | null } | null
    return {
      title: lesson?.title ?? 'Lesson',
      course: lesson?.courses?.title ?? '',
      score: r.score,
      completedAt: r.completed_at ?? '',
    }
  })

  return (
    <div className="flex h-screen bg-obsidian overflow-hidden">
      {/* Sidebar */}
      <aside className="w-52 bg-slate border-r border-steel flex flex-col flex-shrink-0">
        <div className="px-4 py-4 border-b border-steel">
          <Link href="/" className="flex items-center gap-2">
            <Image src="/logo-colour.webp" width={32} height={32} alt="tradecuity" style={{ width: 32, height: 32 }} />
            <span className="font-display font-bold tracking-[-0.03em] text-xl">
              <span className="text-chalk">trade</span><span className="text-acuity-blue">cuity</span>
            </span>
          </Link>
        </div>

        <div className="px-4 py-4 border-b border-steel">
          <div className="flex items-center gap-2.5 mb-3">
            <div className="w-9 h-9 rounded-full bg-acuity-blue flex items-center justify-center text-white text-sm font-display font-bold">
              {getInitials(displayName)}
            </div>
            <div>
              <p className="font-display font-semibold text-chalk text-[13px]">{shortName(displayName)}</p>
              <p className="font-mono text-[11px] text-ghost">{xp.toLocaleString()} XP</p>
            </div>
          </div>
          <div className="h-1 bg-steel rounded-full overflow-hidden mb-1">
            <div className="h-full bg-acuity-blue rounded-full" style={{ width: `${levelProgress}%` }} />
          </div>
          <p className="text-[10px] text-ghost font-body">Level {level} · {levelProgress}% to next</p>
        </div>

        <nav className="flex-1 px-2 py-3">
          {NAV_ITEMS.map((item) => (
            <Link
              key={item.label}
              href={item.href}
              className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-[13px] font-body mb-0.5 transition-colors
                ${item.active
                  ? 'bg-acuity-blue/10 text-acuity-blue border-l-2 border-acuity-blue'
                  : 'text-ghost hover:text-chalk hover:bg-steel'
                }`}
            >
              <span className="text-base">{item.icon}</span>
              {item.label}
            </Link>
          ))}
        </nav>

        <div className="px-4 py-4 border-t border-steel">
          <p className="text-[10px] font-display font-medium tracking-widest text-ghost uppercase mb-2">Streak</p>
          <div className="flex items-center gap-1.5">
            <span className="font-mono font-medium text-3xl text-chalk">{streak}</span>
            <span className="text-2xl">🔥</span>
          </div>
          <p className="text-[11px] text-ghost font-body mt-0.5">days in a row</p>
        </div>
      </aside>

      {/* Main content */}
      <div className="flex flex-1 overflow-hidden">
        <main className="flex-1 overflow-y-auto px-8 py-6">

          {/* Continue learning */}
          <div className="mb-6">
            <p className="text-[10px] font-display font-medium tracking-widest text-ghost uppercase mb-3">Continue learning</p>
            {inProgress.length === 0 && completedCourses.length === 0 ? (
              <div className="bg-slate border border-steel rounded-xl p-6 text-center">
                <p className="text-ghost text-sm font-body mb-3">No courses started yet.</p>
                <Link
                  href="/courses"
                  className="inline-block bg-acuity-blue text-white text-sm font-display font-medium px-4 py-2.5 rounded-lg hover:bg-acuity-blue/90 transition-colors"
                >
                  Browse courses →
                </Link>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {inProgress[0] && (() => {
                  const c = inProgress[0]
                  const pct = Math.round((c.completed / c.lesson_count) * 100)
                  return (
                    <div className="bg-slate border border-acuity-blue/40 rounded-xl p-5">
                      <span className={`text-[9px] font-display font-medium tracking-widest uppercase px-2 py-1 rounded ${c.track === 'technical' ? 'text-acuity-teal bg-acuity-teal/10' : 'text-acuity-blue bg-acuity-blue/10'}`}>
                        {c.track}
                      </span>
                      <h3 className="font-display font-semibold text-chalk text-base mt-2 mb-1">{c.title}</h3>
                      <p className="text-[11px] text-ghost font-body mb-4">Lesson {c.completed} of {c.lesson_count} · In progress</p>
                      <div className="h-0.5 bg-steel rounded-full overflow-hidden mb-4">
                        <div className="h-full bg-acuity-blue rounded-full" style={{ width: `${pct}%` }} />
                      </div>
                      <Link
                        href={`/courses/${c.slug}`}
                        className="block w-full text-center bg-acuity-blue text-white text-sm font-display font-medium py-2.5 rounded-lg hover:bg-acuity-blue/90 transition-colors"
                      >
                        Continue →
                      </Link>
                    </div>
                  )
                })()}

                {completedCourses[0] && (() => {
                  const c = completedCourses[0]
                  return (
                    <div className="bg-slate border border-steel rounded-xl p-5">
                      <span className={`text-[9px] font-display font-medium tracking-widest uppercase px-2 py-1 rounded ${c.track === 'technical' ? 'text-acuity-teal bg-acuity-teal/10' : 'text-acuity-blue bg-acuity-blue/10'}`}>
                        {c.track}
                      </span>
                      <h3 className="font-display font-semibold text-chalk text-base mt-2 mb-1">{c.title}</h3>
                      <p className="text-[11px] text-ghost font-body mb-4">Completed · 100%</p>
                      <div className="h-0.5 bg-acuity-teal rounded-full mb-4" />
                      <Link
                        href={`/courses/${c.slug}`}
                        className="block w-full text-center border border-steel text-ghost text-sm font-display font-medium py-2.5 rounded-lg hover:border-acuity-blue hover:text-chalk transition-colors"
                      >
                        Review
                      </Link>
                    </div>
                  )
                })()}
              </div>
            )}
          </div>

          {/* XP chart */}
          <div className="bg-slate border border-steel rounded-xl p-5 mb-6">
            <p className="text-[10px] font-display font-medium tracking-widest text-ghost uppercase mb-4">XP this week</p>
            <div className="flex items-end justify-between gap-2 h-24">
              {xpByDay.map((dayXp, i) => (
                <div key={i} className="flex flex-col items-center gap-1 flex-1">
                  <div
                    className="w-full rounded-sm bg-acuity-blue/30 border-t border-acuity-blue transition-all"
                    style={{ height: dayXp > 0 ? `${(dayXp / maxDayXp) * 80}px` : '2px', opacity: dayXp > 0 ? 1 : 0.3 }}
                  />
                  <span className="text-[10px] text-ghost font-mono">{DAYS[i]}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Recent activity */}
          <div>
            <p className="text-[10px] font-display font-medium tracking-widest text-ghost uppercase mb-3">Recent activity</p>
            {activity.length === 0 ? (
              <p className="text-ghost text-sm font-body py-4">No activity yet — complete a lesson to see it here.</p>
            ) : (
              <div className="space-y-0">
                {activity.map((a, idx) => (
                  <div key={idx} className="flex items-center justify-between py-3 border-b border-steel/50 last:border-0">
                    <div className="flex items-center gap-3">
                      <span className="w-2 h-2 rounded-full bg-acuity-teal flex-shrink-0" />
                      <div>
                        <p className="text-chalk text-[13px] font-body">{a.title}</p>
                        <p className="text-ghost text-[11px] font-body">{a.course}{a.course && ' · '}{relativeTime(a.completedAt)}</p>
                      </div>
                    </div>
                    <span className={`font-mono text-sm font-medium ${a.score != null ? 'text-acuity-teal' : 'text-ghost'}`}>
                      {a.score != null ? `+${a.score} XP` : 'Done'}
                    </span>
                  </div>
                ))}
              </div>
            )}
          </div>
        </main>

        {/* Right sidebar */}
        <aside className="w-56 border-l border-steel bg-slate flex-shrink-0 overflow-y-auto px-4 py-6">
          <p className="text-[10px] font-display font-medium tracking-widest text-ghost uppercase mb-3">Practice Watchlist</p>
          <div className="space-y-0">
            {WATCHLIST.map((t) => (
              <div key={t.symbol} className="flex items-center justify-between py-2 border-b border-steel/50 last:border-0">
                <span className="font-mono text-[11px] font-medium text-chalk">{t.symbol}</span>
                <div className="flex flex-col items-end">
                  <span className="font-mono text-[11px] text-chalk">{t.price}</span>
                  <span className={`font-mono text-[10px] px-1.5 py-0.5 rounded ${t.bull ? 'text-acuity-teal bg-acuity-teal/10' : 'text-bear-red bg-bear-red/10'}`}>
                    {t.change}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </aside>
      </div>
    </div>
  )
}
