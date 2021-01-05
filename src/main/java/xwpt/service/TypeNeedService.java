package xwpt.service;

import xwpt.entity.TypeNeeds;
import xwpt.utils.R;

import java.util.List;

public interface TypeNeedService {
    List<TypeNeeds> findAll();
    List<TypeNeeds> findbyid(String uid);
    R addtype(TypeNeeds typeNeeds);
    R deleteType(String uid);
}
