<template>
  <a-menu v-model:openKeys="openKeys" v-model:selectedKeys="selectedKeys" mode="inline">
    <a-menu-item key="teacher-studentScore">
      <router-link :to="{ name: 'teacher-studentScore' }" class="router-link-hover">
        <i class="fa-solid fa-pen"></i>
        <span class="sider">
        Nhập điểm
        </span>
      </router-link>
    </a-menu-item>
    <a-menu-item key="teacher-student">
      <router-link :to="{ name: 'teacher-student' }" class="router-link-hover">
        <i class="fa-solid fa-users"></i>
        <span class="sider">
        Sinh viên
        </span>
      </router-link>
    </a-menu-item>
    <a-menu-item key="teacher-forum">
      <router-link :to="{ name: 'teacher-forum' }" class="router-link-hover">
        <i class="fa-solid fa-book"></i>
        <span class="sider">
          Diễn đàn
        </span>
      </router-link>
    </a-menu-item>

    <a-menu-item key="teacher-classStudent">
      <router-link :to="{ name: 'teacher-classStudent' }" class="router-link-hover">
        <i class="fa-solid fa-landmark"></i>
        <span class="sider">
          Lớp chủ nhiệm
        </span>
      </router-link>
    </a-menu-item>
  </a-menu>
</template>

<script>
  import { storeToRefs } from "pinia";
  import { useMenu } from "../stores/use-menu.js";
  import { defineComponent } from 'vue';
  export default defineComponent({

    setup() {
      const store = useMenu();
      return {
        ...storeToRefs(store),
      };
    },
  });
</script>