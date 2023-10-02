<template>
  <section>
    <div>Đăng kí môn học</div>
    <div style="width: 50%; margin-bottom: 20px;">
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
            <th>Nhóm</th>
            <th>Số tín chỉ</th>
            <th>Lớp</th>
            <th>Số lượng</th>
            <th>Còn lại</th>
            <th>Thời khóa biểu</th>
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
            <td>{{ rowData.code }}</td>
            <td>{{ rowData.name }}</td>
            <td>{{ rowData.group }}</td>
            <td>{{ rowData.credits }}</td>
            <td>{{ rowData.class }}</td>
            <td>{{ rowData.quantity }}</td>
            <td>{{ rowData.remaining }}</td>
            <td>{{ rowData.schedule }}</td>
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
            <th>Nhóm</th>
            <th>Số tín chỉ</th>
            <th>Lớp</th>
            <th>Thời khóa biểu</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(selectedCourse, index) in selectedCourses" :key="index">
            <td style="position: relative; width: 40px">
              <button class="btn btn-danger" @click="removeCourse(index)">Xóa</button>
            </td>
            <td>{{ selectedCourse.code }}</td>
            <td>{{ selectedCourse.name }}</td>
            <td>{{ selectedCourse.group }}</td>
            <td>{{ selectedCourse.credits }}</td>
            <td>{{ selectedCourse.class }}</td>
            <td>{{ selectedCourse.schedule }}</td>
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
export default {
  data() {
    return {
      courses: [
        {
          code: "ITEC2020",
          name: "Đô án ngành",
          group: 1,
          credits: 4,
          class: "Dh20IT02",
          quantity: 80,
          remaining: 80,
          schedule: "",
          isSelected: false,
        },
        // Thêm các dòng dữ liệu khác nếu cần
      ],
      selectedCourses: [], // Mảng để lưu trữ các môn học đã chọn
      maxQuantity: 0,
    };
  },
  methods: {
    // Phương thức được gọi khi checkbox thay đổi trạng thái
   toggleCourse(event, rowData, index) {
      if (!rowData.isSelected) {
        rowData.isSelected = true;
        this.selectedCourses.push(rowData);
        rowData.remaining -= 1; // Giảm giá trị "Còn lại" đi 1 khi được chọn
      } 
    },
     removeCourse(index) {
      const removedCourse = this.selectedCourses.splice(index, 1)[0];
      // Đánh dấu môn học đã bị xóa
      removedCourse.isSelected = false;

      // Tìm môn học mở đăng ký tương ứng dựa trên mã và nhóm
      const matchingCourse = this.courses.find(
        (course) =>
          course.code === removedCourse.code && course.group === removedCourse.group
      );

      // Cập nhật lại giá trị "Còn lại" cho môn học mở đăng ký tương ứng
      if (matchingCourse) {
        matchingCourse.remaining += 1;
      }
    },
  },
  created() {
    // Tính toán giá trị `maxQuantity` dựa trên dữ liệu ban đầu
    this.maxQuantity = this.courses.reduce(
      (max, course) => (course.quantity > max ? course.quantity : max),
      0
    );
  },
};
</script>
