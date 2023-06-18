<template>
  <div class="photo-upload-container">
    <label for="input" class="tooltip" >
      <input type="file" accept="image/png, image/jpeg" class="photo-upload-input" @change="handlePhotoUpload"/>
      <default-p-p class="photo-upload-default" v-if="!selectedPhoto"/>
      <span class="tooltiptext bg-primary px-2">Fotoğraf Yükle</span>
    </label>
    <div class="tooltip rounded-full" @click="increasePhotoSize" >
      <img class="rounded-full" :src="selectedPhoto"  v-if="selectedPhoto"/>
      <span class="tooltiptext bg-primary px-2">Fotoğrafı Büyüt</span>
    </div>
    <trash @click="removePhoto" v-if="selectedPhoto" class="photo-upload-trash"/>
    <modal-profile-photo v-if="clickedPhoto" @click.self="closePhotoSize" :selectedPhoto="selectedPhoto"/>
  </div>
</template>

<script setup>
import Trash from "~/components/common/Trash.vue";
import DefaultPP from "~/components/common/DefaultPP.vue";
import ModalProfilePhoto from "~/components/modals/ModalProfilePhoto.vue";
const selectedPhoto = ref(null);
const clickedPhoto = ref(false);

watch(selectedPhoto, (newValue) => {
  const input = document.querySelector('.photo-upload-input')
  if (newValue) {
    input.classList.add('hidden')
  } else {
    input.classList.remove('hidden')
  }
})
const handlePhotoUpload = (event) => {
  const file = event.target.files[0];
  const reader = new FileReader();
  reader.onload = () => {
    selectedPhoto.value = reader.result;
  };
  reader.readAsDataURL(file);
  event.target.value = null;
}

const increasePhotoSize = () => {
  clickedPhoto.value = true;
}

const closePhotoSize = () => {
  clickedPhoto.value = false;
}

const question = ref('Are you sure you want to delete your photo?')
const removePhoto = (event) => {
  if (confirm(question.value)) return selectedPhoto.value = null;
  event.target.value
}

</script>
<style scoped>

.photo-upload-container {
  @apply
  relative border border-gray-ikiyuz bg-white
  w-20 h-20 rounded-full cursor-pointer
}

.photo-upload-input {
  @apply
  w-20 h-20 rounded-full cursor-pointer opacity-0 relative z-50
}

.photo-upload-input:before {
  content: '';
  @apply
  absolute w-full h-full top-0 left-0 z-50
}

.photo-upload-container > img {
  @apply
  absolute top-0 rounded-full cursor-pointer w-20 h-20
}

.photo-upload-default {
  transform: translate(-50%, -50%);
  @apply
  top-[50%] left-[50%] cursor-pointer absolute
}

.photo-upload-trash {
  z-index: 100;
  @apply
  lg:border border-gray-ikiyuz rounded-full bg-white w-5 h-5
  absolute bottom-0 right-0 cursor-pointer p-0.5
}

input::-webkit-file-upload-button {
  @apply
  hidden
}

.tooltip {
  position: relative;
  display: inline-block;
  @apply
  rounded-full
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  bottom: 100%;
  left: 50%;
  margin-left: -60px;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}

</style>
