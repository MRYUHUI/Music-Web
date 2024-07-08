package com.patrick.dao;


import com.patrick.domain.UserFavoriteSongList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author:
 * @Date: 2024-05-09-21:19
 * @Description:
 */
@Mapper
public interface UserFavoriteSongListMapper {
    @Insert("INSERT INTO user_favorite_songlist (song_list_id, user_id) " +
            "VALUES (#{songListId}, #{userId})")
    public int insert(UserFavoriteSongList userFavoriteSongList);

    @Delete("DELETE FROM user_favorite_songlist WHERE user_id = #{userId} AND song_list_id = #{songListId}")
    public int delete(UserFavoriteSongList userFavoriteSongList);

    @Select("SELECT * FROM user_favorite_songlist WHERE user_id = #{userId}")
    public List<UserFavoriteSongList> getUserFavoriteSongListsByUserId(Integer userId);

    @Select("SELECT * FROM user_favorite_songlist WHERE song_list_id = #{songListId}")
    public List<UserFavoriteSongList> getUserFavoriteSongListsByPlaylistId(Integer songListId);

    //    根据用户ID获取其创建的歌单ID
    @Select("SELECT song_list_id FROM user_favorite_songlist WHERE user_id = #{userId}")
    public List<Integer> getPlaylistIdsByUserId(Integer userId);

    @Select("SELECT COUNT(*) FROM user_favorite_songlist WHERE song_list_id = #{songListId} AND user_id = #{userId}")
    public int isExist(UserFavoriteSongList userFavoriteSongList);

}
