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
                    <h1 class="page_title">Notification</h1>
                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#addnotification">Add
                        New</button>
                </div>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" id="" @change="getNotificaitonList(1)" v-model="items">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="1">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getNotificaitonList(1)"
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
                                        <th>Message</th>
                                        <th>Created at </th>
                                        <!-- <th class="text-center">Action</th>-->

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="notificationList && notificationList.length"
                                        v-for="(item, index) in notificationList">
                                        <td class="">{{ item.message }}</td>
                                        <td>{{ item.created }}</td>
                                        <!-- <td class="text-center">
                                            <button class="btn btn_default" data-bs-toggle="modal"
                                                @click="messageDetails(item.id)" data-bs-target="#editMassg"><i
                                                    class="fa-regular fa-pencil-square"></i></button>
                                        </td> -->
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
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getNotificaitonList(link.url.split('page=')[1])"
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

        <!-- Edit Modal -->
        <div class="modal fade" id="editMassg" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Update Message Notification</h1>
                            <form @submit.prevent="UpdateMessage">
                                <input type="text" v-model="editId" hidden>
                                <div class="form-group mb-3">
                                    <textarea name="" required v-model="editmessage" placeholder="Message"
                                        class="form-control" id=""></textarea>
                                    <p class="text-danger message" v-if="errors">{{ errors.editmessage[0] }}</p>
                                </div>
                                <button type="submit" class="btn_primary w-100">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Add Modal -->
        <div class="modal fade" id="addnotification" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>New Message Notification</h1>
                            <form @submit.prevent="addmessage">
                                <div class="form-group mb-3">
                                    <textarea name="" required v-model="message" placeholder="Message"
                                        class="form-control" id=""></textarea>
                                    <p class="text-danger message" v-if="errors">{{ errors.message[0] }}</p>

                                </div>
                                <button type="submit" class="btn_primary w-100">Submit</button>
                            </form>
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
import { useNuxtApp } from '#app';

import { apiFetch } from '~/utils/api'
const { $notyf } = useNuxtApp();
const globalScript = useGlobalScript();

const items = ref('10');
const searchInput = ref('');
const errors = ref();
const message = ref('');
const editId = ref('');
const editmessage = ref('');
const notificationList = ref([]);
const pagination = ref([]);

const addmessage = async () => {
    const formData = new FormData();
    formData.append('message', message.value);

    try {
        const res = await apiFetch('/api/new-message', {
            method: 'POST',
            body: formData
        });

        message.value = '';
        errors.value = '';
        getNotificaitonList(1);

        const modalElement = document.getElementById("addnotification");
        if (modalElement) {
            const modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) modalInstance.hide();
        }

        $notyf.success(res.message);
    } catch (error) {
        if (error?.response?.status === 422 && error.data?.errors) {
            for (const field in error.data.errors) {
                error.data.errors[field].forEach(msg => $notyf.error(msg));
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
    }
};

const messageDetails = async (id) => {
    try {
        const res = await apiFetch(`/api/message-details/${id}`);
        editmessage.value = res.message;
        editId.value = res.id;
    } catch (error) {
        console.error("Error fetching message details:", error);
        $notyf.error("Failed to load message details.");
    }
};

const getNotificaitonList = async (pages = 1) => {
    const query = new URLSearchParams({
        item: items.value,
        searchInput: searchInput.value,
        page: pages,
    });

    try {
        const res = await apiFetch(`/api/notificaion-list?${query.toString()}`, { method: 'GET' });

        const data = await res.json(); 
        notificationList.value = data.data;
        pagination.value = data.pagination.links;
    } catch (error) {
        console.error("Error loading notification list:", error);
        $notyf.error("Failed to load notification list.");
    }
};

const UpdateMessage = async () => {
    const formData = new FormData();
    formData.append('message', editmessage.value);
    formData.append('id', editId.value);

    try {
        const res = await apiFetch('/api/update-message', {
            method: 'POST',
            body: formData
        });

        editmessage.value = '';
        editId.value = '';

        const modalElement = document.getElementById("editMassg");
        if (modalElement) {
            const modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) modalInstance.hide();
        }

        getNotificaitonList();
        $notyf.success(res.message);
    } catch (error) {
        if (error?.response?.status === 422 && error.data?.errors) {
            for (const field in error.data.errors) {
                error.data.errors[field].forEach(msg => $notyf.error(msg));
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
    }
};

onMounted(() => {
    getNotificaitonList(1);
});
</script>
