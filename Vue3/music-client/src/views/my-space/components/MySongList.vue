<script setup>
// import
import MySpacePannel from '@/views/my-space/components/MySpacePannel.vue'
import { computed, onMounted, ref, watch, getCurrentInstance } from 'vue';
import { useRoute } from 'vue-router';
import { useStore } from 'vuex';
import { HttpManager } from '@/api';
import mixin from '@/mixins/mixin'

// data
const { emit } = getCurrentInstance()
const {
  getSongTitle,
  getSingerName,
} = mixin()
const musicList = ref([])
const songIdList = ref([])
const route = useRoute()
const store = useStore()

// method
// 获得所有歌曲的ID
const getAllSongs = async (songListId = curSongListId.value) => {
  const { data: res } = await HttpManager.getListSongOfSongId(songListId)
  songIdList.value = res
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
    const userId = store.getters.userId
    const { data: isUserLike } = await HttpManager.isUserLike({ userId, type: 0, songId })
    tmpSongInfo['user_like'] = isUserLike
    musicList.value.push(tmpSongInfo)
  }

}

const requestAllResource = async () => {
  musicList.value = []
  await getAllSongs()
  await getMusicList()

}
const updateMusicList = () => requestAllResource()


// computed
const albumImgUrl = computed(() => store.getters.showCurSongList.pic)
const albumName = computed(() => store.getters.showCurSongList.title)
const curSongListId = computed(() => store.getters.curSongListId)
watch(curSongListId, () => requestAllResource())
// 钩子
onMounted(() => requestAllResource())
</script>

<template>
  <!-- 传入的应该是响应式计算属性 computed -->
  <my-space-pannel
    @updateList="updateMusicList"
    :musicList="musicList"
    :albumName="albumName"
    :albumImgUrl="albumImgUrl"
  ></my-space-pannel>
</template>


<style scoped lang="scss">
</style>