<template>
    <div class="main_container">
        <Sidebar />

        <div class="main_content">
            <Navbar />

            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center my-2">
                        <h3 class="page_title my-0"><span> Pre Settings </span></h3>
                    </div>
                </div>

                <div class="card app_card">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-md-8 m-auto">
                                <form action="" method="post" @submit.prevent="updateSettings">

                                    <!-- Website Branding -->
                                    <h5 class="text-white mb-3">Website Branding</h5>
                                    <div class="mb-3">
                                        <img :src="logoPreview" alt="Logo" class="img-fluid rounded-1 border"
                                            style="height: 60px;" v-if="logoPreview"><br>
                                        <label class="form-label text-white">Website Logo</label>
                                        <input type="file" class="form-control" @change="onLogoChange">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label text-white">Website Name</label>
                                        <input type="text" class="form-control" v-model="form.websiteName"
                                            placeholder="Website Name">
                                    </div>
                                    <!-- Spin Settings -->
                                    <h5 class="text-white mt-4 mb-3">Spin Settings</h5>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Spin Price</label>
                                        <input type="text" class="form-control" v-model="form.spin_creadit"
                                            placeholder="0.00 Credit">
                                    </div>
                                    <!-- ads Settings -->
                                    <h5 class="text-white mt-4 mb-3">Ads Settings</h5>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Ads Prize</label>
                                        <input type="text" class="form-control" v-model="form.ads_prize"
                                            placeholder="0.00 Credit">
                                    </div>

                                    <!-- Bonus Settings -->
                                    <h5 class="text-white mt-4 mb-3">Bonus Settings</h5>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Register Bonus</label>
                                        <input type="text" class="form-control" v-model="form.registerBonus"
                                            placeholder="Register Bonus">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Question Prediction Bonus</label>
                                        <input type="text" class="form-control" v-model="form.question_credit"
                                            placeholder="Register Bonus">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Pull Prediction Bonus</label>
                                        <input type="text" class="form-control" v-model="form.pull_credit"
                                            placeholder="Register Bonus">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Single Match Prediction Bonus</label>
                                        <input type="text" class="form-control" v-model="form.singleMatchBonus"
                                            placeholder="Single Match Prediction Bonus">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Max-predict Prediction Bonus</label>
                                        <input type="text" class="form-control" v-model="form.maxPredictBonus"
                                            placeholder="Max Predict Bonus">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Tournament Prediction Bonus</label>
                                        <input type="text" class="form-control" v-model="form.tournamentBonus"
                                            placeholder="Tournament Prediction Bonus">
                                    </div>

                                    <!-- Contact Info -->
                                    <h5 class="text-white mt-4 mb-3">Contact Information</h5>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Admin Email</label>
                                        <input type="email" class="form-control" v-model="form.adminEmail"
                                            placeholder="Admin Email">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Support Email</label>
                                        <input type="email" class="form-control" v-model="form.supportEmail"
                                            placeholder="Support Email">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Phone</label>
                                        <input type="text" class="form-control" v-model="form.phone"
                                            placeholder="Phone Number">
                                    </div>

                                    <!-- Social Media -->
                                    <h5 class="text-white mt-4 mb-3">Social Media Links</h5>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Facebook</label>
                                        <input type="text" class="form-control" v-model="form.facebook"
                                            placeholder="Facebook URL">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">WhatsApp</label>
                                        <input type="text" class="form-control" v-model="form.whatsapp"
                                            placeholder="WhatsApp Link">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Telegram</label>
                                        <input type="text" class="form-control" v-model="form.telegram"
                                            placeholder="Telegram Link">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Instagram</label>
                                        <input type="text" class="form-control" v-model="form.instagram"
                                            placeholder="Instagram Link">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Twitter</label>
                                        <input type="text" class="form-control" v-model="form.twitter"
                                            placeholder="Twitter Link">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">LinkedIn</label>
                                        <input type="text" class="form-control" v-model="form.linkedin"
                                            placeholder="LinkedIn Link">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">YouTube</label>
                                        <input type="text" class="form-control" v-model="form.youtube"
                                            placeholder="YouTube Link">
                                    </div>

                                    <!-- SEO Settings -->
                                    <h5 class="text-white mt-4 mb-3">SEO Settings</h5>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Meta Title</label>
                                        <input type="text" class="form-control" v-model="form.metaTitle"
                                            placeholder="Meta Title">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Meta Description</label>
                                        <textarea class="form-control" v-model="form.metaDescription"
                                            placeholder="Meta Description" rows="3"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Meta Keywords</label>
                                        <input type="text" class="form-control" v-model="form.metaKeywords"
                                            placeholder="Keywords (comma separated)">
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="text-center mt-4">
                                        <button type="submit" class="btn btn-primary px-5">Save Settings</button>
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
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const route = useRoute();
const router = useRouter();  // Initialize router

const tid = route.query.id;
const tournamename = route.query.tournament;


const form = ref({
    spin_creadit: '',
    question_credit: '',
    pull_credit: '',
    ads_prize: '',
    websiteName: '',
    registerBonus: '',
    singleMatchBonus: '',
    maxPredictBonus: '',
    tournamentBonus: '',
    adminEmail: '',
    supportEmail: '',
    phone: '',
    facebook: '',
    whatsapp: '',
    telegram: '',
    instagram: '',
    twitter: '',
    linkedin: '',
    youtube: '',
    metaTitle: '',
    metaDescription: '',
    metaKeywords: '',
});

const logoFile = ref(null); // for file
const logoPreview = ref('');


onMounted(() => {
    fetchSettings();
});

// ✅ Handle file change
const onLogoChange = (e) => {
    const file = e.target.files[0];
    if (file) {
        logoFile.value = file;
        logoPreview.value = URL.createObjectURL(file);
    }
};

const updateSettings = async () => {
    const formData = new FormData();
    formData.append('website_name', form.value.websiteName);
    formData.append('spin_creadit', form.value.spin_creadit);
    formData.append('question_credit', form.value.question_credit);
    formData.append('pull_credit', form.value.pull_credit);
    formData.append('ads_prize', form.value.ads_prize);
    formData.append('register_bonus', form.value.registerBonus);
    formData.append('single_match_bonus', form.value.singleMatchBonus);
    formData.append('max_predict_bonus', form.value.maxPredictBonus);
    formData.append('tournament_bonus', form.value.tournamentBonus);
    formData.append('admin_email', form.value.adminEmail);
    formData.append('support_email', form.value.supportEmail);
    formData.append('phone', form.value.phone);
    formData.append('facebook', form.value.facebook);
    formData.append('whatsapp', form.value.whatsapp);
    formData.append('telegram', form.value.telegram);
    formData.append('instagram', form.value.instagram);
    formData.append('twitter', form.value.twitter);
    formData.append('linkedin', form.value.linkedin);
    formData.append('youtube', form.value.youtube);
    formData.append('meta_title', form.value.metaTitle);
    formData.append('meta_description', form.value.metaDescription);
    formData.append('meta_keywords', form.value.metaKeywords);

    if (logoFile.value) {
        formData.append('logo', logoFile.value);
    }

    const res = await apiFetch('/api/settings/update', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            for (const messages of Object.values(error.errors)) {
                messages.forEach((msg) => $notyf.error(msg));
            }
        } else if (error?.error) {
            $notyf.error(error.error);
        } else {
            $notyf.error("An unexpected error occurred.");
        }
        return;
    }

    const data = await res.json();
    $notyf.success(data.message || "Settings updated successfully");
};


const fetchSettings = async () => {
    const res = await apiFetch('/api/settings', {
        method: 'GET',
    });

    if (!res.ok) {
        $notyf.error('Failed to load settings');
        return;
    }

    const data = await res.json();

    logoPreview.value = data.logo_url;

    form.value = {
        websiteName: data.website_name || '',
        spin_creadit: data.spin_creadit || '',
        question_credit: data.question_credit || '',
        pull_credit: data.pull_credit || '',
        registerBonus: data.register_bonus || '',
        singleMatchBonus: data.single_match_bonus || '',
        maxPredictBonus: data.max_predict_bonus || '',
        tournamentBonus: data.tournament_bonus || '',
        adminEmail: data.admin_email || '',
        supportEmail: data.support_email || '',
        phone: data.phone || '',
        facebook: data.facebook || '',
        whatsapp: data.whatsapp || '',
        telegram: data.telegram || '',
        instagram: data.instagram || '',
        twitter: data.twitter || '',
        linkedin: data.linkedin || '',
        youtube: data.youtube || '',
        metaTitle: data.meta_title || '',
        metaDescription: data.meta_description || '',
        metaKeywords: data.meta_keywords || '',
        ads_prize: data.ads_prize || '',
    };
};

onMounted(() => {
    fetchSettings();
});
</script>
