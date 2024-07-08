import { getBaseURL, get, post, deletes } from "./request";

const HttpManager = {
  // 获取图片信息
  attachImageUrl: (url) => url ? `${getBaseURL()}${url}` : "https://cube.elemecdn.com/e/fd/0fc7d20532fdaf769a25683617711png.png",
  // =======================> 用户 API 完成
	// 根据token获得用户信息
	getUserByToken: (token)=>get(`user/get_user_by_token?token=${token}`),
  // 登录
  signIn: ({ username, password }) => post(`user/login/status`, { username, password }),
  // 注册
  SignUp: ({ username, password, sex, phoneNum, email, birth, introduction, location }) => post(`user/add`, { username, password, sex, phoneNum, email, birth, introduction, location }),
  // 删除用户
  deleteUser: (id) => get(`user/delete?id=${id}`),
  // 更新用户信息
  updateUserMsg: ({ id, username, sex, phoneNum, email, birth, introduction, location }) => post(`user/update`, { id, username, sex, phoneNum, email, birth, introduction, location }),
  updateUserPassword: ({ id, username, oldPassword, password }) => post(`user/updatePassword`, { id, username, oldPassword, password }),
  // 返回指定ID的用户
  getUserOfId: (id) => get(`user/detail?id=${id}`),
  // 更新用户头像
  uploadUrl: (userId) => `${getBaseURL()}/user/avatar/update?id=${userId}`,
	// 判断用户密码是否正确
	isOldPwdCorrect: (username, password) => post(`user/verify_old_pwd`, {username, password}),

  // =======================> 歌单 API 完成
  // 获取全部歌单
  getSongList: () => get("songList"),
	// 新增歌单
	createNewSongList: ({ title, introduction, style }) => post(`songList/add`, { title, introduction, style }),
  // 获取歌单类型
  getSongListOfStyle: (style) => get(`songList/style/detail?style=${style}`),
  // 返回标题包含文字的歌单
  getSongListOfLikeTitle: (keywords) => get(`songList/likeTitle/detail?title=${keywords}`),
  // 返回歌单里指定歌单ID的歌曲
  getListSongOfSongId: (songListId) => get(`listSong/detail?songListId=${songListId}`),
	// 将歌曲收藏至歌单
	addSongToSongList: ({songId, songListId}) => post(`/listSong/add`, {songId, songListId}),
	// 判断歌曲是否已经收藏
	isSongExistInSongList: ({songId, songListId}) => post(`/listSong/is_exist`, {songId, songListId}),
	// 删除歌单中的歌曲
	deleteSongFromSongListByBothId: ({songId, songListId}) => post(`/listSong/deleteBySongIdAndSongListId`, {songId, songListId}),
	// 更新歌单信息
  updateSongListMsg: ({ id, title, introduction, style }) => post(`songList/update`, { id, title, introduction, style }),
  // 删除歌单
  deleteSongList: (id) => get(`songList/delete?id=${id}`),

  // =======================> 歌手 API  完成
  // 返回所有歌手
  getAllSinger: () => get("singer"),
  // 通过性别对歌手分类
  getSingerOfSex: (sex) => get(`singer/sex/detail?sex=${sex}`),

  // =======================> 收藏 API 完成
  // 返回的指定用户ID的收藏列表
  getUserLikeByUserId: (userId) => get(`user_like/detail?userId=${userId}`),
  // 添加喜欢的歌曲 type: 0 代表歌曲， 1 代表歌单
  setUserLike: ({ userId, type, songId }) => post(`user_like/add`, { userId, type, songId }),

  deleteUserLike: (userId, songId) => deletes(`user_like/delete?userId=${userId}&&songId=${songId}`),

  isUserLike: ({ userId, type, songId }) => post(`user_like/status`, { userId, type, songId }),

  // =======================> 评分 API 完成
  // 提交评分
  setRank: ({ songListId, consumerId, score }) => post(`rankList/add`, { songListId, consumerId, score }),
  // 获取指定歌单的评分
  getRankOfSongListId: (songListId) => get(`rankList?songListId=${songListId}`),
  // 获取指定用户的歌单评分
  getUserRank: (consumerId, songListId) => get(`/rankList/user?consumerId=${consumerId}&songListId=${songListId}`),
  isRank: (consumerId, songListId) => get(`/rankList/user/check?consumerId=${consumerId}&songListId=${songListId}`),

  // =======================> 评论 API 完成
  // 添加评论
  setComment: ({ userId, content, songId, songListId, nowType }) => post(`comment/add`, { userId, content, songId, songListId, nowType }),
  // 删除评论
  deleteComment: (id) => get(`comment/delete?id=${id}`),
  // 点赞
  setSupport: ({ id, up }) => post(`comment/like`, { id, up }),
  // 返回所有评论
  getAllComment: (type, id) => {
    let url = "";
    if (type === 1) {
      url = `comment/songList/detail?songListId=${id}`;
    } else if (type === 0) {
      url = `comment/song/detail?songId=${id}`;
    }
    return get(url);
  },

  // =======================> 歌曲 API
  // 返回指定歌曲ID的歌曲
  getSongOfId: (id) => get(`song/detail?id=${id}`),
  // 返回指定歌手ID的歌曲
  getSongOfSingerId: (id) => get(`song/singer/detail?singerId=${id}`),
  // 返回指定歌手名的歌曲
  getSongOfSingerName: (keywords) => get(`song/singerName/detail?name=${keywords}`),
  // 下载音乐
  downloadMusic: (url) => get(url, { responseType: "blob" }),
  // 根据歌名模糊查询
  getSongByName: (songName) => get(`song/songName.detail?name=${songName}`),

  //======================> 点赞api的优化 避免有些是重复的点赞！新增数据表了得

  testAlreadySupport: ({ commentId, userId }) => post(`userSupport/test`, { commentId, userId }),

  deleteUserSupport: ({ commentId, userId }) => post(`userSupport/delete`, { commentId, userId }),

  insertUserSupport: ({ commentId, userId }) => post(`userSupport/insert`, { commentId, userId }),

  //获取所有的海报
  getBannerList: () => get("banner/getAllBanner"),

	// ===================== 个人主页
	// 获取自己创建的歌单
	getAllPlayListOfUserId: (userId) => get(`/myspace/playlist/created?id=${userId}`),
	// 获取自己收藏的歌单
	getAllCollectedPlayListOfUserId: (userId) => get(`/myspace/playlist/favorite?id=${userId}`),
	// 获取历史记录
	getAllHistoryByUserId: (userId) => get(`/history?id=${userId}`),
	// 更新历史记录
	updateHistory: ({userId, songId}) => post(`/history/add`, {userId, songId}),
	// 创建歌单
	userCreateSongList: ({userId, songListId}) => post(`/myspace/add/created`, {userId, songListId}),
	// 收藏歌单
	collectToMySongList: ({userId, songListId}) => post(`/myspace/add/favorite`, {userId, songListId}),
	// 删除创建的歌单
	delectCreatedSongList: ({userId, songListId}) => post(`/myspace/delete/created`, {userId, songListId}),
	// 删除收藏的歌单
	delectCollectedSongList: ({userId, songListId}) => post(`/myspace/delete/favorite`, {userId, songListId}),
	// 判断歌单是否已收藏
	isSongListCollected: ({userId, songListId}) => post(`/myspace/user_favorite/is_exist`, {userId, songListId}),
};
	


export { HttpManager };
