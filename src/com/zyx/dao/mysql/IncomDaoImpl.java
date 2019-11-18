package com.zyx.dao.mysql;
import com.zyx.dao.UserDao;
import com.zyx.model.User;


import com.zyx.dao.IncomDao;
import com.zyx.util.DBUtil;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class IncomDaoImpl implements IncomDao {
    @Override
    public List<Map<String, Object>> selectRestMoney(){
        String sql = "select sum(in_amount) as money from income";
        return DBUtil.select(sql);
    }

    @Override
    public List<Map<String, Object>> selectAllByParams(String startDate, String endDate, String minAmount, String maxAmount) {
//        String sql = "select count(1) from income where in_time BETWEEN '"+startDate+"' AND '"+endDate+"' AND in_amount BETWEEN '"+minAmount+"' AND '"+maxAmount+"';";
        String sql = "select count(1) as count from income";
        sql += " where 1=1";
        if (startDate != null && !startDate.equals("")){
            sql += " and in_time >= '"+startDate+"'";
        }
        if (endDate != null && !endDate.equals("")){
            sql += " and in_time <= '"+endDate+"'";
        }
        if (minAmount != null && !minAmount.equals("")){
            sql += " and in_amount >= "+minAmount;
        }
        if (maxAmount != null && !maxAmount.equals("")){
            sql += " and in_amount <= "+maxAmount;
        }
        return DBUtil.select(sql);
    }

    @Override
    public List<Map<String, Object>> selectAllfour(String startDate, String endDate, String minAmount, String maxAmount, int offset, int length) {
//        String sql = "SELECT * FROM income WHERE in_time BETWEEN '"+startDate+"' AND '"+endDate+"' AND in_amount BETWEEN '"+minAmount+"' AND '"+maxAmount+"' ORDER BY in_time DESC LIMIT "+offset+", "+length+";";
        String sql = "select * from income";
        sql += " where 1=1";
        if (startDate != null && !startDate.equals("")){
            sql += " and in_time >= '"+startDate+"'";
        }
        if (endDate != null && !endDate.equals("")){
            sql += " and in_time <= '"+endDate+"'";
        }
        if (minAmount != null && !minAmount.equals("")){
            sql += " and in_amount >= "+minAmount;
        }
        if (maxAmount != null && !maxAmount.equals("")){
            sql += " and in_amount <= "+maxAmount;
        }
        sql += " ORDER BY in_time DESC LIMIT "+offset+", "+length+";";

        return DBUtil.select(sql);
    }


    @Override
    public int UpdataById(String id, String content, String amount) {
        String sql = "update income set in_content = '"+content+"', in_amount = '"+amount+"' where in_id = '"+id+"';";
        return DBUtil.update(sql);
    }

    @Override
    public List<Map<String, Object>> selectAllById(String id) {
        String sql = "select * from income where in_id = '"+id+"';";
        return DBUtil.select(sql);
    }

    @Override
    public int deleteById(String id) {
        String sql = "DELETE FROM income WHERE in_id = '"+id+"';";
        return DBUtil.update(sql);
    }

    @Override
    public List<Map<String, Object>> selectAll() {
        String sql = "select count(1) as count from income";
        return DBUtil.select(sql);
    }

    @Override
    public List<Map<String, Object>> selectAll(int offset, int length) {
        String sql = "select * from income order by in_time desc limit "+offset+", "+length;
        return DBUtil.select(sql);
    }

    @Override
    public int addIncome(String in_amount, String in_content) {
        String sql = "insert into income(in_id, in_amount, in_content, in_time) values (?, ?, ?, ?)";
        return DBUtil.update(sql, UUID.randomUUID().toString(), in_amount, in_content, new Date() );
    }
}
