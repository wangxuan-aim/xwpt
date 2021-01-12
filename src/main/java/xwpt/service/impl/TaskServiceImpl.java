package xwpt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xwpt.dao.FetchTaskMapper;
import xwpt.dao.TaskMapper;
import xwpt.entity.Task;
import xwpt.entity.UserFetch;
import xwpt.service.TaskService;
import xwpt.utils.R;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class TaskServiceImpl implements TaskService {
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    FetchTaskMapper fetchTaskMapper;
    @Override
    public List<Task> findAll(Task task) {
        return taskMapper.findAll(task);
    }

    @Override
    public List<Task> findAlltoAdmin() {
        return taskMapper.findAlltoAdmin();
    }

    @Override
    public List<Task> findtoNotFetch() {
        return taskMapper.findtoNotFetch();
    }

    @Override
    public R addTask(Task task) {
        Date date = new Date();
        long ctrat = (date.getTime())/1000;
        task.setCreatDate(String.valueOf(ctrat));
        int i = taskMapper.addTesk(task);
        if(i>0){
            return R.ok();
        }
       else return R.error();
    }

    @Override
    public R deleteByUId(String Uid) {
        List<Task> tasks = taskMapper.findByUid(Uid);
        if(tasks.size()>0){
            int i = taskMapper.deleteByUId(Uid);
            if(i>0){
                return R.ok();
            }else {
                return R.error();
            }
        }else {
            return R.error("该信息不存在");
        }

    }

    @Override
    public R fetchTouser(UserFetch userFetch) {
        List<Task> tasks = taskMapper.findByUid(userFetch.getTaskId());
        Task task =  tasks.get(0);
        task.setTypes("2");
        int i = taskMapper.updateType(task);
        if(i==0){
            return R.error("任务状态更改失败");
        }
        else {
            int s = fetchTaskMapper.add(userFetch);
            if(s>0){
                return R.ok("接取成功");
            }else {
                return R.error("创建任务失败");
            }
        }
    }

    @Override
    public R updateTask(Task task) {
        int i = taskMapper.updateTask(task);
        if(i>0){
            return R.ok();
        }else {
            return R.error();
        }
    }

    @Override
    public List<Task> myFetchList(int id) {
        List<Task> tasks = new ArrayList<>();
        UserFetch fetchs = new UserFetch();
        fetchs.setUid(String.valueOf(id));
        List<UserFetch> userFetches = fetchTaskMapper.findAll(fetchs);
        for(int i=0;i<userFetches.size();i++){
            String taskId = userFetches.get(i).getTaskId();
            List<Task>  task = taskMapper.findByUid(taskId);
            if(task.size()==1){
                if("2".equals(task.get(0).getTypes())){
                    tasks.add(task.get(0));
                }

            }else{
                for(int s=0;s<task.size();s++){
                    if("2".equals(task.get(s).getTypes())){
                        tasks.add(task.get(s));
                    }
                }
            }
        }
        return tasks;
    }

    @Override
    public int update(Task task) {
        return taskMapper.update(task);
    }

    @Override
    public List<Task> findtoNotFetchToType(String types) {
        return taskMapper.findtoNotFetchToType(types);
    }

    @Override
    public List<Task> myEndhList(int id) {

        List<Task> tasks = new ArrayList<Task>();
        UserFetch fetchs = new UserFetch();
        fetchs.setUid(String.valueOf(id));
        List<UserFetch> userFetches = fetchTaskMapper.findAll(fetchs);
        for(int i=0;i<userFetches.size();i++){
            String taskId = userFetches.get(i).getTaskId();
            List<Task>  task = taskMapper.findByUid(taskId);
            if(task.size()>0){
                if("3".equals(task.get(0).getTypes())){
                    if(task.size()==1){
                        tasks.add(task.get(0));
                    }else{
                        for(int s=0;s<task.size();s++){
                            tasks.add(task.get(s));
                        }
                    }
                }
            }
        }
        return tasks;

    }

    @Override
    public R myFetchListToDelete(int userid, String uid) {
        int i = fetchTaskMapper.deleteToUserIdAndTaslId(userid,uid);
        Task task = new Task();
        task.setUid(uid);
        task.setTypes("1");
        int s = taskMapper.update(task);
       if(i>0&&s>0){
           return R.ok();
       }else if(i==0&&s>0){
           return R.error("删除失败");
       }else if(s==0&&i>0){
           return R.error("任务状态更改失败");
       }else {
           return R.error();
       }
    }

    @Override
    public Task findTaskByID(String uid) {
        return taskMapper.findByUid(uid).get(0);
    }
}
