<template>
  <TheHeader />
  <div class="container-fluid mt-3" style="height: 100%">
    <div class="row">
      <div class="col-sm-3 d-none d-sm-flex">
        <a-list bordered style="width: 100%">
          <TheMenu />
          <template #header>
            <div style="font-size: 20px;">BẢNG ĐIỀU KHIỂN</div>
          </template>
        </a-list>
      </div>

      <div class="col-12 col-sm-9" style="margin-bottom: 150px">
        <router-view></router-view>
      </div>
    </div>
  </div>
  <TheFooter />
</template>

<script>
import TheHeader from "../components/TheHeader.vue";
import TheFooter from "../components/TheFooter.vue";
import TheMenu from "../components/TheMenu.vue";
export default {
  components: {
    TheHeader,
    TheFooter,
    TheMenu,
  },
};
</script>