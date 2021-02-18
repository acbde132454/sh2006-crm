package com.bjpowernode.crm.workbench.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.workbench.bean.Activity;
import com.bjpowernode.crm.workbench.bean.Clue;
import com.bjpowernode.crm.workbench.bean.Transaction;
import com.bjpowernode.crm.workbench.service.ClueService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClueController {

    @Autowired
    private ClueService clueService;


    //查询列表和条件查询
    @RequestMapping("/clue/clueList")
    @ResponseBody
    public ResultVo<Clue> clueList(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "2") Integer pageSize,
            Clue clue){
        PageHelper.startPage(page,pageSize);
        List<Clue> clueList = clueService.clueList(clue);
        PageInfo<Clue> pageInfo = new PageInfo<>(clueList);
        ResultVo resultVo = new ResultVo();
        resultVo.setDataList(pageInfo.getList());
        return resultVo;
    }

    @RequestMapping("/workbench/clue/clueDetail")
    public String clueDetail(String id, Model model){
        Clue clue = clueService.clueDetail(id);
        model.addAttribute("clue",clue);
        return "workbench/clue/detail";
    }

    //从线索详情页跳转到转换页面
    @RequestMapping("/workbench/clue/queryById")
    public String queryById(String id, Model model){
        Clue clue = clueService.clueDetail(id);
        model.addAttribute("clue",clue);
        return "workbench/clue/convert";
    }

    //解除市场活动和线索
    @RequestMapping("/workbench/clue/unbind")
    @ResponseBody
    public ResultVo unbind(String clueId,String activityId){
        ResultVo resultVo = new ResultVo();
        try {
            clueService.unbind(clueId,activityId);
            resultVo.setOk(true);
            resultVo.setMessage("解绑成功");
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("解绑失败");
            e.printStackTrace();
        }
        return resultVo;
    }

    //异步查询市场活动
    @RequestMapping("/workbench/clue/queryActivityByName")
    @ResponseBody
    public List<Activity> queryActivityByName(String id,String name){
        List<Activity> activities = clueService.queryActivityByName(id,name);
        return activities;
    }

    //关联市场活动
    @RequestMapping("/workbench/clue/bind")
    @ResponseBody
    public ResultVo bind(String id,String ids){
        ResultVo resultVo = new ResultVo();
        try {
            List<Activity> activities = clueService.bind(id,ids);
            resultVo.setOk(true);
            resultVo.setMessage("绑定成功");
            resultVo.setDataList(activities);
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("绑定失败");
            e.printStackTrace();
        }
        return resultVo;
    }

    //线索转换功能
    @RequestMapping("/workbench/clue/convert")
    @ResponseBody
    public ResultVo convert(String id, String isCreateTransaction, Transaction transaction){
        ResultVo resultVo = new ResultVo();
        try{
            clueService.convert(id,isCreateTransaction,transaction);
            resultVo.setOk(true);
            resultVo.setMessage("线索转换成功");
        }catch (CrmException e){
            resultVo.setOk(true);
            resultVo.setMessage("线索转换失败");
        }
       return resultVo;
    }
}
