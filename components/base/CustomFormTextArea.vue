<template>
    <div class="mt-6">
        <p class="text-gray-yediyuz font-semibold text-sm">Sorunuz</p>
        <textarea class="text-area" :placeholder="placeholder"/>
    </div>

</template>

<script setup>

defineProps({
    placeholder: {
        type: String,
        default: "Lütfen sorunuzu detaylı bir şekilde anlatmaya özen gösterin."
    }
})

</script>

<style scoped>
.text-area {
    min-height: 192px;
    @apply
    resize-none border-gray-ikiyuz border p-3
    rounded-lg h-fit outline-none overflow-y-hidden
    w-full mt-2
}
</style>
