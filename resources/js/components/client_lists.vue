<template>
    <div>
        <div class="table-responsive">
           <table class="table table-bordered">
              <tr>
                <th class="t-head">client id number</th>
                <th class="t-head">first name</th>
                <th class="t-head">last name</th>
                <th class="t-head">telephone no</th>
                <th class="t-head">client email address</th>
                <th class="t-head">client status</th>
                <th class="t-head"></th>
                <th class="t-head"></th>
              </tr>
              <tr  v-for="(client,index) in clients" :key="index">
                <td class="t-col">{{ client.id_number }}</td>
                <td class="t-col">{{ client.first_name }}</td>
                <td class="t-col">{{ client.last_name }}</td>
                <td class="t-col">{{ client.telephone }}</td>
                <td class="t-col">{{ client.email }}</td>
                <td class="t-col">{{ client.status }}</td>
                <td class="t-col"><button class="edit" @click="editUser(client)">edit</button></td>
                <td class="t-col"><button class="del" @click="deleteUser(client)">delete</button></td>
              </tr>
          </table>
        </div> 
    </div>
</template>

<script>
export default {
  name: "clientList",
  props: ["clients"],
  methods: {
    editUser(client) {
      this.$emit("editClient", client);
    },
    deleteUser(client) {
      this.$emit("removeClient", client);
    }
  }
};
</script>

<style scoped>
.t-head {
  text-align: left;
  color: #f1ba50;
}
.t-col {
  color: #04abc1;
  padding-left: 10px;
}
.t-col .edit {
  color: #f1ba50;
  height: 30px;
  margin-left: 0px;
  padding: 5px;
  border-radius: 2px;
  border: none;
}
.t-col .del {
  color: #e1551c;
  margin-left: 0px;
  height: 30px;
  padding: 5px;
  border-radius: 2px;
  border: none;
}
</style>
