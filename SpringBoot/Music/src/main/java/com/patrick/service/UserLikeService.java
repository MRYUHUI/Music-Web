package com.patrick.service;

import com.patrick.domain.UserLike;

import java.util.List;

public interface UserLikeService {
    public boolean insert(UserLike userLike);

    public boolean update(UserLike userLike);

    public boolean delete(String userId, String songId);

    public List<UserLike> getLikeByUserId(Integer id);

    public boolean isExist(UserLike userLike);

    public List<Integer> getSongIdByUserId(Integer userId);

}
