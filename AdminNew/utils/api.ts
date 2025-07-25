export async function apiFetch(path: string, options: RequestInit = {}) {
  const config = useRuntimeConfig()

  const baseUrl = config.public.apiBaseUrl

  const headers: HeadersInit = options.headers || {}

  // Optional: include auth token if available (from localStorage or pinia)
  const token = process.client ? localStorage.getItem('token') : null
  if (token) {
    headers['Authorization'] = `Bearer ${token}`
  }

  return await fetch(`${baseUrl}${path}`, {
    ...options,
    headers,
  })
}
