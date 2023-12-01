<template>
    <div class="page">
     <div class="container">
       <div class="clients">
       <!-- if there available clients -->
        <div v-if="clients">
           <div class="panel panel-default">
              <div class="panel-heading">
                <form class="frm-search" @submit="filterClient">
                   <input type="search" name="filter" v-model="filter"  class="search-input" placeholder="enter client first name or last name or email or telephone" required>
                   <button type="submit" class="btn">search</button>
                </form>
                <!-- search results -->
                 <div v-if="search">
                    <filterResults  v-bind:searchRes="searchRes" />
                 </div>
                <!-- end search results -->
                <!-- server error message components -->
                <div v-if="severErrors">
                  <serverError  v-bind:serverErrors="severErrors" />
                </div>
                <div v-if="serverErrorMessages">
                  <serverMessage v-bind:serverErrorMessages="serverErrorMessages" />
                </div>
                <!-- end server error messages -->
              </div>
              <div class="panel-heading client-header">
                 <h3>View Clients</h3>
                 <button class="btn-add" @click="showModal()">Add Client</button>
              </div>
              <div class="panel-body">
                  <clientLists v-bind:clients="clients" />
               </div>
            </div>
         </div>
         <!-- if there no client a message is displayed -->
         <div v-if="!clients">
            <h2>There Are No Clients Found</h2>
         </div>
       </div>
     </div>
     <!-- the add client teleport modal -->
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
     <!-- end add client teleport -->
    </div>
</template>

<script>
import clientLists from "./client_lists.vue";
import filterResults from "./filter_results.vue";
import serverError from "./error_message/sever_error.vue";
import serverMessage from "./error_message/sever_error_message.vue";
export default {
  name: "clients",
  components: {
    clientLists,
    filterResults,
    serverError,
    serverMessage
  },
  data() {
    return {
      add_modal: false,
      // user input
      input: {
        id_number: "",
        date_of_birth: "",
        first_name: "",
        last_name: "",
        email: "",
        telephone: "",
        status: ""
      },
      // input validation
      inputErrors: {
        id_number: undefined,
        date_of_birth: undefined,
        first_name: undefined,
        last_name: undefined,
        email: undefined,
        telephone: undefined,
        status: undefined
      },
      // filter
      search: false,
      filter: "",
      searchRes: {},
      // errors
      severErrors: "",
      serverErrorMessages: "",
      // edit or add
      edit: false
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
    // show modal form
    showModal() {
      this.add_modal = true;
    },
    // close modal form
    hideModal() {
      this.add_modal = false;
    },
    async createEditClient(e) {
      e.preventDefault();
      this.inputErrors = this.validateInputErrors(this.input);
      if (Object.keys(this.inputErrors).length) return;
      if (this.edit === false) {
        try {
          const response = await this.$store.dispatch(
            "addNewClient",
            this.input
          );
          console.log(response);
          this.add_modal = false;
          // clears user inputs
          this.input.id_number = "";
          this.input.date_of_birth = "";
          this.input.first_name = "";
          this.input.last_name = "";
          this.input.telephone = "";
          this.input.email = "";
        } catch (error) {
          this.severErrors = error.response.data.errors;
          this.serverErrorMessages = error.response.data.message;
          console.log(error);
          this.add_modal = false;
        }
      } else {
        alert("edit");
      }
    },
    // validate input entered  by user
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
    },
    // search user based on name or surname or email or telephone
    async filterClient(e) {
      e.preventDefault();
      try {
        const response = await this.$store.dispatch(
          "filterClient",
          this.filter
        );
        this.searchRes = response.data.results;
        this.search = true;
        console.log(response);
      } catch (error) {
        this.serverErrorMessages = error.response.data.message;
        console.log(error);
      }
    }
  }
};
</script>

<style scoped>
.frm-search {
  display: flex;
  justify-content: center;
  align-items: center;
}
.frm-search .search-input {
  width: 600px;
  height: 40px;
  border: none;
  background: #f1ba50;
  padding-left: 15px;
  border-radius: 6px;
}

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
