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
              </tr>
              <tr  v-for="(client,index) in clients" :key="index">
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
</template>

<script>
export default {
  name: "clientList",
  props: ["clients"]
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
</style>
