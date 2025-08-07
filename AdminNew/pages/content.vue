<template>
  <div class="main_container">
    <Sidebar />

    <div class="main_content">
      <Navbar />

      <div class="content_section">
        <div class="d-flex justify-content-between align-items-center">
          <div class="d-flex align-items-center my-2">
            <h3 class="page_title my-0"><span>Content settings</span></h3>
          </div>
        </div>

        <!-- App Link Section -->
        <div class="card app_card">
          <div class="card-body p-4">
            <div class="row">
              <div class="col-md-8 m-auto">
                <form @submit.prevent="updateLinkSettings">
                  <div class="mb-3">
                    <label class="form-label text-white">Share your app</label>
                    <textarea
                      class="form-control"
                      v-model="link.description"
                      placeholder="Meta Description"
                      rows="3"
                    ></textarea>
                  </div>
                  <div class="text-start mt-4">
                    <button type="submit" class="btn btn-primary px-5">Update</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>

        <!-- Rules Section -->
        <div class="card app_card my-3">
          <div class="card-body p-4">
            <div class="row">
              <div class="col-md-8 m-auto">
                <form @submit.prevent="updateRuleSettings">
                  <div class="mb-3">
                    <label class="form-label text-white">How it Works</label>
                    <textarea
                      class="form-control"
                      id="summernote"
                      placeholder="Description"
                      rows="3"
                    ></textarea>
                  </div>
                  <div class="text-start mt-4">
                    <button type="submit" class="btn btn-primary px-5">Update</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useNuxtApp } from '#app'

const { $notyf } = useNuxtApp()
const route = useRoute()
const router = useRouter()

// ✅ Declare refs first
const form = ref({ description: '' })
const link = ref({ description: '' })

// ✅ Watch summernote-bound content and update editor
watch(
  () => form.value.description,
  (val) => {
    if (process.client && window.$ && $('#summernote').length) {
      $('#summernote').summernote('code', val)
    }
  }
)

// ✅ API: Get rule details
const getRolesDetails = async () => {
  const res = await apiFetch('/settings/rule', { method: 'GET' })

  if (!res.ok) {
    $notyf.error('Failed to load rule settings')
    return
  }

  const data = await res.json()
  form.value.description = data.data.description
}

// ✅ API: Get app link details
const getappLinkDetails = async () => {
  const res = await apiFetch('/settings/applink', { method: 'GET' })

  if (!res.ok) {
    $notyf.error('Failed to load app link')
    return
  }

  const data = await res.json()
  link.value.description = data.data.description
}

// ✅ API: Update rule settings
const updateRuleSettings = async () => {
  if (process.client && window.$ && $('#summernote').length) {
    form.value.description = $('#summernote').summernote('code')
  }

  const formData = new FormData()
  formData.append('description', form.value.description)

  const res = await apiFetch('/settings/rule', {
    method: 'POST',
    body: formData,
  })

  const data = await res.json()

  if (!res.ok) {
    if (data?.errors) {
      Object.values(data.errors).forEach((messages) =>
        messages.forEach((msg) => $notyf.error(msg))
      )
    } else {
      $notyf.error(data?.error || 'Unexpected error')
    }
    return
  }

  $notyf.success(data.message || 'Settings updated successfully')
  await getRolesDetails()
}

// ✅ API: Update app link settings
const updateLinkSettings = async () => {
  const formData = new FormData()
  formData.append('description', link.value.description)

  const res = await apiFetch('/settings/applink', {
    method: 'POST',
    body: formData,
  })

  const data = await res.json()

  if (!res.ok) {
    if (data?.errors) {
      Object.values(data.errors).forEach((messages) =>
        messages.forEach((msg) => $notyf.error(msg))
      )
    } else {
      $notyf.error(data?.error || 'Unexpected error')
    }
    return
  }

  $notyf.success(data.message || 'Settings updated successfully')
  await getappLinkDetails()
}

// ✅ Lifecycle hook
onMounted(async () => {
  if (process.client && window.$) {
    await getRolesDetails()
    await getappLinkDetails()

    // Init Summernote
    $('#summernote').summernote({
    //   height: 300,
      placeholder: 'Write something...',
      callbacks: {
        onChange: function (contents) {
          form.value.description = contents
        },
      },
    })

    // Set initial content
    $('#summernote').summernote('code', form.value.description)
  }
})
</script>
