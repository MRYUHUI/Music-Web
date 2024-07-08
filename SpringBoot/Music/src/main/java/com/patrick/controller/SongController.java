package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Song;
import com.patrick.service.SongService;
import com.patrick.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

/**
 * 歌曲管理类
 */
@RestController
@RequestMapping("/song")
public class SongController {
    @Autowired
    private SongService songService;
    @GetMapping("")
    public Object getAllSinger() {
        List<Song> songs = songService.allSongs();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, songs);
        return jsonObject;
    }
    @PostMapping("/add")
    public Object addSong(HttpServletRequest request, @RequestParam("file") MultipartFile mpFile) {
        System.out.println(request);
        JSONObject jsonObject = new JSONObject();
//        获取前端传来的文件
        String singerId = request.getParameter("singerId").trim();
        String name = request.getParameter("name").trim();
        String introduction = request.getParameter("introduction").trim();
        String lyric = request.getParameter("lyric").trim();
        String pic = "/img/songPic/OIP.jpg";
//        上传歌曲文件
        if (mpFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "歌曲上传失败");
            return jsonObject;
        }
//        文件名 = 当前时间（毫秒）+ 原来文件名
        String fileName = System.currentTimeMillis() + mpFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "song";
        File file1 = new File(filePath);
        if (!file1.exists()) {
            file1.mkdir();
        }
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        String storeUrlPath = "/song/" + fileName;
        try {
            mpFile.transferTo(dest);
            Song song = new Song();
            song.setSingerId(Integer.parseInt(singerId));
            song.setName(name);
            song.setIntroduction(introduction);
            song.setPic(pic);
            song.setLyric(lyric);
            song.setUrl(storeUrlPath);
            boolean flag = songService.insert(song);
            if (flag) {  // 保存成功
                jsonObject = getJson(flag, "上传");
                jsonObject.put("avator", storeUrlPath);
                return jsonObject;
            }
            jsonObject = getJson(flag, "上传");
            return jsonObject;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonObject;

    }

    @GetMapping("/singer/detail")
    public Object getSongBySingerId(HttpServletRequest request) {
        String singerId = request.getParameter("singerId");
        List<Song> songBySingerId = songService.getSongBySingerId(Integer.parseInt(singerId));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", songBySingerId);
        return jsonObject;
    }

    @PostMapping("/update")
    public Object updateSong(@RequestBody Song song) {
        boolean flag = songService.update(song);
        return getJson(flag, "编辑");
    }

    @DeleteMapping("/delete")
    public Object deleteSong(HttpServletRequest request) {
        String id = request.getParameter("id");
        String songPath = songService.getUrlById(Integer.parseInt(id));
        boolean flag = Consts.deleteFile(songPath);
        if (!flag) return getJson(flag, "删除");
//        String picPath = songService.getPicById(Integer.parseInt(id));
//        flag = Consts.deleteFile(picPath);
//        if(!flag) return getJson(flag, "删除");
        flag = songService.delete(Integer.parseInt(id));
        return getJson(flag, "删除");
    }

    @PostMapping("/img/update")
    public Object updateSongPic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id") int id) {
        JSONObject jsonObject = new JSONObject();

        if (avatorFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "文件上传失败");
            jsonObject.put("type", "error");
            return jsonObject;
        }
        String picPath = songService.getPicById(id);
        boolean flag = Consts.deleteFile(picPath);
        if (!flag) return getJson(flag, "上传");
//        文件名 = 当前时间（毫秒）+ 原来文件名
        String fileName = System.currentTimeMillis() + avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "img"
                + System.getProperty("file.separator") + "songPic" + System.getProperty("file.separator");
        File file1 = new File(filePath);
        if (!file1.exists()) {
            file1.mkdir();
        }
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        String storeAvatorPath = "/img/songPic/" + fileName;
        try {
            avatorFile.transferTo(dest);

            Song song = new Song();
            song.setId(id);
            song.setPic(storeAvatorPath);
            flag = songService.updateSongPic(song);
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

    @PostMapping("/url/update")
    public Object updateSongUrl(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id") int id) {
        JSONObject jsonObject = new JSONObject();

        if (avatorFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "文件上传失败");
            jsonObject.put("type", "error");
            return jsonObject;
        }
        String urlPath = songService.getUrlById(id);
        boolean flag = Consts.deleteFile(urlPath);
        if (!flag) return getJson(flag, "上传");
//        文件名 = 当前时间（毫秒）+ 原来文件名
        String fileName = System.currentTimeMillis() + avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "song";
        File file1 = new File(filePath);
        if (!file1.exists()) {
            file1.mkdir();
        }
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        String storeAvatorPath = "/song/" + fileName;
        try {
            avatorFile.transferTo(dest);

            Song song = new Song();
            song.setId(id);
            song.setUrl(storeAvatorPath);
            flag = songService.updateSongUrl(song);
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

    @GetMapping("/detail")
    public Object getSongById(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        Song song = songService.getSongById(Integer.parseInt(id));
        JSONObject json = getJson(true, "");
        json.put(DATA, song);
        return json;
    }
    @GetMapping("/singerName/detail")
    public Object getSongByName(HttpServletRequest request){
        String name = request.getParameter("name").trim();
        List<Song> songs = songService.getSongByName(name);
        JSONObject json = getJson(true, "");
        json.put(DATA, songs);
        return json;
    }
    @GetMapping("/songName.detail")
    public Object getSongByFuzzyName(HttpServletRequest request){
        String name = request.getParameter("name").trim();
        List<Song> songs = songService.getSongByFuzzyName(name);
        JSONObject json = getJson(true, "");
        json.put(DATA, songs);
        return json;
    }
}
