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
                        <h3 class="page_title my-0">Single Match Reports</h3>
                    </div>
                    <button type="button" class="btn btn-primary" data-bs-target="#addManual" data-bs-toggle="modal">Add
                        Manual</button>
                </div>
                <div class="card app_card ">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" @change="predictUsers(1)" v-model="items" id="">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="predictUsers(1)" placeholder="Search" class="form-control nav_search">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <h1 class="page_title text-white ps-4 mb-0">All History</h1>

                        <ul class="report_user">
                            <li v-if="predictList && predictList.length" v-for="item in predictList">
                                <nuxt-link >
                                    <div class="img_part">
                                        <!-- <img src="/images/user.png" class="img-fluid" alt=""> -->
                                        <div>
                                            <h3>User: {{ capitalize(item.user.username) }}, {{ item.user.email }}</h3>
                                            <p><strong>Match: </strong>{{item.match.team_a.name}} Vs {{item.match.team_b.name}}</p>
                                            <p><strong>Predict: </strong>{{item.team.name}}</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                            <li v-else>
                                <a   class="text-center d-flex justify-content-center">
                                    <p class="text-center mb-0">No Prediction Available Yet.</p>
                                </a>
                            </li>
                        </ul>
                        
                        <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="predictUsers(link.url.split('page=')[1])" class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span>
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
                                    <!-- ============ -->
                                    <form @submit.prevent="addPredict">
                                        <div class="form-group mb-3">
                                            <select name="" v-model="user_id" required autocomplete="off" id=""
                                                class="form-control">
                                                <option value="" selected disabled>Select User</option>
                                                <option v-for="user in userdata" :value="user.id">{{ user.username
                                                    }}
                                                </option>
                                            </select>
                                        </div>
                                        <div class="form-group mb-3"
                                            v-if="teamlist && teamlist.team_a && teamlist.team_b">
                                            <select name="" id="" required autocomplete="off" class="form-control"
                                                v-model="team_id">
                                                <option value="">Select Team</option>
                                                <option :value="teamlist.team_a.id">{{ teamlist.team_a.name }}
                                                </option>
                                                <option :value="teamlist.team_b.id">{{ teamlist.team_b.name }}
                                                </option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </form>
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
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
import { useRoute } from 'vue-router';
import axios from 'axios';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const route = useRoute();
const matchId = route.params.id;
// console.log("==============" + matchId);

const router = useRouter();

const userdata = ref([]);
const teamlist = ref([]);

const user_id = ref('');
const team_id = ref('');
const predictList = ref([]);
const pagination = ref([]);

const searchInput = ref();
const items = ref('10');

const back = () => {
    router.back();
}
const capitalize = (str) => {
  return str.replace(/\b\w/g, (char) => char.toUpperCase());
};

const addPredict = () => {
    const formData = new FormData();

    formData.append('match_id', matchId);
    formData.append('user_id', user_id.value);
    formData.append('team_id', team_id.value);

    console.log(formData);

    axios.post('api/add-singlematch-predict', formData).then(response => {
        // match_id.value = "";
        user_id.value = "";
        team_id.value = "";

        let modalElement = document.getElementById('addManual');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        predictUsers(1);
        $notyf.success(response.data.message);
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

const userList = () => {
    axios.get('api/user-data').then(Response => {
        // console.log(Response.data);
        userdata.value = Response.data;
    })
}

const teamdata = async () => {
    try {
        const id = matchId; // Ensure matchId is defined
        if (!id) {
            console.error("matchId is undefined or null");
            return;
        }
        const response = await axios.get(`api/team-data/${id}`);
        // console.log(response.data); // Check the structure of this response
        teamlist.value = response.data; // Assuming teamlist is a ref() or reactive()
    } catch (error) {
        console.error("Error fetching team data:", error);
    }
};

const predictUsers = (page) => {
    axios.get('api/match-report-users',{
        params:{
            match_id: matchId,
            items: items.value,
            searchInput: searchInput.value,
            page: page,
        }
    }).then(Response => {
        // console.log(Response.data);
        predictList.value = Response.data.data;
        pagination.value = Response.data.pagination.links;
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

onMounted(() => {
    userList();
    predictUsers(1);
    teamdata();
})



</script>
