<template>
  <div class="custom-input">
    <label :for="id">{{ label }}</label>
    <div class="custom-input-container" @click="focus">
      <input
          :type="showPassword ? 'text' : type"
          :id="id"
          :disabled="disabled"
          :placeholder="placeholder"
          @input="handleInput"
          @blur="handleBlur"
      />
      <span v-if="type === 'password'" v-show="!showPassword" class="toggle-password" @click="togglePasswordVisibility">
            <eye/>
        </span>
      <span class="toggle-password" v-if="type === 'password'" v-show="showPassword" @click="togglePasswordVisibility">
            <blind-eye/>
        </span>
    </div>
  </div>
</template>

<script setup>

import Eye from '@/assets/eye.svg'
import BlindEye from '@/assets/blind-eye.svg'

const emit = defineEmits([
  'update:value',
])
const props = defineProps({
  label: {
    type: String,
    default: '',
  },
  type: {
    type: String,
    default: 'text',
  },
  placeholder: {
    type: String,
    default: '',
  },

  disabled: {
    type: Boolean,
    default: false,
  },
})

const error = ref(null);
const value = ref(props.value);
const showPassword = ref(false);
const id = `custom-input-${Math.random().toString(36).substr(2, 9)}`;

const focus = (e) => {
  const div = e.target.closest('.custom-input-container')
  div.querySelector('input').focus();
  div.classList.add('!border-gray-dortyuz','!outline','!outline-3','!outline-gray-ucyuz')
};
const handleInput = (event) => {
  value.value = event.target.value;
  emit('update:value', value.value)
};

// todo: validasyon kütüphanesi ekle
const handleBlur = (e) => {
  const div = e.target.closest('.custom-input-container')
  div.classList.remove('!border-gray-dortyuz','!outline','!outline-3','!outline-gray-ucyuz')
};

const togglePasswordVisibility = () => {
  showPassword.value = !showPassword.value;
};
</script>

<style>
.custom-input {
  margin-top: 10px;
}

.custom-input-container {
  @apply
  flex items-center border bg-white border-gray-ucyuz rounded-lg p-2
}

.custom-input label {
  display: block;
  margin-bottom: 5px;
  @apply
  text-gray-yediyuz font-semibold text-sm
}

.custom-input input {
  width: 100%;
  padding: 5px;
  outline: none;
  @apply
  focus:px-4 transition-all duration-500
}


.custom-input .error {
  color: red;
  font-size: 12px;
  margin-top: 5px;
}

.toggle-password {
 @apply
  text-gray-dortyuz
}

</style>
