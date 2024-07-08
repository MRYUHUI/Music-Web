package com.patrick.dao;

import com.patrick.domain.Banner;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BannerMapper {
    @Insert("INSERT INTO banner (pic, title) VALUES (#{pic}, #{title})")
    public int insertBanner(Banner banner);

    @Update({
            "<script>",
            "UPDATE banner",
            "<set>",
            "<if test='pic != null'>pic = #{pic},</if>",
            "<if test='title != null'>title = #{title},</if>",
            "</set>",
            "WHERE id = #{id}",
            "</script>"
    })
    public int update(Banner banner);

    @Select("SELECT * FROM banner")
    public List<Banner> getAllBanner();

}
