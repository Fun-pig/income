package com.zyx.controller;

import com.alibaba.fastjson.JSON;
import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;
import com.zyx.service.IncomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/IncomeDelete")
public class IncomeDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String delete_id = req.getParameter("id");
        if(delete_id != null) {
            IncomDao incomeService = new IncomDaoImpl();
            int deleteItem = incomeService.deleteById(delete_id);
            resp.getWriter().print(deleteItem);
        } else {
            resp.getWriter().print("错误");
        }
    }
}
