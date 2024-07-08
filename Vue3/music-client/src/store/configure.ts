import { ref } from "vue";
export default {
  state: {
    token: false, // 用户是否登录
    showAside: false, // 是否显示侧边栏
    searchWord: "", // 搜索关键词
    activeNavName: "", // 导航栏名称

		// my space
		curLikeChange: false, // 当前正在播放的歌曲“喜欢”变更
		isPlayAllMusic: false, // 点击了全部播放
		mySpacePannelStyle: 0, // 展示页面的形式
		showCurSongList: {     // 当前被用户点击的歌单信息，主要用于“创建歌单”，“收藏歌单”
				id: null,
				title: '',
				pic: '',
				introduction: '',
				style: ''
		},
		curSongListId: -1,     // 当前正在展示的歌单Id，主要用于“创建歌单”，“收藏歌单”
		isCollectionUnfold: false, // 收藏页面是否打开
		multipleSelection: ref([]), // 要删除的歌曲
		userOpenSongListStyle: 0, // 判断用户点击的是不是创建的歌单, 0表示喜欢、1表示历史、2表示创建、3表示收藏
		isAsideFresh: false, // 是否应该对侧边栏进行刷新
		showEditSongListMsg: false, // 是否显示修改歌单信息的界面
		showCreateSongListPage: false, // 是否展示新增歌单界面
		isMusicListInfoFresh: false, // 歌单信息是否要刷新
		defaultActiveItemInAside: "1", // 默认激活的侧边栏

  },
  getters: {
    token: (state) => state.token,
    activeNavName: (state) => state.activeNavName,
    showAside: (state) => state.showAside,
    searchWord: (state) => state.searchWord,

		// my space
		curLikeChange: (state) => state.curLikeChange,
		isPlayAllMusic: (state)=>state.isPlayAllMusic,
		mySpacePannelStyle: (state) => state.mySpacePannelStyle,
		showCurSongList: (state) => state.showCurSongList,
		curSongListId: (state) => state.curSongListId,
		isCollectionUnfold: (state) => state.isCollectionUnfold,
		multipleSelection: (state) => state.multipleSelection,
		userOpenSongListStyle: (state) => state.userOpenSongListStyle,
		isAsideFresh: (state) => state.isAsideFresh,
		showEditSongListMsg: (state) => state.showEditSongListMsg,
		showCreateSongListPage: (state) => state.showCreateSongListPage,
		isMusicListInfoFresh: (state) => state.isMusicListInfoFresh,
		defaultActiveItemInAside: (state) => state.defaultActiveItemInAside,
  },
  mutations: {
    setToken: (state, token) => {
      state.token = token;
    },
    setActiveNavName: (state, activeNavName) => {
      state.activeNavName = activeNavName;
    },
    setShowAside: (state, showAside) => {
      state.showAside = showAside;

    },
    setSearchWord: (state, searchWord) => {
      state.searchWord = searchWord;
    },

		// my space
		setcurLikeChange: (state) => {
			state.curLikeChange = !state.curLikeChange
		},
		setIsPlayAllMusic:(state)=>{
			state.isPlayAllMusic = !state.isPlayAllMusic
		},
		setMySpacePannelStyle: (state, newStyle) => {
			state.mySpacePannelStyle = newStyle
		},
		setShowCurSongList: (state, newCurSongList) => {
			state.showCurSongList = newCurSongList
		},
		setCurSongListId: (state, newSongListId) => {
			state.curSongListId = newSongListId
		},
		setIsCollectionUnfold: (state) => {
			state.isCollectionUnfold = !state.isCollectionUnfold
		},
		setMultipleSelection: (state, newVal) => {
			state.multipleSelection = newVal
		},
		setUserOpenSongListStyle: (state, newVal) => {
			state.userOpenSongListStyle = newVal
		},
		setIsAsideFresh: (state, newVal) => {
			state.isAsideFresh = newVal
		},
		setShowEditSongListMsg: (state, newVal) => {
			state.showEditSongListMsg = newVal
		},
		setShowCreateSongListPage: (state, newVal) => {
			state.showCreateSongListPage = newVal
		},
		setIsMusicListInfoFresh: (state) => {
			state.isMusicListInfoFresh = !state.isMusicListInfoFresh
		},
		setDefaultActiveItemInAside: (state, newVal) => {
			state.defaultActiveItemInAside = newVal
		}
  },
};
