import { createRouter, createWebHistory } from 'vue-router'
import home from '../layouts/homePage.vue';
import teacher from './teacher.js';
import student from './student.js';
import login from './login.js';
import store from '@/stores/myStore';
import register from './register.js';
import parent from './parents.js';

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
    {
      path: '/parent/scoreStudent/:id',
      name: 'score-student',
      component: () => import ('../pages/parents/scoreStudent/index.vue'),
      props: true
    },
    ...teacher,
    ...student,
    ...login,
    ...register,
    ...parent,
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router;
