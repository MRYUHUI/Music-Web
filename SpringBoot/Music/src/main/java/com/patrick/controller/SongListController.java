package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.SongList;
import com.patrick.service.SongListService;
import com.patrick.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

import static com.patrick.utils.Consts.*;

/**
 * 歌单管理类
 */
@RestController
@RequestMapping("/songList")
public class SongListController {
    @Autowired
    private SongListService songListService;

    @PostMapping("/add")
    public Object addSongList(@RequestBody SongList songList) {
        songList.setPic(DefaultAlbumImg);
        boolean flag = songListService.insert(songList);
        JSONObject json = getJson(flag, "创建歌单");
        json.put(DATA, songList.getId());
        return json;
    }

    @GetMapping("")
    public Object getAllSongList() {
        List<SongList> songLists = songListService.allSongList();
        JSONObject jsonObject = getJson(true, "");
        jsonObject.put("data", songLists);
        return jsonObject;
    }

    @GetMapping("/delete")
    public Object deleteSongList(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        SongList songList = songListService.getSongListById(Integer.parseInt(id));
        if(!songList.getPic().equals(DefaultAlbumImg)){
            boolean flag = Consts.deleteFile(songList.getPic());
            if (!flag) return getJson(flag, "删除");
        }
        boolean flag = songListService.delete(Integer.parseInt(id));
        return getJson(flag, "删除");
    }

    @PostMapping("/update")
    public Object updateSongList(@RequestBody SongList songList) {
        boolean flag = songListService.update(songList);
        return getJson(flag, "编辑");
    }

    @PostMapping("/img/update")
    public Object updateSongListPic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id") int id) {
        JSONObject jsonObject = new JSONObject();

        if (avatorFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "文件上传失败");
            jsonObject.put("type", "error");
            return jsonObject;
        }
        String picPath = songListService.getSongListById(id).getPic();
        boolean flag = Consts.deleteFile(picPath);
        if(!flag) return getJson(flag, "上传");
//        文件名 = 当前时间（毫秒）+ 原来文件名
        String fileName = System.currentTimeMillis() + avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "img"
                + System.getProperty("file.separator") + "songListPic" + System.getProperty("file.separator");
        File file1 = new File(filePath);
        if (!file1.exists()) {
            file1.mkdir();
        }
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        String storeAvatorPath = "/img/songListPic/" + fileName;
        try {
            avatorFile.transferTo(dest);

            SongList songList = new SongList();
            songList.setId(id);
            songList.setPic(storeAvatorPath);
            flag = songListService.update(songList);
            if (flag) {  // 保存成功
                jsonObject = getJson(flag, "上传");
                jsonObject.put("pic", storeAvatorPath);
                return jsonObject;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        jsonObject = getJson(false, "上传");
        return jsonObject;
    }
    @GetMapping("/likeTitle/detail")
    public Object getSongListByFuzzyTitle(HttpServletRequest request){
        String title = request.getParameter("title").trim();
        List<SongList> songLists = songListService.getSongListByFuzzyTitle(title);
        JSONObject json = getJson(true, "");
        json.put(DATA, songLists);
        return json;
    }
    @GetMapping("/style/detail")
    public Object getSongListByTitle(HttpServletRequest request){
        String style = request.getParameter("style").trim();
        List<SongList> songLists = songListService.getSongListByStyle(style);
        JSONObject json = getJson(true, "");
        json.put(DATA, songLists);
        return json;
    }
}
