package xwpt.dao;

import xwpt.entity.UserFetch;

import java.util.List;

public interface FetchTaskMapper {
    int add(UserFetch userFetch);
    List<UserFetch> findAll(UserFetch fetchs);

    int deleteToUserIdAndTaslId(int userid, String uid);
}
