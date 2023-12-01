<template>
    <div>
        <p>{{ serverErrorMessages }}</p>
    </div>
</template>

<script>
export default {
  name: "serverMessage",
  props: ["serverErrorMessages"]
};
</script>

<style scoped>
p {
  font-size: 20px;
  color: #04abc1;
  text-align:center;
}
</style>
