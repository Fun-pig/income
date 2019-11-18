package com.zyx.dao;

import java.util.List;
import java.util.Map;

public interface IncomDao {
    /**
     * 收入模块--查询剩下多少钱
     * @return List<Map<String, Object>>
     */
    List<Map<String, Object>> selectRestMoney();

    /**
     * 收入模块--查询符合条件的个数
     * @param startDate
     * @param endDate
     * @param minAmount
     * @param maxAmount
     * @return List<Map<String, Object>>
     */
    List<Map<String, Object>> selectAllByParams(String startDate, String endDate, String minAmount, String maxAmount);
    /**
     * 查询条件数据
     * @param startDate
     * @param endDate
     * @param minAmount
     * @param maxAmount
     * @return List<Map<String, Object>>
     */
    List<Map<String, Object>> selectAllfour(String startDate, String endDate, String minAmount, String maxAmount, int offset, int length);

    /**
     * 修改收入模块
     * @param id
     * @param content
     * @param amount
     * @return int
     */
    int UpdataById(String id, String content, String amount);

    /**
     * 查找一个数据
     * @param id
     * @return List<Map<String, Object>>
     */
    List<Map<String, Object>> selectAllById(String id);
    /**
     * 删除一个数据
     * @return int
     */
    int deleteById(String id);

    /**
     * 收入模块--查询所有的收入-并做分页出理
     * @param offset
     * @param length
     * @return
     */
    List<Map<String, Object>> selectAll(int offset, int length);

    /**
     * 收入模块-查询全部收入的个数
     * @return List<Map<String, Object>>
     */
    List<Map<String, Object>> selectAll();

    /**
     * 收入模块
     * @param in_amount
     * @param in_content
     * @return int
     */
    int addIncome(String in_amount, String in_content);
}
