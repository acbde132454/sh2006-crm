package com.bjpowernode.crm.base.controller;

import com.bjpowernode.crm.base.bean.DictionaryValue;
import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DictionaryController {

    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("/dictionary/dictionaryValuesList")
    @ResponseBody
    public ResultVo<DictionaryValue> dictionaryValuesList(){
        ResultVo resultVo = new ResultVo();
        List<DictionaryValue>  dictionaryValues =
                dictionaryService.dictionaryValuesList();
        resultVo.setDataList(dictionaryValues);
        return resultVo;
    }

    //异步查询选中的字典种类的排序最大值
    @RequestMapping("/dictionary/queryDictionTypeByCode")
    @ResponseBody
    public DictionaryValue queryDictionTypeByCode(String typeCode){
        ResultVo resultVo = new ResultVo();
        DictionaryValue dictionaryValue = dictionaryService.queryDictionTypeByCode(typeCode);
        return dictionaryValue;
    }

    //保存字典值
    @RequestMapping("/dictionary/saveDictionaryValue")
    public String saveDictionaryValue(DictionaryValue dictionaryValue){
        dictionaryService.saveDictionaryValue(dictionaryValue);
        return "forward:/toView/settings/dictionary/value/index";
    }

}
