<template>
    <title>Social links list</title>

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
                    <h1 class="page_title">Social link List</h1>
                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#addCreditModal">Add
                        New</button>
                </div>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter d-none">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" id="" @change="getCreditList(1)" v-model="items">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="1">100</option>
                                </select>
                            </div>
                            <div class="show_">
                                <p>Status</p>
                                <select name="" id="" @change="getCreditList(1)" v-model="status">
                                    <option value="">ALl</option>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getCreditList(1)"
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
                                        <th>Link</th>
                                        <th class="text-center">Credit</th>
                                        <th>comments </th>
                                        <th>Status</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="creditList && creditList.length" v-for="(item, index) in creditList">
                                        <td>{{ item.links }}</td>
                                        <td class="text-center">{{ item.creadit }} C.P.</td>
                                        <td>{{ item.comments }}</td>
                                        <td>
                                            <span class="badge bg-success" v-if="item.status == 'active'">Active</span>
                                            <span class="badge bg-danger" v-else>Inactive</span>
                                        </td>
                                        <td class="text-center">
                                            <button class="btn btn_default" data-bs-toggle="modal"
                                                @click="getCreditDetails(item.id)" data-bs-target="#editCreditModal"><i
                                                    class="fa-regular fa-pencil-square"></i></button>
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
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getCreditList(link.url.split('page=')[1])" class="page-link">
                                        {{ formatLabel(link.label) }}
                                    </a>
                                    <span v-else class="page-link">{{ formatLabel(link.label) }}</span>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>


            </div>


        </div>

        <!-- Edit Credit Modal -->
        <div class="modal fade" id="editCreditModal" tabindex="-1" aria-labelledby="editCreditLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Edit Credit</h1>
                            <form @submit.prevent="UpdateCredit">

                                <div class="form-group mb-3">
                                    <input type="number" v-model="editCredit.creadit" required placeholder="Credit"
                                        class="form-control" />
                                </div>


                                <div class="form-group mb-3">
                                    <input type="url" v-model="editCredit.links" required placeholder="Link"
                                        class="form-control" />
                                </div>
                                <div class="form-group mb-3">
                                    <textarea v-model="editCredit.comments" id="" placeholder="comments"
                                        class="form-control"></textarea>
                                </div>

                                <!-- Credit Status -->
                                <div class="form-group mb-3">
                                    {{ editCredit.status }}
                                    <select v-model="editCredit.status" class="form-control" required>
                                        <option disabled value="">Select Status</option>
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn_primary w-100">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Credit Modal -->
        <div class="modal fade" id="addCreditModal" tabindex="-1" aria-labelledby="addCreditLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Add new link</h1>
                            <form @submit.prevent="addCredit">

                                <div class="form-group mb-3">
                                    <input type="number" v-model="credit.creadit" required placeholder="Credit"
                                        class="form-control" />
                                </div>


                                <div class="form-group mb-3">
                                    <input type="url" v-model="credit.links" required placeholder="Link"
                                        class="form-control" />
                                </div>
                                <div class="form-group mb-3">
                                    <textarea v-model="credit.comments" id="" placeholder="comments"
                                        class="form-control"></textarea>
                                </div>

                                <!-- Credit Status -->
                                <!-- <div class="form-group mb-3">
                                    <select v-model="credit.status" required class="form-control">
                                        <option disabled value="">Select Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div> -->

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
// import axios from 'axios';
import { apiFetch } from '~/utils/api'
const { $axios } = useNuxtApp();
const axios = $axios;
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const globalScript = useGlobalScript();

const items = ref('10');
const searchInput = ref();
const status = ref('');
const message = ref();
const editId = ref();
const editmessage = ref();
const creditList = ref([]);
const pagination = ref([]);

const credit = ref({
    creadit: '',
    links: '',
    comments: ''
});

const editCredit = ref({
    id: '',
    creadit: '',
    links: '',
    status: '',
    comments: ''
});


function formatLabel(label) {
    const txt = document.createElement('textarea');
    txt.innerHTML = label;
    const decoded = txt.value;

    if (decoded === '« Previous') return 'Prev';
    if (decoded === 'Next »') return 'Next';
    return decoded;
}

const errors = ref();
const addCredit = async () => {
    const res = await apiFetch('/link-ads/save-link-ads', {
        method: 'POST',
        body: JSON.stringify(credit.value),
        headers: {
            'Content-Type': 'application/json',
        }
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

    $notyf.success(data.message);
    credit.value = { creadit: '', links: '', comments: '' };

    const modalElement = document.getElementById("addCreditModal");
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) modalInstance.hide();
    }

    getCreditList();
};

const getCreditDetails = async (id) => {
    const res = await apiFetch(`/link-ads/link-ads-details/${id}`, { method: 'GET' });

    if (!res.ok) {
        $notyf.error("Failed to fetch credit details.");
        return;
    }

    const data = await res.json();
    editCredit.value = {
        id: data.data.id,
        creadit: data.data.creadit,
        links: data.data.links,
        status: data.data.status,
        comments: data.data.comments
    };
};

const getCreditList = async (pages = 1) => {
    const params = new URLSearchParams({
        item: items.value,
        status: status.value,
        searchInput: searchInput.value,
        page: pages,
    });

    const res = await apiFetch(`/link-ads/link-ads-list?${params.toString()}`, { method: 'GET' });

    if (!res.ok) {
        $notyf.error("Failed to load credit list.");
        return;
    }

    const data = await res.json();
    creditList.value = data.data.data;
    pagination.value = data.data.links;
};

const UpdateCredit = async () => {
    const res = await apiFetch('/link-ads/update-link-ads', {
        method: 'POST',
        body: JSON.stringify(editCredit.value),
        headers: {
            'Content-Type': 'application/json',
        }
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

    $notyf.success(data.message);
    editCredit.value = { id: '', name: '', price: '', status: '' };

    const modalElement = document.getElementById("editCreditModal");
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) modalInstance.hide();
    }

    getCreditList();
};


onMounted(() => {
    getCreditList(1);
})




</script>
