package com.bjpowernode.crm.workbench.controller;


import com.bjpowernode.crm.base.bean.EchartsResult;
import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.constants.CrmConstants;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workbench.bean.Transaction;
import com.bjpowernode.crm.workbench.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class TransactionController {

    @Autowired
    private TransactionService transactionService;

    @RequestMapping("/workbench/transaction/queryCustomerName")
    @ResponseBody
    public List<String> queryCustomerName(String customerName){

        List<String> customerNames = transactionService.queryCustomerName(customerName);
        return customerNames;
    }

    //选中阶段获取可能性
    @RequestMapping("/workbench/transaction/queryPossibilityByStage")
    @ResponseBody
    public String queryPossibilityByStage(String stage, HttpSession session){
        Map<String,String> map =
                (Map<String, String>) session.getServletContext().getAttribute("stage2Possibility");
        String possibility = transactionService.queryPossibilityByStage(stage,map);
        return possibility;
    }

    //跳转到交易详情页
    @RequestMapping("/workbench/transaction/queryById")
    public String queryById(String id, Model model){
        Transaction transaction = transactionService.queryById(id);
        model.addAttribute("transaction",transaction);
        return "/workbench/transaction/detail";
    }

    //查询当前交易阶段对应的图标，支持点击交易阶段图片，动态更改当前交易阶段图标内容
    @RequestMapping("/workbench/transaction/queryStage")
    @ResponseBody
    public ResultVo queryStage(Integer index, String id, HttpSession session){
        User user = (User) session.getAttribute(CrmConstants.LOGIN_USER);
        Map<String,String> map =
                (Map<String, String>) session.getServletContext().getAttribute("stage2Possibility");
       ResultVo resultVo = transactionService.queryStage(index,id,map,user);

        return resultVo;
    }

    //制作交易图表
    @RequestMapping("/workbench/transaction/echarts")
    @ResponseBody
    public EchartsResult echarts(){
        EchartsResult echartsResult = transactionService.echarts();
        return echartsResult;
    }
}
