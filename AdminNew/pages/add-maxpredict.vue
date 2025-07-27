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
                                                                        class="form-control mb-3 js-example-basic-single">
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
                                                                    class="form-control mb-3 js-example-basic-single">
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

                <h1 class="page_title">Max Predict List </h1>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" v-model="itemsperpage" id="" @change="getMaxPredict()">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getMaxPredict()"
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
                                        <th>Status </th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in maxPredictList" :key="index">
                                        <!-- =1==== {{ item.id }} -->
                                        <!-- =2=== {{ item.teams }} -->
                                        <td class="text-center">
                                            <span v-if="item.teams.length === 2">
                                                {{ item.teams[0].country?.name }} <strong>VS</strong> {{
                                                    item.teams[1].country?.name }}
                                            </span>
                                        </td>

                                        <td>{{ item.start_date }}</td>
                                        <td>{{ item.end_date }}</td>
                                        <!-- <td>{{ item.status }}</td> -->
                                        <td>
                                            <span
                                                :class="item.status == 'active' ? 'badge bg-success' : 'badge bg-danger'">{{
                                                    item.status == 'active' ? "Active" : "inactive" }}</span>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-default p-2"
                                                @click="chageStatus(item.id)">Change Status</button>

                                            <NuxtLink :to="`/max-predict/players?predict_id=${item.id}`"
                                                class="btn btn_default py-2 ms-2">Players</NuxtLink>
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
import { apiFetch } from '~/utils/api'
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

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
const teamsdata = async () => {
    try {
        const response = await apiFetch('/api/team-list');
        teamOptions.value = await response.json();
    } catch (error) {
        await handleError(error);
    }
};

const playersdata = async () => {
    try {
        const response = await apiFetch('/api/player-list');
        playerOptions.value = await response.json();
    } catch (error) {
        await handleError(error);
    }
};

const chageStatus = async (id) => {
    try {
        const response = await apiFetch(`/api/update-max-predict?id=${id}`, {
            method: 'GET',
        });

        const data = await response.json();
        // console.log(data.errors);

        if(data.status == 200){
            $notyf.success(data.message);
            getMaxPredict();
        }else{

            $notyf.error(data.errors.status[0]);
        }


    } catch (error) {
        if (error.response && error.response._data?.errors) {
            const errorMessages = error.response._data.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => $notyf.error(msg));
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
    }
};

const getMaxPredict = async (page =1 ) => {
    try {
    const query = new URLSearchParams({
      searchInput: searchInput.value,
      items: itemsperpage.value,
      status: status.value,
      page: page,
    });

    const response = await apiFetch(`/api/get-maxpredictList?${query.toString()}`, {
      method: 'GET',
    });

        const data = await response.json();
        maxPredictList.value = data.data;
        pagination.value = data.pagination.links;
    } catch (error) {
        await handleError(error);
    }
};

// Form Submission with Validation
const addmaxpredict = async () => {
    // Basic Validation
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

    try {
        const response = await apiFetch('/api/add-max-predict', {
            method: 'POST',
            body: formData,
        });

        const data = await response.json();
        $notyf.success(data.message);
        getMaxPredict();
    } catch (error) {
        if (error.response && error.response._data?.errors) {
            const errorMessages = error.response._data.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => $notyf.error(msg));
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
    }
};

onMounted(() => {
    if (window.$ && typeof window.$.fn.select2 === 'function') {
        window.$('.js-example-basic-single').select2()
    } else {
        console.warn('Select2 or jQuery not loaded.')
    }
    teamsdata();
    playersdata();
    getMaxPredict();
})
</script>

<style>
.select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 35px;
}

.select2-container .select2-selection--single {
    height: 35px;
}
</style>
