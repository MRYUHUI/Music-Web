package com.patrick.service.impl;

import com.patrick.dao.UserLikeMapper;
import com.patrick.domain.UserLike;
import com.patrick.service.UserLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserLikeServiceImpl implements UserLikeService {
    @Autowired
    private UserLikeMapper userLikeMapper;

    @Override
    public boolean insert(UserLike userLike) {
        return userLikeMapper.insert(userLike) > 0;
    }

    @Override
    public boolean update(UserLike userLike) {
        return userLikeMapper.update(userLike) > 0;
    }

    @Override
    public boolean delete(String userId, String songId) {
        return userLikeMapper.delete(userId, songId) > 0;
    }

    @Override
    public List<Integer> getSongIdByUserId(Integer userId) {
        return userLikeMapper.getSongIdByUserId(userId);
    }

    @Override
    public boolean isExist(UserLike userLike) {
        return userLikeMapper.isExist(userLike) > 0;
    }

    @Override
    public List<UserLike> getLikeByUserId(Integer id) {
        return userLikeMapper.getUserLikeByUserId(id);
    }
}
