<template>
  <div class="play-bar" :class="{ show: !toggle }" @click="handleAfterClick">
    <div class="fold" :class="{ turn: toggle }">
      <yin-icon :icon="iconList.ZHEDIE" @click="toggle = !toggle"></yin-icon>
    </div>
    <!--播放进度-->
    <el-slider
      class="progress"
      v-model="nowTime"
      @change="changeTime"
      size="small"
    ></el-slider>
    <div class="control-box">
      <div class="info-box">
        <!--歌曲图片-->
        <el-image
          v-if="currentPlayIndex != -1"
          class="song-bar-img"
          fit="contain"
          :src="attachImageUrl(songPic)"
          @click="goPlayerPage"
        />
        <yin-icon
          v-else
          class="default-album"
          :icon="iconList.DefaultAlbum"
          @click="goPlayerPage"
        ></yin-icon>
        <!--播放开始结束时间-->
        <div v-if="songId">
          <div class="song-info">
            {{ this.songTitle }} - {{ this.singerName }}
          </div>
          <div class="time-info">{{ startTime }} / {{ endTime }}</div>
        </div>
      </div>
      <!-- 播放方式 -->
      <div class="song-ctr">
        <yin-icon
          class="yin-play-show"
          :icon="playStateList[playStateIndex]"
          @click="changePlayState"
        ></yin-icon>
        <!--上一首-->
        <yin-icon
          class="yin-play-show"
          :icon="iconList.SHANGYISHOU"
          @click="prev"
        ></yin-icon>
        <!--播放-->
        <yin-icon :icon="playBtnIcon" @click="togglePlay"></yin-icon>
        <!--下一首-->
        <yin-icon
          class="yin-play-show"
          :icon="iconList.XIAYISHOU"
          @click="next"
        ></yin-icon>
        <!--音量-->
        <el-dropdown class="yin-play-show" trigger="click">
          <yin-icon v-if="volume !== 0" :icon="iconList.YINLIANG"></yin-icon>
          <yin-icon v-else :icon="iconList.JINGYIN"></yin-icon>
          <template #dropdown>
            <el-dropdown-menu>
              <el-slider
                class="yin-slider"
                style="height: 150px; margin: 10px 0"
                v-model="volume"
                :vertical="true"
              ></el-slider>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
      <div class="song-ctr song-edit">
        <!--喜欢-->
        <yin-icon
          class="yin-play-show"
          :class="{ active: isLike }"
          :icon="isLike ? iconList.like : iconList.dislike"
          @click="changeLike"
        ></yin-icon>
        <!-- 收藏 -->
        <yin-icon
          :icon="iconList.Collect"
          @click="collectToCreateList"
        ></yin-icon>
        <!--下载-->
        <yin-icon
          class="yin-play-show"
          :icon="iconList.download"
          @click="
            downloadMusic({
              songUrl,
              songName: singerName + '-' + songTitle
            })
          "
        ></yin-icon>
        <!--歌曲列表-->
        <yin-icon
          class="sub-playlist"
          :icon="iconList.LIEBIAO"
          @click="changeAside"
        ></yin-icon>
        <!-- 个人空间 -->
        <yin-icon :icon="iconList.MySpace" @click="goToMySpace"></yin-icon>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {
  computed,
  defineComponent,
  getCurrentInstance,
  onMounted,
  ref,
  watch
} from 'vue'
import { mapGetters, useStore } from 'vuex'
import mixin from '@/mixins/mixin'
import YinIcon from './IconVue.vue'
import { HttpManager } from '@/api'
import { formatSeconds } from '@/utils'
import { Icon, RouterName } from '@/enums'
import user from '@/store/user'
import { useRouter } from 'vue-router'
export default defineComponent({
  components: {
    YinIcon
  },
  setup() {
    const router = useRouter()
    const { proxy } = getCurrentInstance()
    const store = useStore()
    const {
      routerManager,
      playMusic,
      checkStatus,
      downloadMusic,
      changeIndex
    } = mixin()

    const isLike = ref(false) // 是否收藏

    const userIdVO = computed(() => store.getters.userId)
    const songIdVO = computed(() => store.getters.songId)
    const token = computed(() => store.getters.token)
    const curLikeChange = computed(() => store.getters.curLikeChange)
    watch(songIdVO, () => {
      initUserLike()
    })
    watch(token, (value) => {
      if (!value) isLike.value = false
    })
    watch(curLikeChange, () => {
      isLike.value = !isLike.value
    })
    async function initUserLike() {
      if (!checkStatus(false)) return

      const userId = userIdVO.value

      const type = '0'
      const songId = songIdVO.value

      isLike.value = (
        (await HttpManager.isUserLike({
          userId,
          type,
          songId
        })) as ResponseBody
      ).data
    }

    async function changeLike() {
      if (!checkStatus()) return

      const userId = userIdVO.value
      const type = '0' //这里要看看 不能直接写死
      const songId = songIdVO.value
      const result = isLike.value
        ? ((await HttpManager.deleteUserLike(
            userIdVO.value,
            songIdVO.value
          )) as ResponseBody)
        : ((await HttpManager.setUserLike({
            userId,
            type,
            songId
          })) as ResponseBody)

      // 更新状态
      isLike.value = !isLike.value
      ;(proxy as any).$message({
        message: result.message,
        type: result.type
      })

      if (result.data == true || result.data == false)
        isLike.value = result.data
    }

    onMounted(async () => {
      if (songIdVO.value) {
        await initUserLike()
      }
    })
    // 刷新后
    onMounted(() => {
      proxy.$store.commit('setIsPlay', false) // 初始化 isPlay 为 false
      proxy.$store.commit('setPlayBtnIcon', Icon.BOFANG)
    })

    return {
      token,
      changeIndex,
      router,
      isLike,
      playMusic,
      routerManager,
      checkStatus,
      attachImageUrl: HttpManager.attachImageUrl,
      changeLike,
      downloadMusic
    }
  },
  data() {
    return {
      curIdx: -1,
      startTime: '00:00',
      endTime: '00:00',
      nowTime: 0, // 进度条的位置
      toggle: true,
      volume: 50,
      playState: Icon.XUNHUAN,
      playStateList: [Icon.XUNHUAN, Icon.LUANXU, Icon.LoopPlay],
      playStateIndex: 0,
      iconList: {
        download: Icon.XIAZAI,
        ZHEDIE: Icon.ZHEDIE,
        SHANGYISHOU: Icon.SHANGYISHOU,
        XIAYISHOU: Icon.XIAYISHOU,
        YINLIANG: Icon.YINLIANG1,
        JINGYIN: Icon.JINGYIN,
        LIEBIAO: Icon.LIEBIAO,
        dislike: Icon.Dislike,
        like: Icon.Like,
        DefaultAlbum: Icon.DefaultAlbum,
        Collect: Icon.Collect,
        MySpace: Icon.MySpace
      },
      curPlayListClickCnt: 0
    }
  },
  computed: {
    // 使用 mapGetters 将 getters 映射为组件的计算属性
    ...mapGetters([
      'userId',
      'isPlay', // 播放状态
      'playBtnIcon', // 播放状态的图标
      'songId', // 音乐id
      'songUrl', // 音乐地址
      'songTitle', // 歌名
      'singerName', // 歌手名
      'songPic', // 歌曲图片
      'curTime', // 当前音乐的播放位置
      'duration', // 音乐时长
      'currentPlayList',
      'currentPlayIndex', // 当前歌曲在歌曲列表的位置
      'showAside', // 是否显示侧边栏
      'autoNext', // 用于触发自动播放下一首
      'rePlayThisSong' // 重播这首歌
    ])
  },
  watch: {
    // 切换播放状态的图标

    isPlay(value) {
      this.$store.commit('setPlayBtnIcon', value ? Icon.ZANTING : Icon.BOFANG)
    },
    volume() {
      this.$store.commit('setVolume', this.volume / 100)
    },
    // 播放时间的开始和结束
    // 在 audio 组件更新 curTime，然后在这里更新 nowTime
    curTime() {
      this.startTime = formatSeconds(this.curTime)
      this.endTime = formatSeconds(this.duration)
      // 移动进度条 （百分比）
      this.nowTime = (this.curTime / this.duration) * 100
    },
    // 自动播放下一首
    autoNext() {
      this.next()
    }
  },
  methods: {
    handleAfterClick() {
      // console.log('handleAfterClick' + this.curPlayListClickCnt)
      if (this.curPlayListClickCnt <= 0) {
        this.$store.commit('setShowAside', false)
        this.curPlayListClickCnt++
      }
      this.curPlayListClickCnt--
    },
    changeAside() {
      // console.log('changeAside' + this.curPlayListClickCnt)
      if (!this.showAside) this.curPlayListClickCnt++
      this.$store.commit('setShowAside', !this.showAside)
      // console.log(this.$store.getters.showAside)
    },
    // 控制音乐播放 / 暂停
    togglePlay() {
      this.$store.commit(
        'setIsPlay',
        this.isPlay == null || this.isPlay ? false : true
      )
      console.log(this.isPlay)
    },
    // nowTime 是百分比
    changeTime() {
      this.$store.commit('setChangeTime', this.duration * (this.nowTime * 0.01))
    },
    changePlayState() {
      this.playStateIndex =
        this.playStateIndex >= this.playStateList.length - 1
          ? 0
          : ++this.playStateIndex
      this.playState = this.playStateList[this.playStateIndex]
      if (this.playState != Icon.LoopPlay) {
        this.$store.commit('setIsLoopPlay', false)
      } else {
        this.$store.commit('setIsLoopPlay', true)
      }
    },
    // 上一首
    prev() {
      if (this.playState === Icon.LUANXU) {
        let playIndex = Math.floor(Math.random() * this.currentPlayList.length)
        playIndex =
          playIndex === this.currentPlayIndex ? playIndex + 1 : playIndex
        this.$store.commit('setCurrentPlayIndex', playIndex)
        this.toPlay(this.currentPlayList[playIndex].url)
      } else if (this.playState == Icon.LoopPlay) {
        // 单曲循环
        this.$store.commit('setChangeTime', 0)
        // this.$store.commit('setCurTime', 0)
        this.$store.commit('setReplayThisSong', !this.rePlayThisSong)
      } else if (
        this.currentPlayIndex !== -1 &&
        this.currentPlayList.length > 1
      ) {
        if (this.currentPlayIndex > 0) {
          this.$store.commit('setCurrentPlayIndex', this.currentPlayIndex - 1)
          this.toPlay(this.currentPlayList[this.currentPlayIndex].url)
        } else {
          this.$store.commit(
            'setCurrentPlayIndex',
            this.currentPlayList.length - 1
          )
          this.toPlay(this.currentPlayList[this.currentPlayIndex].url)
        }
      }
    },
    // 下一首
    next() {
      // 乱序
      if (this.playState === Icon.LUANXU) {
        let playIndex = Math.floor(Math.random() * this.currentPlayList.length)
        playIndex =
          playIndex === this.currentPlayIndex ? playIndex + 1 : playIndex
        this.$store.commit('setCurrentPlayIndex', playIndex)
        this.toPlay(this.currentPlayList[playIndex].url)
      } else if (this.playState == Icon.LoopPlay) {
        // 单曲循环
        this.$store.commit('setChangeTime', 0)
        // this.$store.commit('setCurTime', 0)
        this.$store.commit('setReplayThisSong', !this.rePlayThisSong)
      } else if (
        this.currentPlayIndex !== -1 &&
        this.currentPlayList.length > 1
      ) {
        if (this.currentPlayIndex < this.currentPlayList.length - 1) {
          this.$store.commit('setCurrentPlayIndex', this.currentPlayIndex + 1)
          this.toPlay(this.currentPlayList[this.currentPlayIndex].url)
        } else {
          this.$store.commit('setCurrentPlayIndex', 0)
          this.toPlay(this.currentPlayList[0].url)
        }
      }
    },
    // 选中播放
    toPlay(url) {
      if (url && url !== this.songUrl && this.playState != Icon.LoopPlay) {
        const song = this.currentPlayList[this.currentPlayIndex]
        this.playMusic({
          id: song.id,
          url,
          pic: song.pic,
          index: this.currentPlayIndex,
          name: song.name,
          lyric: song.lyric,
          currentSongList: this.currentPlayList
        })
      }
    },
    goPlayerPage() {
      this.routerManager(RouterName.Lyric, {
        path: `${RouterName.Lyric}/${this.songId}`
      })
    },
    // 前往个人空间
    goToMySpace() {
      if (!this.checkStatus()) return
      this.changeIndex(null)
      this.router.push(`/my-space/${this.userId}`)
    },
    // 收藏歌曲
    collectToCreateList() {
      if (!this.checkStatus(false)) return
      if (this.songId != '' && this.songId)
        this.$store.commit('setIsCollectionUnfold')
    }
  }
})
</script>

<style lang="scss" scoped>
@import '@/assets/css/yin-play-bar.scss';
.default-album {
  transform: scale(2) translateX(50%);
}
.sub-playlist {
  transition: all 0.2s;
}
</style>
