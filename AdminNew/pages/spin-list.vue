<template>
    <title>Spin List</title>
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
                    <h1 class="page_title">Spin List</h1>
                    <button v-if="count <= 20 || count != 20" class="btn_primary" data-bs-toggle="modal"
                        data-bs-target="#addSpin">Add New</button>
                </div>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <!-- <div class="show_">
                                <p>Show</p>
                                <select name="" id="" v-model="items" @change="getSpinList">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div> -->

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" @input="getSpinList" v-model="searchInput" placeholder="Search"
                                        class="form-control nav_search">
                                </div>
                            </div>

                            <div class="form-group">
                                <select name="" id="" v-model="status" @change="getSpinList">
                                    <option value="">All</option>
                                    <option value="1">Acitve</option>
                                    <option value="2">Inactive</option>
                                </select>
                            </div>
                        </div>
                        <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add User </button> -->
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th>Sl.</th>
                                        <th class="text-center">Name</th>
                                        <th>Status</th>
                                        <th>Price</th>
                                        <th class="text-center">Action </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="spinList && spinList.length" v-for="(item, index) in spinList"
                                        :key="index">
                                        <td>{{ index + 1 }}</td>
                                        <td class="text-center">{{ item.name }}</td>
                                        <td>
                                            <p v-if="item.status == 1" class="badge bg-success">Active</p>
                                            <p v-else class="badge bg-danger">Inactive</p>
                                        </td>
                                        <td>
                                            <p>{{ item.prize }}</p>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-default p-2" data-bs-toggle="modal"
                                                data-bs-target="#editSpin" @click="getsingleData(item.id)">
                                                <i class="fa-regular fa-pencil-square" style="font-size: 16px;"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="4" class="text-center">No Data Available</td>
                                    </tr>

                                </tbody>
                            </table>
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#" @click.prevent="getSpinList(link.url.split('page=')[1])"
                                        class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span>  
                                </li>
                            </ul>


                        </div>
                    </div>
                </div>


            </div>
            <!-- edit Modal -->
            <div class="modal fade" id="editSpin" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="adduser_form">
                                <h1>Edit Spin Prize</h1>
                                <form @submit.prevent="UpdateSpinList">
                                    <input type="text" hidden v-model="editid">
                                    <div class="form-group mb-3">
                                        <input type="text" name="name" placeholder="Name" v-model="editname"
                                            class="form-control">
                                        <p class="text-danger message" v-if="errors.editname">{{ errors.editname[0] }}
                                        </p>

                                    </div>
                                    <div class="form-group mb-3">
                                        <input type="number" name="prize" placeholder="00" v-model="editprize"
                                            class="form-control">
                                        <p v-if="errors.editprize">{{ errors.editprize[0] }}</p>

                                    </div>
                                    <div class="form-group mb-3">
                                        <select name="" v-model="editstatus" id="" class="form-control">
                                            <option value="1">Active</option>
                                            <option value="2">Inactive</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn_primary w-100">Update</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add Modal -->
            <div class="modal fade" id="addSpin" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="adduser_form">
                                <h1>New Spin Prize</h1>
                                <form @submit.prevent="addSpinList">
                                    <div class="form-group mb-3">
                                        <input type="text" name="name" placeholder="Name" v-model="name"
                                            class="form-control">
                                        <p class="text-danger message" v-if="errors.name">{{ errors.name[0] }}</p>

                                    </div>
                                    <div class="form-group mb-3">
                                        <input type="number" name="prize" placeholder="00" v-model="prize"
                                            class="form-control">
                                        <p v-if="errors.prize">{{ errors.prize[0] }}</p>

                                    </div>
                                    <button type="submit" class="btn_primary w-100">Submit</button>
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
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
// import axios from 'axios';
// const { $axios } = useNuxtApp();
import { apiFetch } from '~/utils/api'
const { $notyf } = useNuxtApp();

const globalScript = useGlobalScript();

const showPassword = ref(false);
const errors = ref('');
const name = ref('');
const prize = ref('');
const count = ref('');

const editname = ref('');
const editprize = ref('');
const editid = ref('');
const editstatus = ref();

const spinList = ref([]);
const pagination = ref([]);

const items = ref('16');
const searchInput = ref('');
const status = ref('');


const getsingleData = async (id) => {
    try {
        const response = await apiFetch(`/api/get-spin/${id}`);
        const data = await response.json();
        // console.log(data)
        editname.value = data.name;
        editprize.value = data.prize;
        editid.value = data.id;
        editstatus.value = data.status;
    } catch (error) {
        $notyf.error("Failed to load spin details.");
    }
};

const UpdateSpinList = async () => {
    const formData = new FormData();
    formData.append('id', editid.value);
    formData.append('name', editname.value);
    formData.append('prize', editprize.value);
    formData.append('status', editstatus.value);

    try {
        const response = await apiFetch('/api/update-spin', {
            method: 'POST',
            body: formData
        });

        editname.value = '';
        editprize.value = '';

        const modalElement = document.getElementById("editSpin");
        if (modalElement) {
            const modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) modalInstance.hide();
        }

        await getSpinList();
        const data = await response.json();
        $notyf.success(data);
    } catch (error) {
        showValidationErrors(error);
    }
};

const addSpinList = async () => {
    const formData = new FormData();
    formData.append('name', name.value);
    formData.append('prize', prize.value);

    try {
        const response = await apiFetch('/api/make-spin', {
            method: 'POST',
            body: formData
        });

        name.value = '';
        prize.value = '';

        const modalElement = document.getElementById("addSpin");
        if (modalElement) {
            const modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) modalInstance.hide();
        }

        await getSpinList();
        const data = await response.json();
        $notyf.success(data);
    } catch (error) {
        showValidationErrors(error);
    }
};

const getSpinList = async (page = 1) => {
    const formData = new FormData();
    formData.append('items', items.value);
    formData.append('searchInput', searchInput.value);
    formData.append('status', status.value);
    formData.append('page', page);


    const res = await apiFetch(`/api/getspinList`, { method: 'Post', body: formData });

    if (!res.ok) {
        $notyf.error("Failed to fetch ads.");
        return;
    }

    const data = await res.json();
    spinList.value = data.data;
    count.value = data.count;
    pagination.value = data.pagination.links;

};

// Utility function to handle validation error structure
const showValidationErrors = (error) => {
    if (error?.data?.errors) {
        const errorMessages = error.data.errors;
        for (const field in errorMessages) {
            if (Object.prototype.hasOwnProperty.call(errorMessages, field)) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        }
    } else {
        $notyf.error("An error occurred. Please try again.");
    }
};

onMounted(() => {
    getSpinList();
})


</script>
