package xwpt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xwpt.dao.LostFoundMapper;
import xwpt.entity.LostFound;
import xwpt.service.LostFoundService;
import xwpt.utils.R;

import java.util.List;

@Service
@Transactional
public class LostFoundServiceImpl implements LostFoundService {
    @Autowired
    LostFoundMapper lostFoundMapper;
    @Override
    public R addPickAndLost(LostFound lostFound) {
        int i = lostFoundMapper.insert(lostFound);
        if(i>0){
            return R.ok();
        }else {
            return R.error();
        }
    }

    @Override
    public List<LostFound> findAll() {
        return lostFoundMapper.selectAll();
    }
}
