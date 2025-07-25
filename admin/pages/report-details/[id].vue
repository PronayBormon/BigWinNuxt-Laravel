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
                    <div class="d-flex align-items-center">
                        <button type="button" class="btn btn-primary me-2" data-bs-target="#result"
                            data-bs-toggle="modal">Add Result</button>
                        <button type="button" class="btn btn-primary" data-bs-target="#addManual"
                            data-bs-toggle="modal">Add
                            Manual</button>
                    </div>
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
                            <div class="show_">
                                <p>Status</p>
                                <select name="" @change="predictUsers(1)" v-model="status" id="">
                                    <option value="">All</option>
                                    <option value="win">Win</option>
                                    <option value="lose">Lose</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="predictUsers(1)"
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
                                    <tr v-if="predictList && predictList.length" v-for="item in predictList">
                                        <td class="text-start">
                                            <p class="mb-0">{{ item.user.username }}</p>
                                            <p class="mb-0">{{ item.user.email }}</p>
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
                                            <span v-if="item.result != null">{{ item.result.team.name }}</span><span class="active page-item badge text-danger" v-if="item.result == null">Not Added
                                                Yet.</span>
                                        </td>
                                        <td class="text-end">
                                            <strong v-if="item.result != null">
                                                <span class="badge bg-success"
                                                    v-if="item.result.team_id == item.predict_team_id && item.result != null">Win</span>
                                                <span class="badge bg-danger"
                                                    v-if="item.result.team_id != item.predict_team_id && item.result != null">Lose</span>
                                            </strong>

                                            <span class="badge active page-item text-danger" v-if="item.result == null">Not Added
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

                        <!-- <ul class="report_user">
                            <li v-if="predictList && predictList.length" v-for="item in predictList">
                                <nuxt-link>
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>User: {{ capitalize(item.user.username) }}, {{ item.user.email }}</h3>
                                            <p><strong>Match: </strong>{{ item.match.team_a.name }} Vs
                                                {{ item.match.team_b.name }}</p>
                                            <p><strong>Predict: </strong>{{ item.team.name }}</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                            <li v-else>
                                <a class="text-center d-flex justify-content-center">
                                    <p class="text-center mb-0">No Prediction Available Yet.</p>
                                </a>
                            </li>
                        </ul> -->

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

                <div class="modal fade" id="result" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="adduser_form">
                                    <h1>Select Winner</h1>
                                    <!-- ============ -->
                                    <form @submit.prevent="addResult">
                                        <div class="form-group mb-3"
                                            v-if="teamlist && teamlist.team_a && teamlist.team_b">
                                            <select name="" id="" required autocomplete="off" class="form-control"
                                                v-model="result_team_id">
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
// import axios from 'axios';
const { $axios } = useNuxtApp();
const axios = $axios;
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const route = useRoute();
const matchId = route.params.id;
// console.log("==============" + matchId);

const router = useRouter();

const userdata = ref([]);
const teamlist = ref();

const result_team_id = ref("");

const user_id = ref('');
const team_id = ref('');
const predictList = ref([]);
const pagination = ref([]);

//demo
const winner_list = ref([]);

const searchInput = ref();
const items = ref('10');
const status = ref('');

const back = () => {
    router.back();
}
// const getwinner = () => {
//     axios.get(`api/single-match-winner/${matchId}`)
//         .then(response => {
//             // console.log(response.data);
//             winner_list.value = response.data;
//         })
// }
const capitalize = (str) => {
    return str.replace(/\b\w/g, (char) => char.toUpperCase());
};
const addResult = () => {
    const formData = new FormData();

    formData.append('match_id', matchId);
    formData.append('team_id', result_team_id.value);

    console.log(formData);
    // add-single-match-result
    axios.post('api/add-single-match-result', formData).then(response => {
        // match_id.value = "";
        result_team_id.value = "";

        let modalElement = document.getElementById('result');
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
const addPredict = () => {
    const formData = new FormData();

    formData.append('match_id', matchId);
    formData.append('user_id', user_id.value);
    formData.append('team_id', team_id.value);

    // console.log(formData);

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
        
        if(response.data.error != null){

            $notyf.error(response.data.error);
        }else{
            $notyf.success(response.data.message);
        }
    }).catch(error => {
        console.log('error');
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

const BowlerWinner = async () => {
    try {
        const id = matchId; // Ensure matchId is defined
        if (!id) {
            console.error("matchId is undefined or null");
            return;
        }
        const response = await axios.get(`api/bowler-winner-users`, 
            {
                params:{
                    id: matchId,
                }
            }
        );
        console.log(response.data); // Check the structure of this response
        // teamlist.value = response.data;  
    } catch (error) {
        console.error("Error fetching team data:", error);
    }
};

const BatsmanWinner = async () => {
    try {
        const id = matchId; // Ensure matchId is defined
        if (!id) {
            console.error("matchId is undefined or null");
            return;
        }
        const response = await axios.get(`api/batsman-winner-users`, 
            {
                params:{
                    id: matchId,
                }
            }
        );
        console.log(response.data); // Check the structure of this response
        // teamlist.value = response.data;  
    } catch (error) {
        console.error("Error fetching team data:", error);
    }
};



const teamdata = async () => {
    try {
        const id = matchId; // Ensure matchId is defined
        if (!id) {
            console.error("matchId is undefined or null");
            return;
        }
        const response = await axios.get(`api/match-details/${id}`);
        // console.log(response.data); // Check the structure of this response
        teamlist.value = response.data; // Assuming teamlist is a ref() or reactive()
    } catch (error) {
        console.error("Error fetching team data:", error);
    }
};

const predictUsers = (page) => {
    axios.get('api/match-report-users', {
        params: {
            match_id: matchId,
            items: items.value,
            searchInput: searchInput.value,
            page: page,
            status: status.value,
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
    BowlerWinner();
    BatsmanWinner();
})



</script>
