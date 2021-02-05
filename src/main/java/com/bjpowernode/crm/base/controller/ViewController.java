package com.bjpowernode.crm.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;

/**
 * 专门负责页面跳转的Controller
 */
@Controller
public class ViewController {

    @RequestMapping("/testRestful/{name}/{age}/{gender}")
    public void testRestful(
            @PathVariable("name") String name1,
            @PathVariable("age") int age1,
            @PathVariable("gender") String gender1){
        System.out.println("123");

    }

    @RequestMapping({"/toView/{firstView}/{secondView}",
            "/toView/{firstView}/{secondView}/{thirdView}",
            "/toView/{firstView}/{secondView}/{thirdView}/{fourthView}"})
    public String toView(
            @PathVariable(value = "firstView",required = false) String firstView,
            @PathVariable(value = "secondView",required = false) String secondView,
            @PathVariable(value = "thirdView",required = false) String thirdView,
            @PathVariable(value = "fourthView",required = false) String fourthView){

       if(fourthView != null){
           return firstView + File.separator
                   + secondView + File.separator + thirdView + File.separator + fourthView;
       }else if(thirdView != null){
           return firstView + File.separator
                   + secondView + File.separator + thirdView;
       }else if(secondView != null){
           return firstView + File.separator + secondView;
       }else{
           return firstView;
       }
    }


}
