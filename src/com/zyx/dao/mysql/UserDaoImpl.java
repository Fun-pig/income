package com.zyx.dao.mysql;
import com.zyx.model.User;


import com.zyx.dao.UserDao;
import com.zyx.util.DBUtil;

import java.util.List;
import java.util.Map;

/**
 * Created by Ethel_oo on 2019/10/10.
 */
public class UserDaoImpl implements UserDao {
    @Override
    public List<Map<String, Object>> selectByUsername(String username) {
        String sql = "select * from user where username = ?";
        return DBUtil.select(sql, username);
    }
    @Override
    public List<Map<String, Object>> selectUserByUsernameAndPassword(String username, String password) {
        String sql ="select * from user where username = ? and password = ?";
        return DBUtil.select(sql, username, password);
    }
    @Override
    public int addUser(User user) {
        String sql = "insert into user(id, username, password) values (?, ?, ?)";
        return DBUtil.update(sql, user.getId(), user.getUsername(), user.getPassword());
    }


}
