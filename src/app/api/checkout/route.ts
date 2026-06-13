import { NextRequest, NextResponse } from 'next/server'
import Stripe from 'stripe'
import { createClient } from '@/lib/supabase/server'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY ?? '', {
  apiVersion: '2024-04-10',
})

const PRICE_IDS: Record<string, string> = {
  pro_monthly: process.env.NEXT_PUBLIC_STRIPE_PRICE_PRO_MONTHLY ?? '',
  pro_annual:  process.env.NEXT_PUBLIC_STRIPE_PRICE_PRO_ANNUAL  ?? '',
}

export async function POST(req: NextRequest) {
  if (!process.env.STRIPE_SECRET_KEY) {
    return NextResponse.json({ error: 'Payments not configured.' }, { status: 503 })
  }

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) {
    return NextResponse.json({ error: 'Must be signed in to upgrade.' }, { status: 401 })
  }

  const { plan } = await req.json() as { plan: string }
  const priceId = PRICE_IDS[plan]

  if (!priceId) {
    return NextResponse.json({ error: 'Invalid plan.' }, { status: 400 })
  }

  const { data: profile } = await supabase
    .from('profiles')
    .select('stripe_customer_id')
    .eq('id', user.id)
    .single()

  let customerId = profile?.stripe_customer_id as string | undefined

  if (!customerId) {
    const customer = await stripe.customers.create({
      email: user.email,
      metadata: { user_id: user.id },
    })
    customerId = customer.id
    await supabase
      .from('profiles')
      .update({ stripe_customer_id: customerId })
      .eq('id', user.id)
  }

  const origin = req.nextUrl.origin

  const session = await stripe.checkout.sessions.create({
    customer: customerId,
    mode: 'subscription',
    payment_method_types: ['card'],
    line_items: [{ price: priceId, quantity: 1 }],
    success_url: `${origin}/dashboard?upgraded=1`,
    cancel_url:  `${origin}/pricing`,
    allow_promotion_codes: true,
    metadata: { user_id: user.id },
    subscription_data: {
      metadata: { user_id: user.id },
    },
  })

  return NextResponse.json({ url: session.url })
}
