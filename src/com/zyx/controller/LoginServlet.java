package com.zyx.controller;

import com.zyx.model.User;
import com.zyx.service.UserService;
import com.zyx.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by Ethel_oo on 2019/9/26.
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
//      resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html,charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserService userService = new UserService();
        List<Map<String, Object>> userList = userService.login(username, password);
        String tips = "";
        if (userList == null || userList.size() == 0) {
//            用户不存在
            tips = "用户不存在！请先注册！";
            req.setAttribute("tips", tips);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
//            用户存在
            tips = "登录成功！";
            req.setAttribute("tips", tips);
            req.getRequestDispatcher("incomeList.jsp").forward(req, resp);
        }

    }
}
