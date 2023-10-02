<template>
    <TheHeader />
    <section class="section about-section gray-bg" id="about">
        <div class="container">
          <div class="row align-items-center flex-row-reverse">
            <div class="col-lg-6">
              <div class="about-text go-to">
                <h3 class="dark-color">Giới thiệu</h3>
                <h6 class="theme-color lead">Mô tả</h6>
                <p>I <mark>design and develop</mark> services for customers of all sizes, specializing in creating stylish, modern websites, web services and online stores. My passion is to design digital user experiences through the bold interface and meaningful interactions.</p>
                <div class="row about-list">
                  <div class="col-md-6">
                    <div class="media">
                      <label>Tên</label>
                      <p>{{ userInfo.name }}</p>
                    </div>
                    <div class="media">
                      <label>Ngày sinh</label>
                      <p>{{ formattedBirthday }}</p>
                    </div>
                    <div class="media">
                      <label>Địa chỉ</label>
                      <p>{{ userInfo.address }}</p>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="media">
                      <label>E-mail</label>
                      <p v-if="isAuth === true">{{ getUser.email }}</p>
                    </div>
                    <div class="media">
                      <label>Số điện thoại</label>
                      <p>{{ userInfo.phone }}</p>
                    </div>
                    <div class="media">
                      <label>Khoa</label>
                      <p v-if="userInfo.facultyId">{{ userInfo.facultyId.name }}</p>
                    </div>
                    <div class="media">
                      <label>Chuyên ngành</label>
                      <p v-if="userInfo.majorId">{{ userInfo.majorId.name }}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="about-avatar text-center" v-if="isAuth === true">
                <img :src="getUser.avatar" title="" alt="" />
              </div>
            </div>
          </div>
        </div>
      </section>
    <TheFooter />
</template>

<script>
    import TheHeader from '../../components/TheHeader.vue'
    import TheFooter from '../../components/TheFooter.vue'
    import Apis, { endpoints, authApi } from '../../configs/Apis.js';
    import { mapGetters } from "vuex";
    export default {
        components: {
            TheHeader,
            TheFooter,
        },
        computed: {
            ...mapGetters(["isAuth", "getUser"]),
        },
        data() {
            return {
                user: { email: '' },
                userInfo: {},
                formattedBirthday: ""
            };
        },
        created() {
            this.fetchUserInfo();
        },
        methods: {
            async fetchUserInfo() {
                let endpoint = "";
                const userRole = this.getUser.role;
                console.log("userRole",userRole);
                console.log("email",this.getUser.email);
                if (userRole === "ROLE_SINHVIEN") {
                    endpoint = endpoints['get-student-by-username'];
                } else if (userRole === "ROLE_GIANGVIEN") {
                    endpoint = endpoints['get-lecturer-by-username'];
                }
                console.log("username",this.getUser.username);

                const response = await authApi().get(endpoint.replace("{username}", this.getUser.username));
                this.userInfo = response.data;
                console.log(response.data);

                if (response.data.birthday) {
                    const birthdayTimestamp = response.data.birthday;
                    const birthdayDate = new Date(birthdayTimestamp);

                    const formattedBirthday = `${birthdayDate.getDate()}/${birthdayDate.getMonth() + 1}/${birthdayDate.getFullYear()}`;
                    this.formattedBirthday = formattedBirthday;
                }
            }
        },
      
    }

</script>