package xwpt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import xwpt.entity.Task;
import xwpt.entity.User;
import xwpt.entity.UserFetch;
import xwpt.service.TaskService;
import xwpt.service.UserService;
import xwpt.utils.R;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@Api(value = "任务管理",description = "任务管理")
@RequestMapping("/task")
public class TaskHandler {
    @Autowired
    TaskService taskService;

    @Autowired
    UserService userService;
    @ApiOperation(value = "我创建的任务")
    @GetMapping("/mycreat")
    private List<Task> findTask(@RequestParam("types") String types,HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        Task task = new Task();
        task.setSno(user.getSno());
        task.setTypes(types);
       return taskService.findAll(task);
    }


    @ApiOperation(value = "查找所有未接取任务")
    @GetMapping("/findtoNotFetch")
    private List<Task> findAlltoNotEnd(@RequestParam String types){
        if(types==null||types==""){
            return taskService.findtoNotFetch();
        }
        else
            return taskService.findtoNotFetchToType(types);
    }

    @ApiOperation(value = "接取任务")
    @PostMapping("/fetchTouser")
    private R fetchTouser(@RequestParam("uid") String uid,HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        UserFetch userFetch = new UserFetch();
        userFetch.setUserId(String.valueOf(user.getId()));
        userFetch.setTaskId(uid);
        return taskService.fetchTouser(userFetch);
    }
    @ApiOperation(value = "查找任务")
    @GetMapping("/findTaskByID")
    private Task findTaskByID(@RequestParam("uid") String uid){
        return taskService.findTaskByID(uid);
    }

    @ApiOperation(value = "修改接取任务状态")
    @PostMapping("/myFetchListToUpdate")
    private R myFetchListToUpdate(@RequestParam("type") String type,@RequestParam("uid") String uid,HttpServletRequest req){
       Task task = new Task();
       task.setTypes(type);
       task.setUid(uid);
        int i = taskService.update(task);
        return R.ok();
    }

    @ApiOperation(value = "我接取的任务")
    @GetMapping("/myFetchList")
    private List<Task>  myFetchList(HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        return taskService.myFetchList(user.getId());
    }
    @ApiOperation(value = "我完成的任务")
    @GetMapping("/myFetchListToEnd")
    private List<Task>  myFetchListToEnd(HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        return taskService.myEndhList(user.getId());
    }
    @ApiOperation(value = "取消接取的任务")
    @GetMapping("/myFetchListToDelete")
    private R myFetchListToDelete(HttpServletRequest req,@RequestParam("uid") String uid){
        String username = (String) req.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        return taskService.myFetchListToDelete(user.getId(),uid);
    }
    @ApiOperation(value = "修改任务信息")
    @PostMapping("/updateTask")
    private R updateTask(@RequestParam("uid") String uid,@RequestParam("describes") String describes,@RequestParam("demand") String demand,@RequestParam("remuneration") String remuneration,@RequestParam("critetime") String critetime,@RequestParam("endtime") String endtime,@RequestParam("demandtype") String demandtype,@RequestParam("types") String types){
        Task task = new Task();
        task.setDescribes(describes);
        task.setDemand(demand);
        task.setRemuneration(remuneration);
        task.setCritetime(critetime);
        task.setEndtime(endtime);
        task.setDemandtype(demandtype);
        task.setTypes(types);
        task.setUid(uid);
        return taskService.updateTask(task);
    }

    @ApiOperation(value = "管理员查找所有需求")
    @GetMapping("/findAlltoAdmin")
    private List<Task> findAlltoAdmin(HttpServletRequest req){
        return taskService.findAlltoAdmin();
    }
    @ApiOperation(value = "新增需求")
    @PostMapping("/addTask")
    private R addTask(@RequestParam("describes") String describes,@RequestParam("demand") String demand,@RequestParam("remuneration") String remuneration,@RequestParam("critetime") String critetime,@RequestParam("endtime") String endtime,@RequestParam("demandtype") String demandtype,@RequestParam("types") String types,HttpServletRequest request){
        Task task = new Task();
        task.setDescribes(describes);
        task.setDemand(demand);
        task.setRemuneration(remuneration);
        task.setCritetime(critetime);
        task.setEndtime(endtime);
        task.setDemandtype(demandtype);
        task.setTypes(types);
        String username = (String) request.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        task.setSno(user.getSno());
        return taskService.addTask(task);
    }
    @ApiOperation(value = "删除需求信息")
    @PostMapping("/deleteByUId")
    private R deleteByUId(@RequestParam("uid") String uid){
        return taskService.deleteByUId(uid);
    }
}
