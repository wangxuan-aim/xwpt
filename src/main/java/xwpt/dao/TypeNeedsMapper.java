package xwpt.dao;

import xwpt.entity.TypeNeeds;

import java.util.List;

public interface TypeNeedsMapper {
     List<TypeNeeds> findAll();
     List<TypeNeeds> findbyid(String uid);
     int addtype(TypeNeeds typeNeeds);
     int deleteType(String uid);
}
