package com.cwstd.service;

import java.sql.Connection;

public interface LoginService {
    /***
     * 登录数据库
     */
    Connection login(String host, String port, String user, String password);
}
