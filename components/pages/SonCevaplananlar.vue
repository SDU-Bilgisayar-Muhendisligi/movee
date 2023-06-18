<template>
    <div class="son-cevaplananlar">
        <p>En Son cevaplananlar</p>
        <CustomCevaplananCard :cevaplananlar="cevaplananlar"/>
    </div>
</template>

<script setup>

import CustomCevaplananCard from "~/components/base/CustomCevaplananCard.vue";

const {data: cevaplananlar} = await useFetch('https://run.mocky.io/v3/cd4be94b-93ae-42b6-b899-b98a755d0356')



</script>
<style scoped>
.son-cevaplananlar{
    @apply
    mt-4 lg:mt-8
}
.son-cevaplananlar > p{
    @apply
    text-sm font-semibold
    text-gray-yediyuz mb-4
}
</style>
