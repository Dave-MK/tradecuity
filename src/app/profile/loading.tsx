export default function ProfileLoading() {
  return (
    <div className="flex flex-col lg:flex-row min-h-[calc(100vh-53px)] animate-pulse">
      {/* Sidebar skeleton */}
      <aside className="w-full lg:w-64 border-b lg:border-b-0 lg:border-r border-steel bg-slate flex-shrink-0 px-6 py-8">
        <div className="flex flex-row lg:flex-col items-center gap-4 lg:gap-0 mb-6">
          <div className="w-16 h-16 lg:w-20 lg:h-20 rounded-full bg-steel flex-shrink-0" />
          <div className="space-y-2">
            <div className="h-4 w-32 bg-steel rounded" />
            <div className="h-3 w-24 bg-steel/60 rounded" />
          </div>
          <div className="ml-auto lg:ml-0 lg:mt-4 w-14 h-14 rounded bg-steel" />
        </div>
        <div className="flex justify-around py-4 border-y border-steel mb-6">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="space-y-1 text-center">
              <div className="h-5 w-12 bg-steel rounded mx-auto" />
              <div className="h-2.5 w-8 bg-steel/60 rounded mx-auto" />
            </div>
          ))}
        </div>
        <div className="h-3 w-24 bg-steel/60 rounded mb-3" />
        <div className="space-y-3">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="flex items-center gap-2.5 py-2 border-b border-steel/50">
              <div className="w-6 h-6 rounded bg-steel" />
              <div className="space-y-1">
                <div className="h-3 w-24 bg-steel rounded" />
                <div className="h-2.5 w-16 bg-steel/60 rounded" />
              </div>
            </div>
          ))}
        </div>
      </aside>

      {/* Main content skeleton */}
      <div className="flex-1 px-6 lg:px-8 py-8 space-y-6">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 lg:gap-4">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="bg-slate border border-steel rounded-xl p-5">
              <div className="h-2.5 w-16 bg-steel/60 rounded mb-3" />
              <div className="h-7 w-20 bg-steel rounded" />
            </div>
          ))}
        </div>
        <div className="bg-slate border border-steel rounded-xl p-6">
          <div className="h-2.5 w-24 bg-steel/60 rounded mb-4" />
          <div className="h-36 bg-steel/20 rounded" />
        </div>
        <div>
          <div className="h-2.5 w-28 bg-steel/60 rounded mb-4" />
          <div className="space-y-4">
            {[...Array(4)].map((_, i) => (
              <div key={i} className="flex items-center gap-4">
                <div className="h-5 w-24 bg-steel/40 rounded" />
                <div className="flex-1 space-y-1">
                  <div className="flex justify-between">
                    <div className="h-3 w-40 bg-steel rounded" />
                    <div className="h-3 w-12 bg-steel/60 rounded" />
                  </div>
                  <div className="h-0.5 bg-steel rounded" />
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
