<template>
    <div class="content">
        <div class="login">
            <form @submit="onLogin"   class="frm-login">
               <h3>Admin Login</h3>
               <h6>Welcome To Client CRM System</h6>
               <input type="email" name="email" v-model="input.email" placeholder="enter email address" class="form-control input">
               <span style="color:#000000">{{ inputErrors.email }}</span>
               <input type="password" name="password" v-model="input.password" placeholder="enter password" class="form-control input">
               <span style="color:#000000">{{ inputErrors.password }}</span>
               <button type="submit" class="btn btn-primary btn">login</button>
            </form>
            <h4 v-if="severErrors">{{ severErrors }}</h4>
            <h4 v-if="serverErrorMessages">{{ serverErrorMessages }}</h4>
        </div>
    </div>
</template>

<script>
export default {
  name: "login",
  data() {
    return {
      input: {
        email: "",
        password: ""
      },
      inputErrors: {
        email: undefined,
        password: undefined
      },
      severErrors: "",
      serverErrorMessages: ""
    };
  },
  methods: {
    async onLogin(e) {
      e.preventDefault();
      this.inputErrors = this.validateInputs(this.input);
      if (Object.keys(this.inputErrors).length) return;
      try {
        const response = await this.$store.dispatch("login", this.input);
        console.log(response);
        this.getUser();
      } catch (error) {
        console.log(error);
        this.severErrors = error.response.data.errors;
        this.serverErrorMessages = error.response.data.message;
      }
    },
    async getUser() {
      try {
        let response = await this.$store.dispatch("getCurrentUser");
        console.log(response);
      } catch (err) {
        this.serverErrorMessages = err.response.data.message;
        console.log(this.serverErrorMessages);
      }
    },
    validateInputs(input) {
      const errors = {};
      if (!input.email) errors.email = "the email is required";
      if (!input.password) errors.password = "the password is required";
      return errors;
    }
  }
};
</script>

<style scoped>
.login {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.frm-login {
  margin: 30px auto;
  padding: 10px;
  background: #04abc1;
  width: 300px;
  height: 300px;
  border-radius: 6px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border: 1px solid #057f8f;
}
.frm-login h6 {
  color: #000000;
  font-size: 17px;
}
.input {
  background: #000000;
  color: #04abc1;
  border: 1px solid #04abc1;
  margin-bottom: 10px;
}
.btn {
  background: #000000;
  width: 100%;
  height: 45px;
  color: #04abc1;
}
.btn:hover {
  background: #f1ba50;
  color: #000000;
  border: 2px solid #04abc1;
  font-weight: 500;
}
.login h4 {
  margin: 10px auto;
  color: #04abc1;
}
</style>
