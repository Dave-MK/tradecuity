export default function CoursesLoading() {
  return (
    <div className="px-6 md:px-16 py-12 animate-pulse">
      <div className="mb-8">
        <div className="h-8 w-40 bg-steel rounded mb-2" />
        <div className="h-4 w-64 bg-steel/60 rounded" />
      </div>

      {/* Tab row */}
      <div className="flex gap-2 mt-6 overflow-hidden">
        {[...Array(6)].map((_, i) => (
          <div key={i} className="h-8 w-20 bg-slate border border-steel rounded-lg flex-shrink-0" />
        ))}
      </div>

      {/* Track filters */}
      <div className="flex gap-2 mt-3">
        {[...Array(5)].map((_, i) => (
          <div key={i} className="h-6 w-16 bg-slate border border-steel/50 rounded-md" />
        ))}
      </div>

      {/* Course grid sections */}
      <div className="mt-8 space-y-10">
        {[...Array(3)].map((_, s) => (
          <div key={s}>
            <div className="flex items-center gap-3 mb-5">
              <div className="w-14 h-14 rounded bg-steel" />
              <div className="space-y-2">
                <div className="h-2.5 w-14 bg-steel/60 rounded" />
                <div className="h-5 w-36 bg-steel rounded" />
                <div className="h-2.5 w-20 bg-steel/60 rounded" />
              </div>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {[...Array(3)].map((_, i) => (
                <div key={i} className="bg-slate border border-steel rounded-xl p-5 space-y-3">
                  <div className="flex gap-2">
                    <div className="w-9 h-9 bg-steel rounded" />
                    <div className="h-5 w-20 bg-steel/60 rounded" />
                  </div>
                  <div className="h-4 w-full bg-steel rounded" />
                  <div className="h-3 w-full bg-steel/60 rounded" />
                  <div className="h-3 w-3/4 bg-steel/60 rounded" />
                  <div className="h-0.5 bg-steel rounded" />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
