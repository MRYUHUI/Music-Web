package com.patrick.service.impl;

import com.patrick.dao.UserFavoriteSongListMapper;
import com.patrick.domain.UserFavoriteSongList;
import com.patrick.service.UserFavoriteSongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:
 * @Date: 2024-05-09-21:24
 * @Description:
 */
@Service
public class UserFavoriteSongListServiceImpl implements UserFavoriteSongListService {
    @Autowired
    UserFavoriteSongListMapper userFavoriteSongListMapper;

    @Override
    public boolean insert(UserFavoriteSongList userFavoriteSongList) {
        return userFavoriteSongListMapper.insert(userFavoriteSongList) > 0;
    }

    @Override
    public boolean delete(UserFavoriteSongList userFavoriteSongList) {
        return userFavoriteSongListMapper.delete(userFavoriteSongList) > 0;
    }

    @Override
    public List<UserFavoriteSongList> getUserFavoriteSongListsByUserId(Integer userId) {
        return userFavoriteSongListMapper.getUserFavoriteSongListsByUserId(userId);
    }

    @Override
    public List<UserFavoriteSongList> getUserFavoriteSongListsByPlaylistId(Integer songListId) {
        return userFavoriteSongListMapper.getUserFavoriteSongListsByPlaylistId(songListId);
    }

    @Override
    public List<Integer> getPlaylistIdsByUserId(Integer userId) {
        return userFavoriteSongListMapper.getPlaylistIdsByUserId(userId);
    }

    @Override
    public boolean isExist(UserFavoriteSongList userFavoriteSongList) {
        return userFavoriteSongListMapper.isExist(userFavoriteSongList) > 0;
    }
}
