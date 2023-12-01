<template>
    <div>
        <p>{{ severErrors }}</p>
    </div>
</template>

<script>
export default {
  name: "serverError",
  props: ["severErrors"]
};
</script>

<style scoped>
p {
  font-size: 20px;
  color: #04abc1;
  text-align: center;
}
</style>
