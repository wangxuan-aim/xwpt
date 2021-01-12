package xwpt.service;

import xwpt.entity.Task;
import xwpt.entity.UserFetch;
import xwpt.utils.R;

import java.util.List;

public interface TaskService {
    List<Task> findAll(Task task);
    List<Task> findAlltoAdmin();
    List<Task> findtoNotFetch();
    List<Task> myFetchList(int id);
    List<Task> myEndhList(int id);

    Task findTaskByID(String uid);

    R myFetchListToDelete(int userid, String uid);
    R addTask(Task task);
    R deleteByUId(String Uid);
    R fetchTouser(UserFetch userFetch);
    R updateTask(Task task);

    int update(Task task);

    List<Task> findtoNotFetchToType(String types);
}
