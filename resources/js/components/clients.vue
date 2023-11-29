<template>
    <div class="page">
     <div class="container">
       <div class="clients">
        <!-- if there available clients -->
        <div v-if="clients">
           <div class="panel panel-default">
             <div class="panel-heading client-header">
                 <h3>View Clients</h3>
              </div>
              <div class="panel-body">
                <div class="table-responsive">
                 <table class="table table-success">
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
    </div>
</template>

<script>
export default {
  name: "clients",

  data() {
    return {
      // clients: []
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
    }
  }
};
</script>

<style scoped>
.clients {
  margin: 25px;
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
</style>
