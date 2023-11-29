<template>
    <div>
       <nav class="app-navbar">
         <div class="container">
            <router-link to="" class="brand">Themba-Client-CRM</router-link>
            <ul class="menu">
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
  }
};
</script>

<style scoped>
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
</style>
