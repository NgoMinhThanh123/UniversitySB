<template>
    <div id="header" class=" header">
        <div class="text-white" style="background-color: #070758; padding: 1rem 5rem; display: flex; flex-wrap: wrap;">
            <div class="col-6 col-sm-6 d-flex justify-content-sm-start align-items-center">
                <div class="home">
                    <router-link to="/" class="router-link-hover">
                        <span>
                            <i class="fa-solid fa-house"></i>
                            Trang chủ
                        </span>
                    </router-link>
                </div>
                <div class="profile" v-if="isAuth === true">
                    <router-link to="/profile" class="router-link-hover">
                        <i class="fa-solid fa-user"></i>
                        <span class="sider">
                            Hồ sơ
                        </span>
                    </router-link>
                </div>
            </div>
            <div class="col-1 d-flex d-sm-none align-items-center justify-content-center">
                <span>
                    <i class="fa-solid fa-bars"></i>
                </span>
            </div>
            <div class=" col-6 col-sm-6 d-none d-sm-flex align-items-center justify-content-sm-end">
                <div v-if="isAuth === false" class="d-none d-sm-flex align-items-center justify-content-sm-end">
                    <div style="padding-right: 30px;">
                        <router-link to="/login" class="nav-link ">Đăng nhập</router-link>
                    </div>
                    <div>
                        <router-link to="/register" class="nav-link ">Đăng ký</router-link>
                    </div>
                </div>
                <div v-else class="d-none d-sm-flex align-items-center justify-content-sm-end">
                    <div style="padding-right: 30px;" class="d-flex align-items-center">
                        <!-- <img :src="getUser.avatar" class="rounded-circle"style="width: 150px;" alt="Avatar" /> -->
                        <div style="margin-right: 10px;">
                            <img :src="getUser.avatar" class="rounded-circle" style="width: 30px; height: 30px;" alt="Avatar" />
                        </div>
                        <a class="nav-link" href="#" id="navbarDropdown2" role="button" aria-expanded="false">
                            Chào, {{getUser.username}}
                        </a>
                    </div>
                    <div>
                        <router-link to="/login" @click="logout()" class="nav-link ">Đăng xuất</router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Apis, { endpoints, authApi } from '../configs/Apis.js';
    import { mapGetters } from "vuex";
    export default {
        name: "TheHeader",
        computed: {
            ...mapGetters(["isAuth", "getUser"]),
        },
        methods: {
            logout() {
                this.$store.dispatch("logout");
            }
        }
      
    };
</script>





<style>
    .header {
        position: relative;
        left: 0;
        top: 0;
        width: 100%;
        background-color: #0c713d;
        color: white;
        text-align: center;
        box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
    }
</style>