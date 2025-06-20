// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: false },

  modules: ['@pinia/nuxt', 'nuxt-swiper'],

  pages: true,
  plugins: [
    { src: '~/plugins/jquery.client.ts', mode: 'client' } // Ensure plugin runs only in the client-side
  ],
  // css: [
  //   '@/assets/css/styles.css', // Custom global CSS
  // ],

  runtimeConfig: {
    public: {
      baseURL: process.env.NODE_ENV === "production"
        ? "http://192.168.0.110:8000/api"
        : "http://192.168.010:8000/api",
        // ? "http://127.0.0.1:8000/api"
        // : "http://127.0.0.1:8000/api",
    }
  },
  // router: {
  //   middleware: ['auth'] // Register the 'auth' middleware
  // },

  app: {
    head: {
      title: 'BigWin-Welcome to BigWin', // Global title
      meta: [
        { name: 'description', content: 'This is a Nuxt 3 app with Bootstrap 5.3' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' }
      ],
      link: [
        { rel: 'icon', type: 'image/png', href: '/favicon.ico' }, // Favicon
        { rel: 'stylesheet', href: '/assets/bootstrap-5.3.2/css/bootstrap.min.css' }, // Bootstrap 
        { rel: 'stylesheet', href: '/assets/fontawesome-free-6.4.2/css/all.min.css' }, // Fontawsome 
        { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css' }, //  Swiper CSS 

        { rel: 'stylesheet', href: '/css/styles.css' }, // Fontawsome 
      ],
      script: [
        { src: '/assets/bootstrap-5.3.2/js/bootstrap.bundle.min.js', defer: true },
        { src: 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js', defer: true }
      ]
    }
  }
})