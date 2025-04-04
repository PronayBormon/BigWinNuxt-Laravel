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
                <h1 class="page_title">Max-predict Match List</h1>

                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" v-model="items" id="" @change="getTournamentList(1)">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getTournamentList(1)"
                                        placeholder="Search team" class="form-control nav_search">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="report_user">
                            <li v-for="(item, index) in maxPredictList" :key="index">
                                <nuxt-link :to="`/max-predict/predict-users?id=${item.id}`">
                                    <div class="img_part">
                                        <div>
                                            <span v-if="item.teams.length === 2">
                                                {{ item.teams[0].country?.name }} <strong>VS</strong> {{
                                                    item.teams[1].country?.name }}
                                            </span>
                                            <h3>{{ item.name }} </h3>
                                            <p><strong>Start:</strong> {{ item.start_date	 }}, <strong>End:</strong> {{
                                                item.end_date }}</p>
                                                <!-- <p>Total Participate: 20</p> -->
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                        </ul>

                        <ul class="pagination">
                            <li v-for="link in pagination" :key="link.label"
                                :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                <a v-if="link.url" href="#" @click.prevent="getTournamentList(link.url.split('page=')[1])"
                                    class="page-link">
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
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
const globalScript = useGlobalScript();
import axios from "axios";

const maxPredictList = ref([]);
const pagination = ref([]);
const items = ref('10');
const searchInput = ref();



const getMaxPredict = (page) => {
    axios.get('api/get-maxpredictList', {
        params: {
            searchInput: searchInput.value,
            items: items.value,
            page: page,
        }
    }).then(response => {
        // console.log(response.data);
        maxPredictList.value = response.data.data;
        pagination.value = response.data.pagination.links;
    })
}
onMounted(() => {
    getMaxPredict();
})



</script>
