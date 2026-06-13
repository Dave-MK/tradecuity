import { MetadataRoute } from 'next'

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
      disallow: ['/api/', '/dashboard', '/settings', '/profile', '/journal', '/practice'],
    },
    sitemap: 'https://trenduoso.com/sitemap.xml',
  }
}
