package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.ListSong;
import com.patrick.domain.SongList;
import com.patrick.service.ListSongService;
import com.patrick.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

@RestController
@RequestMapping("/listSong")
public class ListSongController {
    @Autowired
    private ListSongService listSongService;

    @PostMapping("/add")
    public Object addListSong(@RequestBody ListSong listSong) {
        boolean flag = listSongService.insert(listSong);
        return getJson(flag, "添加");
    }

    @GetMapping("/detail")
    public Object getListSongBySongListId(HttpServletRequest request) {
        String songListId = request.getParameter("songListId");
        List<ListSong> listSongs = listSongService.getListSongBySongListId(Integer.parseInt(songListId));
        JSONObject json = getJson(true, "");
        json.put(DATA, listSongs);
        return json;
    }

    @GetMapping("/delete")
    public Object deleteSong(HttpServletRequest request) {
        String songId = request.getParameter("songId");
        boolean flag = listSongService.delete(Integer.parseInt(songId));
        return getJson(flag, "删除");
    }

    @PostMapping("/deleteBySongIdAndSongListId")
    public Object deleteBySongIdAndSongListId(@RequestBody ListSong listSong) {
        boolean flag = listSongService.deleteBySongIdAndSongListId(listSong);
        JSONObject json = getJson(flag, "删除");
        json.put(DATA, flag);
        return json;
    }

    @PostMapping("/is_exist")
    public Object isExist(@RequestBody ListSong listSong) {
        boolean flag = listSongService.isExist(listSong);
        JSONObject json = getJson(flag, "");
        json.put(DATA, flag);
        return json;
    }
}
