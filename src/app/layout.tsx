import type { Metadata } from 'next'
import { Oxanium, Inter, JetBrains_Mono } from 'next/font/google'
import { CookieBanner } from '@/components/CookieBanner'
import '@/styles/globals.css'

const oxanium = Oxanium({
  subsets: ['latin'],
  weight: ['400', '500', '600', '700', '800'],
  variable: '--font-display',
})

const inter = Inter({
  subsets: ['latin'],
  weight: ['400', '500'],
  variable: '--font-body',
})

const jetbrainsMono = JetBrains_Mono({
  subsets: ['latin'],
  weight: ['400', '500'],
  variable: '--font-mono',
})

export const metadata: Metadata = {
  title: {
    default: 'Trenduoso — Trading Intelligence',
    template: '%s — Trenduoso',
  },
  description: 'Interactive trading education. Draw on real charts, get scored, and build genuine analytical edge. Structured courses from paper trader to professional.',
  keywords: ['trading education', 'chart analysis', 'technical analysis', 'trading courses', 'learn to trade', 'price action', 'forex education'],
  authors: [{ name: 'Trenduoso' }],
  creator: 'Trenduoso',
  metadataBase: new URL('https://trenduoso.com'),
  openGraph: {
    type: 'website',
    siteName: 'Trenduoso',
    title: 'Trenduoso — Trading Intelligence',
    description: 'Interactive trading education. Draw on real charts, get scored, and build genuine analytical edge.',
    url: 'https://trenduoso.com',
    images: [{ url: '/og-image.png', width: 1200, height: 630, alt: 'Trenduoso' }],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Trenduoso — Trading Intelligence',
    description: 'Interactive trading education. Draw on real charts, get scored, and build genuine analytical edge.',
    images: ['/og-image.png'],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: { index: true, follow: true, 'max-image-preview': 'large' },
  },
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${oxanium.variable} ${inter.variable} ${jetbrainsMono.variable}`}>
      <body className="bg-obsidian text-chalk font-body antialiased">
        {children}
        <CookieBanner />
      </body>
    </html>
  )
}
