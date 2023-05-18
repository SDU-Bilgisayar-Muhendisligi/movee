<template>
    <nuxt-link @click="$router.go(-1)" class="geri-tusu" :class="color">
        <ArrowLeft/>
    </nuxt-link>
</template>

<script setup>
import ArrowLeft from "assets/arrow-left.svg";
defineProps({
    color: {
        type: String,
        default: "color-gray"
    }
})
</script>

<style scoped>
.geri-tusu {
    @apply
    absolute -top-2 left-0 z-50  lg:hidden
}
.color-white{
    @apply
    text-white
}

.color-gray{
    @apply
    text-gray-besyuz
}

</style>
