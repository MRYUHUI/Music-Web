package com.patrick.service;

import com.patrick.domain.UserCreateSongList;

import java.util.List;

/**
 * @Author:
 * @Date: 2024-04-14-15:54
 * @Description:
 */
public interface UserCreateSongListService {
    public boolean insert(UserCreateSongList UserCreateSongList);

    public boolean delete(UserCreateSongList userCreateSongList);

    public List<UserCreateSongList> getUserCreateSongListsByUserId(Integer userId);

    public List<UserCreateSongList> getUserCreateSongListsByPlaylistId(Integer playlistId);

    public List<Integer> getPlaylistIdsByUserId(Integer userId);

    public boolean isExist(UserCreateSongList userCreateSongList);

}
