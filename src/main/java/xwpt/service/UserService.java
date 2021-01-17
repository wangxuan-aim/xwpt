package xwpt.service;

import xwpt.entity.User;
import xwpt.utils.R;

import java.util.List;

public interface UserService {
    List<User> findAll();
    R update(String username,String password);
    R addUser(User user);
    List<User> login(String username,String password);
    int getUserName(String username);

    R updateToUser(String uname, int age, String stu, String sex, String username,String sno);

    User findByUser(String username);
}
