export default function DashboardLoading() {
  return (
    <div className="flex h-screen bg-obsidian overflow-hidden">
      {/* Left sidebar skeleton */}
      <aside className="hidden lg:flex w-52 bg-slate border-r border-steel flex-col flex-shrink-0 animate-pulse">
        <div className="px-4 py-4 border-b border-steel">
          <div className="h-6 w-32 bg-steel rounded" />
        </div>
        <div className="px-4 py-4 border-b border-steel space-y-3">
          <div className="flex items-center gap-2.5">
            <div className="w-9 h-9 rounded-full bg-steel" />
            <div className="space-y-1.5">
              <div className="h-3 w-20 bg-steel rounded" />
              <div className="h-2.5 w-14 bg-steel/60 rounded" />
            </div>
          </div>
          <div className="h-1 bg-steel rounded-full" />
        </div>
        <div className="flex-1 px-2 py-3 space-y-1">
          {[...Array(5)].map((_, i) => (
            <div key={i} className="h-8 bg-steel/40 rounded-lg" />
          ))}
        </div>
      </aside>

      {/* Main content skeleton */}
      <div className="flex-1 overflow-hidden">
        <main className="overflow-y-auto px-4 sm:px-6 lg:px-8 py-6 space-y-6 animate-pulse">
          {/* Mobile top bar */}
          <div className="lg:hidden flex items-center justify-between pb-3 border-b border-steel">
            <div className="flex items-center gap-2.5">
              <div className="w-8 h-8 rounded-full bg-steel" />
              <div className="space-y-1">
                <div className="h-3 w-24 bg-steel rounded" />
                <div className="h-2.5 w-16 bg-steel/60 rounded" />
              </div>
            </div>
            <div className="h-7 w-16 bg-steel rounded" />
          </div>

          <div>
            <div className="h-3 w-28 bg-steel/60 rounded mb-3" />
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {[...Array(2)].map((_, i) => (
                <div key={i} className="bg-slate border border-steel rounded-xl p-5 space-y-3">
                  <div className="h-3 w-16 bg-steel/60 rounded" />
                  <div className="h-4 w-40 bg-steel rounded" />
                  <div className="h-2 w-full bg-steel/60 rounded" />
                  <div className="h-8 bg-steel rounded-lg" />
                </div>
              ))}
            </div>
          </div>

          <div className="bg-slate border border-steel rounded-xl p-5">
            <div className="h-3 w-24 bg-steel/60 rounded mb-4" />
            <div className="flex items-end gap-2 h-24">
              {[...Array(7)].map((_, i) => (
                <div key={i} className="flex-1 flex flex-col items-center gap-1">
                  <div className="w-full bg-steel rounded-sm" style={{ height: `${20 + Math.random() * 60}px` }} />
                  <div className="h-2 w-2 bg-steel/60 rounded" />
                </div>
              ))}
            </div>
          </div>

          <div className="space-y-3">
            {[...Array(5)].map((_, i) => (
              <div key={i} className="flex items-center justify-between py-3 border-b border-steel/50">
                <div className="flex items-center gap-3">
                  <div className="w-2 h-2 rounded-full bg-steel" />
                  <div className="space-y-1">
                    <div className="h-3 w-40 bg-steel rounded" />
                    <div className="h-2.5 w-24 bg-steel/60 rounded" />
                  </div>
                </div>
                <div className="h-3 w-12 bg-steel/60 rounded" />
              </div>
            ))}
          </div>
        </main>
      </div>
    </div>
  )
}
