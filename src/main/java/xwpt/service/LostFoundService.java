package xwpt.service;

import xwpt.entity.LostFound;
import xwpt.utils.R;

import java.util.List;

public interface LostFoundService {
    R addPickAndLost(LostFound lostFound);

    List<LostFound> findAll();
}
