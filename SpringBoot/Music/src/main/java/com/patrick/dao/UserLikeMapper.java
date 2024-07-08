package com.patrick.dao;

import com.patrick.domain.UserLike;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserLikeMapper {

    @Insert("INSERT INTO user_like (user_id, type, song_id, song_list_id, create_time) VALUES (#{userId}, #{type}, #{songId}, #{songListId}, NOW())")
    public int insert(UserLike userLike);

    @Update({
            "<script>",
            "UPDATE user_like",
            "<set>",
            "<if test='type != null'>type = #{type},</if>",
            "<if test='songId != null'>song_id = #{songId},</if>",
            "<if test='songListId != null'>song_list_id = #{songListId},</if>",
            "</set>",
            "WHERE id = #{id}",
            "</script>"
    })
    public int update(UserLike userLike);

    @Delete("DELETE FROM user_like WHERE user_id = #{userId} AND song_id = #{songId}")
    public int delete(String userId, String songId);

    @Select("SELECT * FROM user_like WHERE user_id = #{id}")
    public List<UserLike> getUserLikeByUserId(Integer id);
    @Select("SELECT COUNT(*) FROM user_like WHERE user_id = #{userId} AND song_id = #{songId}")
    public int isExist(UserLike userLike);

    @Select("SELECT song_id FROM user_like WHERE user_id = #{userId}")
    public List<Integer> getSongIdByUserId(Integer userId);
}
