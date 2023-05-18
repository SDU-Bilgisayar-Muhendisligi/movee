<template>
    <form action="" class="custom-form">
        <label for="" class="custom-form-label" :label="label">{{ label }}</label>
        <div class="custom-form-input-container">
            <input :type="typeBool" class="custom-form-input"
                   :placeholder="placeholder" required>
                <eye v-if="password" v-show="!eyeShow" @click="show"
                     class="custom-form-eye"/>
                <blind-eye v-show="eyeShow" @click="show"
                           class="custom-form-blind-eye"/>
        </div>
    </form>
</template>

<script setup>
import Eye from "~/assets/eye.svg"
import BlindEye from "~/assets/blind-eye.svg"

const props = defineProps({
    label: {
        type: String,
        default: "E posta"
    },
    placeholder: {
        type: String,
        default: "E posta gir"
    },
    password: {
        type: Boolean,
        default: false
    },
    type: {
        type: String,
        default: "text"
    }
})
const eyeShow = ref(false)

const show = () => {
    eyeShow.value = !eyeShow.value
}

const typeBool = computed(() => {
    if (eyeShow.value) {
        return "text"
    } else if (eyeShow.value == false && props.password) {
        return "password"
    } else {
        return "email"
    }
})

</script>


<style scoped>
.custom-form {
    @apply
    flex flex-col mt-10
}



.custom-form-label {
    @apply
    text-gray-yediyuz font-semibold text-sm
}

.custom-form-input-container {
    @apply
    flex justify-between items-center
    px-3 py-2 mt-2 border border-gray-ikiyuz
    bg-white rounded-lg
}

.custom-form-input {
    @apply
    rounded-lg outline-none bg-white w-full
}

.custom-form-eye {
    @apply
    text-gray-besyuz
}

.custom-form-blind-eye {
    @apply
    text-gray-besyuz
}

</style>
