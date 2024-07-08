package com.patrick.service.impl;

import com.patrick.dao.UserCreateSongListMapper;
import com.patrick.domain.UserCreateSongList;
import com.patrick.service.UserCreateSongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:
 * @Date: 2024-04-14-15:54
 * @Description:
 */
@Service
public class UserCreateSongListServiceImpl implements UserCreateSongListService {
    @Autowired
    UserCreateSongListMapper userCreateSongListMapper;
    @Override
    public boolean insert(UserCreateSongList userCreateSongList) {
        return userCreateSongListMapper.insert(userCreateSongList) > 0;
    }

    @Override
    public boolean delete(UserCreateSongList userCreateSongList) {
        return userCreateSongListMapper.delete(userCreateSongList) > 0;
    }

    @Override
    public List<UserCreateSongList> getUserCreateSongListsByUserId(Integer userId) {
        return userCreateSongListMapper.getUserCreateSongListsByUserId(userId);
    }

    @Override
    public List<UserCreateSongList> getUserCreateSongListsByPlaylistId(Integer playlistId) {
        return userCreateSongListMapper.getUserCreateSongListsByPlaylistId(playlistId);
    }

    @Override
    public List<Integer> getPlaylistIdsByUserId(Integer userId) {
        return userCreateSongListMapper.getPlaylistIdsByUserId(userId);
    }

    @Override
    public boolean isExist(UserCreateSongList userCreateSongList) {
        return userCreateSongListMapper.isExist(userCreateSongList)> 0;
    }
}
