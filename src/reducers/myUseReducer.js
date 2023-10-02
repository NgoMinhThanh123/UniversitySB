import { ref } from 'vue';
import VueCookies from 'vue-cookies';

const myUser = ref(null);

const login = (payload) => {
  myUser.value = payload;
};

const logout = () => {
  VueCookies.remove("token");
  VueCookies.remove("user");
  myUser.value = null;
};

export default {
  myUser,
  login,
  logout,
};