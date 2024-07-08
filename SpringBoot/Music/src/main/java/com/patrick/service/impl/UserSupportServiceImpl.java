package com.patrick.service.impl;

import com.patrick.dao.UserSupportMapper;
import com.patrick.domain.UserSupport;
import com.patrick.service.UserSupportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserSupportServiceImpl implements UserSupportService {
    @Autowired
    private UserSupportMapper userSupportMapper;

    @Override
    public boolean isUserSupportExist(UserSupport userSupport) {
        return userSupportMapper.isUserSupportExist(userSupport) > 0;
    }

    @Override
    public boolean delete(UserSupport userSupport) {
        return userSupportMapper.delete(userSupport) >  0;
    }

    @Override
    public boolean insert(UserSupport userSupport) {
        return userSupportMapper.insert(userSupport) > 0;
    }
}
