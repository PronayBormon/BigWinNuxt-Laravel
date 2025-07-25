// plugins/notyf.client.ts
import { Notyf } from 'notyf'
import 'notyf/notyf.min.css'

export default defineNuxtPlugin((nuxtApp) => {
  const notyf = new Notyf({
    duration: 3000,
    position: { x: 'right', y: 'top' },
  })

  nuxtApp.provide('notyf', notyf)
})
