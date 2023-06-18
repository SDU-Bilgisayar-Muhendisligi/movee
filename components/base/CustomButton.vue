<template>
    <div class="custom-button" :class="bgColor">
        <slot/>
    </div>
</template>

<script setup>

defineProps({
    bgColor: {
        type: String,
        default: "bg-purple-text-white"
    }
})

</script>

<style scoped>
.custom-button {
    @apply
    flex justify-center items-center
    py-2 cursor-pointer rounded-xl
}



.bg-purple-text-white {
    @apply
    bg-primary text-white
}

.bg-gray-text-dark {
    @apply
    bg-gray-yuz text-dark
}

.bg-green-text-white{
    @apply
    bg-green text-white
}
</style>
