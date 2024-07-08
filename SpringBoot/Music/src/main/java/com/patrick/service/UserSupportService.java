package com.patrick.service;

import com.patrick.domain.UserSupport;


public interface UserSupportService {
    public boolean isUserSupportExist(UserSupport userSupport);

    public boolean delete(UserSupport userSupport);

    public boolean insert(UserSupport userSupport);
}
