package xwpt.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import xwpt.entity.LostFound;
import xwpt.entity.User;
import xwpt.service.LostFoundService;
import xwpt.service.UserService;
import xwpt.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@Api(value = "失物招领",description = "失物招领")
@RequestMapping("/LostFound")
public class LostFoundHandler {
    @Autowired
    LostFoundService lostFoundService;
    @Autowired
    UserService userService;

    @ApiOperation(value = "丢失/捡取登记")
    @RequestMapping("/pickAndLost")
    private R pickAndLost(@RequestParam("describes")String describes,@RequestParam("title")String title, @RequestParam("type") String type,HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("xwptU");
        User user = userService.findByUser(username);
        LostFound lostFound = new LostFound();
        lostFound.setDescription(describes);
        lostFound.setType(type);
        lostFound.setCreatdate(String.valueOf(System.currentTimeMillis()));
        lostFound.setTitle(title);
        lostFound.setCreatuser(String.valueOf(user.getId()));
        return lostFoundService.addPickAndLost(lostFound);
}

    @ApiOperation(value = "丢失/捡取信息列表")
    @RequestMapping("/pickAndLostList")
    private List<LostFound> pickAndLostList(){
        List<LostFound> list = lostFoundService.findAll();;
        for(int i=0;i<list.size();i++){
            String types = list.get(i).getType();
            if("1".equals(types)){
                list.get(i).setType("捡取");
            }
            if("2".equals(types)){
                list.get(i).setType("遗失");
            }
            String creat = list.get(i).getCreatdate();
            String thetime = String.valueOf(System.currentTimeMillis());
            Double creat1 = Double.valueOf(thetime);
            Double thetime1 = Double.valueOf(creat);
            Double s =(creat1-thetime1)/60000;
            String time = "";
            if(s>1){
                time = String.valueOf(s).substring(0,String.valueOf(s).indexOf("."))+"分钟前";
            }
            if(s<1){
                time = "刚才";
            }
            list.get(i).setCreatdate(time);
        }
    return list;
    }
}
