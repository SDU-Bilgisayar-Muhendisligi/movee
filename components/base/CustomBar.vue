<template>
  <div class="custom-bar">
    <custom-geri-tusu class="custom-bar-button"/>
    <p>Sorularım</p>
  </div>
</template>

<script setup>

import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
</script>


<style scoped>
.custom-bar {
  @apply
  flex lg:hidden justify-center mt-9
}

.custom-bar-button {
  top: 40px !important;
  left: 20px !important;
}

custom-bar > p {
  @apply
  text-gray-yediyuz
  font-normal text-base
}
</style>
