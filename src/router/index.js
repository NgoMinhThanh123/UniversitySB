import { createRouter, createWebHistory } from 'vue-router'
import home from '../layouts/homePage.vue';
import teacher from './teacher.js';
import student from './student.js';
import login from './login.js';
import store from '@/stores/myStore';

const routes = [
    {
      path: '/',
      component: home,
    },
    {
      path: '/profile',
      name: 'profile',
      component: () => import ('../pages/profile/index.vue'),
      beforeEnter: (to, from, next) => {
        // Kiểm tra trạng thái đăng nhập từ store Vuex
        if (store.getters.isAuth) {
          next(); // Cho phép truy cập
        } else {
          next('/login'); // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }
      },
    },
    ...teacher,
    ...student,
    ...login
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router;
