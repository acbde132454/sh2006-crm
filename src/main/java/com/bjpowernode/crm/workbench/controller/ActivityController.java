package com.bjpowernode.crm.workbench.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.constants.CrmConstants;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workbench.bean.Activity;
import com.bjpowernode.crm.workbench.bean.ActivityRemark;
import com.bjpowernode.crm.workbench.service.ActivityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    //异步查询所有市场活动信息,还有列表的条件查询
    @RequestMapping("/workbench/activity/activityList")
    @ResponseBody
    public ResultVo activityList(@RequestParam(defaultValue = "1") int page,
                                 int pageSize,Activity activity){
        //limit a,b a:当前页 b:每页记录数
        PageHelper.startPage(page, pageSize);
        List<Activity> activityList = activityService.activityList(activity);

        PageInfo<Activity> activityPageInfo = new PageInfo<>(activityList);

        ResultVo resultVo = new ResultVo();
        resultVo.setDataList(activityPageInfo.getList());
        resultVo.setPageInfo(activityPageInfo);
        return resultVo;
    }

    //添加或者修改市场活动
    @RequestMapping("/activity/createOrUpdateActivity")
    @ResponseBody
    public ResultVo createOrUpdateActivity(Activity activity, HttpSession session){

        ResultVo resultVo = new ResultVo();
        //从session中获取登录用户
        User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
        try {
            boolean updateOrAdd = activityService.createOrUpdateActivity(activity,user);
            resultVo.setOk(true);
            if(updateOrAdd){
                resultVo.setMessage("添加市场活动成功");
            }else{
                resultVo.setMessage("修改市场活动成功");
            }

        } catch (CrmException e) {
            resultVo.setOk(false);
            if(e.getCrmEnum().getCode().equals("002-001")){
                resultVo.setMessage("添加市场活动失败");
            }else if(e.getCrmEnum().getCode().equals("002-002")){
                resultVo.setMessage("修改市场活动失败");
            }

        }
        return resultVo;
    }

    //根据主键查询市场活动
    @RequestMapping("/workbench/activity/queryById")
    @ResponseBody
    public Activity queryById(String id){
        Activity activity = activityService.queryById(id);
        return activity;
    }

    //批量删除市场活动
    @RequestMapping("/workbench/activity/deleteBatch")
    @ResponseBody
    public ResultVo deleteBatch(String ids){
        ResultVo resultVo = new ResultVo();
        try {
            activityService.deleteBatch(ids);
            resultVo.setOk(true);
            resultVo.setMessage("删除市场活动成功");
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("删除市场活动失败");
        }
        return resultVo;
    }

    //查询市场活动详情，跳转到详情页
    @RequestMapping("/workbench/activity/queryDetail")
    public String queryDetail(String id, Model model,HttpSession session){
        Activity activity = activityService.queryDetail(id);
        List<User> users = (List<User>) session.getServletContext().getAttribute("users");
        for (User user : users) {
            if(activity.getOwner().equals(user.getId())){
                activity.setOwner(user.getName());
            }
        }
        model.addAttribute("activity",activity);
        return "activity/detail";
    }

    //异步更新市场活动备注
    @RequestMapping("/workbench/activity/updateRemark")
    @ResponseBody
    public ResultVo<ActivityRemark> updateRemark(ActivityRemark activityRemark,HttpSession session){
        ResultVo<ActivityRemark> resultVo = new ResultVo();
        try {
            User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
            activityRemark.setEditBy(user.getName());
            activityService.updateRemark(activityRemark);
            resultVo.setOk(true);
            resultVo.setMessage("更新市场活动备注成功");
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("更新市场活动备注失败");
        }
        return resultVo;
    }

    //异步添加市场活动备注
    @RequestMapping("/workbench/activity/saveActivityRemark")
    @ResponseBody
    public ResultVo<ActivityRemark> saveActivityRemark(ActivityRemark activityRemark,HttpSession session){
        ResultVo<ActivityRemark> resultVo = new ResultVo();
        try {
            User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
            activityRemark.setCreateBy(user.getName());
            activityRemark = activityService.saveActivityRemark(activityRemark);
            resultVo.setOk(true);
            resultVo.setMessage("添加市场活动备注成功");
            resultVo.setT(activityRemark);
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("添加市场活动备注失败");
        }
        return resultVo;

    }

    //异步删除市场活动备注
    @RequestMapping("/workbench/activity/deleteRemark")
    @ResponseBody
    public ResultVo<ActivityRemark> deleteRemark(String id){
        ResultVo<ActivityRemark> resultVo = new ResultVo();
        try {
           activityService.deleteRemark(id);
            resultVo.setOk(true);
            resultVo.setMessage("删除市场活动备注成功");
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("删除市场活动备注失败");
        }
        return resultVo;

    }
}
