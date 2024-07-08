package com.patrick.dao;

import com.patrick.domain.UserCreateSongList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author:
 * @Date: 2024-04-14-15:47
 * @Description:
 */
@Mapper
public interface UserCreateSongListMapper {
    @Insert("INSERT INTO user_create_songlist (song_list_id, user_id) " +
            "VALUES (#{songListId}, #{userId})")
    public int insert(UserCreateSongList UserCreateSongList);

    @Delete("DELETE FROM user_create_songlist WHERE user_id = #{userId} AND song_list_id = #{songListId}")
    public int delete(UserCreateSongList userCreateSongList);

    @Select("SELECT * FROM user_create_songlist WHERE user_id = #{userId}")
    public List<UserCreateSongList> getUserCreateSongListsByUserId(Integer userId);

    @Select("SELECT * FROM user_create_songlist WHERE song_list_id = #{songListId}")
    public List<UserCreateSongList> getUserCreateSongListsByPlaylistId(Integer songListId);

//    根据用户ID获取其创建的歌单ID
    @Select("SELECT song_list_id FROM user_create_songlist WHERE user_id = #{userId}")
    public List<Integer> getPlaylistIdsByUserId(Integer userId);

    @Select("SELECT COUNT(*) FROM user_create_songlist WHERE song_list_id = #{songListId} AND user_id = #{userId}")
    public int isExist(UserCreateSongList userCreateSongList);


}

