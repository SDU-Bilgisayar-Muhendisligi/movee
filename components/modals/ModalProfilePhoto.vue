<template>
  <div class="modal-profil-photo">
    <img :src="selectedPhoto" :alt="selectedPhoto">
  </div>
</template>

<script setup>
defineProps({
  selectedPhoto: String
})
</script>


<style scoped>
.modal-profil-photo {
  z-index: 9999;
  @apply
  fixed w-full top-0 left-0 bottom-0 right-0 bg-[rgba(0,0,0,0.5)]
  flex flex-col justify-center items-center
}
.modal-profil-photo > img {
  @apply
  rounded
}
</style>
