package xwpt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xwpt.entity.TypeNeeds;
import xwpt.service.TypeNeedService;
import xwpt.utils.R;

import java.util.List;

@RestController
@Api(value = "需求类型操作",description = "需求类型字典")
@RequestMapping("/typeNeed")
public class TypeNeedHandler {
    @Autowired
    private TypeNeedService typeNeedService;

    @GetMapping("/findAll")
    @ApiOperation(value = "查找所有类型")
    private List<TypeNeeds> findAll(){
        return typeNeedService.findAll();
    }
    @PostMapping("/addtype")
    @ApiOperation(value = "增加新类型")
    private R addtype(TypeNeeds typeNeeds){
        return typeNeedService.addtype(typeNeeds);
    }
    @PostMapping("/deleteType")
    @ApiOperation(value = "删除类型")
    private R deleteType(String uid){
        return typeNeedService.deleteType(uid);
    }

}
