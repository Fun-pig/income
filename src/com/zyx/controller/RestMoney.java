package com.zyx.controller;

import com.alibaba.fastjson.JSON;
import com.zyx.dao.IncomDao;
import com.zyx.service.IncomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/RestMoney")
public class RestMoney extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("content-type", "application/json;charset=UTF-8");
        IncomService userService = new IncomService();
        List<Map<String, Object>> restmoney =  userService.selectRestMoney();
        resp.getWriter().print(JSON.toJSON(restmoney));
    }
}
