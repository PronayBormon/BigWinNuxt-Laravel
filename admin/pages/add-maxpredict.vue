<template>
    <div class="main_container">
        <!-- Sidebar -->
        <Sidebar />

        <!-- Main Content -->
        <div class="main_content">
            <!-- Navbar -->
            <Navbar />

            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Max Predict</h1>
                </div>

                <div class="card banner_card">
                    <div class="card-body">
                        <form @submit.prevent="addmaxpredict">
                            <div class="row">
                                <div class="col-md-12 m-auto">
                                    <div class="adduser_form">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" class="form-control" v-model="tdate" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" class="form-control"
                                                        v-model="tenddate" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Fixed 2 Teams -->
                                        <div class="form-group mb-3">
                                            <div class="team_list">
                                                <div class="row">
                                                    <div class="col-md-12" v-for="(team, teamIndex) in teams"
                                                        :key="teamIndex">
                                                        <h6 class="select_title">Team {{ teamIndex + 1 }}</h6>
                                                        <div class="row">
                                                            <!-- Team Selection -->
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="select_title">Select Team</label>
                                                                    <select v-model="team.team_id"
                                                                        class="form-control mb-3">
                                                                        <option value="">Select Team</option>
                                                                        <option v-for="teamOption in teamOptions"
                                                                            :key="teamOption.id" :value="teamOption.id">
                                                                            {{ teamOption.name }}
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <!-- Player Selection (Minimum 15 Players) -->
                                                            <div class="col-md-3 col-sm-6"
                                                                v-for="(player, playerIndex) in 15" :key="playerIndex">
                                                                <label class="select_title">Select Player {{ playerIndex
                                                                    + 1 }}</label>
                                                                <select v-model="team.players[playerIndex]"
                                                                    class="form-control mb-3">
                                                                    <option value="" selected disabled>Select Player
                                                                    </option>
                                                                    <option v-for="playerOption in playerOptions"
                                                                        :key="playerOption.id" :value="playerOption.id">
                                                                        {{ playerOption.player_name }}
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>

                <h1 class="page_title">Tournament List </h1>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" v-model="itemsperpage" id="" @change="getMaxPredict(1)">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getMaxPredict(1)"
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
                                        <th class="text-center">Teams</th>
                                        <th>Start Date </th>
                                        <th>End Date </th>
                                        <!-- <th>Status </th> -->
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in maxPredictList" :key="index">
                                        <!-- =1==== {{ item.id }} -->
                                        <!-- =2=== {{ item.teams }} -->
                                        <td class="text-center">
                                            <span v-if="item.teams.length === 2">
                                                {{ item.teams[0].country?.name }} <strong>VS</strong> {{ item.teams[1].country?.name }}
                                            </span>
                                        </td>

                                        <td>{{ item.start_date }}</td>
                                        <td>{{ item.end_date }}</td>
                                        <!-- <td>
                                            <span :class="item.status == 1 ? 'badge bg-success' : 'badge bg-danger'">{{
                                                item.status == 1 ? "Active" : "inactive" }}</span>
                                        </td> -->
                                        <td class="text-center">
                                            <!-- <button type="button" class="btn btn-default p-2"
                                                @click="getdetails(item.id)" data-bs-toggle="modal"
                                                data-bs-target="#editMatch"><i class="fa-regular fa-pencil-square"
                                                    style="font-size: 16px;"></i></button> -->

                                            <NuxtLink :to="`/max-predict/players?predict_id=${item.id}`" class="btn btn_default py-2 ms-2">Team List</NuxtLink>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getMaxPredict(link.url.split('page=')[1])" class="page-link">
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
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';

const tdate = ref('');
const tenddate = ref('');
const status = ref('');
const searchInput = ref('');
const itemsperpage = ref('10');

// Fixed 2 Teams with Minimum 15 Players Each
const teams = ref([
    { team_id: '', players: Array(15).fill('') },
    { team_id: '', players: Array(15).fill('') }
]);

// Sample Team & Player Options (Fetch from API if needed)
const teamOptions = ref([]);
//
const playerOptions = ref([]);
const maxPredictList = ref([]);
const pagination = ref([]);

const teamsdata = () => {
    axios.get('api/team-list').then(response => {
        // console.log(response.data);
        teamOptions.value = response.data;
    })
}
const playersdata = () => {
    axios.get('api/player-list').then(response => {
        // console.log(response.data);
        playerOptions.value = response.data;
    })
}
const getMaxPredict = (page) => {
    axios.get('api/get-maxpredictList',{
        params:{
            searchInput: searchInput.value,
            items:itemsperpage.value,
            status: status.value,
            page: page,
        }
    }).then(response => {
        console.log(response.data);
        maxPredictList.value = response.data.data;
        pagination.value = response.data.pagination.links;
    })
}
// Form Submission with Validation
const addmaxpredict = () => {
    console.log("Submitting Form...");

    // Validation: Ensure each team is selected and has at least 15 players
    for (let i = 0; i < teams.value.length; i++) {
        if (!teams.value[i].team_id) {
            alert(`Please select a team for Team ${i + 1}.`);
            return;
        }
        if (teams.value[i].players.includes('')) {
            alert(`Please select at least 15 players for Team ${i + 1}.`);
            return;
        }
    }

    const formData = new FormData();
    formData.append("start_date", tdate.value);
    formData.append("end_date", tenddate.value);

    teams.value.forEach((team, teamIndex) => {
        formData.append(`teams[${teamIndex}][team_id]`, team.team_id);
        team.players.forEach((player, playerIndex) => {
            formData.append(`teams[${teamIndex}][players][${playerIndex}]`, player);
        });
    });

    console.log("FormData Entries:");
    for (let [key, value] of formData.entries()) {
        console.log(key, value);
    }

    axios.post("api/add-max-predict", formData)
        .then(response => {
            console.log("✅ Success:", response.data);
        })
        .catch(error => {
            console.error("❌ Error:", error);
        });
};
onMounted(() => {
    teamsdata();
    playersdata();
    getMaxPredict();
})
</script>
