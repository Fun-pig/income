package com.zyx.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;
import com.zyx.service.IncomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Array;
import java.util.List;
import java.util.Map;

@WebServlet("/IncomeListServlet")
public class IncomeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("content-type", "application/json;charset=UTF-8");
        String offset = req.getParameter("page");
        int offsetInt = Integer.parseInt(offset);

        int length = 4;
        offsetInt = (offsetInt - 1) * length;
        IncomDao incomService = new IncomDaoImpl();
        List<Map<String, Object>> incomeSelect = incomService.selectAll(offsetInt, length);
        List<Map<String, Object>> incomeSelectAll = incomService.selectAll();
        IncomService userService = new IncomService();
        List<Map<String, Object>> restmoney =  userService.selectRestMoney();

        JSONArray array = new JSONArray();
        array.add(0,incomeSelect);
        array.add(1,incomeSelectAll);
        array.add(2,restmoney);

        resp.getWriter().print(JSON.toJSON(array));

    }
}
