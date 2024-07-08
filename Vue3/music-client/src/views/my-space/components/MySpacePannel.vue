<!-- 这个页面是模板页面，根据路由传过来的style动态显示 -->

<script setup>
const props = defineProps({
  musicList: {
    type: Array
  },
  albumName: {
    type: String
  },
  albumImgUrl: {
    type: String
  }
})
// import
import { onMounted, getCurrentInstance, toRefs } from 'vue'
import ShowPlayList from "@/views/my-space/components/ShowPlayList.vue"
import MusicListInfo from "@/views/my-space/components/MusicListInfo.vue"
import EditSongListMsgVue from './EditSongListMsg.vue'


const { musicList } = toRefs(props)
const { emit } = getCurrentInstance()

const updateList = () => {
  emit('updateList')
}
</script>

<template>
  <div class="my-favorite-music">
    <!-- 基本信息 -->
    <MusicListInfo
      @freshPannel="updateList"
      :albumImgUrl="albumImgUrl"
      :albumName="albumName"
    ></MusicListInfo>
    <!-- 编辑创建歌单信息 -->
    <edit-song-list-msg-vue></edit-song-list-msg-vue>
    <!-- 歌曲列表 -->
    <ShowPlayList :musicList="musicList"></ShowPlayList>
  </div>
</template>


<style scoped lang="scss">
.my-favorite-music {
  height: 800px;
  border-radius: 10px;
  box-shadow: 0 0 20px #00000097;
  padding: 30px;
  width: 1110px;
}
</style>