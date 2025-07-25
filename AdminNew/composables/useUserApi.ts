// composables/useUserApi.ts
import { ref } from 'vue'
import { useNuxtApp } from '#app'

export function useUserApi() {
  const userList = ref([])
  const pagination = ref(null)
  const loading = ref(false)

  const fetchUsers = async ({ page = 1, perPage = 10, search = '', status = '' }) => {
    if (!process.client) return

    loading.value = true
    try {
      const { $axios } = useNuxtApp()
      const res = await $axios.post('/api/user-list', {
        perPage,
        search,
        status,
        page
      })

      userList.value = res.data.data
      pagination.value = res.data.meta
    } catch (e) {
      console.error('User list fetch failed', e)
    } finally {
      loading.value = false
    }
  }

  return {
    userList,
    pagination,
    loading,
    fetchUsers
  }
}
