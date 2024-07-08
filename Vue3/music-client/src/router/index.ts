import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
const routes: Array<RouteRecordRaw> = [
  {
    path: "/:pathMatch(.*)*",
    redirect: "/404",
  },
  {
    path: "/404",
    component: () => import("@/views/error/404.vue"),
  },
  {
    path: "/",
    // name: "yin-container",
    component: () => import("@/views/YinContainer.vue"),
    children: [
      {
        path: "/",
        name: "home",
        component: () => import("@/views/Home.vue"),
      },
      {
        path: "/sign-in",
        name: "sign-in",
        component: () => import("@/views/SignIn.vue"),
      },
      {
        path: "/sign-up",
        name: "sign-up",
        component: () => import("@/views/SignUp.vue"),
      },
      {
        path: "/personal",
        name: "personal",
        meta: {
          requireAuth: true,
        },
        component: () => import("@/views/personal/Personal.vue"),
      },
      {
        path: "/song-sheet",
        name: "song-sheet",
        component: () => import("@/views/song-sheet/SongSheet.vue"),
      },
      {
        path: "/song-sheet-detail/:id",
        name: "song-sheet-detail",
        component: () => import("@/views/song-sheet/SongSheetDetail.vue"),
      },
      {
        path: "/singer",
        name: "singer",
        component: () => import("@/views/singer/Singer.vue"),
      },
      {
        path: "/singer-detail/:id",
        name: "singer-detail",
        component: () => import("@/views/singer/SingerDetail.vue"),
      },
      {
        path: "/lyric/:id",
        name: "lyric",
        component: () => import("@/views/Lyric.vue"),
      },
      {
        path: "/search",
        name: "search",
        component: () => import("@/views/search/Search.vue"),
      },
      {
        path: "/personal-data",
        name: "personal-data",
        component: () => import("@/views/setting/PersonalData.vue"),
      },
      {
        path: "/setting",
        name: "setting",
        meta: {
          requireAuth: true,
        },
        component: () => import("@/views/setting/Setting.vue"),
        children: [
          {
            path: "/setting/PersonalData",
            name: "personalData",
            meta: {
              requireAuth: true,
            },
            component: () => import("@/views/setting/PersonalData.vue"),
          }
        ]
      },
			{
				path: "/my-space/:id",
				name: "my-space",
				meta: {
					requireAuth: true,
				},
				component: () => import("@/views/my-space/MySpace.vue"),
				children:[
					{
						path: "", // 默认路由，显示 "我喜欢的音乐" 页面
						name: "my-space-like",
						meta: {
							requireAuth: true,
						},
						component: () => import("@/views/my-space/components/MyFavoriteMusic.vue"),
					},
					{
						path: "/my-space/play-history/:id", // 历史记录
						name:"my-play-history",
						meta: {
							requireAuth: true,
						},
						component: () => import("@/views/my-space/components/MyPlayHistory.vue"),
					},
					{
						path: "/my-space/my-song-list/:songListId", // 我的歌单
						name:"my-collect-song-list",
						meta: {
							requireAuth: true,
						},
						component: () => import("@/views/my-space/components/MySongList.vue"),
					},
				]
			},
			
    ],
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});


router.beforeEach((to,from,next)=>{
	const accessToken = localStorage.getItem('accessToken')
	// 如果路由需要登录权限且未登录，则重定向到登录页面
	if (to.meta.requireAuth && !accessToken) { 
		setTimeout(() => {
			next({
					name:'sign-in'
			})
	}, 500);
	}else{
			next()
	}
})
export default router;
