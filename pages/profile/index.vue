<template>
  <base-card height-type="height-auto" flex-type="between-row" padding-size="p-0">
    <div class="profile-container">
      <profile-side-bar/>
      <div class="profil-card-container">
        <div>
          <div class="profil-card-content relative">
            <label for="input" class="profil-card-img-icon z-10">
              <input id="input" type="file" class="hidden"
                     @change="previewImage($event)">
              <default-p-p class="absolute"/>
            </label>
            <img id="preview-selected-image" class="profil-card-img object-cover" alt="image"/>
            <span class="profil-card-img-remove">
                          <trash @click="removePhoto"/>
                        </span>
            <div id="defaultProfilImg"
                 class="profil-card-content-select-img">
            </div>
          </div>
        </div>
        <div class="profile-my-profile">
          <p class="profile-my-name">Movee</p>
          <p class="profile-my-email">hi@movee.one</p>
        </div>
      </div>
    </div>
  </base-card>
</template>


<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import ProfileSideBar from "~/components/app/Sidebar/ProfileSideBar.vue";
import DefaultPP from "~/components/common/DefaultPP.vue";
import BackgrounImage from "~/components/common/BackgrounImage.vue";
import Trash from "~/components/common/Trash.vue";

definePageMeta({
  layout: "temiz"
})

function removePhoto() {
  const imagePreviewElement = document.querySelector('#preview-selected-image')
  profil.value = document.querySelector('.profil-card-img')
  const removeButton = document.querySelector('.profil-card-img-remove')
  imagePreviewElement.src = ''
  if (imagePreviewElement.src === '') {
    imagePreviewElement.classList.add('hidden')
  }
  imagePreviewElement.style.display = 'block'
  removeButton.classList.remove('!flex')
  imagePreviewElement.classList.remove('z-50')
  const headerImage = document.querySelector('.headerImage')
  headerImage.src = ''
  if (headerImage.src === '') {
    headerImage.classList.add('hidden')
  }
  headerImage.style.display = 'block'
  document.getElementById('defaultProfilImg').style.display = 'flex'
  document.getElementById('defaultProfilImgHeader').style.display = 'flex'
}

const image = ref(null)
const file = ref(null)
const profil = ref()

const previewImage = (event) => {
  const imageFiles = event.target.files
  const imageSrc = URL.createObjectURL(imageFiles[0])
  const removeButton = document.querySelector('.profil-card-img-remove')
  const imagePreviewElement = document.querySelector('#preview-selected-image')
  const headerImage = document.querySelector('.headerImage')
  imagePreviewElement.classList.add('z-50')

  removeButton.classList.add('!flex')
  imagePreviewElement.src = imageSrc
  imagePreviewElement.style.display = 'block'
  headerImage.src = imageSrc
  headerImage.style.display = 'block'
  document.getElementById('defaultProfilImg').style.display = 'none'
  document.getElementById('defaultProfilImgHeader').style.display = 'none'
}
</script>

<style scoped>
.profile-container {
  @apply
  flex flex-col-reverse lg:flex-row justify-between w-full
}

.profile-my-profile {
  @apply
  flex flex-col items-center w-full
}

.profile-my-photo {
  @apply
  flex flex-col items-center justify-center z-10
  border border-gray-ikiyuz bg-white rounded-full w-16 h-16
}

.profile-my-name {
  @apply
  text-gray-yediyuz font-semibold text-lg mt-4
}

.profile-my-email {
  @apply
  text-gray-besyuz font-normal text-sm mt-2
}

.profil-card-container {
  @apply
  flex flex-col relative
   items-center
  mt-3 w-full justify-start
}

.profil-card-content {
  @apply
  relative w-20 h-20 lg:w-32 lg:h-32
  flex flex-col
  items-center justify-center
}

.profil-card-img {
  @apply
  w-20 h-20 lg:w-32 lg:h-32 rounded-full
  relative flex items-center justify-center
  bg-cover bg-center bg-white border
  border-gray-ikiyuz
}

.profil-card-img-remove {
  @apply
  absolute w-6 h-6 right-0 bottom-0 hidden
  flex-col justify-center items-center
  bg-white rounded-full z-50
}

.profil-card-img-icon {
  @apply
  w-8 h-8 bg-white
  rounded-full absolute
  flex items-center justify-center
  border border-gray
  shadow  shadow-white
}


.profil-card-content-select-img {
  @apply
  w-full h-full border border-gray-ikiyuz
  bg-white absolute top-0 left-0
  rounded-full flex items-center justify-center
  text-4xl
}

.profil-card-content-delete-img {
  @apply
  flex items-center
  hover:cursor-pointer sm:mb-0
}

.profil-card-form {
  @apply
  w-auto sm:w-[300px]
}

.profil-card-form-eye-icon {
  @apply
  absolute  top-10 right-4
}
</style>
