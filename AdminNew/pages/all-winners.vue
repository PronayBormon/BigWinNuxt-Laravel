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
                <h1 class="page_title">All Winners</h1>
                <div class="card app_card">
                    <div class="card-body">
                        <div class="adduser_form">
                            <nav class="mb-3 win_nav">
                                <div class="nav nav-tabs justify-content-center"
                                    style="display: grid; grid-template-columns: repeat(4,4fr);" id="nav-tab"
                                    role="tablist">
                                    <button class="nav-link active" id="nav-singlematch-tab" data-bs-toggle="tab"
                                        data-bs-target="#singlematch" type="button" role="tab"
                                        aria-controls="nav-singlematch" aria-selected="true">Single Match</button>
                                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#Bowling-profile" type="button" role="tab"
                                        aria-controls="nav-profile" aria-selected="false">Bowling</button>


                                    <button class="nav-link " id="nav-home-tab" data-bs-toggle="tab"
                                        data-bs-target="#Batting-home" type="button" role="tab" aria-controls="nav-home"
                                        aria-selected="true">Batting</button>


                                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#tournament-home" type="button" role="tab"
                                        aria-controls="nav-profile" aria-selected="false">Tournament</button>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="singlematch" role="tabpanel"
                                    aria-labelledby="nav-home-tab" tabindex="0">
                                    <!-- single match  -->
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
                                                    <!-- <i class="fa-solid fa-search d-none"></i> -->
                                                    <input type="text" v-model="searchInput" @input="getMatchList(1)"
                                                        placeholder="Search team" class="form-control nav_search">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                                    <td class="text-center">{{ item.teamA }}</td>
                                                    <td>
                                                        {{ item.teamB }}
                                                    </td>
                                                    <td>{{ item.start_time }}</td>
                                                    <td>{{ item.end_time }}</td>
                                                    <td>
                                                        <span
                                                            :class="item.status == 1 ? 'badge bg-success' : 'badge bg-danger'">{{
                                                                item.status == 1 ? "Active" : "inactive" }}</span>
                                                    </td>
                                                    <td class="text-center">
                                                        <button type="button" class="btn btn-default p-2"
                                                            @click="matchWinner(item.id)">Winners</button>
                                                        <!-- <nuxt-link to="`/winners/single-match?id=${item.id}`"  class="btn btn-default p-2">Winners</nuxt-link> -->

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <ul class="pagination">
                                            <li v-for="link in pagination" :key="link.label"
                                                :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                                <a v-if="link.url" href="#"
                                                    @click.prevent="getMatchList(link.url.split('page=')[1])"
                                                    class="page-link">
                                                    {{ link.label }}
                                                </a>
                                                <span v-else>{{ link.label }}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>


                                <div class="tab-pane fade" id="Bowling-profile" role="tabpanel"
                                    aria-labelledby="nav-profile-tab" tabindex="0">
                                    <!-- bowling  -->

                                    <div class="card-header">
                                        <div class="header_filter">
                                            <div class="show_">
                                                <p>Show</p>
                                                <select name="" v-model="itemsBoll" id="" @change="getMaxPredict(1)">
                                                    <option value="10">10</option>
                                                    <option value="20">20</option>
                                                    <option value="50">50</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </div>

                                            <div class="form-group d-none d-md-block">
                                                <div class="seach_box">
                                                    <i class="fa-solid fa-search d-none"></i>
                                                    <input type="text" v-model="searchInputBoll"
                                                        @input="getMaxPredict(1)" placeholder="Search team"
                                                        class="form-control nav_search">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <ul class="report_user">
                                        <li v-for="(item, index) in maxPredictList" :key="index">
                                            <nuxt-link :to="`/winners/bowling?id=${item.id}`">
                                                <div class="img_part">
                                                    <div>
                                                        <span v-if="item.teams.length === 2">
                                                            {{ item.teams[0].country?.name }} <strong>VS</strong> {{
                                                                item.teams[1].country?.name }}
                                                        </span>
                                                        <h3>{{ item.name }} </h3>
                                                        <p><strong>Start:</strong> {{ item.start_date }},
                                                            <strong>End:</strong> {{
                                                                item.end_date }}
                                                        </p>
                                                        <!-- <p>Total Participate: 20</p> -->
                                                    </div>
                                                </div>
                                                <i class="fa-solid fa-arrow-right"></i>
                                            </nuxt-link>
                                        </li>
                                    </ul>

                                    <ul class="pagination">
                                        <li v-for="link in paginationBoll" :key="link.label"
                                            :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                            <a v-if="link.url" href="#"
                                                @click.prevent="getMaxPredict(link.url.split('page=')[1])"
                                                class="page-link">
                                                {{ link.label }}
                                            </a>
                                            <span v-else>{{ link.label }}</span>
                                        </li>
                                    </ul>
                                </div>

                                <div class="tab-pane fade" id="Batting-home" role="tabpanel"
                                    aria-labelledby="nav-profile-tab" tabindex="0">
                                    <!-- <h1>Batting</h1> -->
                                    <!-- bowling  -->

                                    <div class="card-header">
                                        <div class="header_filter">
                                            <div class="show_">
                                                <p>Show</p>
                                                <select name="" v-model="itemsBoll" id="" @change="getMaxPredict(1)">
                                                    <option value="10">10</option>
                                                    <option value="20">20</option>
                                                    <option value="50">50</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </div>

                                            <div class="form-group d-none d-md-block">
                                                <div class="seach_box">
                                                    <i class="fa-solid fa-search d-none"></i>
                                                    <input type="text" v-model="searchInputBoll"
                                                        @input="getMaxPredict(1)" placeholder="Search team"
                                                        class="form-control nav_search">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <ul class="report_user">
                                        <li v-for="(item, index) in maxPredictList" :key="index">
                                            <nuxt-link :to="`/winners/batting?id=${item.id}`">
                                                <div class="img_part">
                                                    <div>
                                                        <span v-if="item.teams.length === 2">
                                                            {{ item.teams[0].country?.name }} <strong>VS</strong> {{
                                                                item.teams[1].country?.name }}
                                                        </span>
                                                        <h3>{{ item.name }} </h3>
                                                        <p><strong>Start:</strong> {{ item.start_date }},
                                                            <strong>End:</strong> {{
                                                                item.end_date }}
                                                        </p>
                                                        <!-- <p>Total Participate: 20</p> -->
                                                    </div>
                                                </div>
                                                <i class="fa-solid fa-arrow-right"></i>
                                            </nuxt-link>
                                        </li>
                                    </ul>

                                    <ul class="pagination">
                                        <li v-for="link in paginationBoll" :key="link.label"
                                            :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                            <a v-if="link.url" href="#"
                                                @click.prevent="getMaxPredict(link.url.split('page=')[1])"
                                                class="page-link">
                                                {{ link.label }}
                                            </a>
                                            <span v-else>{{ link.label }}</span>
                                        </li>
                                    </ul>
                                </div>


                                <div class="tab-pane fade " id="tournament-home" role="tabpanel"
                                    aria-labelledby="nav-profile-tab" tabindex="0">
                                    <!-- <h1>tournament-home</h1> -->
                                    <div class="app_card">
                                        <div class="card-header">
                                            <div class="header_filter">
                                                <div class="show_">
                                                    <p>Show</p>
                                                    <select name="" v-model="Titems" id=""
                                                        @change="getTournamentList(1)">
                                                        <option value="10">10</option>
                                                        <option value="20">20</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select>
                                                </div>

                                                <div class="form-group d-none d-md-block">
                                                    <div class="seach_box">
                                                        <i class="fa-solid fa-search d-none"></i>
                                                        <input type="text" v-model="TsearchInput"
                                                            @input="getTournamentList(1)" placeholder="Search team"
                                                            class="form-control nav_search">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead">
                                                <tr>
                                                    <th class="text-center">Tournament Name</th>
                                                    <th>Start Date </th>
                                                    <th>End Date </th>
                                                    <th>Status </th>
                                                    <th class="text-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(item, index) in tournamentList" :key="index">
                                                    <!-- {{ item }} -->
                                                    <td class="text-center">{{ item.name }}</td>
                                                    <td>{{ item.start_date }}</td>
                                                    <td>{{ item.end_date }}</td>
                                                    <td>
                                                        <span
                                                            :class="item.status == 1 ? 'badge bg-success' : 'badge bg-danger'">{{
                                                                item.status == 1 ? "Active" : "inactive" }}</span>
                                                    </td>
                                                    <td class="text-center">
                                                        <!-- <button type="button" class="btn btn-default p-2"
                                                            @click="changeStatus(item.id)"> Change status</button> -->

                                                        <button type="button" @click="TteamlistId(item.id, item.name)"
                                                            class="btn btn-default py-2 ms-2">Winner List</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <ul class="pagination">
                                            <li v-for="link in Tpagination" :key="link.label"
                                                :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                                <a v-if="link.url" href="#"
                                                    @click.prevent="getTournamentList(link.url.split('page=')[1])"
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
                    </div>
                </div>


            </div>


        </div>

    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
import { useRoute, useRouter } from 'vue-router';
import { apiFetch } from '~/utils/api'
// import axios from 'axios';
// const { $axios } = useNuxtApp();
// const axios = $axios;
import { useNuxtApp } from '#app';

const globalScript = useGlobalScript();
const route = useRoute();
const router = useRouter();
const { $notyf } = useNuxtApp();

const matchWinner = ($id) => {
    router.push({ path: '/winners/single-match', query: { id: $id } });
};
const TteamlistId = ($id) => {
    router.push({ path: '/winners/tournament', query: { id: $id } });
};

const matchList = ref([]);
const pagination = ref([]);
const items = ref('10');
const searchInput = ref('');

//bating bowling
const maxPredictList = ref([]);
const paginationBoll = ref([]);
const itemsBoll = ref('10');
const searchInputBoll = ref('');
//tournament

const tournamentList = ref([]);
const Tpagination = ref([]);
const Titems = ref('10');
const TsearchInput = ref();
const getMaxPredict = async (page = 1) => {
    const query = new URLSearchParams({
        searchInput: searchInputBoll.value,
        items: itemsBoll.value,
        page: page,
    });

    try {
        const res = await apiFetch(`/api/get-maxpredictList?${query.toString()}`, { method: 'GET' });
        const data = await res.json();
        maxPredictList.value = data.data;
        paginationBoll.value = data.pagination.links;
    } catch (error) {
        $notyf.error("Failed to load max predict list.");
    }
};

// const getPredictBollerBatsmanResult = async () => {
//     const id = 1;
//     try {
//         const res = await apiFetch(`/api/predict-match-result/${id}`, { method: 'GET' });
//         console.log(res);
//     } catch (error) {
//         $notyf.error("Failed to fetch prediction result.");
//     }
// };

const getMatchList = async (pages = 1) => {
    const query = new URLSearchParams({
        items: items.value,
        search: searchInput.value,
        page: pages,
    });

    try {
        const res = await apiFetch(`/api/get-matchList?${query.toString()}`, { method: 'GET' });
        const data = await res.json();

        matchList.value = data.data;
        pagination.value = data.pagination.links;
    } catch (error) {
        $notyf.error("Failed to load match list.");
    }
};

const getTournamentList = async (pages = 1) => {
    const query = new URLSearchParams({
        items: Titems.value,
        search: TsearchInput.value,
        page: pages,
    });

    try {
        const res = await apiFetch(`/api/get-tournamentList?${query.toString()}`, { method: 'GET' });
        
        const data = await res.json();
        tournamentList.value = data.data;
        Tpagination.value = data.pagination.links;
    } catch (error) {
        $notyf.error("Failed to load tournament list.");
    }
};



onMounted(() => {
    getMatchList();
    getMaxPredict();
    getTournamentList();

    // getSingleMatchWinner();
    // getPredictBollerBatsmanResult();
})


</script>

<style>
.win_nav {
    color: #fff;
}
</style>
