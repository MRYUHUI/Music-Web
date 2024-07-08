package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Singer;
import com.patrick.service.SingerService;
import com.patrick.utils.Consts;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static com.patrick.utils.Consts.*;

/**
 * 歌手控制類
 */
@RestController
@RequestMapping("/singer")
public class SingerController {
    @Autowired
    private SingerService singerService;

    /**
     * 添加歌手
     */
    @PostMapping("/add")
    public Object addSinger(@RequestBody Singer singer) {
        singer.setPic(DEFAULTAVATAR);
        boolean flag = singerService.insert(singer);
        return getJson(flag, "");
    }

    @PostMapping("/update")
    public Object updateSinger(@RequestBody Singer singer) {
        boolean flag = singerService.update(singer);
        return getJson(flag, "");
    }

    @DeleteMapping("/delete")
    public Object deleteSinger(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        String picPath = singerService.getPicById(Integer.parseInt(id));
        boolean flag = Consts.deleteFile(picPath);
        if(!flag) return getJson(flag, "删除");
        flag = singerService.delete(Integer.parseInt(id));
        return getJson(flag, "删除");
    }

    @PostMapping("/selectByPrimaryKey")
    public Object selectByPrimaryKey(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        return singerService.getSingerById(Integer.parseInt(id));
    }

    @GetMapping("")
    public Object getAllSinger() {
        List<Singer> singers = singerService.allSingers();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, singers);
        return jsonObject;
    }

    @GetMapping("/singerOfName")
    public Object getSingerByName(HttpServletRequest request) {
        String name = request.getParameter("name").trim();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, singerService.getSingerByFuzzyName(name));
        return jsonObject;
    }
    
    @GetMapping("/sex/detail")
    public Object getSingerBySex(HttpServletRequest request) {
        String sex = request.getParameter("sex").trim();
        List<Singer> singers = singerService.getSingerBySex(Integer.parseInt(sex));
        JSONObject json = getJson(true, "");
        json.put(DATA, singers);
        return json;
    }

    /**
     * 更新歌手图片
     *
     * @param avatorFile
     * @param id
     * @return
     */
    @PostMapping("/avatar/update")
    public Object updateSingerPic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id") int id) {
        JSONObject jsonObject = new JSONObject();

        if (avatorFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "文件上传失败");
            jsonObject.put("type", "error");
            return jsonObject;
        }
        String picPath = singerService.getPicById(id);
        boolean flag = Consts.deleteFile(picPath);
        if(!flag) return getJson(flag, "上传");
//        文件名 = 当前时间（毫秒）+ 原来文件名
        String fileName = System.currentTimeMillis() + avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "img"
                + System.getProperty("file.separator") + "singerPic" + System.getProperty("file.separator");
        File file1 = new File(filePath);
        if (!file1.exists()) {
            file1.mkdir();
        }
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        String storeAvatorPath = "/img/singerPic/" + fileName;
        try {
            avatorFile.transferTo(dest);

            Singer singer = new Singer();
            singer.setId(id);
            singer.setPic(storeAvatorPath);
            flag = singerService.updateSingerPic(singer);
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

    //  ===========  获得要返回的Json =============
    public JSONObject getJson(boolean tag, String msg) {
        JSONObject jsonObject = new JSONObject();
        if (tag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, msg + "成功");
            jsonObject.put(Consts.SUCCESS, "success");
            jsonObject.put("type", "success");
        } else {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, msg + "失敗");
            jsonObject.put("type", "error");
        }
        return jsonObject;
    }
}
