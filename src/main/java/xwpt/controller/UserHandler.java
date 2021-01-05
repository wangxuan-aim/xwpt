package xwpt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xwpt.entity.User;
import xwpt.service.UserService;
import xwpt.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@Api(value = "用户操作",description = "管理用户")
@RequestMapping("/user")
public class UserHandler {
    @Autowired
    UserService userService;

    @ApiOperation(value = "获取用户列表")
    @GetMapping("/list")
    private List<User> list(){
        List<User> list = userService.findAll();
        return list;
    }
    @ApiOperation(value = "增加用户")
    @PostMapping("/add")
    private R add(User user){
      return userService.addUser(user);
    }
    @ApiOperation(value = "更改账户密码")
    @PostMapping("/update")
    private R update(@RequestParam("username") String username, @RequestParam("password")String password){
        return userService.update(username,password);
    }

    @ApiOperation(value = "更改账户信息")
    @RequestMapping("/updateToUser")
    private R updateToUser(@RequestParam("uname") String uname,@RequestParam("sno") String sno, @RequestParam("age")int age, @RequestParam("stu")String stu, @RequestParam("sex")String sex,@RequestParam("password")String password, HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("xwptU");
        if(!"".equals(username)){
            return userService.updateToUser(uname,age,stu,sex,username,sno,password);
        }
        else
            return R.error("当前登录信息失效");
    }
    @ApiOperation(value = "获取用户数据")
    @RequestMapping("/findByUser")
    private User findByUser(HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("xwptU");
        if(!"".equals(username)){
            return userService.findByUser(username);
        }
        else
            return null;
    }
}
