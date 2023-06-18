<template>
    <nuxt-link class="paylas-tusu" :class="color">
        <Share/>
    </nuxt-link>
</template>
<script setup>
import Share from "assets/share.svg";
defineProps({
    color: {
        type: String,
        default: "color-gray"
    }
})

</script>
<style scoped>
.paylas-tusu {
    @apply
    absolute top-0 lg:top-10 right-0 lg:right-5   z-50  lg:hidden
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
