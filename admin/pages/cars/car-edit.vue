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
                <h1>Dashboard</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit, omnis. Tempora eum harum eveniet veritatis esse quisquam earum. Neque provident blanditiis odio quaerat. Ullam veritatis sint consectetur facilis delectus voluptates nemo! At officia placeat sequi adipisci iure dolore dolor quos aut tempora. At ut, doloremque cumque quos nihil corporis esse temporibus vitae, perferendis suscipit iure, enim molestias obcaecati quisquam. In iste doloremque facere corrupti qui, consectetur eos voluptatum sint numquam rem aliquam, eius magni porro ullam illum minima ex magnam praesentium, ratione officiis ea! Illo ut reiciendis excepturi similique quo optio temporibus, enim vel magni. Commodi, atque? Ipsam, ipsa eaque libero repudiandae dolore, quam, molestias placeat vel impedit corporis tenetur id? Ipsam deserunt ab ipsum distinctio maxime placeat tenetur nostrum omnis dolore, esse nihil accusamus necessitatibus consequatur maiores magnam dolores tempore commodi consequuntur animi totam! Dolorem minima, aspernatur numquam quod laboriosam assumenda mollitia tenetur eius voluptatibus, blanditiis obcaecati voluptate harum.
                </p>
            </div>



        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
const globalScript = useGlobalScript();

</script>
