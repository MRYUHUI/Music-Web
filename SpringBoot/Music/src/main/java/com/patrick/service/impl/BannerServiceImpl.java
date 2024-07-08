package com.patrick.service.impl;

import com.patrick.dao.BannerMapper;
import com.patrick.domain.Banner;
import com.patrick.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerMapper bannerMapper;
    @Override
    public boolean insertBanner(Banner banner) {
        return bannerMapper.insertBanner(banner) > 0;
    }

    @Override
    public boolean update(Banner banner) {
        return bannerMapper.update(banner) > 0;
    }


    @Override
    public List<Banner> getAllBanner() {
        return bannerMapper.getAllBanner();
    }
}
