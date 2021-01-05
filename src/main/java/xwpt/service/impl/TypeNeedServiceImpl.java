package xwpt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xwpt.dao.TypeNeedsMapper;
import xwpt.entity.TypeNeeds;
import xwpt.service.TypeNeedService;
import xwpt.utils.R;

import java.util.List;
@Service
public class TypeNeedServiceImpl implements TypeNeedService {
    @Autowired
    TypeNeedsMapper typeNeedsMapper;
    @Override
    public List<TypeNeeds> findAll() {
        return typeNeedsMapper.findAll();
    }

    @Override
    public List<TypeNeeds> findbyid(String uid) {
        return typeNeedsMapper.findbyid(uid);
    }

    @Override
    public R addtype(TypeNeeds typeNeeds) {
        int i = typeNeedsMapper.addtype(typeNeeds);
        if(i>0){
            return R.ok();
        }else return R.error();
    }

    @Override
    public R deleteType(String uid) {
        List<TypeNeeds> typeNeeds= typeNeedsMapper.findbyid(uid);
        if(typeNeeds.size()>0){
            int i = typeNeedsMapper.deleteType(uid);
            if(i>0){
                return R.ok();
            }
            else return R.error();
        }else {
            return R.error("该类型不存在");
        }
    }
}
