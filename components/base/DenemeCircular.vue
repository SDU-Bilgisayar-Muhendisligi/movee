<script setup >

const props = defineProps({
  voteUser: Number,
  max: Number,
})
onMounted(() => {
  let circularProgress = document.querySelector(".circular-progress"),
      progressValue = document.querySelector(".progress-value");
  const colorUnfilled = props.voteUser > 0 && props.voteUser < 5 ? '#D64545' : props.voteUser >= 5 && props.voteUser < 6 ? '#334053' : props.voteUser < 10 ? '#FF994A' : ''

  let progressStartValue = 0,
      progressEndValue = props.voteUser ,
      speed = 1;

  let progress = setInterval(() => {
    progressStartValue++;

    progressValue.textContent = `${progressStartValue}`
    circularProgress.style.background =` conic-gradient(${colorUnfilled} ${progressStartValue * 36}deg, #E6E9EE 0deg)`

    if(progressStartValue == progressEndValue){
      clearInterval(progress);
    }
  }, speed);
})

const dynmcClass = props.voteUser > 0 && props.voteUser < 5 ? 'text-red' : props.voteUser >= 5 && props.voteUser < 6 ? 'text-gray-yediyuz' : props.voteUser < 10 ? 'text-orange' : props.voteUser === 10 ? 'text-primary' : ''
</script>

<template>
  <div class="containerr">
    <div class="circular-progress">
      <span class="progress-value" :class="dynmcClass">{{voteUser}}</span>
    </div>
  </div>

</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');


.circular-progress{
  position: relative;
  height: 25px;
  width: 25px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.circular-progress::before{
  content: "";
  position: absolute;
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background-color: #fff;
}
.progress-value{
  position: relative;
  font-size: 12px;
  font-weight: 600;
}


</style>
