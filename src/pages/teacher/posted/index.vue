<template>
  <div class="container-fluid" style="padding-bottom: 50px">
    <div class="row">
      <div class="col-12 d-flex justify-content-end">
        <form class="d-flex">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Search"
            v-model="searchKeyword"
          />
          <button
            class="btn btn-primary"
            style="width: 150px"
            @click="handleSearch"
          >
            Tìm kiếm
          </button>
        </form>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>Tên bài post</th>
            <th>Thời gian đăng</th>
            <th>Thời gian đăng</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="p in listPost" :key="p.id">
            <td>
              <router-link :to="'/teacher/detailForum/' + p.id" class="post-link">
                {{ p.title }}
              </router-link>
            </td>
            <td>{{ formatDate(p.postTime) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import { authApi, endpoints } from "@/configs/Apis";
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["isAuth", "getUser"]),
  },

  data() {
    return {
      listPost: [],
    };
  },
  created() {
    this.getListPostByUser();
  },

  methods: {
    async getListPostByUser() {
      try {
        const userId = this.getUser.id;
        console.log("userId", userId);
        const response = await authApi().get(
          endpoints["get-list-post-by-userId"].replace("{userId}", userId)
        );
        this.listPost = response.data;
          console.log("get-list-post-by-userId",this.listPost);
      } catch (error) {
        console.error(error);
      }
    },

    formatDate(date) {
      if (!date) return ""; // Tránh xử lý ngày null hoặc undefined

      // Chuyển đối đối tượng ngày sang ngày
      const formattedDate = new Date(date);

      // Lấy thông tin về ngày, tháng và năm
      const day = formattedDate.getDate();
      const month = formattedDate.getMonth() + 1; // Lưu ý: Tháng bắt đầu từ 0
      const year = formattedDate.getFullYear();

      // Định dạng thành chuỗi "ngày/tháng/năm"
      return `${day}/${month}/${year}`;
    },
  },
};
</script>
