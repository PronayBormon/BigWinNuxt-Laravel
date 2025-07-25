<template>
    <div class="main_container">
        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">
            <!-- navbar section  -->
            <Navbar />

            <!-- content section -->
            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Single Match</h1>
                    <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Banner</button> -->
                </div>

                <div class="row">
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white">Team Win Prediction page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="matchPagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="matchPage_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="previewImage">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Add</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white">Team Max-Prediction page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="maxPredictsave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="maxpredict_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="previewmaxPredict">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white">WalletPage page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="WalletPagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="wallet_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="preview_walletPage">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white"> Winner page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="WinnerPagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="winner_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="preview_winner">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white"> Profile page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="ProfilePagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="profile_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="previewProfile">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</template>

<script setup>
import { onMounted } from "vue";
import axios from "axios";
import { useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();
// $notyf.success(response.data.message);

const router = useRouter();

const matchPage = ref();
const maxpredict_image = ref();
const walletpage = ref();
const winnerPage = ref();
const profilepage = ref();

const maxpredict_image_preview = ref();
const wallet_image_preview = ref();
const winner_image_preview = ref();
const profile_image_preview = ref();
const matchPage_preview = ref();

const previewProfile = (event) => {
    const file = event.target.files[0];
    if (file) {
        profilepage.value = file;
        profile_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};

const preview_winner = (event) => {
    const file = event.target.files[0];
    if (file) {
        winnerPage.value = file;
        winner_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};
const preview_walletPage = (event) => {
    const file = event.target.files[0];
    if (file) {
        walletpage.value = file;
        wallet_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};
const previewImage = (event) => {
    const file = event.target.files[0];
    if (file) {
        matchPage.value = file;
        matchPage_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};

const previewmaxPredict = (event) => {
    const file = event.target.files[0];
    if (file) {
        maxpredict_image.value = file;
        maxpredict_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};
const WalletPagesave = () => {

    const formData = new FormData();
    formData.append('image', walletpage.value);

    axios.post('cms/Wallet-page', formData).then(response => {
        maxpredict_image.value = "";

        let modalElement = document.getElementById('editMatch');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            $notyf.error("An error occurred. Please try again.");
        }
    });
}

const ProfilePageimage = () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);

    axios.get('cms/Profile-image', formData).then(response => {
        profile_image_preview.value = response.data.image;
    });
}

const WinnerPageimage = () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);
    axios.get('cms/Winner-image', formData).then(response => {
        winner_image_preview.value = response.data.image;
    });
}
const walletPageimage = () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);
    axios.get('cms/Wallet-image', formData).then(response => {
       wallet_image_preview.value = response.data.image;
    });
}
const maxPredictimage = () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);
    axios.get('cms/maxpredict-image', formData).then(response => {
       maxpredict_image_preview.value = response.data.image;
    });
}
const matchPageimage = () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);
    axios.get('cms/match-image', formData).then(response => {
        matchPage_preview.value = response.data.image;
    });
}



const ProfilePagesave = () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);

    axios.post('cms/Profile-page', formData).then(response => {
        profilepage.value = "";

        let modalElement = document.getElementById('editMatch');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            $notyf.error("An error occurred. Please try again.");
        }
    });
}
const WinnerPagesave = () => {

    const formData = new FormData();
    formData.append('image', winnerPage.value);

    axios.post('cms/Winner-page', formData).then(response => {
        winnerPage.value = "";

        let modalElement = document.getElementById('editMatch');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            $notyf.error("An error occurred. Please try again.");
        }
    });
}
const maxPredictsave = () => {

    const formData = new FormData();
    formData.append('image', maxpredict_image.value);

    axios.post('cms/maxpredict-page', formData).then(response => {
        maxpredict_image.value = "";

        let modalElement = document.getElementById('editMatch');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            $notyf.error("An error occurred. Please try again.");
        }
    });
}
const matchPagesave = () => {

    const formData = new FormData();
    formData.append('image', matchPage.value);

    // console.log(formData);

    axios.post('cms/match-page', formData).then(response => {
        matchPage.value = "";
        console.log(response.data);
        let modalElement = document.getElementById('editMatch');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
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
            $notyf.error("An error occurred. Please try again.");
        }
    });
}

onMounted(() => {
    ProfilePageimage();
    WinnerPageimage();
    walletPageimage();
    maxPredictimage();
    matchPageimage();
});
</script>