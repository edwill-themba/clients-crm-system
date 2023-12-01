<template>
    <div>
       <div class="panel panel-default">
          <div class="panel-heading">
             <h3><strong>Full Name:</strong> {{ searchRes.first_name }} {{ searchRes.last_name }}</h3>
          </div>
          <div class="panel-body">
             <p><strong>UUID:</strong> {{ searchRes.uuid }}</p>
             <p><strong>ID Number:</strong> {{ searchRes.id_number }}</p>
             <p><strong>Telephone:</strong> {{ searchRes.telephone }}</p>
             <p><strong>Email:</strong> {{ searchRes.email }}</p>
             <p><strong>Status:</strong> {{ searchRes.status }}</p>
          </div>
       </div>
    </div>
</template>

<script>
export default {
  name: "filterResults",
  props: ["searchRes"],
  data() {
    return {
      search: false
    };
  }
};
</script>

<style scoped>
h3,
p {
  color: #04abc1;
}
strong {
  color: #f1ba50;
  margin-left: 12px;
  padding-left: 10px;
}
</style>
