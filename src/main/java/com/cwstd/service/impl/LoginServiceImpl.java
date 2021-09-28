package com.cwstd.service.impl;

import com.cwstd.service.LoginService;
import com.cwstd.util.JDBCUtil;
import org.springframework.stereotype.Service;

import java.sql.Connection;

@Service
public class LoginServiceImpl implements LoginService {

    @Override
    public Connection login(String host, String port, String user, String password) {
        String url="jdbc:mysql://"+host+":"+port+"/information_schema"+"?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
        System.out.println(url);
        Connection conn = JDBCUtil.getConn(url, user, password);
        return conn;
    }
}
