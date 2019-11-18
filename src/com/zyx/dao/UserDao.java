package com.zyx.dao;
import com.zyx.model.User;
import java.util.List;
import java.util.Map;

/**
 * Created by Ethel_oo on 2019/10/10.
 */
public interface UserDao {
    /**
     * 用户模块——查询用户名并返回user数据
     * @param username
     * @return List<Map<String, Object>>
     */
    List<Map<String, Object>> selectByUsername(String username);

    /**
     * 用户模块——登录
     * @param username
     * @param password
     * @return
     */
    List<Map<String, Object>> selectUserByUsernameAndPassword(String username, String password);

    /**
     * 用户模块——注册
     * @param user
     * @return
     */
    int addUser(User user);

}
