package com.patrick.service;

import com.patrick.domain.UserFavoriteSongList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author:
 * @Date: 2024-05-09-21:23
 * @Description:
 */
public interface UserFavoriteSongListService {

    public boolean insert(UserFavoriteSongList userFavoriteSongList);

    public boolean delete(UserFavoriteSongList userFavoriteSongList);

    public List<UserFavoriteSongList> getUserFavoriteSongListsByUserId(Integer userId);

    public List<UserFavoriteSongList> getUserFavoriteSongListsByPlaylistId(Integer songListId);

    //    根据用户ID获取其创建的歌单ID
    public List<Integer> getPlaylistIdsByUserId(Integer userId);

    public boolean isExist(UserFavoriteSongList userFavoriteSongList);
}
