package com.zyx.controller;

import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/incomAdd")
public class IncomAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String in_amount = req.getParameter("in_amount");
        String in_content = req.getParameter("in_content");

        IncomDao incomService = new  IncomDaoImpl();
        int incom = incomService.addIncome(in_amount, in_content);

        String tips = "";
        if (incom > 0) {
//            用户不存在
            tips = "添加成功！";
            req.setAttribute("tips", tips);
            req.getRequestDispatcher("incomeList.jsp").forward(req, resp);
        } else {
//            用户存在
            tips = "添加失败！";
            req.setAttribute("tips", tips);
            req.getRequestDispatcher("incomAdd.jsp").forward(req, resp);
        }

    }
}
