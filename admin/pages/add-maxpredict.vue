<template>
    <div class="main_container">
        <Sidebar />
        <div class="main_content">
            <Navbar />
            <div class="content_section">
                <h1 class="page_title">Add Max Predict</h1>
                <div class="card banner_card">
                    <div class="card-body">
                        <form @submit.prevent="addmaxpredict">
                            <div class="row">
                                <div class="col-md-3">
                                    <input type="datetime-local" v-model="tdate" class="form-control mb-3" />
                                </div>
                                <div class="col-md-3">
                                    <input type="datetime-local" v-model="tenddate" class="form-control mb-3" />
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <div v-for="(team, teamIndex) in teams" :key="teamIndex" class="mb-4 border p-3">
                                    <h6>Team {{ teamIndex + 1 }}</h6>
                                    <select :data-index="teamIndex" class="form-control team-select"
                                        v-model="team.team_id">
                                        <option value="">Select Team</option>
                                        <option v-for="t in teamOptions" :key="t.id" :value="t.id">{{ t.name }}</option>
                                    </select>

                                    <div class="row mt-3">
                                        <div class="col-md-4" v-for="(player, playerIndex) in team.players"
                                            :key="playerIndex">
                                            <select :data-team="teamIndex" :data-player="playerIndex"
                                                class="form-control player-select mt-2"
                                                v-model="team.players[playerIndex]">
                                                <option value="">Select Player {{ playerIndex + 1 }}</option>
                                                <option v-for="p in playerOptions" :key="p.id" :value="p.id">
                                                    {{ p.player_name }}
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
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
import { ref, onMounted, nextTick, watch } from 'vue'
// import axios from 'axios'
const { $axios } = useNuxtApp();
const axios = $axios;
import { useNuxtApp } from '#app'
const { $notyf } = useNuxtApp()

const tdate = ref('')
const tenddate = ref('')
const teams = ref([
    { team_id: '', players: Array(15).fill('') },
    { team_id: '', players: Array(15).fill('') }
])
const teamOptions = ref([])
const playerOptions = ref([])

const status = ref('');
const searchInput = ref('');
const itemsperpage = ref('10');

const maxPredictList = ref([]);
const pagination = ref([]);

const initSelect2 = () => {
    nextTick(() => {
        $('.team-select').each(function () {
            const index = $(this).data('index')
            $(this).select2().on('change', function () {
                teams.value[index].team_id = $(this).val()
            })
            $(this).val(teams.value[index].team_id).trigger('change')
        })

        $('.player-select').each(function () {
            const teamIndex = $(this).data('team')
            const playerIndex = $(this).data('player')
            $(this).select2().on('change', function () {
                teams.value[teamIndex].players[playerIndex] = $(this).val()
            })
            $(this)
                .val(teams.value[teamIndex].players[playerIndex])
                .trigger('change')
        })
    })
}

onMounted(() => {
    teamsdata();
    playersdata();
    teamsdata();
    playersdata();
    getMaxPredict();
})

watch([teams, teamOptions, playerOptions], () => initSelect2(), {
    deep: true
})


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
const chageStatus = (id) => {
    axios.get('api/update-max-predict', {
        params: {
            id: id,
        }
    }).then(response => {
        // console.log(response.data.errors.status);
        $notyf.success(response.data.message);
        getMaxPredict();
    }).catch(error => {
        console.log("Error:", error.response);
        if (error.response && error.response.data && error.response.data.errors) {
            const errorMessages = error.response.data.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg); // make sure $notyf is defined
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
    });

}

const getMaxPredict = (page) => {
    axios.get('api/get-maxpredictList', {
        params: {
            searchInput: searchInput.value,
            items: itemsperpage.value,
            status: status.value,
            page: page,
        }
    }).then(response => {
        // console.log(response.data);
        maxPredictList.value = response.data.data;
        pagination.value = response.data.pagination.links;
    })
}
const addmaxpredict = () => {
    for (let i = 0; i < teams.value.length; i++) {
        if (!teams.value[i].team_id) {
            alert(`Please select a team for Team ${i + 1}`)
            return
        }
        if (teams.value[i].players.includes('')) {
            alert(`Please select all 15 players for Team ${i + 1}`)
            return
        }
    }

    const formData = new FormData()
    formData.append('start_date', tdate.value)
    formData.append('end_date', tenddate.value)

    teams.value.forEach((team, i) => {
        formData.append(`teams[${i}][team_id]`, team.team_id)
        team.players.forEach((player, j) => {
            formData.append(`teams[${i}][players][${j}]`, player)
        })
    })

    axios.post("api/add-max-predict", formData)
        .then(response => {
            $notyf.success(response.data.message);
            getMaxPredict();
        }).catch(error => {
            // If the error response is validation errors, show them using Notyf
            if (error.response && error.response.data && error.response.data.errors) {
                const errorMessages = error.response.data.errors;

                // Loop through the errors object and show each error message
                for (const field in errorMessages) {
                    if (errorMessages.hasOwnProperty(field)) {
                        errorMessages[field].forEach((msg) => {
                            $notyf.error(msg); // Show each error message using Notyf
                        });
                    }
                }
            } else {
                $notyf.error("An error occurred. Please try again.");
            }
        }); F
}
</script>

<style scoped>
.select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 35px;
}

.select2-container .select2-selection--single {
    height: 35px;
}
</style>