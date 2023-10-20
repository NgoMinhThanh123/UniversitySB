<template>
  <div class="container" style="margin-bottom: 200px">
    <div class="row">
      <form @submit.prevent="handleSubmit">
        <div class="col-12 d-flex studentScore">
          <div class="input-studentScore">
            <label for="subjectSelect">Chọn môn học:</label>
            <select
              class="form-control"
              id="subjectSelect"
              v-model="selectedSubject"
              @change="handleSubjectChange"
            >
              <option value="">Chọn môn học</option>
              <option
                v-for="(subject, index) in subjectList"
                :key="index"
                :value="subject.id"
              >
                {{ subject.name }}
              </option>
            </select>
          </div>
          <div class="input-studentScore">
            <label for="subjectSelect">Chọn học kì:</label>
            <select
              class="form-control"
              id="semesterSelect"
              v-model="selectedSemester"
              @change="handleSemesterChange"
            >
              <option value="">Chọn học kì</option>
              <option
                v-for="(semester, index) in semesterList"
                :key="index"
                :value="semester.id"
              >
                {{ `${semester.name} - ${semester.schoolYear}` }}
              </option>
            </select>
          </div>
          <div class="input-studentScore">
            <button class="btn btn-primary">Tìm kiếm</button>
          </div>
          <div v-if="isEditMode">
            <div class="input-studentScore">
              <button
                @click="exitHandleEdit"
                class="btn btn-primary"
                style="margin-right: 10px"
              >
                Thoát
              </button>
            </div>
          </div>
          <div v-else>
            <div class="input-studentScore d-flex">
              <button @click="handleEdit" class="btn btn-primary">
                Nhập điểm
              </button>
              <button
                class="btn btn-primary"
                style="margin-left: 10px"
                @click="handleSendMail"
                :disabled="loading"
              >
                Gửi mail
              </button>
              <div style="text-align: center; margin: 0 10px">
                <div
                  v-if="loading"
                  class="spinner-border text-primary"
                  role="status"
                >
                  <span class="visually-hidden">Loading...</span>
                </div>
              </div>
              <div
                class="d-flex mt-3 align-items-center"
                style="justify-content: center"
              ></div>
            </div>
          </div>
        </div>
      </form>
      <div v-if="hasError">
        <p style="font-size: 20px; padding: 20px">{{ err }}</p>
      </div>
      <div v-if="isEditMode" class="form-input-score">
        <div class="table-studentScore">
          <table class="table table-hover">
            <thead>
              <tr class="header-studentScore">
                <th style="width: 150px">Mã số sinh viên</th>
                <th style="width: 20%">Họ và tên</th>
                <th>
                  <div class="form-check">
                    <input
                      type="radio"
                      class="form-check-input"
                      id="radio1"
                      name="optradio"
                      value="1"
                      v-model="selectedColumn"
                    />Quá trình
                    <label class="form-check-label" for="radio1"></label>
                  </div>
                </th>
                <th>
                  <div class="form-check">
                    <input
                      type="radio"
                      class="form-check-input"
                      id="radio2"
                      name="optradio"
                      value="2"
                      v-model="selectedColumn"
                    />Giữa kì
                    <label class="form-check-label" for="radio2"></label>
                  </div>
                </th>
                <th>
                  <div class="form-check">
                    <input
                      type="radio"
                      class="form-check-input"
                      id="radio3"
                      name="optradio"
                      value="3"
                      v-model="selectedColumn"
                    />Cuối kì
                    <label class="form-check-label" for="radio3"></label>
                  </div>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(student, index) in studentList" :key="index">
                <td style="width: 150px; text-align: center">
                  {{ student.studentId }}
                </td>
                <td style="width: 20%">{{ student.studentName }}</td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    placeholder=""
                    :disabled="selectedColumn !== '1'"
                    :name="`score_${student.studentId}`"
                    v-model="student.scoreDto.scoreValue1"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    placeholder=""
                    :disabled="selectedColumn !== '2'"
                    :name="`score_${student.studentId}`"
                    v-model="student.scoreDto.scoreValue2"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    placeholder=""
                    :disabled="selectedColumn !== '3'"
                    :name="`score_${student.studentId}`"
                    v-model="student.scoreDto.scoreValue3"
                  />
                </td>
              </tr>
            </tbody>
          </table>
          <div class="btn-save">
            <button class="btn btn-primary" @click="saveSelectedColumnScores()">
              Lưu
            </button>
          </div>
        </div>
      </div>
      <div v-else>
        <div v-if="studentList.length > 0">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center">Mã số sinh viên</th>
                <th class="text-center">Tên sinh viên</th>
                <th class="text-center">Ngày sinh</th>
                <th class="text-center">Quá trình</th>
                <th class="text-center">Giữa kì</th>
                <th class="text-center">Cuối kì</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(student, index) in studentList" :key="index">
                <td class="text-center">{{ student.studentId }}</td>
                <td class="text-center">{{ student.studentName }}</td>
                <td class="text-center">
                  {{ formatDate(student.studentBirthday) }}
                </td>
                <td class="text-center">
                  {{ getScoreValue(student.scoreDto, "Quá trình") }}
                </td>
                <td class="text-center">
                  {{ getScoreValue(student.scoreDto, "Giữa kì") }}
                </td>
                <td class="text-center">
                  {{ getScoreValue(student.scoreDto, "Cuối kì") }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { authApi, endpoints } from "@/configs/Apis.js";
import { mapGetters } from "vuex";
import { useMenu } from "../../../stores/use-menu.js";
export default {
  setup() {
    useMenu().onSelectedKeys(["teacher-studentScore"]);
  },
  data() {
    return {
      isEditMode: false,
      err: "",
      hasError: false,
      selectedColumn: "option1",
      subjectList: [],
      selectedSubject: "",
      selectedLecturer: {},
      studentList: [],
      semesterList: [],
      selectedSemester: "",
      studentScores: {},
      scoreColumnNames: [],
      loading: false,

      quatrinh: {},
      giuaki: {},
      cuoiki: {},
      studentColumnIds: {
        "Quá trình": 1,
        "Giữa kì": 2,
        "Cuối kì": 3,
      },
    };
  },
  computed: {
    ...mapGetters(["isAuth", "getUser"]),
  },
  created() {
    this.fetchLecturerInfo();

    this.fetchLecturerInfo().then((lecturerInfo) => {
      if (lecturerInfo && lecturerInfo.id) {
        const lecturerId = lecturerInfo.id;
        this.fetchSubjectsByLecturerId(lecturerId);
      }
    });
  },
  methods: {
    handleEdit() {
      this.isEditMode = true;
    },
    exitHandleEdit() {
      this.isEditMode = false;
    },
    handleSubjectChange(event) {
      this.selectedSubject = event.target.value;
    },
    handleSemesterChange(event) {
      this.selectedSemester = event.target.value;
    },
    getScoreValue(scoreDto, columnName) {
      const score = scoreDto.find(
        (item) => item.scoreColumnName === columnName
      );
      return score ? score.scoreValue : "";
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

    async fetchLecturerInfo() {
      try {
        const lecturerUsername = this.getUser.username;
        const response = await authApi().get(
          endpoints["get-lecturer-by-username"].replace(
            "{username}",
            lecturerUsername
          )
        );
        this.selectedLecturer = response.data;

        return response.data;
      } catch (error) {
        console.error(err);
        return null;
      }
    },
    async fetchSubjectsByLecturerId(lecturerId) {
      try {
        const response = await authApi().get(
          endpoints["get-subject-by-lecturerId"].replace(
            "{lecturerId}",
            lecturerId
          )
        );
        this.subjectList = response.data;

        const endpoint = endpoints["semester"] + `?lecturerId=${lecturerId}`;

        const semesterResponse = await authApi().get(endpoint);
        this.semesterList = semesterResponse.data;

      } catch (error) {
        console.error(error);
        return null;
      }
    },
    async handleSubmit(event) {
      event.preventDefault();

      try {
        if (!this.selectedSubject || !this.selectedSemester) {
          this.hasError = true;
          this.err = "Vui lòng chọn môn và học kì.";
          return;
        }

        const subjectId = this.selectedSubject;
        const lecturerId = this.selectedLecturer.id;
        const semesterId = this.selectedSemester;

        const endpoint =
          endpoints["get-list-student"] +
          `?lecturerId=${lecturerId}&subjectId=${subjectId}&semesterId=${semesterId}`;

        const response = await authApi().get(endpoint);

        if (response.data) {
          this.studentList = response.data;
          this.hasError = false;
        }
      } catch (error) {
        console.error(error);
      }
    },
    async saveSelectedColumnScores() {
      try {
        const subjectId = this.selectedSubject;
        const semesterId = this.selectedSemester;
        const columnScores = {}; // Đối tượng lưu điểm của tất cả sinh viên trong cột tương ứng

        let scoreColumnId = 0;
        if (this.selectedColumn === "1") {
          scoreColumnId = this.studentColumnIds["Quá trình"];
        } else if (this.selectedColumn === "2") {
          scoreColumnId = this.studentColumnIds["Giữa kì"];
        } else if (this.selectedColumn === "3") {
          scoreColumnId = this.studentColumnIds["Cuối kì"];
        } else {
          // Nếu selectedColumn không hợp lệ
          console.error("Selected column is not valid");
          return;
        }

        // Lặp qua danh sách sinh viên và lấy điểm của từng sinh viên trong cột tương ứng
        for (const student of this.studentList) {
          if (student.scoreDto.scoreValue1) {
            // Điểm của từng sinh viên tương ứng với cột được chọn
            const score = parseFloat(student.scoreDto.scoreValue1 || 0);
            columnScores[student.studentId] = score;
          }
          if (student.scoreDto.scoreValue2) {
            // Điểm của từng sinh viên tương ứng với cột được chọn
            const score = parseFloat(student.scoreDto.scoreValue2 || 0);
            columnScores[student.studentId] = score;
          }
          if (student.scoreDto.scoreValue3) {
            // Điểm của từng sinh viên tương ứng với cột được chọn
            const score = parseFloat(student.scoreDto.scoreValue3 || 0);
            columnScores[student.studentId] = score;
          } else {
            console.error(`Không tồn tại`);
          }
        }

        // Lưu điểm cho tất cả sinh viên
        const promises = this.studentList.map(async (student) => {
          const studentId = student.studentId;
          const requestData = [
            {
              subjectId: subjectId,
              semesterId: semesterId,
              studentId: studentId,
              scoreColumnId: scoreColumnId,
              scoreValue: columnScores[studentId],
            },
          ];

          try {
            const response = await authApi().post(
              endpoints["add-score"],
              requestData,
              {
                headers: {
                  "Content-Type": "application/json", // Đặt Content-Type là application/json
                },
              }
            );

            if (response.status !== 201) {
              console.error(`Lưu điểm của sinh viên thất bại!!!`);
            }
          } catch (error) {
            console.error(`Lỗi khi lưu điểm của sinh viên có `, error);
          }
        });

        // Đợi tất cả các promise hoàn thành
        await Promise.all(promises);

        // Hiển thị thông báo sau khi đã lưu điểm cho tất cả sinh viên
        alert("Lưu điểm của tất cả sinh viên thành công!");
      } catch (error) {
        console.error(error);
      }
    },

    async handleSendMail() {
      try {
        this.loading = true;
        const subjectId = this.selectedSubject;
        const semesterId = this.selectedSemester;
        const lecturerId = this.selectedLecturer.id;

        if (!subjectId || !semesterId || !lecturerId) {
          alert("Không thể gửi mail khi chưa có danh sách!");
        }

        const endpoint =
          endpoints["send-mail"] +
          `?lecturerId=${lecturerId}&subjectId=${subjectId}&semesterId=${semesterId}`;

        const response = await authApi().post(endpoint);
        if (response.status === 200) {
          this.loading = false;
          alert("Gửi mail thành công");
        } else {
          this.loading = false;
          alert("Đã có lỗi xảy ra, vui lòng thử lại sau!");
        }
      } catch (error) {
        this.loading = false;
        alert("Đã có lỗi xảy ra, vui lòng thử lại sau!");
        console.error(error);
      }
    },
  },
};
</script>