package com.patrick.service.impl;

import com.patrick.dao.AdminMapper;
import com.patrick.domain.Admin;
import com.patrick.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 管理員service實現類
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    /**
     * 驗證密碼是否正確
     *
     * @param username
     * @param password
     */

    @Override
    public boolean verifyPassword(String username, String password) {
        return adminMapper.verifyPassword(username, password) > 0;

    }

    @Override
    public Admin getAdminByUsernameAndPassword(String username, String pwd) {
        return adminMapper.getAdminByUsernameAndPassword(username, pwd);
    }
}
