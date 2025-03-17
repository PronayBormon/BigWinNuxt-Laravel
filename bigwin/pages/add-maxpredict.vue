<template>
    <div class="main_container">
        <!-- Sidebar -->
        <Sidebar />

        <!-- Main Content -->
        <div class="main_content">
            <!-- Navbar -->
            <Navbar />

            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Max Predict</h1>
                </div>

                <div class="card banner_card">
                    <div class="card-body">
                        <form @submit.prevent="addmaxpredict">
                            <div class="row">
                                <div class="col-md-12 m-auto">
                                    <div class="adduser_form">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" class="form-control" v-model="tdate" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" class="form-control"
                                                        v-model="tenddate" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Dynamic Team Selection -->
                                        <div class="form-group mb-3">
                                            <div class="team_list">
                                                <div class="row">
                                                    <!-- For each team -->
                                                    <div class="col-md-12">
                                                        <h6 class="select_title">Team 1</h6>
                                                        <div class="row">
                                                            <!-- Team Selection -->
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="select_title">Select Team One</label>
                                                                    <select v-model="team" class="form-control mb-3">
                                                                    <option value="">Select Team</option>
                                                                    <option> TeamOption </option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <hr>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-12">
                                                        <h6 class="select_title">Team 1</h6>
                                                        <div class="row">
                                                            <!-- Team Selection -->
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="select_title">Select Team One</label>
                                                                    <select v-model="team" class="form-control mb-3">
                                                                    <option value="">Select Team</option>
                                                                    <option> TeamOption </option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player</label>
                                                                <select v-model="palyer" class="form-control mb-3">
                                                                    <option value="" selected disabled>Select  Player </option>
                                                                    <option> option 1</option>
                                                                </select>
                                                            </div>
                                                            <hr>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from "axios";
import { useRouter } from 'vue-router';
const router = useRouter();

const tdate = ref("");
const tenddate = ref("");

const tournamentList = ref([]);
const pagination = ref([]);
const items = ref('10');
const searchInput = ref();



const team = ref([]);
const teams = ref([]);
const player = ref([]);

const addmaxpredict = () =>{
    console.log(Array.isArray(teams)); // Should print true
console.log(teams); // See what's inside


}

const getTournamentList = (pages) => {
    axios.get('api/get-tournamentList', {
        params: {
            items: items.value,
            search: searchInput.value,
            page: pages,
        }
    }).then(response => {
        tournamentList.value = response.data.data;
        pagination.value = response.data.pagination.links;
        // console.log(response.data.data);
    });
}
onMounted(() => {
    // teamsdata();
    // playersdata();
    // getTournamentList();
})
</script>
