<template>
    <div class="page">
      <div class="container">
        <div class="logout">
          <h3 v-if="!serverError">You have successfully Logged Out</h3>
          <h4 v-if="serverError">{{ serverError }}</h4>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: "logout",
  data() {
    return {
      serverError: ""
    };
  },
  created() {
    this.logout();
  },
  methods: {
    async logout() {
      try {
        const response = await this.$store.dispatch("logout");
        console.log(response);
        this.$router.push({ path: "/" });
      } catch (error) {
        this.serverError = error.response.data.message;
      }
    }
  }
};
</script>

<style scoped>
.logout {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 100%;
  margin-top: 25px;
}
.logout h3 {
  color: #04abc1;
  font-size: 30px;
}
.logout h4 {
  margin: 10px;
  color: #04abc1;
}
</style>
