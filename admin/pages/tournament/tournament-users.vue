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
                    <div class="d-flex align-items-center my-2">
                        <button type="button" @click="back" class="btn btn-default py-0"><i
                                class="fa-solid fa-arrow-left"></i></button>
                        <h3 class="page_title my-0"><span v-if="tournamename">{{ tournamename }}</span></h3>
                    </div>
                    <button type="button" class="btn btn-primary" data-bs-target="#addManual" data-bs-toggle="modal">Add
                        Manual</button>
                </div>
                <div class="card app_card ">
                    <div class="card-body">
                        <h1 class="page_title text-white ps-4 mb-0">All History</h1>

                        <ul class="report_user">

                            <li v-if="PredictUsers.users" v-for="item in PredictUsers.users">
                                <!-- {{ item }} -->
                                <nuxt-link :to="`/tournament/tournament-details?id=${item.id}`">
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>{{item.username}}</h3>
                                            <p>{{item.email}}</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                            <li v-else class="text-center">
                                <p class="text-center">No Data Available</p>
                            </li>
                        </ul>

                    </div>
                </div>

                <!-- =-============ Modal ============ -->
                <div class="modal fade" id="addManual" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">


                                <div class="adduser_form">

                                    <h1>Add Prediction</h1>
                                    <div class="d-flex align-items-center jsutify-content-center my-3">
                                        <ul class="nav tabs_navigation nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="Batting-tab" data-bs-toggle="tab"
                                                    data-bs-target="#semiFianl-pane" type="button" role="tab"
                                                    aria-controls="semiFianl-pane" aria-selected="true">Semi
                                                    Final</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link " id="final-tab" data-bs-toggle="tab"
                                                    data-bs-target="#final-pane" type="button" role="tab"
                                                    aria-controls="final-pane" aria-selected="false">Final</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link " id="Champion-tab" data-bs-toggle="tab"
                                                    data-bs-target="#Champion-pane" type="button" role="tab"
                                                    aria-controls="Champion-pane"
                                                    aria-selected="false">Champion</button>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- ============ -->

                                    <div class="tab-content mb-2" id="myTabContent">
                                        <!-- ======== Semi Final ========  -->
                                        <div class="tab-pane fade show active" id="semiFianl-pane" role="tabpanel"
                                            aria-labelledby="semiFianl" tabindex="0">
                                            <form @submit.prevent="addSemiFinalPrediction">
                                                <div class="form-group mb-3">
                                                    <select v-model="user_id" required class="form-control">
                                                        <option value="">Select User</option>
                                                        <option v-for="user in userdata" :value="user.id">{{
                                                            user.username
                                                        }}
                                                        </option>
                                                    </select>
                                                </div>

                                                <div v-for="(team, index) in teams" :key="index">
                                                    <label>Team {{ index + 1 }}</label>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Select Team</label>
                                                                <select v-model="team.team_id" class="form-control">
                                                                    <option value="" disabled>Select Team</option>
                                                                    <option v-for="item in tournament.teams"
                                                                        :value="item.id">{{
                                                                            item.team.name }}</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Match</label>
                                                                <input type="text" v-model="team.match"
                                                                    class="form-control" placeholder="Match">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Win</label>
                                                                <input type="text" v-model="team.win"
                                                                    class="form-control" placeholder="Win">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Lose</label>
                                                                <input type="text" v-model="team.los"
                                                                    class="form-control" placeholder="Lose">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Tie</label>
                                                                <input type="text" v-model="team.tie"
                                                                    class="form-control" placeholder="Tie">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>PTS</label>
                                                                <input type="text" v-model="team.pts"
                                                                    class="form-control" placeholder="PTS">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="submit" class="btn_primary w-100">Submit</button>
                                            </form>
                                        </div>
                                        <!-- ======== Final ========  -->
                                        <div class="tab-pane fade" id="final-pane" role="tabpanel"
                                            aria-labelledby="final" tabindex="0">
                                            <form @submit.prevent="addFinalPrediction">
                                                <div class="form-group mb-3">
                                                    <select v-model="fianl_user_id" required class="form-control">
                                                        <option value="">Select User</option>
                                                        <option v-for="user in userdata" :value="user.id">{{
                                                            user.username
                                                        }}
                                                        </option>
                                                    </select>
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label>Select Team One</label>
                                                    <select v-model="team_one" @change="teamOnePlayer"
                                                        class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in tournament.teams" :value="item.id">{{
                                                            item.team.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label>Select Team Two</label>
                                                    <select v-model="team_two" @change="teamOnePlayer"
                                                        class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in tournament.teams" :value="item.id">{{
                                                            item.team.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label>Highest Wicket Taker</label>
                                                    <!-- {{ teamPlayerList }} -->
                                                    <select v-model="hwt" class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in teamPlayerList" :value="item.id">{{
                                                            item.player.player_name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label>High Scorer</label>
                                                    <select v-model="hs" class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in teamPlayerList" :value="item.id">{{
                                                            item.player.player_name }}</option>
                                                    </select>
                                                </div>

                                                <button type="submit" class="btn_primary mt-2 w-100">Submit</button>
                                            </form>
                                        </div>
                                        <!-- ======== Champion ========  -->
                                        <div class="tab-pane fade " id="Champion-pane" role="tabpanel"
                                            aria-labelledby="Champion" tabindex="0">
                                            <form @submit.prevent="addChampion">
                                                <div class="form-group mb-3">
                                                    <select v-model="champion_user_id" required class="form-control">
                                                        <option value="">Select User</option>
                                                        <option v-for="user in userdata" :value="user.id">{{
                                                            user.username
                                                        }}
                                                        </option>
                                                    </select>
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label>Select Team</label>
                                                    <select v-model="champion_team" @change="teamOnePlayer"
                                                        class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in tournament.teams" :value="item.id">{{
                                                            item.team.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label>Man Of The Match</label>
                                                    <!-- {{ teamPlayerList }} -->
                                                    <select v-model="mom" class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in teamPlayerList" :value="item.id">{{
                                                            item.player.player_name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label>Man of The Tournament</label>
                                                    <select v-model="mot" class="form-control">
                                                        <option value="" disabled>Select Team</option>
                                                        <option v-for="item in teamPlayerList" :value="item.id">{{
                                                            item.player.player_name }}</option>
                                                    </select>
                                                </div>

                                                <button type="submit" class="btn_primary mt-2 w-100">Submit</button>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- ============ -->

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
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import { useNuxtApp } from '#app';
import PlayerList from '../player-list.vue';
const { $notyf } = useNuxtApp();

const route = useRoute();
const router = useRouter();  // Initialize router

const tid = route.query.id;
const tournamename = route.query.tournament;

const userdata = ref([]);
const tournament = ref([]);
const teamPlayerList = ref([]);
const PredictUsers = ref([]);

const user_id = ref("");

const fianl_user_id = ref("");
const team_one = ref("");
const team_two = ref("");
const hwt = ref("");
const hs = ref("");

const champion_user_id = ref("");
const champion_team = ref("");
const mom = ref("");
const mot = ref("");


const teams = ref([
    { team_id: '', match: '', win: '', los: '', tie: '', pts: '' },
    { team_id: '', match: '', win: '', los: '', tie: '', pts: '' },
    { team_id: '', match: '', win: '', los: '', tie: '', pts: '' },
    { team_id: '', match: '', win: '', los: '', tie: '', pts: '' }
]);

const addChampion = () => {
    const formData = new FormData();
    formData.append('match_id', tid);
    formData.append('user_id', champion_user_id.value);
    formData.append('team_id', champion_team.value);
    formData.append('mom', mom.value);
    formData.append('mot', mot.value);

    axios.post('api/predictions/champion', formData).then(response => {
        $notyf.success(response.data.message);
        // console.log(response.data);
        let modalElement = document.getElementById('addManual');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            // If it's not validation errors, show a general error message
            $notyf.error("An error occurred. Please try again.");
        }
    });

}

const addFinalPrediction = () => {
    const formData = new FormData();
    formData.append('match_id', tid);
    formData.append('user_id', fianl_user_id.value);
    formData.append('team_one', team_one.value);
    formData.append('team_two', team_two.value);
    formData.append('hwt', hwt.value);
    formData.append('hs', hs.value);

    // console.log(formData);
    axios.post('api/predictions/final', formData).then(response => {
        $notyf.success(response.data.message);
        // console.log(response.data);
        let modalElement = document.getElementById('addManual');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            // If it's not validation errors, show a general error message
            $notyf.error("An error occurred. Please try again.");
        }
    });
}
const addSemiFinalPrediction = () => {
    const formData = new FormData();
    formData.append('user_id', user_id.value);
    formData.append('match_id', tid);
    formData.append('teams', JSON.stringify(teams.value));

    axios.post('/api/predictions/semi-final', formData).then(response => {
        // console.log(response.data);
        $notyf.success(response.data.message);
        let modalElement = document.getElementById('addManual');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            // If it's not validation errors, show a general error message
            $notyf.error("An error occurred. Please try again.");
        }
    });
}

const teamOnePlayer = async () => {
    axios.get(`api/tournamet/team-players`, {
        params: {
            match_id: tid,
        }
    }).then(response => {
        // console.log(response.data);
        teamPlayerList.value = response.data;
    })
}
const back = () => {
    router.back(); // Correct method to navigate back
}

const details = () => {
    axios.get(`api/tournament-details/${tid}`).then(Response => {
        // console.log(Response.data);
        tournament.value = Response.data;
    })
}
const userList = () => {
    axios.get('api/user-data').then(Response => {
        // console.log(Response.data);
        userdata.value = Response.data;
    })
}

const predictList = () => {
    axios.get('/api/users-with-predictions', {
        params: { match_id: tid }
    }).then(response => {
        // console.log(response.data);
        PredictUsers.value = response.data;
    });

}

onMounted(() => {
    details();
    userList();
    predictList();
});
</script>
