export default function CourseDetailLoading() {
  return (
    <div className="px-6 md:px-16 py-12 max-w-3xl animate-pulse">
      <div className="h-4 w-24 bg-steel rounded mb-6" />

      <div className="flex items-center gap-3 mb-4">
        <div className="w-20 h-20 bg-steel rounded flex-shrink-0" />
        <div className="space-y-2">
          <div className="h-3 w-28 bg-steel rounded" />
          <div className="h-3 w-20 bg-steel rounded" />
        </div>
      </div>

      <div className="h-8 w-64 bg-steel rounded-lg mb-2" />
      <div className="h-4 w-96 bg-steel rounded mb-4" />
      <div className="flex gap-6 mb-8">
        {[60, 48, 72].map((w, i) => (
          <div key={i} style={{ width: w }} className="h-3 bg-steel rounded" />
        ))}
      </div>

      <div className="space-y-3 mt-6">
        {[1, 2, 3, 4, 5, 6].map((i) => (
          <div key={i} className="bg-slate border border-steel rounded-xl p-4 flex items-center gap-4">
            <div className="w-7 h-7 rounded-full bg-steel flex-shrink-0" />
            <div className="flex-1 space-y-1.5">
              <div className="h-4 w-48 bg-steel rounded" />
              <div className="h-3 w-16 bg-steel rounded" />
            </div>
            <div className="h-3 w-12 bg-steel rounded" />
          </div>
        ))}
      </div>
    </div>
  )
}
