package com.zyx.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

/**
 * Created by Ethel_oo on 2019/9/7.
 */
public class DBUtil {

    private static String driver = null;
    private static String url = null;
    private static String username = null;
    private static String password = null;

    private static Connection connection = null;
    private static PreparedStatement preparedStatement = null;
    private static ResultSet resultSet = null;

    static {
        InputStream inputStream = DBUtil.class.getResourceAsStream("/jdbc.properties");
        Properties properties = new Properties();
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        driver = properties.getProperty("driver");
        url = properties.getProperty("url");
        username = properties.getProperty("username");
        password = properties.getProperty("password");
    }

    private static void startConnection () {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int update(String sql, Object... params) {
        int result = 0;
        startConnection();
//        3、建立Statement对象
        try {
            preparedStatement = connection.prepareStatement(sql);
            if (params != null && params.length != 0) {
                for (int i = 0; i < params.length; i++) {
                    preparedStatement.setObject(i + 1, params[i]);
                }
            }
            result += preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        closeAll();
        return result;

    }

    public static List<Map<String, Object>> select(String sql, Object... params) {
        List<Map<String, Object>> list = new ArrayList<>();
        startConnection();
//        3、建立Statement对象
        try {
            preparedStatement = connection.prepareStatement(sql);
            if (params != null && params.length != 0) {
                for (int i = 0; i < params.length; i++) {
                    preparedStatement.setObject(i + 1, params[i]);
                }
            }

//        4、执行SQL语句（获取结果集）
            resultSet = preparedStatement.executeQuery();
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
//        通过ResultSet拿到最终结果集
            while (resultSet.next()) {
                Map<String, Object> map = new HashMap<>();
//            获取列的值
                for (int i = 0; i < columnCount; i++) {
                    String columnKey = metaData.getColumnName(i + 1);
                    Object columnValue = resultSet.getObject(columnKey);
                    map.put(columnKey, columnValue);
                }
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeAll();
        return list;
    }

    private static void closeAll() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
