<template>
  <div>
    <div class="row">
      <div
        class="col-2 col-md-3 col-lg-3 col-xl-2 d-none d-md-flex sidebar-desktop"
        style="padding: 0"
      >
        <a-list bordered style="width: 100%;">
          <TheMenuStudent />
          <template #header>
            <div>
              <img
                src="../assets/logoSchool_1.png"
                alt="logo"
                style="width: 100%"
              />
            </div>
          </template>
        </a-list>
      </div>
      <div class="col col-md-9 col-lg-9 col-xl-10" style="padding: 0">
        <TheHeader />
        <div class="container" style="padding: 20px; min-height: 85vh">
          <router-view></router-view>
        </div>
        <TheFooter />
      </div>
    </div>
  </div>
</template>

<script>
import TheHeader from "../components/TheHeader.vue";
import TheFooter from "../components/TheFooter.vue";
import TheMenuStudent from "../components/TheMenuStudent.vue";
export default {
  components: {
    TheHeader,
    TheFooter,
    TheMenuStudent,
  },
};
</script>
