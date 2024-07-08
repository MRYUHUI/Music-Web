package com.patrick.service;

import com.patrick.domain.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerService {
    public boolean insertBanner(Banner banner);

    public boolean update(Banner banner);

    public List<Banner> getAllBanner();


}
