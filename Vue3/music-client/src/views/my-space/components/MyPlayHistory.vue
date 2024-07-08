<script setup>
// import
import MySpacePannel from '@/views/my-space/components/MySpacePannel.vue'
import { computed, ref } from "vue"
import { HttpManager } from "@/api"
import { onMounted } from "vue"
import { useRoute } from 'vue-router'
import mixin from '@/mixins/mixin'
// data
const musicList = ref([])
const route = useRoute()
const songIdList = ref([])
const albumImg = ref("")
const {
  getSongTitle,
  getSingerName,
} = mixin()

// method
const getAllPlayHistory = async (userId) => {
  const res = await HttpManager.getAllHistoryByUserId(userId)
  songIdList.value = res.data;
}

// 获得所有歌曲的ID
const getAllSongs = async (userId = route.params.id) => {
  await getAllPlayHistory(userId);
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
    const userId = route.params.id
    const { data: isUserLike } = await HttpManager.isUserLike({ userId, type: 0, songId })
    tmpSongInfo['user_like'] = isUserLike
    musicList.value.push(tmpSongInfo)

  }
  albumImg.value = musicList.value[0].pic

}
const requestAllResource = async () => {
  await getAllSongs()
  await getMusicList()

}

// 钩子
onMounted(() => requestAllResource())
const albumImgUrl = computed(() => albumImg.value.toString())

</script>

<template>
  <my-space-pannel
    :musicList="musicList"
    albumName="最近播放"
    :albumImgUrl="albumImgUrl"
  ></my-space-pannel>
</template>


<style scoped lang="scss">
</style>