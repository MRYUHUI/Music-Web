package com.patrick.utils;

import com.alibaba.fastjson.JSONObject;
import org.springframework.util.FileSystemUtils;

import java.io.File;

public class Consts {
    /*登錄名*/
    public static final String NAME = "name";
    //    返回碼
    public static final String CODE = "code";
    //    返回信息
    public static final String MSG = "message";

    public static final String SUCCESS = "success";

    public static final String ERROR = "error";

    public static final String WARNING = "warning";

    public static final String DATA = "data";

    public static final String STATUS = "status";

    public static final String TYPE = "type";

    public static final String DEFAULTAVATAR = "/img/DefaultAvatar.png";

    public static final String DefaultAlbumImg = "/img/DefaultAlbumImg.png";

    public static Boolean deleteFile(String path) {
        String filePath = System.getProperty("user.dir") + path;
        File file = new File(filePath);
        if (!file.exists()) {
            return true; // 文件不存在，直接返回true
        }
        return FileSystemUtils.deleteRecursively(new File(filePath));
    }

    public static JSONObject getJson(boolean tag, String msg) {
        JSONObject jsonObject = new JSONObject();
        if (tag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, msg + "成功");
            jsonObject.put(Consts.SUCCESS, true);
            jsonObject.put(TYPE, SUCCESS);
        } else {
            jsonObject.put(Consts.CODE, 0);
            jsonObject.put(Consts.MSG, msg + "失敗");
            jsonObject.put(TYPE, ERROR);
            jsonObject.put(Consts.SUCCESS, false);
        }
        return jsonObject;
    }
}
