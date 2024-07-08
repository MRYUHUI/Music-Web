package com.patrick.service;


import com.patrick.domain.Admin;

/**
 * 管理員service接口
 */
public interface AdminService {

/**
 * 驗證密碼是否正確
 */
    public boolean verifyPassword(String username, String password);

    public Admin getAdminByUsernameAndPassword(String username, String pwd);


}

