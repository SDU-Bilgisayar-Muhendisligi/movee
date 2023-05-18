<template>
    <img class="image" >
</template>

<script setup>

</script>

<style scoped>
.image {
    height: 300px;
    @apply
    bg-contain bg-no-repeat sm:bg-cover
    bg-[url('/bg-slider.png')] w-full top-0 right-0 left-0
    lg:h-2/6 lg:hidden absolute
}
</style>
