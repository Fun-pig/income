package com.zyx.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;
import com.zyx.service.IncomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/searchIncome")
public class searchIncomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("content-type", "application/json;charset=UTF-8");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String minAmount = req.getParameter("minAmount");
        String maxAmount = req.getParameter("maxAmount");
        String offset = req.getParameter("page");
        int offsetInt = Integer.parseInt(offset);

        int length = 4;
        offsetInt = (offsetInt - 1) * length;

        IncomDao selectSerivce = new IncomDaoImpl();
        List<Map<String, Object>> resule = selectSerivce.selectAllfour(startDate, endDate, minAmount, maxAmount, offsetInt, length);
        List<Map<String, Object>> resule2 = selectSerivce.selectAllByParams(startDate, endDate, minAmount, maxAmount);

        JSONArray array = new JSONArray();
        array.add(0,resule);
        array.add(1,resule2);
        resp.getWriter().print(JSON.toJSON(array));
    }
}
