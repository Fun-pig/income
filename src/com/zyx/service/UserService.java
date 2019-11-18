package com.zyx.service;

import com.zyx.dao.UserDao;
import com.zyx.dao.mysql.UserDaoImpl;
import com.zyx.model.User;
import java.util.List;
import java.util.Map;

/**
 * Created by Ethel_oo on 2019/10/10.
 */
public class UserService {
    /**
     * 用户模块——查询用户名是否存在
     * @param username
     * @return boolean
     */
    public boolean selectByUsername(String username) {
        UserDao userDao = new UserDaoImpl();
        List<Map<String, Object>> userList = userDao.selectByUsername(username);
        if (userList != null && userList.size() != 0) {
            return true;
        }
        return false;
    }

    /**
     * 用户模块——登录账号
     * @param username
     * @param password
     * @return List<Map<String, Object>>
     */
    public List<Map<String, Object>> login(String username, String password) {
        UserDao userDao = new UserDaoImpl();
        return userDao.selectUserByUsernameAndPassword(username, password);
    }

    /**
     * 用户模块——注册用户
     * @param user
     * @return User
     */
    public int addUser(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.addUser(user);
    }
}
