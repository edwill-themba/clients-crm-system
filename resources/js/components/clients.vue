<template>
    <div class="page">
     <div class="container">
       <div class="clients">
       <!-- if there available clients -->
        <div v-if="clients">
           <div class="panel panel-default">
             <div class="panel-heading client-header">
                 <h3>View Clients</h3>
                 <button class="btn-add" @click="showModal()">Add Client</button>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                 <table class="table table-bordered">
                    <tr>
                      <th class="t-head">client id</th>
                      <th class="t-head">client id number</th>
                      <th class="t-head">first name</th>
                      <th class="t-head">last name</th>
                      <th class="t-head">telephone no</th>
                      <th class="t-head">client email address</th>
                       <th class="t-head">client status</th>
                    </tr>
                    <tr  v-for="(client,index) in clients" :key="index">
                      <td class="t-col">{{ client.id }}</td>
                      <td class="t-col">{{ client.id_number }}</td>
                      <td class="t-col">{{ client.first_name }}</td>
                      <td class="t-col">{{ client.last_name }}</td>
                      <td class="t-col">{{ client.telephone }}</td>
                      <td class="t-col">{{ client.email }}</td>
                      <td class="t-col">{{ client.status }}</td>
                   </tr>
                  </table>
                </div>
               </div>
            </div>
         </div>
         <!-- if there no client a message is displayed -->
         <div v-if="!clients">
            <h2>There Are No Clients Found</h2>
         </div>
       </div>
     </div>
     <teleport to="#add-client">
       <div v-if="add_modal" class="modal-page">
         <div class="modal-form">
            <h6>Add New Client</h6>
            <form @submit="createEditClient">
            <div class="form-group">
              <input type="text" name="id_number" v-model="input.id_number" class="form-control input" placeholder="enter id number">
              <span style="color:#000000">{{ inputErrors.id_number }}</span>
            </div>
            <div class="form-group">
              <input type="date" name="date_of_birth" v-model="input.date_of_birth" class="form-control input">
              <span style="color:#000000">{{ inputErrors.date_of_birth }}</span>
            </div>
            <div class="form-group">
              <input type="text" name="first_name" v-model="input.first_name" class="form-control input" placeholder="enter first name">
              <span style="color:#000000">{{ inputErrors.first_name }}</span>
            </div>
            <div class="form-group">
              <input type="text" name="last_name" v-model="input.last_name" class="form-control input" placeholder="enter last name">
               <span style="color:#000000">{{ inputErrors.last_name }}</span>
            </div>
            <div class="form-group">
              <input type="text" name="telephone" v-model="input.telephone" class="form-control input" placeholder="enter telephone">
              <span style="color:#000000">{{ inputErrors.telephone }}</span>
            </div>
            <div class="form-group">
              <input type="email" name="email" v-model="input.email" class="form-control input" placeholder="enter email">
              <span style="color:#000000">{{ inputErrors.email }}</span>
            </div>
            <div class="form-group">
              <select name="status" v-model="input.status" class="form-control">
                <option value="">please select client status</option>
                <option value="active">active</option>
                <option value="inactive">inactive</option>
              </select>
               <span style="color:#000000">{{ inputErrors.status }}</span>
            </div>
             <button type="submit" class="btn">add client</button>
             <button type="button" @click="hideModal()" class="btn">close modal</button>
            </form>
         </div>
       </div> 
     </teleport>
    </div>
</template>

<script>
export default {
  name: "clients",

  data() {
    return {
      add_modal: false,
      input: {
        id_number: "",
        date_of_birth: "",
        first_name: "",
        last_name: "",
        email: "",
        telephone: "",
        status: ""
      },
      inputErrors: {
        id_number: undefined,
        date_of_birth: undefined,
        first_name: undefined,
        last_name: undefined,
        email: undefined,
        telephone: undefined,
        status: undefined
      }
    };
  },
  computed: {
    clients() {
      return this.$store.getters.allTheClients;
    }
  },
  created() {
    this.allClients();
  },
  methods: {
    // gets all the clients
    async allClients() {
      try {
        const response = await this.$store.dispatch("getAllClient");
        console.log(response);
      } catch (error) {
        console.log(error);
      }
    },
    showModal() {
      this.add_modal = true;
    },
    hideModal() {
      this.add_modal = false;
    },
    createEditClient(e) {
      e.preventDefault();

      this.inputErrors = this.validateInputErrors(this.input);
      if (Object.keys(this.inputErrors).length) return;
      alert("submit is clicked");
    },
    validateInputErrors(input) {
      const errors = {};
      if (!input.id_number) errors.id_number = "the id number is required";
      if (!input.date_of_birth)
        errors.date_of_birth = "the birth date is required";
      if (!input.first_name) errors.first_name = "the first name is required";
      if (!input.last_name) errors.last_name = "the last name is required";
      if (!input.status) errors.status = "the status is required";
      if (!input.email) errors.email = "the email is required";
      if (!input.telephone) errors.telephone = "the telephone is required";
      return errors;
    }
  }
};
</script>

<style scoped>
.clients {
  margin: 25px;
}
.client-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
}
.client-header .btn-add {
  background-color: #f1ba50;
  font-size: 14px;
  margin: 10px;
  height: 40px;
  width: 100px;
  border-radius: 6px;
  border: none;
}
.client-header .btn-add:hover {
  background: #000000;
  color: #f1ba50;
  border: 1px solid #f1ba50;
}
.clients .client-header h3 {
  color: #04abc1;
}
h2 {
  color: #04abc1;
  text-align: center;
}
.t-head {
  text-align: left;
  color: #f1ba50;
}
.t-col {
  color: #04abc1;
  padding-left: 10px;
}
.modal-page {
  top: 0;
  left: 0;
  position: absolute;
  width: 100%;
  height: 100%;
  background: #d3d3d349;
  margin: 0;
  padding: 10px;
  transition: transform 0.5s ease-in-out;
}
.modal-page .modal-form {
  width: 300px;
  height: 700px;
  background: #f1ba50;
  border-radius: 6px;
  margin: 5px;
  padding: 5px;
}
.modal-page .modal-form h6 {
  color: #000000;
  text-align: center;
  font-size: 20px;
  font-weight: 700;
  margin: 15px auto;
}
.input {
  margin-bottom: 15px;
}
.btn {
  background-color: #04abc1;
  font-size: 14px;
  margin: 10px;
  height: 40px;
  width: 120px;
  border-radius: 6px;
  border: none;
}
.btn:hover {
  background: #f1ba50;
  color: #04abc1;
  border: 1px solid #04abc1;
}
</style>
