package com.zyx.demo;

import com.zyx.model.User;
import com.zyx.util.DBUtil;

import java.util.List;
import java.util.Map;

/**
 * Created by Ethel_oo on 2019/9/12.
 */
public class DBUtilDemo {
    public static int addUser(User user) {
        String sql = "insert into user(id, username, password) values (?, ?, ?)";
        return DBUtil.update(sql, user.getId(), user.getUsername(), user.getPassword());
    }

    public static int deleteUserById(String id) {
        String sql = "delete from user where id = ?";
        return DBUtil.update(sql, id);
    }

    public static int updateUser(User user) {
        /*修改id为001的用户的密码，改为000000*/
        String sql = "update user set password = ? where id = ?";
        return DBUtil.update(sql, user.getPassword(), user.getId());
    }

    public static List<Map<String, Object>> selectAllUser() {
        String sql ="select * from user where username=? and password=?";
        return DBUtil.select(sql, "admin", "123");
    }

    public static void main(String[] args) {
        List<Map<String, Object>> userList = selectAllUser();
        System.out.println();
    }
}
