// middleware/auth.global.ts
export default defineNuxtRouteMiddleware((to) => {
  const token = useCookie('auth_token') // get token from cookies
  const publicPages = ['/auth/login', '/auth/register']

  // redirect to login if not logged in and trying to access a protected page
  if (!token.value && !publicPages.includes(to.path)) {
    return navigateTo('/auth/login')
  }

  // if already logged in and trying to access login page, redirect to home
  if (token.value && to.path.startsWith('/auth')) {
    return navigateTo('/')
  }
})
