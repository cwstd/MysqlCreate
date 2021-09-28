package com.cwstd.controller;

import com.cwstd.pojo.MysqlInfo;
import com.cwstd.service.LoginService;
import com.cwstd.util.JDBCUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.sql.Connection;

@Controller
@RequestMapping("/logincontroller")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping("login")
    public String login(String host, String port, String user, String password, HttpSession session){
        Connection login = loginService.login(host, port, user, password);
        if(login!=null){
            MysqlInfo mysqlInfo = new MysqlInfo(host, port, user, password);
            JDBCUtil.closeConn(login);
            session.setAttribute("mysqlInfo",mysqlInfo);
            return "redirect:/main.jsp";
        }
        session.setAttribute("msg","loginFail");
        return "redirect:/login.jsp";
    }
}
