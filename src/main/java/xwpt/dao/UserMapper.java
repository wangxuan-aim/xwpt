package xwpt.dao;

import org.apache.ibatis.annotations.Param;
import xwpt.entity.User;

import java.util.List;

public interface UserMapper {
    User queryById(long id);
    User queryByUserName(String username);
    List<User> queryAll();
    /**
     * 修改用户
     * @return 如果影响行数等于>1，表示更新的记录行数
     */
    int update(@Param("username")String username,@Param("password")String password);

    int addUser(User user);

    int deleteId(@Param("id") int id);

    List<User> login(@Param("username") String username, @Param("password") String password);

    int updateToUser(User users);
}
