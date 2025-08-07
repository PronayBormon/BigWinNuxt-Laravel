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
                                                    <input type="datetime-local" required class="form-control"
                                                        v-model="tdate" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" required class="form-control"
                                                        v-model="tenddate" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Fixed 2 Teams -->
                                        <div class="form-group mb-3">
                                            <div class="team_list">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h6 class="select_title">Team </h6>
                                                        <div class="row">
                                                            <!-- Team Selection -->
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="select_title">Select Team</label>

                                                                    <select id="teamA" required
                                                                        class="js-example-basic-single"
                                                                        style="width: 100%;">
                                                                        <option value="">Select Team</option>
                                                                        <option v-for="team in teamOptions"
                                                                            :key="team.id" :value="team.id">{{ team.name
                                                                            }}</option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <!-- Player Selection (Minimum 15 Players) -->
                                                            <div v-for="n in 15" :key="'a' + n"
                                                                class="col-md-3 col-sm-6">
                                                                <label class="select_title">Player {{ n }}</label>
                                                                <select :id="'team0player' + (n - 1)" required
                                                                    class="js-example-basic-single"
                                                                    style="width: 100%;">
                                                                    <option value="">Select Player</option>
                                                                    <option v-for="player in playerOptions"
                                                                        :key="player.id" :value="player.id">{{
                                                                            player.player_name }}</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <h6 class="select_title">Team B</h6>
                                                        <div class="row">
                                                            <!-- Team Selection -->
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="select_title">Select Team</label>


                                                                    <select id="teamB" required
                                                                        class="js-example-basic-single"
                                                                        style="width: 100%;">
                                                                        <option value="">Select Team</option>
                                                                        <option v-for="team in teamOptions"
                                                                            :key="team.id" :value="team.id">{{ team.name
                                                                            }}</option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <!-- Player Selection (Minimum 15 Players) -->
                                                            <div v-for="n in 15" :key="'b' + n"
                                                                class="col-md-3 col-sm-6">
                                                                <label class="select_title">Player {{ n }}</label>
                                                                <select :id="'team1player' + (n - 1)" required
                                                                    class="js-example-basic-single"
                                                                    style="width: 100%;">
                                                                    <option value="">Select Player</option>
                                                                    <option v-for="player in playerOptions"
                                                                        :key="player.id" :value="player.id">{{
                                                                            player.player_name }}</option>
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
import { ref, onMounted, nextTick, watch } from 'vue';
import { apiFetch } from '~/utils/api';
import { useNuxtApp } from '#app';

const { $notyf } = useNuxtApp();

const tdate = ref('');
const tenddate = ref('');
const status = ref('');
const searchInput = ref('');
const itemsperpage = ref('10');

const teamOptions = ref([]);
const playerOptions = ref([]);
const maxPredictList = ref([]);
const pagination = ref([]);

const teams = ref([
    { team_id: '', players: Array(15).fill('') },
    { team_id: '', players: Array(15).fill('') }
]);

const teamsdata = async () => {
    try {
        const res = await apiFetch('/api/team-list');
        teamOptions.value = await res.json();
    } catch (error) {
        await handleError(error);
    }
};

const playersdata = async () => {
    try {
        const res = await apiFetch('/api/player-list');
        playerOptions.value = await res.json();
    } catch (error) {
        await handleError(error);
    }
};

const getMaxPredict = async (page = 1) => {
    try {
        const query = new URLSearchParams({
            searchInput: searchInput.value,
            items: itemsperpage.value,
            status: status.value,
            page
        });
        const res = await apiFetch(`/api/get-maxpredictList?${query.toString()}`);
        const data = await res.json();
        maxPredictList.value = data.data;
        pagination.value = data.pagination.links;
    } catch (error) {
        await handleError(error);
    }
};

const chageStatus = async (id) => {
    try {
        const res = await apiFetch(`/api/update-max-predict?id=${id}`);
        const data = await res.json();
        if (data.status == 200) {
            $notyf.success(data.message);
            getMaxPredict();
        } else {
            $notyf.error(data.errors.status[0]);
        }
    } catch (error) {
        const err = error?.response?._data?.errors || {};
        for (const field in err) {
            err[field].forEach(msg => $notyf.error(msg));
        }
    }
};

const addmaxpredict = async () => {
    for (let i = 0; i < teams.value.length; i++) {
        if (!teams.value[i].team_id) {
            $notyf.success("Please select team");
            return;
        }
        if (teams.value[i].players.includes('')) {
            $notyf.success("Please select match");
            return;
        }
    }
    if(tdate.value == tenddate.value){
            $notyf.success("Please select match");
    }

    const formData = new FormData();
    formData.append("start_date", tdate.value);
    formData.append("end_date", tenddate.value);

    teams.value.forEach((team, i) => {
        formData.append(`teams[${i}][team_id]`, team.team_id);
        team.players.forEach((player, j) => {
            formData.append(`teams[${i}][players][${j}]`, player);
        });
    });

    try {
        const res = await apiFetch('/api/add-max-predict', {
            method: 'POST',
            body: formData,
        });
        const data = await res.json();
        $notyf.success(data.message);
        getMaxPredict();
    } catch (error) {
        const err = error?.response?._data?.errors || {};
        for (const field in err) {
            err[field].forEach(msg => $notyf.error(msg));
        }
    }
};

function initSelect2() {
    if (window.$ && typeof window.$.fn.select2 === 'function') {
        // Team selectors
        const $teamA = window.$('#teamA');
        const $teamB = window.$('#teamB');

        $teamA.select2().on('change', (e) => {
            teams.value[0].team_id = e.target.value;
        });

        $teamB.select2().on('change', (e) => {
            teams.value[1].team_id = e.target.value;
        });

        // Player selectors
        for (let teamIndex = 0; teamIndex < 2; teamIndex++) {
            for (let playerIndex = 0; playerIndex < 15; playerIndex++) {
                const id = `#team${teamIndex}player${playerIndex}`;
                const $player = window.$(id);
                $player.select2().on('change', (e) => {
                    teams.value[teamIndex].players[playerIndex] = e.target.value;
                });
            }
        }
    } else {
        console.warn('Select2 or jQuery not loaded.');
    }
}

onMounted(async () => {
    await teamsdata();
    await playersdata();
    await nextTick(); // Ensure DOM is updated
    initSelect2();
    getMaxPredict();
});

watch([teamOptions, playerOptions], async () => {
    await nextTick();
    initSelect2();
});
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
