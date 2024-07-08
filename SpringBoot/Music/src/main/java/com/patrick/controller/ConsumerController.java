package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Consumer;
import com.patrick.domain.SongList;
import com.patrick.service.ConsumerService;
import com.patrick.service.SongListService;
import com.patrick.utils.Consts;
import com.patrick.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.patrick.utils.Consts.*;

@RestController
@RequestMapping("/user")
public class ConsumerController {
    @Autowired
    private ConsumerService consumerService;

    @Autowired
    private SongListService songListService;

    @PostMapping("/add")
    public Object addConsumer(@RequestBody Consumer consumer) {
        if (consumer.getUsername().equals("") || consumer.getPassword().equals("") || consumer.getSex() == null) {
            return getJson(false, "注册");
        }
        boolean flag = consumerService.countUserByUserName(consumer.getUsername());
        if (flag) {
            JSONObject json = getJson(false, "");
            json.put(MSG, "该用户名已被使用");
            return json;
        }
        consumer.setAvatar(DEFAULTAVATAR);
        flag = consumerService.insert(consumer);
        return getJson(flag, "注册");
    }

    @PostMapping("/update")
    public Object update(@RequestBody Consumer consumer) {
        boolean flag = consumerService.update(consumer);
        JSONObject json = getJson(flag, "");
        // jwt ---------
        Map<String, String> payload = new HashMap<>();
        payload.put("userId", consumer.getId().toString());
        payload.put("username", consumer.getUsername());
        // 生成jwt令牌
        String token = JWTUtils.getToken(payload);
        json.put("accessToken", token);
        // ------------
        return json;
    }

    @GetMapping("/delete")
    public Object deleteSinger(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        String picPath = consumerService.getConsumerById(Integer.parseInt(id)).getAvatar();
        if(!(picPath.equals("") || picPath.equals("/img/DefaultAvatar.png"))){
            boolean flag = Consts.deleteFile(picPath);
            if (!flag) return getJson(flag, "删除");
        }
        boolean flag = consumerService.delete(Integer.parseInt(id));
        return getJson(flag, "删除");
    }

    @GetMapping("")
    public Object getAllConsumer() {
        List<Consumer> consumers = consumerService.allConsumer();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, consumers);
        return jsonObject;
    }

    @PostMapping("/avatar/update")
    public Object updateAvatarPic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id") int id) {
        JSONObject jsonObject = new JSONObject();

        if (avatorFile.isEmpty()) {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, "文件上传失败");
            jsonObject.put("type", "error");
            return jsonObject;
        }
//        删除用户先前的头像
        String picPath = consumerService.getConsumerById(id).getAvatar();
        boolean flag = Consts.deleteFile(picPath);
        if (!flag) return getJson(flag, "上传");
//        文件名 = 当前时间（毫秒）+ 原来文件名
        String fileName = System.currentTimeMillis() + avatorFile.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator") + "avatorImages";
        File file1 = new File(filePath);
        if (!file1.exists()) {
            file1.mkdir();
        }
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        String storeAvatorPath = "/avatorImages/" + fileName;
        try {
            avatorFile.transferTo(dest);

            Consumer consumer = new Consumer();
            consumer.setId(id);
            consumer.setAvatar(storeAvatorPath);
            flag = consumerService.update(consumer);
            if (flag) {  // 保存成功
                jsonObject = getJson(flag, "上传");
                jsonObject.put(DATA, storeAvatorPath);
                return jsonObject;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        jsonObject = getJson(false, "上传");
        return jsonObject;
    }

    @PostMapping("/login/status")
    public Object verifyPassword(@RequestBody Consumer consumerIn) {
        boolean flag = consumerService.verifyPassword(consumerIn.getUsername(), consumerIn.getPassword());
        if (!flag) return getJson(flag, "登录");
        Consumer consumer = consumerService.getConsumerByUsername(consumerIn.getUsername());
        JSONObject jsonObject = getJson(flag, "登录");
        // jwt ---------
        Map<String, String> payload = new HashMap<>();
        payload.put("userId", consumer.getId().toString());
        payload.put("username", consumer.getUsername());
        // 生成jwt令牌
        String token = JWTUtils.getToken(payload);
        jsonObject.put("accessToken", token);
        // ------------
        Consumer[] consumers = new Consumer[1];
        consumers[0] = consumer;
        jsonObject.put(DATA, consumers);
        return jsonObject;
    }

    @GetMapping("/get_user_by_token")
    public Object getUserByToken(@RequestParam String token) {
        Integer userId = JWTUtils.getUserIdFromToken(token);
        boolean isUserExist = consumerService.isExist(userId);
        if (!isUserExist) return getJson(false, "获取");
        Consumer consumer = consumerService.getConsumerById(userId);
        JSONObject jsonObject = getJson(true, "登录");
        // jwt ---------
        Map<String, String> payload = new HashMap<>();
        payload.put("userId", consumer.getId().toString());
        payload.put("username", consumer.getUsername());
        // 生成jwt令牌
        String newToken = JWTUtils.getToken(payload);
        jsonObject.put("accessToken", newToken);
        // ------------
        jsonObject.put(DATA, consumer);
        return jsonObject;
    }

    @GetMapping("/detail")
    public Object getSongById(HttpServletRequest request) {
        String id = request.getParameter("id").trim();
        Consumer consumer = consumerService.getConsumerById(Integer.parseInt(id));
        Consumer[] consumers = new Consumer[1];
        consumers[0] = consumer;
        JSONObject json = getJson(true, "");
        json.put(DATA, consumers);
        return json;
    }

    @PostMapping("/updatePassword")
    public Object updatePassword(@RequestBody Map<String, Object> request) {
        Consumer consumer = new Consumer();
        consumer.setId((int) request.get("id"));
        consumer.setPassword((String) request.get("password"));
        boolean flag = consumerService.update(consumer);
        return getJson(flag, "修改");
    }

    @GetMapping("/myspace/playlist")
    public Object getSongListMsgByUserId(@RequestParam Integer id) {
        List<Integer> playListIds = consumerService.getPlayListByUserId(id);
        List<SongList> songLists = new ArrayList<>();
        for (int playListId : playListIds) {
            songLists.add(songListService.getSongListById(playListId));
        }
        JSONObject jsonObject = getJson(true, "获取");
        jsonObject.put(DATA, songLists);
        return jsonObject;
    }

    @PostMapping("/verify_old_pwd")
    public Object isPwdCorrect(@RequestBody Consumer consumerIn) {
        boolean flag = consumerService.verifyPassword(consumerIn.getUsername(), consumerIn.getPassword());
        JSONObject json = getJson(flag, "");
        if (!flag) {
            json.put(MSG, "旧密码填写错误");
            return json;
        }
        return json;
    }

}