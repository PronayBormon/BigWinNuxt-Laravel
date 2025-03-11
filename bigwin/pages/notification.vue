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
                                    <option value="2">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getNotificaitonList(1)" placeholder="Search"
                                        class="form-control nav_search">
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
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="notificationList && notificationList.length"
                                        v-for="(item, index) in notificationList">
                                        <td class="">{{ item.message }}</td>
                                        <td>{{ item.created }}</td>
                                        <td class="text-center">
                                            <button class="btn btn_default"><i
                                                    class="fa-regular fa-pencil-square"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- <button @click="getNotificaitonList" type="button">test</button> -->
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#" @click.prevent="getNotificaitonList(link.url.split('page=')[1])"
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
import axios from 'axios';
const globalScript = useGlobalScript();

const items = ref('10');
const searchInput = ref();
const errors = ref();
const message = ref();
const notificationList = ref([]);
const pagination = ref([]);

const addmessage = () => {
    const formData = new FormData();
    formData.append('message', message.value);

    axios.post('api/new-message', formData).then(response => {
        getNotificaitonList(1);
        errors.value = "";
        message.value = "";

        let modalElement = document.getElementById("addnotification");
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }

    }).catch(error => {
        if (error.response && error.response.data && error.response.data.errors) {
            console.log("Validation Errors:", error.response.data.errors);
            errors.value = error.response.data.errors;
        } else {
            console.log("Error:", error.message);
        }
    });
}
const getNotificaitonList = (pages) => {

    const pageNum = pages;
    console.log("==========================="+pageNum);
    
    axios.get('api/notificaion-list', {
        params: {
            item: items.value,        
            searchInput: searchInput.value,
            page: pages,
        }
    }).then(response => {
        console.log(response.data.data);
        notificationList.value = response.data.data;
        pagination.value = response.data.pagination.links;  // Set pagination links
    })
}

onMounted(() => {
    getNotificaitonList(1);
})




</script>
