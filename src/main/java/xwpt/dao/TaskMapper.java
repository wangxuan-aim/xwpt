package xwpt.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import xwpt.entity.Task;

import java.util.List;

public interface TaskMapper {
    List<Task> findAll(Task task);
    List<Task> findByUid(String uid);
    List<Task> findAlltoAdmin();
    List<Task> findtoNotFetch();
    int addTesk(Task task);
    int deleteByUId(@RequestParam("uid") String uid);
    int updateType(Task task);

    int update(Task task);

    int updateTask(Task task);
}
