<template>
    <div>
        <form @submit.prevent="login" class="Auth-form-container">
            <div class="Auth-form">
                <div v-if="err" class="alert alert-danger">
                    Tên người dùng hoặc mật khẩu không chính xác. Vui lòng thử lại.
                </div>
                <div class="Auth-form-content">
                    <h3 class="Auth-form-title">Đăng nhập</h3>
                    <div class="form-group mt-3">
                        <label>Tài khoản</label>
                        <input required v-model="user.username" id="username" type="text" class="form-control mt-1"
                            placeholder="Nhập tài khoản" />
                    </div>
                    <div class="form-group mt-3">
                        <label>Mật khẩu</label>
                        <input required v-model="user.password" id="password" type="password" class="form-control mt-1"
                            placeholder="Nhập mật khẩu" />
                    </div>
                    <div class="d-grid gap-2 mt-3">
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    </div>
                    <div class="login text-right mt-2">
                        <div class="forgot-password">
                            Quên <router-link to="#">mật khẩu?</router-link>
                        </div>
                        <div class="register-link">
                            <router-link to="/register">Đăng ký</router-link>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>


<script>
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import Apis, { endpoints, authApi } from '../configs/Apis.js';
    import VueCookies from 'vue-cookies';
    import { mapState } from "vuex";

    export default {
        name: "Login",
        computed: {
            ...mapState(["store"]),
        },
        data() {
            return {
                user: {
                    username: "",
                    password: "",
                },
                errorMessage: "",
            };
        },
        methods: {
            async login() {
                try {
                    const res = await Apis.post(`${endpoints["login"]}`, {
                        username: this.user.username,
                        password: this.user.password,
                    });
                    if (res.data === "error") {
                        this.errorMessage =
                            "Tài khoản hoặc mật khẩu của bạn không đúng!!";
                    } else {
                        console.log(res.data);
                        this.errorMessage = "";
                        VueCookies.set("token", res.data.accessToken);

                        let { data } = await authApi().get(endpoints["current-user"]);
                        VueCookies.set("user", data);

                        await this.$store.dispatch("login", data);

                        if (data.role == 'ROLE_GIANGVIEN') {
                            this.$router.push('/teacher');
                        }
                        else if (data.role == 'ROLE_SINHVIEN') {
                            this.$router.push('/student');
                        }
                    }
                } catch (error) {
                    throw error;
                }
            },
        },
        watch: {
            "errorMessage": function (newErrorMessage, oldErrorMessage) {
                console.log(`Giá trị mới của user.errorMessage: ${newErrorMessage}`);
                console.log(`Giá trị cũ của user.errorMessage: ${oldErrorMessage}`);

                // Thực hiện các hành động khác tại đây nếu cần
            },
        },
    };

</script>

<!-- <script>
    import { ref } from 'vue';
    import { useRouter } from 'vue-router';
    import Apis, { endpoints, authApi } from '../configs/Apis.js';
    import VueCookies from 'vue-cookies';
    import { login } from '../reducers/myUseReducer.js';
    import axios from 'axios';

    export default {
        setup() {
            const username = ref('');
            const password = ref('');
            const err = ref(false);
            const router = useRouter();
            const token = ref(null);
            const user = ref(null);

            const login = async () => {
                try {
                    let res = await Apis.post(endpoints.login, {
                        username: username.value,
                        password: password.value
                    });
                    console.log(res);
                    // Lưu token vào cookie tại đây nếu cần
                    VueCookies.set('token', res.data);

                    let { data } = await authApi().get(endpoints['current-user']);
                    console.log("curent user", data);
                    // Lưu thông tin người dùng vào cookie tại đây nếu cần
                    // Hàm để lưu token vào cookie
                    VueCookies.set('user', JSON.stringify(res.data));
                    login(res.data);

                    if (res.data.role == 'ROLE_GIANGVIEN') {
                        router.push('/teacher')
                    } else {
                        router.push('/student')
                    }

                    try {
                        const u = await getUserByUsername(username.value);
                        if (u) {
                            const studentUsername = u.username;

                            // Fetch thông tin của học sinh
                            const studentInfo = await authApi().get(endpoints['get-student-by-username'].replace("{username}", studentUsername));

                            const userEmail = u.email; // Lấy email của người dùng (nếu bạn cần)

                            // Thực hiện các tác vụ cần thiết (ví dụ: đăng nhập)
                            // Chuyển hướng sau khi đăng nhập thành công
                            if (res.data.role == 'ROLE_GIANGVIEN') {
                                router.push('/teacher')
                            } else {
                                router.push('/student')
                            }
                        } else {
                            console.log('User not found');
                            err.value = true;
                        }
                    } catch (err) {
                        err.value = true;
                    }
                } catch (err) {
                    console.error(err);
                    err.value = true;
                }
            };

            const getUserByUsername = async (username) => {
                try {
                    const response = await Apis.get(endpoints["get-user"].replace("{username}", username));
                    return response.data;
                } catch (error) {
                    console.error(error);
                    return null; // Hoặc xử lý lỗi theo cách bạn muốn
                }
            };

            return {
                username,
                password,
                err,
                login
            };
        }
    };
</script>  -->

<style scoped>
    /* CSS cho component của bạn */
</style>