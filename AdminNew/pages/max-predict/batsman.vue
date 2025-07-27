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
                    <h3 class="page_title my-0">Batsman</h3>
                </div>
                <div class="card app_card ">
                    <div class="card-body card_report_body">
                        <div class="card card_report">
                            <div class="card-header">
                                <h3>Batsman</h3>
                            </div>
                            <div class="card-body">
                                <div class="history_details table-responsive">
                                    <table class="table mb-3">
                                        <thead>
                                            <tr>
                                                <th>Player Name</th>
                                                <th class="text-center">R</th>
                                                <!-- <th class="text-center">B</th> -->
                                                <!-- <th class="text-center">4s</th> -->
                                                <th class="text-center">6s</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in batsmanList">
                                                <!-- {{ item }} -->
                                                <td>{{item.team_players.player.player_name}}</td>
                                                <td class="text-center">{{item.run}}</td>
                                                <!-- <td class="text-center">{{item.ball}}</td> -->
                                                <!-- <td class="text-center">{{item.total_4}}</td> -->
                                                <td class="text-center">{{item.total_6}}</td>
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
// import axios from "axios";

const { $axios } = useNuxtApp();
const axios = $axios;

const route = useRoute();
const matchId = route.query.id;
const userId = route.query.user_id;

const batsmanList = ref([]);

// console.log(matchId, userId);  // These will contain the ID values

const getbatsMandata = async () => {
  try {
    const query = new URLSearchParams({
      matchId: matchId,
      userId: userId,
    });

    const response = await apiFetch(`/api/batsman-data?${query.toString()}`, {
      method: 'GET',
    });

    const data = await response.json();
    batsmanList.value = data; // Assign to your ref

  } catch (e) {
    await handleError(e);
  }
};

const back = () =>{
    router.back();
}

onMounted(()=>{
    getbatsMandata();
})



</script>
