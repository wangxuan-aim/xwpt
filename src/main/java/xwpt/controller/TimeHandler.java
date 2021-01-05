package xwpt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xwpt.utils.R;

import java.io.File;

@RestController
@EnableScheduling
@Configuration
@Api(value = "时间管理",description = "时间管理")
@RequestMapping("/time")
public class TimeHandler {
    @GetMapping("/deleteFile")
    @ApiOperation(value = "定时删除文件")
    @Scheduled(fixedRate=15000)
    private R deleteFile(){
    String path = "E:\\新建文件夹//新建 DOC 文档.doc";
        File file = new File(path);
        Boolean b = file.exists();
        if(b){
            if(file.delete()){
                return R.ok();
            }
            else {
                return R.error();
            }

        }
        else {
            return R.error();
        }
    }
}
