<template>
  <TheHeader />
  <div class="container-fluid mt-3">
    <div class="row">
      <div class="col-sm-3 d-none d-sm-flex">
        <a-list bordered style="width: 100%">
          <TheMenuStudent />
          <template #header>
            <div>BẢNG ĐIỀU KHIỂN</div>
          </template>
        </a-list>
      </div>

      <div class="col-12 col-sm-9">
        <router-view></router-view>
      </div>
    </div>
  </div>
  <TheFooter />
</template>

<script>
  import TheHeader from '../components/TheHeader.vue'
  import TheFooter from '../components/TheFooter.vue'
  import TheMenuStudent from '../components/TheMenuStudent.vue'
  export default {
    components: {
      TheHeader,
      TheFooter,
      TheMenuStudent,
    },
  };
</script>