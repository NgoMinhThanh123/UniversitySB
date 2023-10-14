<template>
  <div>
    <div v-if="semesters.length > 0">
      <h2 class="score">Thông tin điểm số</h2>
      <div v-for="(semester, semesterIndex) in semesters" :key="semesterIndex">
        <div class="semester">
          {{ `${semester.name}-${semester.schoolYear}` }}
        </div>
        <table class="score-table">
          <thead>
            <tr>
              <th>STT</th>
              <th>Tên môn học</th>
              <th>Số tín chỉ</th>
              <th>Quá trình</th>
              <th>Giữa kì</th>
              <th>Cuối kì</th>
              <th>TK</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(score, scoreIndex) in scoreLists[semesterIndex]"
              :key="scoreIndex"
            >
              <td>{{ scoreIndex + 1 }}</td>
              <td>{{ score.subjectName }}</td>
              <td>{{ score.credit }}</td>
              <td>
                <span v-if="score.scoreDto && score.scoreDto.length > 0">
                  <span
                    v-if="score.scoreDto[0].scoreColumnName === 'Quá trình'"
                  >
                    {{ score.scoreDto[0].scoreValue || "-" }}
                  </span>
                </span>
              </td>
              <td>
                <span v-if="score.scoreDto && score.scoreDto.length > 1">
                  <span v-if="score.scoreDto[1].scoreColumnName === 'Giữa kì'">
                    {{ score.scoreDto[1].scoreValue || "-" }}
                  </span>
                </span>
              </td>
              <td>
                <span v-if="score.scoreDto && score.scoreDto.length > 2">
                  <span v-if="score.scoreDto[2].scoreColumnName === 'Cuối kì'">
                    {{ score.scoreDto[2].scoreValue || "-" }}
                  </span>
                </span>
              </td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div v-else style="padding: 20px">
      <span style="font-size: 25px">Sinh viên chưa có điểm</span>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from "vue";
import { authApi, endpoints } from "@/configs/Apis";
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["isAuth", "getUser"]),
  },
  data() {
    return {
      semesters: [],
      scoreLists: [],
      err: "",
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    async fetchData() {
      try {
        const studentUsername = this.getUser.username;
        const response = await authApi().get(
          endpoints["get-student-by-username"].replace(
            "{username}",
            studentUsername
          )
        );
        const studentId = response.data.id;
        const semesterResponse = await authApi().get(
          endpoints["semester-student"] + `?studentId=${studentId}`
        );

        this.semesters = semesterResponse.data
          .sort((a, b) => {
            return  new Date(b.fromDate) - new Date(a.fromDate);
          });

        const scoreListsValue = [];

        for (const semester of semesterResponse.data) {
          const semesterId = semester.id;

          const scoreEndpoint =
            endpoints["score-list"] +
            `?studentId=${studentId}&semesterId=${semesterId}`;
          const scoreResponse = await authApi().get(scoreEndpoint);

          scoreListsValue.push(scoreResponse.data);
        }
        this.scoreLists = scoreListsValue;
      } catch (err) {
        err.value = true;
      }
    },
  },
  setup() {},
};
</script>

