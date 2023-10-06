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
                <div v-if="errorMessage" class="alert alert-danger">
                  {{ errorMessage }}
                </div>
              </div>
              <form action="#" method="post" @submit.prevent="login">
                <div class="form-group first">
                  <label for="username">Username</label>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    required
                    v-model="user.username"
                  />
                </div>
                <div class="form-group last mb-4">
                  <label for="password">Password</label>
                  <input
                    type="password"
                    class="form-control"
                    id="password"
                    required
                    v-model="user.password"
                  />
                </div>

                <input
                  type="submit"
                  value="Đăng nhập"
                  class="btn btn-block btn-primary"
                />
                <div
                  class="d-flex mt-3 align-items-center"
                  style="justify-content: center"
                >
                  <span class="registerHover" style="margin-right: 10px">
                    <router-link to="/" class="nav-link">
                      Trang chủ
                    </router-link>
                  </span>
                  <span class="registerHover">
                    <router-link to="/register" class="nav-link">
                      Đăng ký
                    </router-link>
                  </span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
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
        console.log(res.status);
        if (res.status === 400) {
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
        if (error.response && error.response.status === 400) {
          this.errorMessage = "Tài khoản hoặc mật khẩu của bạn không đúng!!";
        } else {
          throw error;
        }
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

