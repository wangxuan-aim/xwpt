package xwpt.dao;

import java.util.List;
import xwpt.entity.LostFound;

public interface LostFoundMapper {
    int deleteByPrimaryKey(String id);

    int insert(LostFound record);

    LostFound selectByPrimaryKey(String id);

    List<LostFound> selectAll();

    int updateByPrimaryKey(LostFound record);
}