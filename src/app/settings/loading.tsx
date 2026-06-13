export default function SettingsLoading() {
  return (
    <div className="px-6 md:px-16 py-12 max-w-3xl animate-pulse">
      <div className="h-8 w-32 bg-steel rounded-lg mb-10" />
      {[140, 120, 110, 130].map((h, i) => (
        <div key={i} className="bg-slate border border-steel rounded-xl p-6 mb-6">
          <div className="h-4 w-28 bg-steel rounded mb-5" />
          <div className="h-10 bg-steel rounded-lg mb-3" />
          <div style={{ height: h - 80 }} className="h-8 w-24 bg-steel rounded-lg" />
        </div>
      ))}
    </div>
  )
}
