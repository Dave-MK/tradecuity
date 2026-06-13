import { NextRequest, NextResponse } from 'next/server'

const DEMO_CANDLES = [
  { t: 0,  o: 1.0740, h: 1.0760, l: 1.0725, c: 1.0755, v: 1200 },
  { t: 1,  o: 1.0755, h: 1.0780, l: 1.0740, c: 1.0770, v: 980  },
  { t: 2,  o: 1.0770, h: 1.0790, l: 1.0750, c: 1.0760, v: 1100 },
  { t: 3,  o: 1.0760, h: 1.0800, l: 1.0755, c: 1.0795, v: 1350 },
  { t: 4,  o: 1.0795, h: 1.0820, l: 1.0780, c: 1.0810, v: 900  },
  { t: 5,  o: 1.0810, h: 1.0840, l: 1.0800, c: 1.0830, v: 1050 },
  { t: 6,  o: 1.0830, h: 1.0855, l: 1.0815, c: 1.0820, v: 1200 },
  { t: 7,  o: 1.0820, h: 1.0845, l: 1.0810, c: 1.0840, v: 870  },
  { t: 8,  o: 1.0840, h: 1.0870, l: 1.0830, c: 1.0860, v: 1400 },
  { t: 9,  o: 1.0860, h: 1.0890, l: 1.0848, c: 1.0875, v: 1100 },
  { t: 10, o: 1.0875, h: 1.0900, l: 1.0855, c: 1.0865, v: 950  },
  { t: 11, o: 1.0865, h: 1.0895, l: 1.0860, c: 1.0888, v: 1050 },
  { t: 12, o: 1.0888, h: 1.0920, l: 1.0875, c: 1.0910, v: 1300 },
]

export async function GET(req: NextRequest) {
  const { searchParams } = req.nextUrl
  const ticker   = searchParams.get('ticker')   ?? 'C:EURUSD'
  const timespan = searchParams.get('timespan') ?? 'day'
  const from     = searchParams.get('from')     ?? '2024-01-01'
  const to       = searchParams.get('to')       ?? '2024-03-01'

  const apiKey = process.env.POLYGON_API_KEY

  // No key configured — return demo data so lessons still work
  if (!apiKey) {
    return NextResponse.json({ results: DEMO_CANDLES, source: 'demo' })
  }

  try {
    const url = `https://api.polygon.io/v2/aggs/ticker/${ticker}/range/1/${timespan}/${from}/${to}?adjusted=true&sort=asc&limit=50&apiKey=${apiKey}`
    const res = await fetch(url, { next: { revalidate: 300 } })

    if (!res.ok) {
      return NextResponse.json({ results: DEMO_CANDLES, source: 'demo' })
    }

    const data = await res.json()
    const candles = (data.results ?? []).map(
      (r: { t: number; o: number; h: number; l: number; c: number; v: number }, i: number) => ({
        t: i, o: r.o, h: r.h, l: r.l, c: r.c, v: r.v,
      })
    )

    return NextResponse.json({
      results: candles.length > 0 ? candles : DEMO_CANDLES,
      source:  candles.length > 0 ? 'polygon' : 'demo',
    })
  } catch {
    return NextResponse.json({ results: DEMO_CANDLES, source: 'demo' })
  }
}
