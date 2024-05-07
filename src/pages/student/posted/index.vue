<template>
  <div class="container-fluid" style="padding-bottom: 50px">
    <div v-if="isLoading" style="position: absolute; width: 100%; height: 50%">
      <div class="loader">
        <div class="ball"></div>
        <div class="ball"></div>
        <div class="ball"></div>
      </div>
    </div>
    <div v-else class="row">
      <table class="table">
        <thead>
          <tr>
            <th>Tên bài post</th>
            <th>Nội dung</th>
            <th>Thời gian đăng</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="p in listPost" :key="p.id">
            <td>
              <router-link
                :to="'/student/detailForum/' + p.id"
                class="post-link"
              >
                {{ p.title }}
              </router-link>
              <div
                v-if="isEditMode && editedPost && editedPost.id === p.id"
                style="margin: 10px"
              >
                <textarea
                  class="form-control"
                  rows="2"
                  id="comment"
                  name="text"
                  :placeholder="p.content"
                  v-model="content"
                ></textarea>
                <div class="post-update-and-delete">
                  <ul>
                    <li @click="updatePosted(p.id)">Lưu</li>
                    <li @click="exitHandleEdit">Thoát</li>
                  </ul>
                </div>
              </div>
              <div v-else>
                <div class="post-update-and-delete">
                  <ul>
                    <li @click="handleEdit(p)">Chỉnh sửa</li>
                    <li @click="confirmDelete(p.id)">Xóa</li>
                  </ul>
                </div>
              </div>
            </td>
            <td>{{ p.content }}</td>
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
      isEditMode: false,
      content: "",
      editedPost: null,
      isLoading: false,
    };
  },
  created() {
    this.getListPostByUser();
  },

  methods: {
    handleEdit(post) {
      if (!this.isEditMode) {
        this.isEditMode = true;
        this.content = post.content;
        this.editedPost = post;
      } else {
        this.isEditMode = false;
        this.editedPost = null;
      }
    },
    exitHandleEdit() {
      this.isEditMode = false;
      this.editedPost = null;
    },
    async getListPostByUser() {
      try {
        this.isLoading = true;
        const userId = this.getUser.id;
        const response = await authApi().get(
          endpoints["get-list-post-by-userId"].replace("{userId}", userId)
        );
        this.listPost = response.data;
        this.isLoading = false;
      } catch (error) {
        console.error(error);
      }
    },

    async updatePosted(postId) {
      try {
        const response = await authApi().put(
          endpoints["update-post"].replace("{postId}", postId),
          {
            content: this.content,
          }
        );
        const updatedPostIndex = this.listPost.findIndex(
          (post) => post.id === postId
        );

        // Nếu tìm thấy bài viết, cập nhật nội dung của nó
        if (updatedPostIndex !== -1) {
          this.listPost[updatedPostIndex].content = response.data.content;
        }
        this.content = "";
        this.isEditMode = false;
        this.getListPostByUser();
      } catch (error) {
        console.error("Error submitting post:", error);
      }
    },
    async deletePost(postId) {
      try {
        const response = await authApi().delete(
          endpoints["delete-post"].replace("{postId}", postId)
        );

        this.isEditMode = false;
        this.getListPostByUser();
      } catch (error) {
        console.error("Error submitting post:", error);
      }
    },
    async confirmDelete(postId) {
      const confirmDelete = window.confirm(
        "Bạn có chắc chắn muốn xóa bài đăng này không?"
      );
      if (confirmDelete) {
        await this.deletePost(postId);
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

<style scoped>
.loader {
  width: 100%;
  height: 100%;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  gap: 10px;
  transition: 0.5s linear;
}

.ball {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  animation: bounce6135 1s alternate infinite;
  transition: 0.5s linear;
}

.ball {
  background: #000;
}

.ball:nth-child(2) {
  animation-delay: 0.25s;
}

.ball:nth-child(3) {
  animation-delay: 0.5s;
}

@keyframes bounce6135 {
  from {
    transform: scale(2);
  }

  to {
    transform: scale(1);
  }
}
</style>
