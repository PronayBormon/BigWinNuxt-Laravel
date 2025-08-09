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
                    <h3 class="page_title my-0">{{ tournamentName }} result</h3>
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
                                                <th class="text-center">Man of the Tournament</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="champion">

                                                <td>{{ champion.team }}</td>
                                                <!-- <td class="text-center">{{champion.mom.player.player_name}}</td> -->
                                                <td class="text-center">{{ champion.mot }}
                                                </td>
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
                                                <th class="text-center">Man of the match</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="finals">
                                                <td>{{ finals.teamA }}</td>
                                                <td class="text-center">{{ finals.teamB }}</td>
                                                <td class="text-center">{{ finals.hs }}</td>
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
                                                <th class="text-center">Win</th>
                                                <th class="text-center">PTS</th>
                                                <!-- <th class="text-center">Lose</th>
                                                <th class="text-center">Tie</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in semi">
                                                <!-- {{ item }} -->
                                                <td>{{ item.team }}</td>
                                                <td class="text-center">{{ item.win }}</td>
                                                <td class="text-center">{{ item.pts }}</td>
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
import { useRoute } from 'vue-router';
const router = useRouter();
import { apiFetch } from '~/utils/api'
const { $notyf } = useNuxtApp();
const route = useRoute();
const id = route.query.id;
const tournamentName = route.query.tournament;

const champion = ref();
const semi = ref([]);
const finals = ref();


const back = () => {
      router.go(-1); // works like back()
}

const getTournamentResult = async (pages) => {
    const response = await apiFetch(`/tournament/result/${id}`, {
        method: 'GET'
    });
    const data = await response.json();
    // console.log(data.code);
    if (data.code == 404) {
        $notyf.error(data.message || 'Settings updated successfully')
    }


    champion.value = data.champion;
    semi.value = data.semi;
    finals.value = data.finals;

    console.log('Champion:', champion.value);
    console.log('Semi:', semi.value);
    console.log('Finals:', finals.value);
};

onMounted(() => {
    getTournamentResult();
})



</script>
