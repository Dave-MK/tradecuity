import Link from 'next/link'
import { TrenduosoWordmark } from '@/components/TrenduosoWordmark'
import Image from 'next/image'

export default function NotFound() {
  return (
    <div className="min-h-screen bg-obsidian flex items-center justify-center px-4">
      <div className="text-center max-w-sm">
        <Link href="/" className="flex items-center justify-center gap-2.5 mb-12">
          <Image src="/logo-colour.webp" width={40} height={40} alt="Trenduoso" style={{ width: 40, height: 40 }} />
          <span className="font-display font-bold tracking-[-0.03em] text-2xl">
            <TrenduosoWordmark />
          </span>
        </Link>

        <p className="font-mono text-[72px] font-medium text-steel leading-none mb-4">404</p>
        <h1 className="font-display font-bold text-chalk text-xl mb-2">Page not found</h1>
        <p className="text-ghost font-body text-sm leading-relaxed mb-8">
          This page doesn&apos;t exist — it may have moved or the link is wrong.
        </p>

        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <Link
            href="/"
            className="bg-acuity-blue text-white font-display font-medium text-sm px-5 py-2.5 rounded-lg hover:bg-acuity-blue/90 transition-colors"
          >
            Go home
          </Link>
          <Link
            href="/courses"
            className="border border-steel text-chalk font-display font-medium text-sm px-5 py-2.5 rounded-lg hover:border-acuity-blue transition-colors"
          >
            Browse courses
          </Link>
        </div>
      </div>
    </div>
  )
}

