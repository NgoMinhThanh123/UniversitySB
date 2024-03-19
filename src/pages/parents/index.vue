<template>
  <TheHeader />
  <div id="parent">
    <div class="container">
      <form class="formParent">
        <div class="row">
          <div class="col">
            <label>Mã số sinh viên</label>
            <input type="text" class="form-control" placeholder="Mã số sinh viên" />
          </div>
          <div class="col">
            <label>Họ và tên</label>
            <input type="text" class="form-control" placeholder="Họ và tên" />
          </div>
          <div class="col">
            <label>Ngày sinh</label>
            <input type="date" class="form-control" placeholder="Ngày sinh" />
          </div>
        </div>
        <div class="row" style="margin-top: 20px">
          <div class="col">
            <label>Mã lớp</label>
            <input type="text" class="form-control" placeholder="Mã lớp" />
          </div>
          <div class="col">
            <label>CCCD</label>
            <input type="text" class="form-control" placeholder="CCCD" />
          </div>
          <div class="col">
            <!-- <input type="text" class="form-control" placeholder="Last name" /> -->
          </div>
        </div>
      </form>
      <div class="btn-search">
        <input
          type="submit"
          value="Tra cứu"
          class="btn btn-block btn-primary"
          :disabled="loading"
          style="max-width: 100px"
        />
      </div>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <TheFooter />
</template>
<script>
import TheFooter from "@/components/TheFooter.vue";
import TheHeader from "@/components/TheHeader.vue";

export default {
  components: {
    TheFooter,
    TheHeader,
  },
};
</script>
<style scoped>
#parent {
  position: relative;
  width: 100%;
  /* min-height: 100vh; */
  margin-top: 50px;
  margin-bottom: 50px;
  /* background: #d3d3d3; */
}

.container {
  /* position: relative; */
  width: 1200px;
  min-height: 400px;
  padding: 30px;
  border-radius: 5px;
  box-shadow: -1px -1px 20px 4px rgba(234, 234, 234, 1);
  -webkit-box-shadow: -1px -1px 20px 4px rgba(234, 234, 234, 1);
  -moz-box-shadow: -1px -1px 20px 4px rgba(234, 234, 234, 1);
}

.btn-search {
  max-width: 100%;
  margin-top: 40px;
  display: flex;
  justify-content: flex-end;
}

.formParent {
}
</style>
