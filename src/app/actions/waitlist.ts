'use server'
import { createClient } from '@/lib/supabase/server'

export async function joinWaitlist(email: string): Promise<{ error?: string }> {
  if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    return { error: 'Please enter a valid email address.' }
  }

  const supabase = await createClient()

  const { error } = await supabase
    .from('waitlist')
    .insert({ email: email.toLowerCase().trim() })

  if (error) {
    if (error.code === '23505') return {}  // already on the list — silent success
    return { error: 'Something went wrong. Please try again.' }
  }

  return {}
}
