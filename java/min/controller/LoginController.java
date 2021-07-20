package min.controller;

import min.entity.User;
import min.service.UserService;
import min.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login")
    public String adminLogin(String adminNumber, String adminPwd, HttpSession httpSession) {
        Map<String,String> map = new HashMap<String,String>();
        map.put("adminNumber", adminNumber);
        map.put("adminPwd", adminPwd);
        User user = userService.selectAdmin(map);
        if(user != null) {
            httpSession.setAttribute("user", user);
            //httpSession.setMaxInactiveInterval(1800);  //默认存在半个小时  设置回话存在时长 秒单位
            httpSession.setAttribute("imgPath", Message.IMG_PATH);
            return "index";
        }else {
            httpSession.setAttribute("Login_error", Message.LOGIN_FAILED_MSG);
            httpSession.setMaxInactiveInterval(1);   //设置该消息存在一秒，显示后下次访问页面即消失
            // return "redirect:/login";
            return "login";
        }
    }

}
