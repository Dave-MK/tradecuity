'use server'
import { createClient } from '@/lib/supabase/server'
import { createClient as createAdminClient } from '@supabase/supabase-js'
import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'

export async function updateDisplayName(formData: FormData) {
  const name = (formData.get('name') as string ?? '').trim()
  if (!name || name.length < 2) return { error: 'Name must be at least 2 characters.' }

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: 'Not authenticated.' }

  const { error } = await supabase
    .from('profiles')
    .update({ display_name: name })
    .eq('id', user.id)

  if (error) return { error: error.message }

  revalidatePath('/settings')
  revalidatePath('/dashboard')
  revalidatePath('/profile')
  return { success: true }
}

export async function uploadAvatar(formData: FormData) {
  const file = formData.get('avatar') as File | null
  if (!file || file.size === 0) return { error: 'No file provided.' }
  if (file.size > 2 * 1024 * 1024) return { error: 'File must be under 2MB.' }
  if (!['image/jpeg', 'image/png', 'image/webp', 'image/gif'].includes(file.type)) {
    return { error: 'Unsupported file type. Use JPEG, PNG, WebP, or GIF.' }
  }

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: 'Not authenticated.' }

  const ext = file.name.split('.').pop() ?? 'jpg'
  const path = `${user.id}/avatar.${ext}`
  const bytes = await file.arrayBuffer()

  const { error: uploadError } = await supabase.storage
    .from('avatars')
    .upload(path, bytes, { contentType: file.type, upsert: true })

  if (uploadError) return { error: uploadError.message }

  const { data: { publicUrl } } = supabase.storage
    .from('avatars')
    .getPublicUrl(path)

  const { error: updateError } = await supabase
    .from('profiles')
    .update({ avatar_url: publicUrl })
    .eq('id', user.id)

  if (updateError) return { error: updateError.message }

  revalidatePath('/settings')
  revalidatePath('/profile')
  return { url: publicUrl }
}

export async function deleteAccount() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
    return { error: 'Account deletion not configured.' }
  }

  const admin = createAdminClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
  )

  const { error } = await admin.auth.admin.deleteUser(user.id)
  if (error) return { error: error.message }

  redirect('/')
}
