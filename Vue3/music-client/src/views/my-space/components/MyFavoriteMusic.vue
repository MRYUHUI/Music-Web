<script setup>
// import
import MySpacePannel from '@/views/my-space/components/MySpacePannel.vue'
import { computed, ref } from "vue"
import { HttpManager } from "@/api"
import { onMounted } from "vue"
import { useRoute, useRouter } from 'vue-router'
import mixin from '@/mixins/mixin'
import { useStore } from 'vuex'
// data
const store = useStore()
const musicList = ref([])
const route = useRoute()
const router = useRouter()
const songIdList = ref([])
const albumImg = ref("")
const {
  getSongTitle,
  getSingerName,
} = mixin()

// method
const getUserLikeSongs = async (userId) => {
  const res = await HttpManager.getUserLikeByUserId(userId);
  songIdList.value = res.data;
}
// 获得所有歌曲的ID
const getAllSongs = async (userId = route.params.id) => {
  await getUserLikeSongs(userId)
}


// 获得所有歌曲的信息
const getMusicList = async () => {

  // 在 forEach 方法中，async 函数不会按照期望的方式工作，因为 forEach 方法不会等待异步函数执行完成。
  for (const [index, item] of songIdList.value.entries()) {
    const songId = item.songId;
    // 获得 songId 对应的歌曲信息
    const { data: res } = await HttpManager.getSongOfId(songId);
    const tmpSongInfo = res
    tmpSongInfo['songName'] = getSongTitle(res.name)
    tmpSongInfo['singerName'] = getSingerName(res.name)
    tmpSongInfo['album'] = res.introduction
    tmpSongInfo['index'] = index
    tmpSongInfo['user_like'] = true
    musicList.value.push(tmpSongInfo)

  }
  albumImg.value = musicList.value[0].pic



}
const requestAllResource = async () => {
  await getAllSongs()
  await getMusicList()
}
const defaultActiveItemInAside = computed(() => store.getters.defaultActiveItemInAside)
// 钩子
onMounted(() => {
  const index = defaultActiveItemInAside.value
  const showStyle = index.substr(0, 1)
  if (showStyle === '1') {
    requestAllResource()
    return
  }
  else if (showStyle === '2') {
    const userId = store.getters.userId
    router.replace({ name: "my-play-history", params: { id: userId } });
    return
  }
  else if (showStyle === '3') {
    const songListIdStr = index.slice(2)
    const songListId = parseInt(songListIdStr)
    router.replace({ name: "my-collect-song-list", params: { songListId } });
  }
  else if (showStyle === '4') {
    const songListIdStr = index.slice(2)
    const songListId = parseInt(songListIdStr)
    router.replace({ name: "my-collect-song-list", params: { songListId } });
  }
})
const albumImgUrl = computed(() => albumImg.value.toString())
</script>

<template>
  <div class="my-fav-music-layout">
    <!-- 侧边栏 -->
    <the-aside></the-aside>

    <!-- 主题内容 -->
    <my-space-pannel
      :musicList="musicList"
      albumName="我喜欢的音乐"
      :albumImgUrl="albumImgUrl"
    ></my-space-pannel>
  </div>
</template>


<style scoped lang="scss">
.my-fav-music-layout {
  position: relative;
}
</style>