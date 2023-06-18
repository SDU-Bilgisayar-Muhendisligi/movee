<script setup>
let music = null;
let duration = null;
onMounted(() =>{
   music = document.getElementById('music');
  duration = music.duration.toString()
  console.log(duration) ;
  let pButton = document.getElementById('pButton');
  let playhead = document.getElementById('playhead');
  let timeline = document.getElementById('timeline');

  let timelineWidth = timeline.offsetWidth - playhead.offsetWidth;

  pButton.addEventListener("click", play);

  music.addEventListener("timeupdate", timeUpdate, false);

  timeline.addEventListener("click", function(event) {
    moveplayhead(event);
    music.currentTime = duration * clickPercent(event);
  }, false);

  function clickPercent(event) {
    return (event.clientX - getPosition(timeline)) / timelineWidth;
  }

  playhead.addEventListener('mousedown', mouseDown, false);
  window.addEventListener('mouseup', mouseUp, false);

  let onplayhead = false;

  function mouseDown() {
    onplayhead = true;
    window.addEventListener('mousemove', moveplayhead, true);
    music.removeEventListener('timeupdate', timeUpdate, false);
  }

  function mouseUp(event) {
    if (onplayhead == true) {
      moveplayhead(event);
      window.removeEventListener('mousemove', moveplayhead, true);
      // change current time
      music.currentTime = duration * clickPercent(event);
      music.addEventListener('timeupdate', timeUpdate, false);
    }
    onplayhead = false;
  }
  function moveplayhead(event) {
    let newMargLeft = event.clientX - getPosition(timeline);

    if (newMargLeft >= 0 && newMargLeft <= timelineWidth) {
      playhead.style.marginLeft = newMargLeft + "px";
    }
    if (newMargLeft < 0) {
      playhead.style.marginLeft = "0px";
    }
    if (newMargLeft > timelineWidth) {
      playhead.style.marginLeft = timelineWidth + "px";
    }
  }

  function timeUpdate() {
    let playPercent = timelineWidth * (music.currentTime / duration);
    playhead.style.marginLeft = playPercent + "px";
    if (music.currentTime == duration) {
      pButton.className = "";
      pButton.className = "play";
    }
  }

  function play() {
    if (music.paused) {
      music.play();
      pButton.className = "";
      pButton.className = "pause";
    } else { // pause music
      music.pause();
      // remove pause, add play
      pButton.className = "";
      pButton.className = "play";
    }
  }

  music.addEventListener("canplaythrough", function() {
    duration = music.duration;
  }, false);

  function getPosition(el) {
    return el.getBoundingClientRect().left;
  }
})
</script>

<template>
  <audio id="music">
    <source src="https://drive.google.com/uc?id=1A0XncBUeVB5m6sH4kbzxwEqobGBUhmwt">
    <source src="https://drive.google.com/uc?id=1A0XncBUeVB5m6sH4kbzxwEqobGBUhmwt">
  </audio>
  <div id="audioplayer">
    <button id="pButton" class="play"></button>
    <p class="text-gray-yediyuz text-xs px-2">00:00</p>
    <div id="timeline">
      <div id="playhead"></div>
    </div>
    <p class="text-gray-yediyuz text-xs px-4">{{duration}}</p>
  </div>
</template>

<style scoped>
#audioplayer {
  height: 60px;
  @apply
  border border-gray-yuz rounded-xl
  flex items-center justify-between mt-10
}

#pButton {
  height: 60px;
  width: 60px;
  border: none;
  background-size: 50% 50%;
  background-repeat: no-repeat;
  background-position: center;
  float: left;
  outline: none;
  @apply
  flex items-center
}

.play {
  background: url('/play.png');
}

.pause {
  background: url('/pause-button.png');
}

#timeline {
  height: 3px;
  float: left;
  @apply
  bg-gray-ikiyuz rounded-2xl flex items-center w-3/4
}

#playhead {
  width: 18px;
  height: 18px;
  border-radius: 50%;
  @apply
  bg-gray-ucyuz
}
</style>
