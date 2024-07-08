package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Banner;
import com.patrick.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.patrick.utils.Consts.DATA;

@RestController
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    @GetMapping("/getAllBanner")
    public Object getAllBanner() {
        List<Banner> banners = bannerService.getAllBanner();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, banners);
        return jsonObject;
    }
}
