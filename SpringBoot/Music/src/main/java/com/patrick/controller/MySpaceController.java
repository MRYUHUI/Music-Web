package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.SongList;
import com.patrick.domain.UserCreateSongList;
import com.patrick.domain.UserFavoriteSongList;
import com.patrick.service.SongListService;
import com.patrick.service.UserCreateSongListService;
import com.patrick.service.UserFavoriteSongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

/**
 * @Author:
 * @Date: 2024-04-14-15:44
 * @Description:
 */
@RestController
@RequestMapping("/myspace")
public class MySpaceController {
    @Autowired
    UserCreateSongListService userCreateSongListService;
    @Autowired
    SongListService songListService;
    @Autowired
    UserFavoriteSongListService userFavoriteSongListService;
//    用户收藏歌单
    @PostMapping("/add/favorite")
    public Object userCollectSongList(@RequestBody UserFavoriteSongList userFavoriteSongList) {
        boolean flag = userFavoriteSongListService.insert(userFavoriteSongList);
        return getJson(flag, "收藏");
    }
    //    用户收藏歌单
    @PostMapping("/add/created")
    public Object userCreatedSongList(@RequestBody UserCreateSongList userCreateSongList) {
        boolean flag = userCreateSongListService.insert(userCreateSongList);
        return getJson(flag, "创建");
    }
//    判断歌单是否已经收藏了
    @PostMapping("/user_favorite/is_exist")
    public Object isExist(@RequestBody UserFavoriteSongList userFavoriteSongList) {
        boolean flag =  userFavoriteSongListService.isExist(userFavoriteSongList);
        JSONObject json = getJson(flag, "");
        json.put(DATA, flag);
        return json;
    }
//    删除用户创建的歌单
    @PostMapping("/delete/created")
    public Object deleteFromCreate(@RequestBody UserCreateSongList userCreateSongList) {
        boolean flag = userCreateSongListService.delete(userCreateSongList);
        JSONObject json = getJson(flag, "删除");
        json.put(DATA, flag);
        return json;
    }
    //    删除用户收藏的歌单
    @PostMapping("/delete/favorite")
    public Object deleteFromFavorite(@RequestBody UserFavoriteSongList userFavoriteSongList) {
        boolean flag = userFavoriteSongListService.delete(userFavoriteSongList);
        JSONObject json = getJson(flag, "取消收藏");
        json.put(DATA, flag);
        return json;
    }
//    根据用户的id获取该用户创建的歌单
    @GetMapping("/playlist/created")
    public Object getCreatedSongListByUsername(@RequestParam Integer id) {
        List<Integer> playListIds = userCreateSongListService.getPlaylistIdsByUserId(id);
        List<SongList> songLists = new ArrayList<>();
        for (int playListId : playListIds) {
            songLists.add(songListService.getSongListById(playListId));
        }
        JSONObject jsonObject = getJson(true, "获取");
        jsonObject.put(DATA, songLists);
        return jsonObject;
    }
    //    根据用户的id获取该用户收藏的歌单
    @GetMapping("/playlist/favorite")
    public Object getCollectedSongListByUsername(@RequestParam Integer id) {
        List<Integer> playListIds = userFavoriteSongListService.getPlaylistIdsByUserId(id);
        List<SongList> songLists = new ArrayList<>();
        for (int playListId : playListIds) {
            songLists.add(songListService.getSongListById(playListId));
        }
        JSONObject jsonObject = getJson(true, "获取");
        jsonObject.put(DATA, songLists);
        return jsonObject;
    }
}
