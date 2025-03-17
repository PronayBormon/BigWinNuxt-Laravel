<template>
    <div class="main_container">
        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">
            <!-- navbar section  -->
            <Navbar />

            <!-- content section -->
            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Single Match</h1>
                    <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Banner</button> -->
                </div>

                <div class="card banner_card">
                    <div class="card-body">
                        <form action="">
                            <div class="row">
                                <div class="col-md-6 m-auto">

                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="addMatch()">
                                            <div class="form-group mb-3">
                                                <!-- <input type="text" class="form-control" id="name" placeholder="Team A Name"> -->
                                                <select class="form-control" v-model="teamA">
                                                    <option value="">Select Team A</option>
                                                    <option v-for="(item, index) in teamList" :value="item.id">{{
                                                        item.name }}
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-3">
                                                <!-- <input type="text" class="form-control" id="name" placeholder="Team B Name"> -->
                                                <!-- {{ teamList }} -->
                                                <select class="form-control" v-model="teamB">
                                                    <option value="">Select Team B</option>
                                                    <option v-for="(item, index) in teamList" :value="item.id">{{
                                                        item.name }}
                                                    </option>
                                                    <!-- <option value="2">Pakistan</option> -->
                                                </select>
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control" v-model="dateTime"
                                                    onfocus="(this.type='datetime-local')" onblur="(this.type='text')"
                                                    placeholder="Select Date/Time GMT" id="datetime" :min="minDateTime">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control" v-model="enddateTime"
                                                    onfocus="(this.type='datetime-local')" onblur="(this.type='text')"
                                                    placeholder="Select end Date/Time GMT" id="datetime"
                                                    :min="minDateTime">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Add</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <h1 class="page_title">Match List </h1>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" v-model="items" id="" @change="getMatchList(1)">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getMatchList(1)"
                                        placeholder="Search team" class="form-control nav_search">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-center">Team A</th>
                                        <th>Team B </th>
                                        <th>Start Date </th>
                                        <th>End Date </th>
                                        <th>Status </th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in matchList" :key="index">
                                        <!-- {{ item }} -->
                                        <td class="text-center">{{ item.teamA }}</td>
                                        <td>
                                            {{ item.teamB }}
                                        </td>
                                        <td>{{ item.start_time }}</td>
                                        <td>{{ item.end_time }}</td>
                                        <td>
                                            <span :class="item.status == 1 ? 'badge bg-success' : 'badge bg-danger'">{{
                                                item.status == 1 ? "Active" : "inactive" }}</span>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-default p-2"
                                                @click="getdetails(item.id)" data-bs-toggle="modal"
                                                data-bs-target="#editMatch"><i class="fa-regular fa-pencil-square"
                                                    style="font-size: 16px;"></i></button>
                                                    
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getMatchList(link.url.split('page=')[1])" class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- edit modal  -->
        <div class="modal fade" id="editMatch" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Edit Match</h1>

                            <form action="" @submit.prevent="updateMatch()">
                                <div class="form-group mb-3">
                                    <select class="form-control" v-model="editteamA">
                                        <option value="">Select Team A</option>
                                        <option v-for="(item, index) in teamList" :value="item.id">{{ item.name }}
                                        </option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <select class="form-control" v-model="editteamB">
                                        <option value="">Select Team B</option>
                                        <option v-for="(item, index) in teamList" :value="item.id">{{ item.name }}
                                        </option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <input type="text" class="form-control" v-model="editdateTime"
                                        onfocus="(this.type='datetime-local')" onblur="(this.type='text')"
                                        placeholder="Select Date/Time GMT" id="datetime" :min="minDateTime">
                                </div>
                                <div class="form-group mb-3">
                                    <input type="text" class="form-control" v-model="editenddateTime"
                                        onfocus="(this.type='datetime-local')" onblur="(this.type='text')"
                                        placeholder="Select end Date/Time GMT" id="datetime" :min="minDateTime">
                                </div>
                                <div class="form-group mb-3">
                                    <select name="" v-model="editstatus" id="" class="form-control">
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn_primary w-100">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted } from "vue";
import axios from "axios";

import { useRouter } from 'vue-router';

const router = useRouter();


const minDateTime = ref('');
const teamA = ref('');
const teamB = ref('');
const dateTime = ref();
const enddateTime = ref();

const items = ref('10');
const searchInput = ref();

const teamList = ref([]);
const matchList = ref([]);
const pagination = ref([]);

const editteamA = ref('');
const editteamB = ref('');
const editdateTime = ref();
const editenddateTime = ref();
const editstatus = ref();
const editId = ref();


const updateMatch = () => {

    const formData = new FormData();
    formData.append('id', editId.value);
    formData.append('teamA', editteamA.value);
    formData.append('teamB', editteamB.value);
    formData.append('startDate', editdateTime.value);
    formData.append('endDate', editenddateTime.value);
    formData.append('status', editstatus.value);
    // console.log(formData);
    axios.post('api/update-match', formData).then(response => {

        editteamA.value = "";
        editteamB.value = "";
        editdateTime.value = "";
        editenddateTime.value = "";
        editstatus.value = "";
        editId.value = "";
        // console.log(response.data);
        let modalElement = document.getElementById('editMatch');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        getMatchList();
    });
}

const getdetails = (id) => {
    axios.get(`api/match-details/${id}`).then(response => {
        // console.log(response.data);
        editteamA.value = response.data.team_a;
        editteamB.value = response.data.team_b;
        editdateTime.value = response.data.time;
        editenddateTime.value = response.data.end_date;
        editstatus.value = response.data.status;
        editId.value = response.data.id;
    })
}


const addMatch = () => {
    const formData = new FormData();

    formData.append('teamA', teamA.value);
    formData.append('teamB', teamB.value);
    formData.append('dateTime', dateTime.value);
    formData.append('enddateTime', enddateTime.value);

    // console.log(formData);
    teamA.value = "";
    teamB.value = "";
    dateTime.value = "";
    enddateTime.value = "";

    axios.post('api/add-match', formData).then(response => {
        // console.log(response.data);
        getMatchList();
    });
}
const getTeamList = () => {

    axios.get('api/getteamlist').then(response => {
        teamList.value = response.data;
    });
}
const getMatchList = (pages) => {

    axios.get('api/get-matchList', {
        params: {
            items: items.value,
            search: searchInput.value,
            page: pages,
        }
    }).then(response => {
        matchList.value = response.data.data;
        pagination.value = response.data.pagination.links;
    });
}

const bannerslider = () => {
    new Swiper(".mySwiper", {
        slidesPerView: 1.5,
        spaceBetween: 30,
        centeredSlides: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
}
const today = () => {
    const now = new Date();
    now.setMinutes(now.getMinutes() - now.getTimezoneOffset()); // Adjust for timezone
    minDateTime.value = now.toISOString().slice(0, 16); // Format: YYYY-MM-DDTHH:MM
}
onMounted(() => {
    bannerslider();
    today();
    getTeamList();
    getMatchList(1);
});
</script>
