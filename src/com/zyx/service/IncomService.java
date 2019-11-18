package com.zyx.service;

import com.zyx.dao.IncomDao;
import com.zyx.dao.mysql.IncomDaoImpl;
import jdk.nashorn.internal.runtime.UnwarrantedOptimismException;

import java.util.List;
import java.util.Map;

public class IncomService {
    /**
     * 收入模块--查询剩下多少钱
     * @return List<Map<String, Object>>
     */
    public List<Map<String, Object>> selectRestMoney(){
        IncomDao income = new IncomDaoImpl();
        return income.selectRestMoney();
    }

    /**
     * 收入模块--查询符合条件的个数
     * @param startDate
     * @param endDate
     * @param minAmount
     * @param maxAmount
     * @return List<Map<String, Object>>
     */
    public List<Map<String, Object>> selectAllByParams(String startDate, String endDate, String minAmount, String maxAmount) {
        IncomDao income = new IncomDaoImpl();
        return income.selectAllByParams(startDate, endDate, minAmount, maxAmount);
    }

    /**
     * 收入模块--查询条件数据
     * @param startDate
     * @param endDate
     * @param minAmount
     * @param maxAmount
     * @return List<Map<String, Object>>
     */
    public List<Map<String, Object>> selectAllfour(String startDate, String endDate, String minAmount, String maxAmount, int offset, int length) {
        IncomDao income = new IncomDaoImpl();
        return income.selectAllfour(startDate, endDate, minAmount, maxAmount, offset, length);
    }

    /**
     * 收入模块--修改数据
     * @param id
     * @param content
     * @param amount
     * @return int
     */
    public int UpdataById(String id, String content, String amount) {
        IncomDao income = new IncomDaoImpl();
        return income.UpdataById(id, content, amount);
    }

    /**
     * 收入模块--查询原始数据
     * @param id
     * @return List<Map<String, Object>>
     */
    public List<Map<String, Object>> selectAllById(String id) {
        IncomDao income = new IncomDaoImpl();
        return income.selectAllById(id);
    }

    /**
     * 收入模块--删除数据
     * @param id
     * @return int
     */
    public int deleteById(String id) {
        IncomDao income = new IncomDaoImpl();
        return income.deleteById(id);
    }
    /**
     * 收入模块--查询全部收入
     * @return
     */
    public List<Map<String, Object>> selectAll(int offset, int length) {
        IncomDao incomDao = new IncomDaoImpl();
        return incomDao.selectAll(offset, length);
    }

    /**
     * 收入模块--查询个数
     * @return
     */
    public List<Map<String, Object>> selectAll() {
        IncomDao incomDao = new IncomDaoImpl();
        return incomDao.selectAll();
    }

    /**
     * 收入模块--新增收入
     * @param in_amount
     * @param in_content
     * @return int
     */
    public int addIcom(String in_amount, String in_content) {
        IncomDao incomDao = new IncomDaoImpl();
        return incomDao.addIncome(in_amount, in_content);
    }
}
