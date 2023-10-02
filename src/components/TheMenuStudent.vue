<template>
  <a-menu v-model:openKeys="openKeys" v-model:selectedKeys="selectedKeys" mode="inline">
    <a-menu-item key="student-score">
      <router-link :to="{ name: 'student-score' }" class="router-link-hover">
        <i class="fa-solid fa-paintbrush"></i>
        <span class="sider">
        Điểm thi
        </span>
      </router-link>
    </a-menu-item>
    <a-menu-item key="student-forum">
      <router-link :to="{ name: 'student-forum' }" class="router-link-hover">
        <i class="fa-solid fa-book"></i>
        <span class="sider">
          Diễn đàn
        </span>
      </router-link>
    </a-menu-item>

    <a-menu-item key="student-chat">
      <router-link :to="{ name: 'student-chat' }" class="router-link-hover">
        <i class="fa-brands fa-rocketchat"></i>
        <span class="sider">
          Chat
        </span>
      </router-link>
    </a-menu-item>
    <a-menu-item key="student-course">
      <router-link :to="{ name: 'student-course' }" class="router-link-hover">
        <i class="fa-solid fa-book-open-reader"></i>
        <span class="sider">
          Đăng ký môn học
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