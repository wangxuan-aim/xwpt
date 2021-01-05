package xwpt.controller;


import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import xwpt.entity.User;
import xwpt.service.UserService;
import xwpt.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class LoginAndSignHandler {
    @Autowired
    UserService userService;
    @ApiOperation(value = "登录")
    @RequestMapping("/login")
    private R login(@RequestParam("username")String username, @RequestParam("password") String password, HttpServletRequest request){
        List<User> list = userService.login(username,password);
        if(list.size()==0){
            return R.error("账号名或密码错误");
        }else {
            request.getSession().setAttribute("xwptU",username);
            request.getSession().setAttribute("xwptP",password);
            String sd = (String) request.getSession().getAttribute("xwptU");
            String s = (String) request.getSession().getAttribute("xwptP");
            return R.ok();
        }
    }

    @ApiOperation(value = "注册")
    @RequestMapping("/sign")
    private R sign(@RequestParam("username")String username, @RequestParam("password") String password, HttpServletRequest request){
        int u = userService.getUserName(username);
        if(u==0){
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            R i = userService.addUser(user);
            return i;
        }else {
            return R.error("该账号已存在");
        }
    }

    @ApiOperation(value = "注销")
    @RequestMapping("/logOut")
    private R logOut(HttpServletRequest request){
        request.getSession().removeAttribute("xwptU");
        request.getSession().removeAttribute("xwptP");
        String sd = (String) request.getSession().getAttribute("xwptU");
        String s = (String) request.getSession().getAttribute("xwptP");
        if(s==null&&sd==null){
            return R.ok();
        }else {
            return R.error();
        }
    }
}
