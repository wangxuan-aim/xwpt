package xwpt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xwpt.dao.UserMapper;
import xwpt.entity.User;
import xwpt.service.UserService;
import xwpt.utils.R;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    public List<User> findAll(){
        List<User> list = userMapper.queryAll();
        return list;
    }

    @Override
    public R update(String username, String password) {
       int i = userMapper.update(username,password);
       if(i>0){
           return R.ok();
       }else return R.error();
    }

    @Override
    public R addUser(User user) {
        User users = userMapper.queryByUserName(user.getUsername());
        if(users!=null){
            return R.error("该账号已存在");
        }else {
            int i = userMapper.addUser(user);
            if(i>0){
                return R.ok();
            }else {
                return R.error();
            }
        }
    }

    @Override
    public List<User> login(String username, String password) {
        List<User> list = userMapper.login(username,password);
        return list;
    }

    @Override
    public int getUserName(String username) {
        User users = userMapper.queryByUserName(username);
        if(users!=null){
            return 1;
        }else {
        return 0;
        }
    }

    @Override
    public R updateToUser(String uname, int age, String stu, String sex, String username,String sno,String  password) {
        User users = userMapper.queryByUserName(username);
        users.setUname(uname);
        users.setAge(age);
        users.setStu(stu);
        users.setSex(sex);
        users.setSno(sno);
        if(password!=null){
            if(!"".equals(password)){
               users.setPassword(password);
            }
        }
        int i = userMapper.updateToUser(users);
        if(i>0){
            return R.ok();
        }else return R.error();
    }

    @Override
    public User findByUser(String username) {
        return userMapper.queryByUserName(username);
    }
}
