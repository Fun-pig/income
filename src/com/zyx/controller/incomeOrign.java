package com.zyx.controller;

import com.alibaba.fastjson.JSON;
import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/incomeOrign")
public class incomeOrign extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("content-type", "application/json;charset=UTF-8");
        String Orign_id = req.getParameter("id");
        if(Orign_id != null) {
            IncomDao incomeService = new IncomDaoImpl();
            List<Map<String, Object>> OrignItem = incomeService.selectAllById(Orign_id);
            resp.getWriter().print(JSON.toJSON(OrignItem));
        } else {
            resp.getWriter().print("错误");
        }
    }
}
