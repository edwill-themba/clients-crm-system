<template>
    <div>
      <!-- menu -->
      <div class="icon-menu">
        <div  class="bars"  v-on:click="showNavbar">
          <FontAwesomeIcon  icon="bars" class="icon-bars"/>
        </div>
        <div class="times" v-on:click="hideNavbar">
          <FontAwesomeIcon  icon="times" class="icon-times" />
        </div>
      </div>
      <!-- end menu -->
       <nav class="app-navbar">
         <div class="container">
            <router-link to="" class="brand">Themba-Client-CRM</router-link>
            <ul class="menu" v-on:click="hideNavbar">
              <li v-if="!isLoggedIn">
                <router-link to="/">Admin Login</router-link>
              </li> 
              <li v-if="isLoggedIn">
                <router-link to="/clients">View Clients</router-link>
              </li> 
                <li v-if="isLoggedIn">
                <router-link to="#" style="color: #f1ba50;">{{ isCurrentUser }}</router-link>
              </li> 
              <li v-if="isLoggedIn">
                <router-link to="/logout">Log Out</router-link>
              </li>
            </ul>
          </div>
        </nav>
       <router-view></router-view>
    </div>
</template>

<script>
export default {
  name: "navbar",
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    },
    isCurrentUser() {
      return this.$store.getters.isCurrentUser;
    }
  },
  methods: {
    showNavbar() {
      const bar = document.querySelector(".bars");
      const times = document.querySelector(".times");
      const menu = document.querySelector(".menu");
      bar.classList.toggle("inactive");
      times.classList.add("active");
      menu.classList.toggle("active");
    },
    hideNavbar() {
      const bar = document.querySelector(".bars");
      const times = document.querySelector(".times");
      const menu = document.querySelector(".menu");
      bar.classList.remove("inactive");
      times.classList.remove("active");
      menu.classList.remove("active");
    }
  }
};
</script>

<style scoped>
.app-navbar {
  position: relative;
}
.app-navbar .container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.brand {
  color: #04abc1;
  text-decoration: none;
  font-size: 20px;
}
.brand:hover {
  color: #f1ba50;
}

.app-navbar .container .menu li {
  display: inline;
  list-style: none;
  margin-left: 12px;
}
.app-navbar .container .menu li a {
  color: #04abc1;
  text-decoration: none;
  font-size: 18px;
}
.app-navbar .container .menu li a:hover {
  color: #f1ba50;
}
.icon-menu {
  position: absolute;
  margin-left: 90%;
  margin-top: 5%;
}
.icon-menu .icon-bars {
  color: #f1ba50;
  display: none;
}
.icon-menu .icon-times {
  color: #04abc1;
  display: none;
}

@media (max-width: 798px) {
  .brand {
    font-size: 16px;
    margin-left: 20px;
  }
  .menu {
    margin-top: 60px;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    transform: translateX(-100%);
    background: #000000;
    bottom: 0;
    top: 60;
    position: fixed;
    display: block;
    text-align: center;
  }
  .menu.active {
    left: 0;
    transform: translateX(0px);
  }
  .menu li {
    margin-top: 10px;
  }

  .icon-menu {
    display: inline;
    z-index: 100;
  }
  .bars .icon-bars {
    display: inline-block;
    right: 10%;
  }

  .bars.inactive .icon-bars {
    display: none;
  }
  .times.active .icon-times {
    display: inline-block;
  }
}
</style>
