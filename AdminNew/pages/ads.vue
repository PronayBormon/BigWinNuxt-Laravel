<template>

    <div class="main_container">

        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">

            <!-- navbar section  -->
            <Navbar />

            <!-- content setion  -->
            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Ads List</h1>
                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#addCreditModal">Add
                        New</button>
                </div>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" id="" @change="getAdsList()" v-model="items">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="1">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getAdsList()"
                                        placeholder="Search" class="form-control nav_search">
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <select name="" id="">
                                    <option value="" selected disabled>Status</option>
                                    <option value="">Acitve</option>
                                    <option value="">Inactive</option>
                                </select>
                            </div> -->
                        </div>
                        <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add User </button> -->
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th>Title</th>
                                        <th>File</th>
                                        <th>Type</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="creditList && creditList.length" v-for="(item, index) in creditList">
                                        <td class="">{{ item.title }}</td>
                                        <td>
                                            <!-- {{ item.type }} -->
                                            <video v-if="item.type == 'video'" style="height: 40px;"
                                                :src="item.file_path"></video>
                                            <img :src="item.file_path" v-if="item.type == 'image'" alt=""
                                                class="img-fluid" style="height: 40px;">
                                        </td>
                                        <td>
                                            {{ item.type }}
                                        </td>
                                        <td class="text-center">
                                            <button class="btn btn_default" @click="deleteAds(item.id)"><i
                                                    class="fa-solid fa-trash text-denager"
                                                    style="color: red;"></i></button>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="4" class="text-center">No Data Available</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- <button @click="getNotificaitonList" type="button">test</button> -->
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#" @click.prevent="getAdsList(link.url.split('page=')[1])"
                                        class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span> <!-- Show "..." for ellipsis -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>


        </div>

        <!-- Edit Credit Modal -->


        <!-- Add Ads Modal -->
        <div class="modal fade" id="addCreditModal" tabindex="-1" aria-labelledby="addCreditLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Add New Ads</h1>
                            <form @submit.prevent="SaveAds">
                                <!-- Ads Title -->
                                <div class="form-group mb-3">
                                    <input type="text" v-model="title" required placeholder="Title"
                                        class="form-control" />
                                </div>

                                <!-- Ads Type -->
                                <div class="form-group mb-3">
                                    <select v-model="type" required class="form-control">
                                        <option disabled value="">Select Type</option>
                                        <option value="1">Image</option>
                                        <option value="2">Video</option>
                                    </select>
                                </div>

                                <!-- Image Preview -->
                                <img :src="imageUrl || defaultImage" alt="Image Preview" class="img-fluid mb-3"
                                    style="height: 40px; border: 1px solid #fff; object-fit: cover;" />

                                <!-- File Input -->
                                <p class="text-danger mb-0 mt-2" style="font-size: 12px;">Please select type first</p>
                                <div class="form-group mb-3">
                                    <input type="file" @change="onImageChange" :disabled="!type"
                                        :accept="type === '1' ? 'image/*' : type === '2' ? 'video/*' : ''" required
                                        class="form-control" />
                                </div>



                                <!-- <button type="submit" class="btn_primary w-100">Submit</button> -->
                                <button type="submit" class="btn_primary w-100" :disabled="loading">
                                    <span v-if="loading && type === '2'" class="spinner-border spinner-border-sm me-2"
                                        role="status" aria-hidden="true"></span>
                                    Submit
                                </button>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div v-if="type === '2' && loading" class="text-center mb-3"
            style="position: fixed;left: 50%;top: 50%;background: #00000087;color: #fff;width: 100vw;height: 100vh;transform: translate(-50%,-50%);z-index: 999999;display: flex;justify-content: center;align-items: center;flex-direction: column;">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Uploading...</span>
            </div>
            <p style="font-size: 12px; margin-top: 5px;">Uploading video, please wait...</p>
        </div>



    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
// import axios from 'axios';
// const { $axios } = useNuxtApp();
// const axios = $axios;
import { apiFetch } from '~/utils/api'
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const globalScript = useGlobalScript();

const items = ref('10');
const searchInput = ref('');

const title = ref();
const type = ref('');
const image = ref('');
const loading = ref(false);


const imageUrl = ref();
const defaultImage = '';
const creditList = ref([]);
const pagination = ref([]);


const errors = ref();



const getAdsListads = async () => {
  const res = await apiFetch('/api/show-ads', { method: 'GET' });
  if (!res.ok) {
    $notyf.error("Failed to fetch ads.");
    return;
  }
  const data = await res.json();
  console.log(data);
};

const getAdsList = async (pages = 1) => {
  const params = new URLSearchParams({
    perPage: items.value,
    search: searchInput.value,
    page: pages,
  });
  
  
  const res = await apiFetch(`/api/get-ads`, { method: 'GET', body: params });
  
  if (!res.ok) {
    $notyf.error("Failed to fetch ads.");
    return;
  }
  
  const data = await res.json();
  creditList.value = data.data;
  pagination.value = data.pagination.links;
};

const deleteAds = async (id) => {
  const res = await apiFetch(`/api/delete-ads/${id}`, { method: 'GET' });

  const data = await res.json();

  if (!res.ok) {
    if (data?.errors) {
      for (const field in data.errors) {
        data.errors[field].forEach(msg => $notyf.error(msg));
      }
    } else {
      $notyf.error("An error occurred. Please try again.");
    }
    return;
  }

  getAdsList();
  $notyf.success(data.message);
};

const SaveAds = async () => {
  const formData = new FormData();
  formData.append('title', title.value);
  formData.append('file_path', image.value);
  formData.append('type', type.value);

  const res = await apiFetch('/api/save-ads', {
    method: 'POST',
    body: formData,
  });

  const data = await res.json();

  if (!res.ok) {
    if (data?.errors) {
      for (const field in data.errors) {
        data.errors[field].forEach(msg => $notyf.error(msg));
      }
    } else {
      $notyf.error("An error occurred. Please try again.");
    }
    return;
  }

  getAdsList();

  const modalElement = document.getElementById("addCreditModal");
  if (modalElement) {
    const modalInstance = bootstrap.Modal.getInstance(modalElement);
    if (modalInstance) modalInstance.hide();
  }

  $notyf.success(data.message);
};


function onImageChange(event) {
    const file = event.target.files[0];
    if (!file) return;

    const isImage = type.value === '1';
    const isVideo = type.value === '2';

    if (isImage && !file.type.startsWith('image/')) {
        alert('Please select an image file.');
        return;
    }
    if (isVideo && !file.type.startsWith('video/')) {
        alert('Please select a video file.');
        return;
    }

    // const file = event.target.files[0];
    if (file) {
        image.value = file;
        imageUrl.value = URL.createObjectURL(file); // Generate preview URL
    }


}
onMounted(() => {
    getAdsList();
    getAdsListads();
})




</script>
