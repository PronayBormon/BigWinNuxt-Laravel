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

                <div class="d-flex align-items-center my-2">
                    <button type="button" @click="back" class="btn btn-default py-0"><i
                            class="fa-solid fa-arrow-left"></i></button>
                    <h3 class="page_title my-0">Tournament</h3>
                </div>
                <div class="card app_card ">
                    <div class="card-body card_report_body">
                        <div class="card card_report mb-3">
                            <div class="card-header">
                                <h3>Winner</h3>
                            </div>
                            <div class="card-body">
                                <div class="history_details table-responsive">
                                    <table class="table mb-3">
                                        <thead>
                                            <tr>
                                                <th>Team</th>
                                                <th class="text-center">Man of the Match</th>
                                                <th class="text-center">Man of the Tournament</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="champion">
                                                
                                                <td>{{ champion.team.team.name }}</td>
                                                <td class="text-center">{{champion.mom.player.player_name}}</td>
                                                <td class="text-center">{{champion.mot.player.player_name}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card card_report mb-3">
                            <div class="card-header">
                                <h3>Finalist</h3>
                            </div>
                            <div class="card-body">
                                <div class="history_details table-responsive">
                                    <table class="table mb-3">
                                        <thead>
                                            <tr>
                                                <th>Team A</th>
                                                <th class="text-center">Team B</th>
                                                <th class="text-center">Highest Wicket Taker</th>
                                                <th class="text-center">High Scorer</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="Final">
                                                <td>{{Final.team_one.team.name}}</td>
                                                <td class="text-center">{{Final.team_two.team.name}}</td>
                                                <td class="text-center">{{Final.hwt.player.player_name}}</td>
                                                <td class="text-center">{{Final.hs.player.player_name}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card card_report mb-3">
                            <div class="card-header">
                                <h3>Semi Finalist</h3>
                            </div>
                            <div class="card-body">
                                <div class="history_details table-responsive">
                                    <table class="table mb-3">
                                        <thead>
                                            <tr>
                                                <th>Team</th>
                                                <th class="text-center">Match</th>
                                                <th class="text-center">Win</th>
                                                <th class="text-center">Lose</th>
                                                <th class="text-center">Tie</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in semiFinal">
                                                <!-- {{ item }} -->
                                                <td>{{item.team.team.name}}</td>
                                                <td class="text-center">{{item.match}}</td>
                                                <td class="text-center">{{item.win}}</td>
                                                <td class="text-center">{{item.los}}</td>
                                                <td class="text-center">{{item.tie}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
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

const user_id = route.query.id;
// console.log(user_id + "===============");

const semiFinal = ref([]);
const Final = ref();
const champion = ref();



const back = () => {
    router.back();
}
const fetchData = () => {
    axios.get(`/api/getUserPredictions/${user_id}`).then(response => {
        // console.log(response.data);

        semiFinal.value = response.data.semi_final;
        Final.value = response.data.final;
        champion.value = response.data.champion;
    });
}

onMounted(() => {
    fetchData();
})


</script>
