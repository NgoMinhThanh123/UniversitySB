<template>
  <div style="height: 100%;">
    <div v-if="isLoading" style="position: absolute; width: 100%; height: 50%">
      <div class="loader">
        <div class="ball"></div>
        <div class="ball"></div>
        <div class="ball"></div>
      </div>
    </div>
    <div v-else>
      <div v-if="semesterData.length > 0">
        <h2 class="score">Thông tin điểm số</h2>
        <div
          v-for="(semester, semesterIndex) in semesterData"
          :key="semesterIndex"
        >
          <div class="semester">
            {{
              `${semester.semesterInfo.name}-${semester.semesterInfo.schoolYear}`
            }}
          </div>
          <div class="table-container">
            <table class="table table-striped table-bordered text-center">
              <thead>
                <tr class="table-title">
                  <th style="width: 5%;">STT</th>
                  <th style="width: 30%;">Tên môn học</th>
                  <th style="width: 10%;">Số tín chỉ</th>
                  <th style="width: 15%;">Quá trình</th>
                  <th style="width: 15%;">Giữa kì</th>
                  <th style="width: 15%;">Cuối kì</th>
                  <th style="width: 10%;">TK</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(score, scoreIndex) in semester.score"
                  :key="scoreIndex"
                >
                  <td scope="row">{{ scoreIndex + 1 }}</td>
                  <td class="text-start">{{ score.subjectName }}</td>
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
                      <span
                        v-if="score.scoreDto[1].scoreColumnName === 'Giữa kì'"
                      >
                        {{ score.scoreDto[1].scoreValue || "-" }}
                      </span>
                    </span>
                  </td>
                  <td>
                    <span v-if="score.scoreDto && score.scoreDto.length > 2">
                      <span
                        v-if="score.scoreDto[2].scoreColumnName === 'Cuối kì'"
                      >
                        {{ score.scoreDto[2].scoreValue || "-" }}
                      </span>
                    </span>
                  </td>
                  <td>
                    <span v-if="score.scoreDto && score.scoreDto.length > 3">
                      <span
                        v-if="score.scoreDto[3].scoreColumnName === 'Điểm TK'"
                      >
                        {{ score.scoreDto[3].scoreValue || "-" }}
                      </span>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div>
            <p>
              {{ semester.accumulates.scoreColumnName }}:
              {{ semester.accumulates.scoreValue }}
            </p>
          </div>
        </div>
      </div>
      <div v-else style="padding: 20px">
        <span style="font-size: 25px">Sinh viên chưa có điểm</span>
      </div>
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
      semesterData: [],
      err: "",
      isLoading: false,
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    async fetchData() {
      try {
        this.isLoading = true;
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

        this.semesters = semesterResponse.data.sort((a, b) => {
          return new Date(b.fromDate) - new Date(a.fromDate);
        });

        const semesterDataValue = [];

        for (const semester of semesterResponse.data) {
          const semesterId = semester.id;

          const scoreEndpoint =
            endpoints["score-list"] +
            `?studentId=${studentId}&semesterId=${semesterId}`;
          const scoreResponse = await authApi().get(scoreEndpoint);

          const scoreAccumulateEndpoint =
            endpoints["get-scores-accumulate"] +
            `?studentId=${studentId}&semesterId=${semesterId}`;
          const scoreAccumulateResponse = await authApi().get(
            scoreAccumulateEndpoint
          );

          const semesterDataItem = {
            semesterInfo: semester,
            score: scoreResponse.data,
            accumulates: scoreAccumulateResponse.data,
          };

          semesterDataValue.push(semesterDataItem);
        }
        
        this.semesterData = semesterDataValue;
        this.isLoading = false;
        console.log("semesterData", this.semesterData);
      } catch (err) {
        this.isLoading = false;
        err.value = true;
      }
    },
  },
  setup() {},
};
</script>

<style>
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

.table-title th {
  background: #070758;
  color: #fff;
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
