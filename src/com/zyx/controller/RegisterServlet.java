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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username2");
        String password = req.getParameter("password2");
        String repassword = req.getParameter("repassword");
        String tips = "";

        if(!password.equals(repassword)) {
            tips = "密码不一致！";
            req.setAttribute("tips", tips);
            req.getRequestDispatcher("result.jsp").forward(req, resp);
        } else {
            User user = new User(null, username, password);

            UserService userService = new UserService();
            boolean userExists = userService.selectByUsername(username);

            if(userExists) {
                tips = "用户已经存在，请重新注册";
                req.setAttribute("tips", tips);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            } else {
                int userRegister = userService.addUser(user);
                if (userRegister == 0) {
                    tips = "注册失败！";
                    req.setAttribute("tips", tips);
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                } else {
                    tips = "注册成功！";
                    req.setAttribute("tips", tips);
                    req.getRequestDispatcher("incomeList.jsp").forward(req, resp);
                }
            }
        }

    }
}
