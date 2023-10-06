<template>
  <section>
    <div style="width: 50%; margin-bottom: 20px">
      <div
        class="form-group"
        :class="{ 'has-error': !selecetFacuties }"
        style="margin-right: 10px"
      >
        <label for="selecetFacuties">Đăng ký môn học</label>
        <select
          class="form-control"
          id="selecetFacuties"
          v-model="selecetFacuties"
          @change="getSubject"
        >
          <option value="">-- Chọn Khoa --</option>
          <option
            v-for="(facutly, index) in faculties"
            :key="index"
            :value="facutly.id"
          >
            {{ facutly.name }}
          </option>
        </select>
      </div>
    </div>
    <div v-if="courses.length > 0">
      <p>Danh sách môn học mở đăng ký:</p>
      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Mã môn học</th>
            <th>Tên môn học</th>
            <th>Số tín chỉ</th>
            <th>Số lượng</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(rowData, index) in courses" :key="index">
            <td style="position: relative; width: 40px">
              <input
                class="form-check-input"
                type="checkbox"
                :id="'check' + index"
                :disabled="rowData.isSelected"
                :checked="rowData.isSelected"
                @change="toggleCourse($event, rowData)"
                style="
                  position: absolute;
                  top: 43%;
                  left: 100%;
                  transform: translate(-50%, -50%);
                "
              />
            </td>
            <td>{{ rowData.id }}</td>
            <td>{{ rowData.name }}</td>
            <td style="text-align: center">{{ rowData.credit }}</td>
            <td style="text-align: center">{{ this.quantity }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-else-if="courses === null">
      <p>Danh sách môn học mở đăng ký:</p>

      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Mã môn học</th>
            <th>Tên môn học</th>
            <th>Số tín chỉ</th>
            <th>Số lượng</th>
          </tr>
        </thead>
      </table>
      <p style="text-align: center">
        <strong>Không có môn học nào mở đăng ký cho khoa này.</strong>
      </p>
    </div>
    <div v-else>
      <p>Danh sách môn học mở đăng ký:</p>

      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Mã môn học</th>
            <th>Tên môn học</th>
            <th>Số tín chỉ</th>
            <th>Số lượng</th>
          </tr>
        </thead>
      </table>
      <p style="text-align: center">
        <strong>Không có môn học nào mở đăng ký cho khoa này.</strong>
      </p>
    </div>
    <div>
      <p>Danh sách môn học đã chọn:</p>
      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>Mã môn học</th>
            <th>Tên môn học</th>
            <th>Số tín chỉ</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(selectedCourse, index) in selectedCourses" :key="index">
            <td style="position: relative; width: 40px">
              <button class="btn btn-danger" @click="removeCourse(index)">
                Xóa
              </button>
            </td>
            <td>{{ selectedCourse.id }}</td>
            <td>{{ selectedCourse.name }}</td>
            <td>{{ selectedCourse.credit }}</td>
          </tr>
        </tbody>
      </table>
      <div class="btn-save">
        <button class="btn btn-primary" @click="submitCourses()">Đăng ký</button>
      </div>
    </div>
  </section>
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
      courses: [],
      faculties: [],
      selecetFacuties: "",
      selectedCourses: [], // Mảng để lưu trữ các môn học đã chọn
      maxQuantity: 0,
      quantity: 80,
    };
  },
  methods: {
    // Phương thức được gọi khi checkbox thay đổi trạng thái
    toggleCourse(event, rowData, index) {
      if (!rowData.isSelected) {
        rowData.isSelected = true;
        this.selectedCourses.push(rowData);
        this.remaining -= 1; // Giảm giá trị "Còn lại" đi 1 khi được chọn
      }
    },
    removeCourse(index) {
      const removedCourse = this.selectedCourses.splice(index, 1)[0];
      // Đánh dấu môn học đã bị xóa
      removedCourse.isSelected = false;

      // Tìm môn học mở đăng ký tương ứng dựa trên mã và nhóm
      const matchingCourse = this.courses.find(
        (course) =>
          course.id === removedCourse.id && course.group === removedCourse.group
      );

      // Cập nhật lại giá trị "Còn lại" cho môn học mở đăng ký tương ứng
      if (matchingCourse) {
        matchingCourse.remaining += 1;
      }
    },

    async getSubject() {
      try {
        if (this.selecetFacuties) {
          // Check if a selection has been made
          const facultyId = this.selecetFacuties; // Use the selected value as facultyId
          console.log("facultyId", facultyId);

          const response = await authApi().get(
            endpoints["get-subject-by-facultyId"] + `?facultyId=${facultyId}`
          );
          console.log("Subject", response.data);
          this.courses = response.data;
        } else {
          // Handle the case when no selection is made, e.g., show an error message
          console.error("Please select a faculty before fetching subjects.");
        }
      } catch (error) {
        if (error.response && error.response.status === 404) {
          // Handle 404 error by setting courses to an empty array
          this.courses = [];
        } else {
          console.error("Error fetching subjects:", error);
          // Handle other errors as needed
        }
      }
    },

    async getFacutly() {
      try {
        const response = await authApi().get(endpoints["faculties"]);
        console.log("faculties", response.data);
        this.faculties = response.data;
      } catch (error) {
        console.log(error);
      }
    },
    async submitCourses() {
      try {
        const username = this.getUser.username;
        const resStudentId = await authApi().get(
          endpoints["get-student-by-username"].replace("{username}", username)
        );
        console.log("Student", resStudentId.data);
        const studentId = resStudentId.data.id;
        console.log("StudentId", studentId);

        try {
          const promises = this.selectedCourses.map(async (score) => {
            const subjectId = score.id;
            const requestData = [
              {
                studentId: studentId,
                subjectId: subjectId,
              },
            ];
            const response = await authApi().post(
              endpoints["course-register"],
              requestData,
              {
                headers: {
                  "Content-Type": "application/json", // Đặt Content-Type là application/json
                },
              }
            );
            if (response.status !== 201) {
              console.error(`Đăng ký của sinh viên thất bại!!!`);
            }
          });
          await Promise.all(promises);

          // Hiển thị thông báo sau khi đã lưu điểm cho tất cả sinh viên
          alert("Đăng ký môn học thành công!");
        } catch (error) {
          console.log(error);
        }
      } catch (error) {
        console.log(error);
      }
    },
  },
  created() {
    this.getFacutly();
    this.getSubject();
    if (this.faculties.length > 0) {
      this.getSubject();
      // Tính toán giá trị `maxQuantity` dựa trên dữ liệu ban đầu
      this.maxQuantity = this.courses.reduce(
        (max, course) => (course.quantity > max ? course.quantity : max),
        0
      );
    }
  },
};
</script>
