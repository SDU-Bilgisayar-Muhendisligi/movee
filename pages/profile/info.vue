<template>
    <base-card height-type="height-auto" flex-type="between-row" padding-size="p-0">
        <div class="profile-container">
            <profile-side-bar class="wow"/>
            <div class="w-full">
                <div class="lg:px-4">
                    <custom-geri-tusu class="!top-10 !left-5"/>
                    <p class="mt-9 flex lg:hidden w-full justify-center text-gray-yediyuz font-normal text-base">Profil
                        Bilgilerim</p>
                    <custom-form-input label="Adınız soyadınız" placeholder="Movee"/>
                    <custom-form-input label="E-posta" placeholder="hi@movee.one"/>
                </div>
            </div>
        </div>
    </base-card>
</template>

<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import ProfileSideBar from "~/components/app/Sidebar/ProfileSideBar.vue";
import CustomFormInput from "~/components/base/CustomFormInput.vue";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import BackgrounImage from "~/components/common/BackgrounImage.vue";

definePageMeta({
    layout: "temiz"
})
</script>

<style scoped>
.profile-container {
    @apply
    flex justify-between w-full
}

.wow {
    display: none !important
}

@media (min-width: 1024px) {
    .wow {
        display: block !important
    }
}

</style>
