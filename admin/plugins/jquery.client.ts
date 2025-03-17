import jQuery from 'jquery'

export default defineNuxtPlugin((nuxtApp) => {
  // console.log('jQuery plugin loaded')
  nuxtApp.provide('jquery', jQuery)
})
