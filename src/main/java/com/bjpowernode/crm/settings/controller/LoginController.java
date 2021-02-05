package com.bjpowernode.crm.settings.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    //跳转到登录页面
    @RequestMapping({"/","/index","/home"})
    public String toLogin(){
        return "../login";
    }

  /*  @RequestMapping("/toLogin1")
    public String toLogin1(){
        return "forward:/toTest";
    }

    @RequestMapping("/toTest")
    public String toTest(){
        return "../settings/test";
    }*/
}
