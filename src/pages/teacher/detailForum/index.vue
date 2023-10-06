<template>
  <div class="container-fluid" style="padding: 0 0 100px 0">
    <div class="row">
      <div className="container">
        <p class="postDetail">Tiêu đề: {{ post.title }}</p>
        <p class="userDetail">
          Đăng bởi: {{ usernameHost }} - Thời gian:
          {{ formatDate(post.postTime) }}
        </p>
        <p>Nội dung: {{ post.content }}</p>
      </div>
      <hr />
      <div class="post-container">
        <label for="comment">Bình luận:</label>
        <textarea
          class="form-control"
          rows="5"
          id="comment"
          name="text"
          placeholder="Nhập bình luận"
          v-model="content"
        ></textarea>
        <Button class="btn-title btn btn-primary" @click="addComment"
          >Gửi</Button
        >
      </div>
    </div>
    <hr />
    <h4>Bình luận</h4>
    <div v-if="!comment || comment.length === 0">
      <p>Chưa có bình luận nào.</p>
    </div>
    <div v-else>
      <div v-for="p in comment" :key="p.id" class="post-container-detail">
        <div class="post-row">
          <p class="postDetail">
            <strong
              >{{ p.userId.username }} - {{ formatDate(p.dateCreated) }}</strong
            >
          </p>
          <p>Nội dung: {{ p.content }}</p>
          <div v-if="isEditMode && editedPost && editedPost.id === p.id && getUser.id === p.userId.id">
            <textarea
              class="form-control"
              rows="2"
              id="comment"
              name="text"
              :placeholder="p.content"
              v-model="content_comment"
            ></textarea>
            <div class="post-update-and-delete">
              <ul>
                <li @click="updateComment(p.id)">Lưu</li>
                <li @click="exitHandleEdit">Thoát</li>
              </ul>
            </div>
          </div>
          <div v-else >
            <div class="post-update-and-delete" v-if="getUser.id === p.userId.id">
              <ul>
                <li @click="handleEdit(p)">Chỉnh sửa</li>
                <li @click="confirmDelete(p.id)">Xóa</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Apis, { authApi, endpoints } from "@/configs/Apis";
import { mapGetters } from 'vuex';
export default {
   computed: {
    ...mapGetters(["isAuth", "getUser"]),
  },
  data() {
    return {
      user: null,
      usernameHost: null,
      postId: null,
      post: "",
      comment: null,
      content: "",
      content_comment: "",
      isEditMode: false,
      editedPost: null,
    };
  },
  mounted() {
    this.postId = this.$route.params.id;

    this.loadProduct();
    this.loadComment();
  },
  methods: {
    handleEdit(post) {
      if (!this.isEditMode) {
        this.isEditMode = true;
        this.content_comment = post.content;
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
    async loadProduct() {
      const { data } = await authApi().get(endpoints.details(this.postId));
      this.post = data;
      console.log(this.post);
      console.log("this.post.title", this.post.title);

      console.log("this.post.userId.id", this.post.userId.id);

      this.loadUser();
    },
    async loadUser() {
      const userInfo = await authApi().get(
        endpoints["user-id"].replace("{id}", this.post.userId.id)
      );
      this.usernameHost = userInfo.data.username;
      console.log("this.usernameHost", this.usernameHost);
    },
    async loadComment() {
      const { data } = await authApi().get(
        endpoints.comments.replace("{id}", this.postId)
      );
      this.comment = data;
    },
    async addComment() {
      const { data } = await authApi().post(endpoints["add-comment"], {
        content: this.content,
        postId: this.post,
      });
      this.comment.push(data);
      this.content = "";
    },
    async updateComment(commentId) {
      try {
        const response = await authApi().put(
          endpoints["update-comment"].replace("{commentId}", commentId),
          {
            content: this.content_comment,
          }
        );
      
        this.content = "";
        this.isEditMode = false;
        this.loadComment();
      } catch (error) {
        console.error("Error submitting post:", error);
      }
    },
    async deleteComment(commentId) {
      try {
        const response = await authApi().delete(
          endpoints["delete-comment"].replace("{commentId}", commentId)
        );
      
        this.isEditMode = false;
        this.loadComment();
      } catch (error) {
        console.error("Error submitting post:", error);
      }
    },
    async confirmDelete(commentId) {
    const confirmDelete = window.confirm('Bạn có chắc chắn muốn xóa bình luận này không?');
    if (confirmDelete) {
      await this.deleteComment(commentId);
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
/* Add your CSS styles here */
</style>


