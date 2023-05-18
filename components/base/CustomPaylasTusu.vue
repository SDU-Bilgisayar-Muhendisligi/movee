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


// const handleShare = () => {
//     if (!navigator.share) {
//         navigator.share({
//             title: 'Başlık',
//             text: 'Paylaşmak istediğiniz metin',
//             url: `${window.location.href}`,
//         })
//             .then(() => console.log('Paylaşıldı'))
//             .catch((error) => console.error('Paylaşım hatası:', error));
//     } else {
//         console.log(window.location.href)
//     }
// };
</script>
<style scoped>
.paylas-tusu {
    @apply
    absolute -top-2 right-0 z-50  lg:hidden
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
