<template>
  <section>
    <div>Đăng kí môn học</div>
    <div style="width: 50%; margin-bottom: 20px">
      <select class="form-select">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
      </select>
    </div>
    <div>
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
            <td style="text-align: center">{{this.quantity}}</td>
          </tr>
        </tbody>
      </table>
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
        <button class="btn btn-primary">Lưu</button>
      </div>
    </div>
  </section>
</template>

<script>
import { authApi, endpoints } from "@/configs/Apis";
export default {
  data() {
    return {
      courses: [],
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
          course.id === removedCourse.id &&
          course.group === removedCourse.group
      );

      // Cập nhật lại giá trị "Còn lại" cho môn học mở đăng ký tương ứng
      if (matchingCourse) {
        matchingCourse.remaining += 1;
      }
    },

    async getSubject() {
      try {
        const response = await authApi().get(endpoints["subjects"]);
        console.log("Subject", response.data);
        this.courses = response.data;
      } catch (error) {
        console.log(error);
      }
    },
  },
  created() {
    this.getSubject();
    // Tính toán giá trị `maxQuantity` dựa trên dữ liệu ban đầu
    this.maxQuantity = this.courses.reduce(
      (max, course) => (course.quantity > max ? course.quantity : max),
      0
    );
  },
};
</script>
