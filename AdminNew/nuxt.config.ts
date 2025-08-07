// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },

  runtimeConfig: {
    public: {
      apiBaseUrl: process.env.API_BASE_URL || 'http://127.0.0.1:8000/api',
    },
  },

  modules: ['@pinia/nuxt'],

  pages: true,

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
        { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css' },
        {
          rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs4.min.css',
        },
      ],
      script: [
        { src: "https://code.jquery.com/jquery-3.6.0.min.js" },
        { src: '/assets/bootstrap-5.3.2/js/bootstrap.bundle.min.js', defer: true },
        { src: 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js', defer: true },
        { src: 'https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js', defer: true },
        {
          src: 'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs4.min.js',
          defer: true,
        },
      ]
    }
  }
})
