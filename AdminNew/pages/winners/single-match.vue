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
                        <h3 class="page_title my-0">Single Match Winners</h3>
                    </div>
                    <div class="d-flex align-items-center">
                        <!-- <button type="button" class="btn btn-primary me-2" data-bs-target="#result"
                            data-bs-toggle="modal">Add Result</button> -->
                        <!-- <button type="button" class="btn btn-primary" data-bs-target="#addManual"
                            data-bs-toggle="modal">Add
                            Manual</button> -->
                    </div>
                </div>
                <div class="card app_card ">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" @change="getSingleMatchWinner(1)" v-model="items" id="">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <!--<div class="show_">
                                <p>Status</p>
                                <select name="" @change="getSingleMatchWinner(1)" v-model="status" id="">
                                    <option value="">All</option>
                                    <option value="win">Win</option>
                                    <option value="lose">Lose</option>
                                </select>
                            </div> -->


                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getSingleMatchWinner(1)"
                                        placeholder="Search" class="form-control nav_search">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-start">SL.</th>
                                        <th class="text-start">User</th>
                                        <th class="text-center">Spin Run </th>
                                        <th class="text-center">Match </th>
                                        <th class="text-center">(PDT) </th>
                                        <th class="text-center">Predicted</th>
                                        <th class="text-center">Result</th>
                                        <th class="text-end">Status (WIn/Lose)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="matchList && matchList.length" v-for="(item , index) in matchList">
                                        
                                        <td class="text-start">
                                            <span>{{ index+1 }}</span>
                                        </td>
                                        <td class="text-start">
                                            <p class="mb-0">{{ item.user.username }}</p>
                                            <p class="mb-0">{{ item.user.email }}</p>
                                            <p class="mb-0">{{ item.user.phone }}</p>
                                        </td>
                                        <td class="text-center">
                                            <span>{{ item.run }} Run</span>
                                        </td>
                                        <td class="text-center">{{ item.match.team_a.name }} Vs
                                            {{ item.match.team_b.name }}</td>
                                        <td class="text-center">
                                            {{ item.create_time }}
                                        </td>
                                        <td class="text-center">{{ item.team.name }}</td>
                                        <td class="text-center">
                                            <span v-if="item.result != null">{{ item.result.team.name }}</span><span
                                                class="active page-item badge text-danger"
                                                v-if="item.result == null">Not Added
                                                Yet.</span>
                                        </td>
                                        <td class="text-end">
                                            <strong v-if="item.result != null">
                                                <span class="badge bg-success"
                                                    v-if="item.result.team_id == item.predict_team_id && item.result != null">Win</span>
                                                <span class="badge bg-danger"
                                                    v-if="item.result.team_id != item.predict_team_id && item.result != null">Lose</span>
                                            </strong>

                                            <span class="badge active page-item text-danger"
                                                v-if="item.result == null">Not Added
                                                Yet.</span>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="7" class="text-center">
                                            <p class="mb-0">No Prediction Available Yet.</p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                        <ul class="pagination">
                            <li v-for="link in pagination" :key="link.label"
                                :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                <a v-if="link.url" href="#" @click.prevent="predictUsers(link.url.split('page=')[1])"
                                    class="page-link">
                                    {{ link.label }}
                                </a>
                                <span v-else>{{ link.label }}</span>
                            </li>
                        </ul>

                        <hr>

                    </div>
                </div>


            </div>
        </div>

    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { apiFetch } from '~/utils/api'
import { useNuxtApp } from '#app';

const route = useRoute();
const router = useRouter();
const matchId = route.query.id;


const matchList = ref([]);
const pagination = ref([]);
const items = ref('10');
const searchInput = ref();
// console.log("Match ID from query string:", matchId);

const back = () => {
    router.back();
}

const getSingleMatchWinner = async () => {
  try {
    const queryParams = new URLSearchParams({
      items: items.value,
      id: matchId
    }).toString();

    const response = await apiFetch(`/api/match-winner-list?${queryParams}`);
    const data = await response.json();

    // console.log(data)

    if (response.ok) {
      matchList.value = data.data;
    } else {
      $notyf.error(data.message || "Failed to fetch match winner list.");
    }
  } catch (error) {
    $notyf.error("An error occurred while fetching match winners.");
  }
};


onMounted(() => {
    getSingleMatchWinner();
});

</script>
