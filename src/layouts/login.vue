<template>
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img
            src="../assets/undraw_remotely_2j6y.svg"
            alt="Image"
            class="img-fluid"
          />
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
                <h3>Đăng nhập</h3>
                <div v-if="err" class="alert alert-danger">
                    Tên người dùng hoặc mật khẩu không chính xác. Vui lòng thử lại.
                </div>
              </div>
              <form action="#" method="post" @submit.prevent="login">
                <div class="form-group first">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" id="username"  required v-model="user.username"/>
                </div>
                <div class="form-group last mb-4">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" id="password" required v-model="user.password"/>
                </div>

                <div class="d-flex mb-5 align-items-center">
                  <span class="ml-auto"
                    ><a href="#" class="forgot-pass">Forgot Password</a></span
                  >
                </div>

                <input
                  type="submit"
                  value="Đăng nhập"
                  class="btn btn-block btn-primary"
                />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- <div>
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
    </div> -->
</template>


<script>
import { ref } from "vue";
import { useRouter } from "vue-router";
import Apis, { endpoints, authApi } from "../configs/Apis.js";
import VueCookies from "vue-cookies";
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
          this.errorMessage = "Tài khoản hoặc mật khẩu của bạn không đúng!!";
        } else {
          console.log(res.data);
          this.errorMessage = "";
          VueCookies.set("token", res.data.accessToken);

          let { data } = await authApi().get(endpoints["current-user"]);
          VueCookies.set("user", data);

          await this.$store.dispatch("login", data);

          if (data.role == "ROLE_GIANGVIEN") {
            this.$router.push("/teacher");
          } else if (data.role == "ROLE_SINHVIEN") {
            this.$router.push("/student");
          }
        }
      } catch (error) {
        throw error;
      }
    },
  },
  watch: {
    errorMessage: function (newErrorMessage, oldErrorMessage) {
      console.log(`Giá trị mới của user.errorMessage: ${newErrorMessage}`);
      console.log(`Giá trị cũ của user.errorMessage: ${oldErrorMessage}`);

      // Thực hiện các hành động khác tại đây nếu cần
    },
  },
};
</script>

