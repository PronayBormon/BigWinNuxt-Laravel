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
                <h1 class="page_title"> <button @click.prevent="back" class="border-0 bg-transparent" type="button"><i
                            class="fa-solid fa-arrow-left"></i></button>Player List </h1>
                <div class="card app_card">
                    <div class="card-header">
                        <form>
                            <div class="header_filter">
                                <div class="show_">
                                    <p>Show</p>
                                    <select name="item" id="item-select" v-model="items" @change="teamData(1)">
                                        <option value="10" selected>10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>

                                <div class="form-group d-none d-md-block">
                                    <div class="seach_box">
                                        <i class="fa-solid fa-search"></i>
                                        <input type="text" placeholder="Search" v-model="searchInput"
                                            @input="teamData(1)" name="search" class="form-control nav_search" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select name="status" id="status-select" v-model="status" @change="teamData(1)">

                                        <option value="">All</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#editList">Edit List
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <!-- <th class="text-start">Tournament name</th> -->
                                        <th>Player Name</th>
                                        <th>Status</th>
                                        <!-- <th>Action</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="playersList && playersList.length" v-for="(items, index) in playersList"
                                        :key="items.id">
                                        <td class="text-start">{{ items.player.player_name }}</td>
                                        <!-- <td>
                                            <span :class="items.status == 1 ? 'badge bg-success' : 'badge bg-danger'">{{
                                                items.status == 1 ? 'Active' : 'Inactive' }}</span>
                                        </td> -->

                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#edituser"
                                                @click="playseDetails(items.id)" class="btn btn_default">Details
                                                Action</button>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="6" class="text-center"><span class="my-4">No data available</span>
                                        </td>
                                        <!-- Adjust colspan based on number of columns -->
                                    </tr>
                                </tbody>
                            </table>
                            <!-- Pagination -->
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="teamData(link.url.split('page=')[1])" class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span>
                                </li>
                            </ul>


                        </div>
                    </div>
                </div>

                <!--add Modal -->
                <div class="modal fade" id="editList" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Edit Team List</h1>

                                    <div class="d-flex align-items-center flex-wrap">
                                        <span v-for="(items, index) in teamList"
                                            class="badge text-dark d-flex align-items-center">{{ items.team.name }}
                                            <button type="button" @click="removeTeam(items.team.id)" class="btn btn-danger btn-sm ms-1 p-0 px-2">-</button>
                                        </span>
                                    </div>

                                    <form @submit.prevent="addTeams">

                                        <div class="form-group">
                                            <label class="text-white">Select Teams</label>
                                            <div v-for="item in teams" :key="item.id" class="form-check">
                                                <input type="checkbox" :id="'team-' + item.name" :value="item.id"
                                                    v-model="selectedTeamsid" class="form-check-input">
                                                <label :for="'team-' + item.name" class="form-check-label">
                                                    {{ item.name }}
                                                </label>
                                            </div>

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

    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';

const route = useRoute();
const router = useRouter();
const tournamentId = route.query.tid;
const teamId = route.query.team_id;

const matchdetails = ref();
const items = ref("10");
const searchInput = ref();
const status = ref('');
const team_id = ref();

const teamList = ref([]);
const pagination = ref([]);
const teams = ref([]);
const selectedTeamsid = ref([]);
const playersList = ref([]);

const back = () => {
    router.back();
}


const teamData = (page) => {
    axios.get(`api/tournament-playerList`, {
        params: {
            tournamentId: tournamentId,
            teamId: teamId,
            items: items.value,
            searchInput: searchInput.value,
            status: status.value,
            page: page,
        }
    }).then(response => {
        console.log(response.data.data);
        playersList.value = response.data.data;
        pagination.value = response.data.pagination.links;

    });
}
const teamListselect = () => {
    axios.get("api/team-list").then(response => {
        teams.value = response.data;
    })
}
onMounted(() => {
    teamData();
    teamListselect();
});



</script>
