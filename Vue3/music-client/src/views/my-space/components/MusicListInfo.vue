<script setup >
const props = defineProps({
  albumImgUrl: {
    type: String,
  },
  albumName: {
    type: String,
    default: ''
  }
})
// import
import { HttpManager } from '@/api'
import { defineProps, ref, getCurrentInstance, computed, watch } from 'vue'
import IconItem from '@/views/my-space/components/IconItem.vue'
import { Icon } from '@/enums'
import { useStore } from 'vuex'
import user from '@/store/user'
//data
const iconList = {
  BOFANG6: Icon.BOFANG6,
  editCreatedSongListMsg: Icon.editCreatedSongListMsg,
}
const selectedMusicList = ref([])
const attachImageUrl = HttpManager.attachImageUrl
const { proxy, emit } = getCurrentInstance()

const store = useStore()
// method
const handlePlay = () => {
  store.commit('setIsPlayAllMusic')
}
// 将歌曲从创建歌单中删除
const deleteSelectedMusic = async () => {
  selectedMusicList.value = store.getters.multipleSelection
  for (const item of selectedMusicList.value) {
    const songId = item.id
    const songListId = curSongListId.value
    const res = await HttpManager.deleteSongFromSongListByBothId({ songId, songListId })
  }
  // 这里的freshPannel会沿着MusicListInfo=>MySpacePannel=>MySongList
  emit('freshPannel');
  proxy.$message({
    message: res.message,
    type: res.type
  })
}
// 取消收藏歌单
const cancelColletedSongList = async () => {
  const songListId = store.getters.showCurSongList.id
  const userId = store.getters.userId
  const res = await HttpManager.delectCollectedSongList({ userId, songListId })
  if (res.success) {
    // 通知aside刷新
    store.commit("setIsAsideFresh", !store.getters.isAsideFresh)
  }
  proxy.$message({
    message: res.message,
    type: res.type
  })
}
const curSongListId = computed(() => store.getters.curSongListId)
// 判断用户点击的是不是创建歌单
const userOpenSongListStyle = computed(() => store.getters.userOpenSongListStyle)
// 编辑歌单
const showEditSongListMsgPannel = () => {
  store.commit("setShowEditSongListMsg", !store.getters.showEditSongListMsg)
}
</script>

<template>
  <div class="music-list-info">
    <div class="album-img-box">
      <el-image
        class="album-img"
        fit="contain"
        :src="attachImageUrl(albumImgUrl)"
      />
    </div>
    <div class="album-info">
      <div class="album-msg">
        {{ albumName }}
        <IconItem
          v-if="userOpenSongListStyle === 2"
          :icon="iconList.editCreatedSongListMsg"
          @click="showEditSongListMsgPannel"
        ></IconItem>
      </div>

      <div class="btn-list">
        <button class="play-all-music-btn" @click="handlePlay">
          <IconItem :icon="iconList.BOFANG6"></IconItem>
          <span>播放全部</span>
        </button>
        <el-button
          v-if="userOpenSongListStyle === 2"
          @click="deleteSelectedMusic"
          >批量删除</el-button
        >
        <el-button
          v-else-if="userOpenSongListStyle === 3"
          @click="cancelColletedSongList"
          >取消收藏</el-button
        >
      </div>
    </div>
  </div>
</template>


<style scoped lang="scss">
.album-msg {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
}
.music-list-info {
  display: flex;
  width: inherit;
  height: 200px;
  border-bottom: 1px solid #00000037;
  gap: 20px;
}
.album-img-box {
  position: relative;
  height: 180px;
  width: 180px;
  border-radius: 20px;
  overflow: hidden;
}
.album-img {
  // position: absolute;
  // top: -3px;
  height: 100%;
  width: 100%;
}
.album-info {
  padding: 20px;
  font-weight: bold;
  font-size: 30px;
  display: flex;
  flex-direction: column;
  gap: 70px;
}
.btn-list {
  display: flex;
  gap: 20px;
  align-items: center;
}
</style>