<template>
  <div>Lớp: {{ extractedId }}</div>
  <div class="table col-12">
    <div class="table">
      <template v-if="studentList.length > 0">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <th style="text-align: center">Mã số sinh viên</th>
              <th style="text-align: center">Tên sinh viên</th>
              <th style="text-align: center">Ngày sinh</th>
              <th style="text-align: center">Giới tính</th>
              <th style="text-align: center">Số điện thoại</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="student in studentList" :key="student.id">
              <td style="text-align: center">{{ student.id }}</td>
              <td style="text-align: center">{{ student.name }}</td>
              <td style="text-align: center">
                {{ formatDate(student.birthday) }}
              </td>
              <td style="text-align: center">
                {{ student.gender === 1 ? "Nam" : "Nữ" }}
              </td>
              <td style="text-align: center">{{ student.phone }}</td>
            </tr>
          </tbody>
        </table>
      </template>
      <template v-else>
        <div class="text-hr-teacher">Không có lớp chủ nhiệm</div>
      </template>
    </div>
  </div>
</template>

<script>
import { authApi, endpoints } from "@/configs/Apis.js";
import { mapGetters } from "vuex";
import { useMenu } from "@/stores/use-menu";

export default {
  computed: {
    ...mapGetters(["isAuth", "getUser"]),
    extractedId() {
      if (this.studentList.length > 0 && this.studentList[0].classesId) {
        return this.studentList[0].classesId.id || "N/A";
      }
      return "N/A";
    },
  },
  data() {
    return {
      studentList: [],
    };
  },
  created() {
    this.getStudent();
  },
  methods: {
    async getStudent() {
      console.log(this.getUser.username);
      const lecturerUsername = this.getUser.username;
      const response = await authApi().get(
        endpoints["get-lecturer-by-username"].replace(
          "{username}",
          lecturerUsername
        )
      );
      console.log("response.data.id", response.data.id);
      console.log("response.data.id", response.data);
      const lecturerId = response.data.id;
      const listStudent = await authApi().get(
        endpoints["student-home-room-teacher"].replace(
          "{lecturerId}",
          lecturerId
        )
      );
      console.log("listStudent.data", listStudent.data);
      if (listStudent.data) {
        this.studentList = listStudent.data;
        console.log("studentList", this.studentList);
        console.log("studentList,length", this.studentList.length);
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

  setup() {
    useMenu().onSelectedKeys(["teacher-classStudent"]);
  },
};
</script>