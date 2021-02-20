package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.base.bean.EchartsResult;
import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import com.bjpowernode.crm.workbench.bean.*;
import com.bjpowernode.crm.workbench.mapper.*;
import com.bjpowernode.crm.workbench.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionMapper transactionMapper;

    @Autowired
    private CompanyMapper companyMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private TransactionHistoryMapper transactionHistoryMapper;

    @Override
    public List<String> queryCustomerName(String customerName) {
        Example example = new Example(Transaction.class);
        example.createCriteria().andLike("name","%" + customerName + "%");
        List<Company> companies = companyMapper.selectByExample(example);
        List<String> customerNames = new ArrayList<>();
        for(Company company : companies){
            customerNames.add(company.getName());
        }
        return customerNames;
    }

    @Override
    public String queryPossibilityByStage(String stage, Map<String, String> map) {
        return map.get(stage);
    }

    @Override
    public Transaction queryById(String id) {
        Transaction transaction = transactionMapper.selectByPrimaryKey(id);
        //处理所有者名称
        User user = userMapper.selectByPrimaryKey(transaction.getOwner());

        transaction.setOwner(user.getName());

        //处理公司名称
        Company company = companyMapper.selectByPrimaryKey(transaction.getCustomerId());
        transaction.setCustomerId(company.getName());

        //处理联系人名字
        Contacts contacts = contactsMapper.selectByPrimaryKey(transaction.getContactsId());
        transaction.setContactsId(contacts.getFullname());

        //处理市场活动名字
        Activity activity = activityMapper.selectByPrimaryKey(transaction.getActivityId());
        transaction.setActivityId(activity.getName());

        //查询交易备注 不写了

        //交易阶段历史
        TransactionHistory transactionHistory = new TransactionHistory();
        transactionHistory.setTranId(id);
        List<TransactionHistory> transactionHistories = transactionHistoryMapper.select(transactionHistory);

        transaction.setTransactionHistories(transactionHistories);
        return transaction;
    }


    @Override
    public ResultVo queryStage(Integer position,String id,
                                                Map<String, String> map,User user) {
        //先根据主键查询当前交易所处阶段及其可能性
        Transaction transaction = transactionMapper.selectByPrimaryKey(id);

        //获取当前交易的阶段
        String currentStage = transaction.getStage();
        //获取当前阶段所对应的可能性
        String currentPossibility = transaction.getPossibility();


        //把map转换成list集合，目的就是为了方便获取每个阶段对应的下标
        List<Map.Entry<String,String>> stageList = new ArrayList<>(map.entrySet());

        ResultVo resultVo = new ResultVo();
        if(position != null){
            //根据页面点击的阶段，把点击的阶段的可能改成当前阶段
            for(int i = 0; i < stageList.size(); i++) {
                if(i == position){
                    currentStage = stageList.get(i).getKey();
                    currentPossibility = stageList.get(i).getValue();
                    //更新数据库阶段和可能性
                    Transaction transaction1 = new Transaction();
                    transaction1.setStage(currentStage);
                    transaction1.setPossibility(currentPossibility);
                    transaction1.setId(id);
                    transactionMapper.updateByPrimaryKeySelective(transaction1);
                    Example e = new Example(null);

                    //添加一条新的交易历史记录
                    TransactionHistory transactionHistory = new TransactionHistory();
                    transactionHistory.setId(UUIDUtil.getUUID());
                    transactionHistory.setTranId(id);
                    transactionHistory.setStage(currentStage);
                    transactionHistory.setMoney(transaction.getMoney());
                    transactionHistory.setExpectedDate(transaction.getExpectedDate());
                    transactionHistory.setCreateTime(DateTimeUtil.getSysTime());
                    transactionHistory.setCreateBy(user.getName());
                    transactionHistory.setPossibility(currentPossibility);
                    transactionHistoryMapper.insert(transactionHistory);
                    resultVo.setT(transactionHistory);
                }
            }
        }


        //定义一个map，返回每次包含的满足条件的所有的阶段图标
       List<Map<String,String>> stagesList = new ArrayList<>();

        //查找出所有阶段第一个可能性为0的那个阶段的索引
        int pointer = 0;
        for(int i = 0; i < stageList.size(); i++) {
            String possibility = stageList.get(i).getValue();
            if("0".equals(possibility)){
                pointer = i;
                break;
            }
        }

        //交易失败的情况，确定前面七个是黑圈，后面两个是x，红x和黑x不能确定
        if("0".equals(currentPossibility)){
            //遍历所有的交易阶段及其可能性
            for(int i = 0; i < stageList.size(); i++){

                Map<String,String> failMap = new HashMap<>();
                String stage = stageList.get(i).getKey();
                String possibility = stageList.get(i).getValue();
                if(possibility.equals("0")){
                    //找到所有阶段中为0的那个阶段的可能性
                    if(currentStage.equals(stage)){
                        //当前阶段是红x,另一个是黑x
                        System.out.println("红x");
                        failMap.put("type","红x");
                        failMap.put("text",stage);
                        failMap.put("possibility",possibility);
                    }else{
                        //黑x
                        System.out.println("黑x");
                        failMap.put("type","黑x");
                        failMap.put("text",stage);
                        failMap.put("possibility",possibility);
                    }
                }else{
                    //七个黑圈
                    System.out.println("黑圈");
                    failMap.put("type","黑圈");
                    failMap.put("text",stage);
                    failMap.put("possibility",possibility);
                }
                failMap.put("index",i+"");
                stagesList.add(failMap);
            }

        }else{
            //交易中状态
            //确定当前交易所处阶段的索引
            int index = 0;
            for(int i = 0; i < stageList.size(); i++) {
                String possibility = stageList.get(i).getValue();
                if(currentPossibility.equals(possibility)){
                    index = i;
                    break;
                }
            }
            //遍历九个阶段
            for(int i = 0; i < stageList.size(); i++) {
                Map<String,String> successMap = new HashMap<>();
                String stage = stageList.get(i).getKey();
                String possibility = stageList.get(i).getValue();
               if(i < index){
                   System.out.println("绿圈");
                   successMap.put("type","绿圈");
                   successMap.put("text",stage);
                   successMap.put("possibility",possibility);
               }else if(i == index){
                   System.out.println("锚点");
                   successMap.put("type","锚点");
                   successMap.put("text",stage);
                   successMap.put("possibility",possibility);
               }else if(i > index && i < pointer){
                   System.out.println("黑圈");
                   successMap.put("type","黑圈");
                   successMap.put("text",stage);
                   successMap.put("possibility",possibility);
               }else{
                   System.out.println("黑x");
                   successMap.put("type","黑x");
                   successMap.put("text",stage);
                   successMap.put("possibility",possibility);
               }
                successMap.put("index",i+"");
                stagesList.add(successMap);
            }
        }
        resultVo.setDataList(stagesList);
        return resultVo;
    }

    @Override
    public EchartsResult echarts() {
        List<Map<String, String>> maps = transactionMapper.queryTransaction();
        //图表的标题
        List<String> titles = new ArrayList<>();
        for (Map<String, String> map : maps) {
            titles.add(map.get("name"));
        }
        EchartsResult echartsResult = new EchartsResult();
        echartsResult.setTitles(titles);
        echartsResult.setMaps(maps);
        return echartsResult;
    }
}
