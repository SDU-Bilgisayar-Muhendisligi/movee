<template>
  <base-card height-type="height-auto" flex-type="between-row" padding-size="p-0">
    <div class="profile-container">
      <profile-side-bar/>
      <div class="profil-card-container">
        <div>
         <photo-upload/>
          <div class="profile-my-profile">
            <p class="profile-my-name">Enes Aktaş</p>
            <p class="profile-my-email">hi@enes.one</p>
          </div>
        </div>
      </div>
    </div>
  </base-card>
</template>
<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import ProfileSideBar from "~/components/app/Sidebar/ProfileSideBar.vue";
import PhotoUpload from "~/components/base/PhotoUpload.vue";

definePageMeta({
  layout: "background"
})


function inpute() {
  previewImage()
}

// function removePhoto() {
//   const imagePreviewElement = document.querySelector('#preview-selected-image')
//   profil.value = document.querySelector('.profil-card-img')
//   const removeButton = document.querySelector('.profil-card-img-remove')
//   imagePreviewElement.src = ''
//   if (imagePreviewElement.src === '') {
//     imagePreviewElement.classList.add('hidden')
//   }
//   imagePreviewElement.style.display = 'block'
//   removeButton.classList.remove('!flex')
//   imagePreviewElement.classList.remove('z-50')
//   document.getElementById('defaultProfilImg').style.display = 'flex'
// }

const image = ref(null)
const file = ref(null)
const profil = ref()

const previewImage = (event) => {
  const imageFiles = event.target.files[0]
  const imageSrc = URL.createObjectURL(imageFiles)
  const removeButton = document.querySelector('.profil-card-img-remove')
  const imagePreviewElement = document.querySelector('#preview-selected-image')
  imagePreviewElement.classList.add('z-50')

  removeButton.classList.add('!flex')
  imagePreviewElement.src = imageSrc
  imagePreviewElement.style.display = 'flex'
  document.getElementById('defaultProfilImg').style.display = 'none'
}
</script>

<style scoped>


.masked-email {
  /* Hide the bullets in password input */
  -webkit-text-security: disc;
  -moz-text-security: disc;
  text-security: disc;
}


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
  flex flex-col sm:flex-row relative
  items-center lg:items-start sm:gap-20
  mt-8 w-full justify-center
}

.profil-card-content {
  @apply
  relative w-20 h-20 lg:w-32 lg:h-32
  flex flex-col
  items-center  justify-center
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
  bg-white rounded-full z-50 lg:border border-gray-ikiyuz
}


.profil-card-img-icon {
  @apply
  w-8 h-8
  rounded-full absolute
  flex items-center justify-center
  border border-gray cursor-pointer
  shadow  shadow-white
}

.profil-card-img-icon:before {
  content: '';
  @apply
  absolute  w-full bg-site-success z-50
}


.profil-card-content-select-img {
  @apply
  w-full h-full border border-gray-ikiyuz
  bg-white absolute top-0 left-0 text-4xl
  rounded-full flex items-center justify-center
}

.profil-card-button-input {
  @apply
  w-20 h-20 lg:w-32 lg:h-32
  cursor-pointer rounded-full
  absolute border border-gray-ikiyuz
}

input::-webkit-file-upload-button {
  @apply
  hidden
}

input {
  @apply
  text-white
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
