package com.zyx.controller;

import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdataIcome")
public class UpdataIcome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String incomeId = req.getParameter("incomeId");
        String incomeSource = req.getParameter("incomeSource");
        String incomeCount = req.getParameter("incomeCount");
        IncomDao incomeService = new IncomDaoImpl();
        int updataIncome = incomeService.UpdataById(incomeId, incomeSource, incomeCount);
        String tips = "";
        if (updataIncome == 1) {
            req.getRequestDispatcher("incomeList.jsp").forward(req, resp);
        } else {
            tips = "更新失败！";
            req.setAttribute("tips", tips);
            req.getRequestDispatcher("result.jsp").forward(req, resp);
        }

    }
}
