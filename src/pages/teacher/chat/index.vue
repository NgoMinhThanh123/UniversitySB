<template>
  <button class="contactButton menu-btn" @click="toggleSidebar">
  Danh sách chat
  <div class="iconButton">
    <svg
      height="24"
      width="24"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M0 0h24v24H0z" fill="none"></path>
      <path
        d="M16.172 11l-5.364-5.364 1.414-1.414L20 12l-7.778 7.778-1.414-1.414L16.172 13H4v-2z"
        fill="currentColor"
      ></path>
    </svg>
  </div>
</button>

  <!-- <button class="menu-btn " >Menu</button> -->
  <div class="wrapper">
    <!-- Sidebar  -->
    <nav style="color: white" id="sidebar">
      <div class="sidebar-header d-flex justify-content-around">
        <div class="d-flex pointer" style="margin-right: 25px; width: 160px">
          <img
            :src="photoURL"
            alt="user"
            style="
              border-radius: 50%;
              background: white;
              width: 50px;
              height: 50px;
            "
          />
          <div
            style="
              padding: 10px 0px 0px;
              width: 50%;
              display: flex;
              justify-content: space-between;
            "
          >
            <p
              style="line-height: 2; font-weight: 600; margin-left: 10px"
              @click="onProfileClick"
            >
              {{ currentUserName }}
            </p>
          </div>
        </div>
        <button type="button" class="btn btn-primary" @click="logout">
          Logout
        </button>
      </div>
      <div style="height: 1px; border-bottom: 1px solid #00388b"></div>
      <ul class="list-unstyled components">
        <li
          class="action mb-3"
          @click="letsChat(item)"
          v-for="item in searchUsers"
          :key="item.id"
          v-show="item.id !== currentUserId"
        >
          <div
            class="d-flex"
            style="cursor: pointer; padding-bottom: 15px; width: 100%"
          >
            <div class="d-flex" style="width: 30%; justify-content: center">
              <img
                :src="item.URL"
                alt="user"
                style="
                  border-radius: 50%;
                  background: white;
                  width: 50px;
                  height: 50px;
                "
              />
            </div>
            <div
              style="
                padding: 10px 0px 0px;
                width: 50%;
                display: flex;
                justify-content: space-between;
              "
            >
              <h6 style="line-height: 2; font-weight: 600">{{ item.name }}</h6>
            </div>
          </div>
          <div style="height: 1px; border-bottom: 1px solid #00388b"></div>
        </li>
      </ul>
    </nav>

    <!-- Page Content  -->
    <div id="box-content">
      <div
        id="content"
        class="content-chatbox"
        v-if="currentPeerUser === null && !showProfile"
      >
        <div class="my-4 d-flex" style="justify-content: center">
          <img
            :src="photoURL"
            class="br-50"
            style="width: 100px; height: 100px"
          />
        </div>
        <div>
          <h2 style="text-align: center">Chào {{ currentUserName }},</h2>
          <h3 style="text-align: center">
            Hãy chùng mọi người trao đổi những thắc mắc nhé.
          </h3>
        </div>
      </div>
      <div v-else class="header-width">
        <ChatBox :currentPeerUser="currentPeerUser" />
      </div>
    </div>
  </div>
</template>

<script>
import { getAuth, signOut } from "firebase/auth";
import { getFirestore, collection, getDocs } from "firebase/firestore"; // Sử dụng db từ Firebase Modular SDK
import ChatBox from "../../../components/ChatBox.vue";
import { db } from "../../../main";

export default {
  name: "Chat",
  components: {
    ChatBox,
  },
  data() {
    return {
      currentUserName: localStorage.getItem("name"),
      currentPeerUser: null,
      currentUserId: localStorage.getItem("id"),
      currentUserPhoto: localStorage.getItem("photoURL"),
      searchUsers: [],
      photoURL: localStorage.getItem("photoURL"),
      listStudents: [],
      showProfile: false,
    };
  },
  methods: {
    toggleSidebar() {
      const sidebar = document.getElementById("sidebar");
      sidebar.classList.toggle("action");
      sidebar.classList.toggle("slide-right");

      const boxContent = document.getElementById("box-content");
      boxContent.classList.toggle("unactive");
    },
    async onProfileClick() {
      // Toggle the showProfile flag when clicking on the <p> element
      this.showProfile = false;
      this.currentPeerUser = null;
      const sidebar = document.getElementById("sidebar");
      sidebar.classList.remove("action");
      sidebar.classList.remove("slide-right");

      const boxContent = document.getElementById("box-content");
      boxContent.classList.remove("unactive");
    },
    async logout() {
      const auth = getAuth();
      await signOut(auth);
      this.$router.push("/login");
      localStorage.clear();
    },
    letsChat(item) {
      this.currentPeerUser = item;
      this.showProfile = true;
      const sidebar = document.getElementById("sidebar");
      sidebar.classList.remove("action");
      sidebar.classList.remove("slide-right");

      const boxContent = document.getElementById("box-content");
      boxContent.classList.remove("unactive");
    },
    async getUserList() {
      const usersCollection = collection(db, "users"); // Tạo một bộ sưu tập Firestore
      const querySnapshot = await getDocs(usersCollection); // Lấy dữ liệu từ bộ sưu tập
      querySnapshot.forEach((doc) => {
        const userData = doc.data();
        if (userData.id !== this.currentUserId) {
          this.searchUsers.push({
            documentKey: doc.id,
            id: userData.id,
            name: userData.name,
            URL: userData.URL,
            description: userData.description,
          });
        }
      });
    },
  },
  created() {
    if (!localStorage.hasOwnProperty("id")) this.$router.push("/");
    this.getUserList();
  },
};
</script>

<style scoped>
.pointer {
  cursor: pointer;
}
.br-50 {
  border-radius: 50%;
}
.header-width {
  width: calc(100% - 350px);
  transition: all 0.3s;
  position: absolute;
  right: 0;
}

.menu-btn {
  display: none;
}

.header-width {
  margin-right: 10px;
}

.contactButton {
  background: #7079f0;
  color: white;
  font-family: inherit;
  padding: 0.45em;
  padding-left: 1em;
  font-size: 17px;
  font-weight: 500;
  border-radius: 0.9em;
  border: none;
  cursor: pointer;
  letter-spacing: 0.05em;
  display: flex;
  align-items: center;
  box-shadow: inset 0 0 1.6em -0.6em #714da6;
  overflow: hidden;
  position: relative;
  height: 2.8em;
  padding-right: 3em;
  display: none;
}

.iconButton {
  top: 10%;
  margin-left: 1em;
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 2.2em;
  width: 2.2em;
  border-radius: 0.7em;
  box-shadow: 0.1em 0.1em 0.6em 0.2em #7a8cf3;
  right: 0.3em;
  transition: all 0.3s;
}

.contactButton:hover {
  transform: translate(-0.05em, -0.05em);
  box-shadow: 0.15em 0.15em #5566c2;
}

.contactButton:active {
  transform: translate(0.05em, 0.05em);
  box-shadow: 0.05em 0.05em #5566c2;
}


@media (max-width: 768px) {
  .contactButton {
    display: block;
  }

  .wrapper {
    display: block;
  }
  .menu-btn {
    display: block;
  }
  /* Hide the sidebar by default on smaller screens */
  #sidebar {
    display: none;
  }

  /* Show the sidebar when active class is applied */
  #sidebar.action {
    display: block;
    margin: 10px !important;
  }

  .unactive {
    display: none;
  }

  #content {
    position: relative;
    width: 100%;
  }

  .header-width {
    position: relative;
    width: unset;
    margin: 10px 0;
  }

  .content-chatbox {
    margin: 10px 0;
  }

  .slide-right {
    -webkit-animation: slide-right 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94)
      both;
    animation: slide-right 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
  }

  @-webkit-keyframes slide-right {
    0% {
      -webkit-transform: translateX(-100px);
      transform: translateX(-100px);
    }
    100% {
      -webkit-transform: translateX(0);
      transform: translateX(0);
    }
  }
  @keyframes slide-right {
    0% {
      -webkit-transform: translateX(-100px);
      transform: translateX(-100px);
    }
    100% {
      -webkit-transform: translateX(0);
      transform: translateX(0);
    }
  }
}
</style>