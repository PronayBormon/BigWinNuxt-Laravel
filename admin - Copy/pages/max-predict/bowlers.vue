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
                    <button type="button" @click="back" class="btn btn-default py-0"><i class="fa-solid fa-arrow-left"></i></button>
                    <h3 class="page_title my-0">Bowlers</h3>
                </div>
                <div class="card app_card ">
                    <div class="card-body card_report_body">
                        <div class="card card_report">
                            <div class="card-header">
                                <h3>Bowlers</h3>
                            </div>
                            <div class="card-body">
                                <div class="history_details table-responsive">
                                    <table class="table mb-3">
                                        <thead>
                                            <tr>
                                                <th>Player Name</th>
                                                <!-- <th class="text-center">O</th>
                                                <th class="text-center">M</th> -->
                                                <th class="text-center">R</th>
                                                <th class="text-center">W</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in bowlersList">
                                                <td>{{item.team_players.player.player_name}}</td>
                                                <!-- <td class="text-center">{{item.over}}</td>
                                                <td class="text-center">{{item.maden_over}}</td> -->
                                                <td class="text-center">{{item.run}}</td>
                                                <td class="text-center">{{item.wicket}}</td>
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
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
const globalScript = useGlobalScript();
import { useRouter } from 'vue-router';

const router = useRouter();

import { useRoute } from 'vue-router';
import axios from 'axios';

const route = useRoute();
const matchId = route.query.id;
const userId = route.query.user_id;

const bowlersList = ref([]);

// console.log(matchId, userId);  // These will contain the ID values

const getBollerdata = () =>{
    axios.get('api/bowlers-data', {
        params:{
            matchId: matchId,
            userId: userId,
        }
    }).then(response =>{
        // console.log(response.data);
        bowlersList.value = response.data;
    })
}
const back = () =>{
    router.back();
}

onMounted(()=>{
    getBollerdata();
})


</script>
