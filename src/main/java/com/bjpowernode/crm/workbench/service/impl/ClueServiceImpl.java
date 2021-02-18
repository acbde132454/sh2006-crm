package com.bjpowernode.crm.workbench.service.impl;

import cn.hutool.core.util.StrUtil;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import com.bjpowernode.crm.workbench.bean.*;
import com.bjpowernode.crm.workbench.mapper.*;
import com.bjpowernode.crm.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {

    @Autowired
    private ClueMapper clueMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private CompanyMapper companyMapper;

    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private CompanyRemarkMapper companyRemarkMapper;

    @Autowired
    private ContactsRemarkMapper contactsRemarkMapper;

    @Autowired
    private ContactsActivityRelationMapper contactsActivityRelationMapper;

    @Autowired
    private TransactionMapper transactionMapper;

    @Autowired
    private TransactionRemarkMapper transactionRemarkMapper;

    @Autowired
    private TransactionHistoryMapper transactionHistoryMapper;

    @Autowired
    private ClueRemarkMapper clueRemarkMapper;


    @Override
    public List<Clue> clueList(Clue clue) {
        Example example = new Example(Clue.class);
        Example.Criteria criteria = example.createCriteria();

        if(StrUtil.isNotEmpty(clue.getFullname())){
            //拼接名字条件
            criteria.andLike("fullname","%" + clue.getFullname() + "%");
        }
        if(StrUtil.isNotEmpty(clue.getCompany())){
            //拼接公司名字条件
            criteria.andLike("company","%" + clue.getCompany() + "%");
        }

        if(StrUtil.isNotEmpty(clue.getPhone())){
            //拼接公司电话条件
            criteria.andLike("phone","%" + clue.getPhone() + "%");
        }

        if(StrUtil.isNotEmpty(clue.getSource())){
            //拼接线索来源条件
            criteria.andEqualTo("source",clue.getSource());
        }

        /**
         * 拼接所有者条件
         * 1、先根据用户输入的用户姓名查询用户表的所有信息
         * 2、把用户的主键放入集合中(线索表中的满足条件的owner)
         * 3、在clue表中查询线索信息
         * where id in(1,2,3)
         * where id = 1 or id = 2 or id = 3
         */
        if(StrUtil.isNotEmpty(clue.getOwner())){
            //拼接线索来源条件
            Example e = new Example(User.class);
            e.createCriteria().andLike("name","%" + clue.getOwner() + "%");
            List<User> users = userMapper.selectByExample(e);
            if(users.size() > 0){
                for (User user : users) {
                    criteria.orEqualTo("owner",user.getId());
                }
            }else{
                criteria.orEqualTo("owner","");
            }

        }

        if(StrUtil.isNotEmpty(clue.getMphone())){
            //拼接联系人手机号条件
            criteria.andLike("mphone","%" +clue.getMphone() + "%");
        }
        if(StrUtil.isNotEmpty(clue.getState())){
            //拼接线索状态条件
            criteria.andEqualTo("state",clue.getState());
        }
        List<Clue> clueList = clueMapper.selectByExample(example);
        for (Clue c : clueList) {
            //取出clue的所有者
            User user = userMapper.selectByPrimaryKey(c.getOwner());
            c.setOwner(user.getName());
        }
        return clueList;
    }

    @Override
    public Clue clueDetail(String id) {
        Clue clue = clueMapper.selectByPrimaryKey(id);
        User user = userMapper.selectByPrimaryKey(clue.getOwner());
        clue.setOwner(user.getName());
        //查询中间表
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        clueActivityRelation.setClueId(id);
        List<ClueActivityRelation> clueActivityRelations =
                clueActivityRelationMapper.select(clueActivityRelation);
        List<Activity> activityList = new ArrayList<>();
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            Activity activity = activityMapper.selectByPrimaryKey(activityRelation.getActivityId());
            //查询市场活动所有者名称
            user = userMapper.selectByPrimaryKey(activity.getOwner());
            activity.setOwner(user.getName());
            activityList.add(activity);
        }
        clue.setActivities(activityList);
        return clue;
    }

    @Override
    public void unbind(String clueId, String activityId) {
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        clueActivityRelation.setClueId(clueId);
        clueActivityRelation.setActivityId(activityId);
        int count = clueActivityRelationMapper.delete(clueActivityRelation);
    }

    @Override
    public List<Activity> queryActivityByName(String id, String name) {
        //先查询当前线索已经关联的市场活动
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        clueActivityRelation.setClueId(id);
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationMapper.select(clueActivityRelation);
        List<String> ids = new ArrayList<>();
        for (ClueActivityRelation relation : clueActivityRelations) {
            ids.add(relation.getActivityId());
        }
        Example example = new Example(Activity.class);
        Example.Criteria criteria = example.createCriteria();
        if(StrUtil.isNotEmpty(name)){
            criteria.andLike("name","%" + name + "%")
                    .andNotIn("id",ids);
        }else{
            criteria.andNotIn("id",ids);
        }
        List<Activity> activityList = activityMapper.selectByExample(example);
        return activityList;
    }

    @Override
    public List<Activity> bind(String id, String ids) {
        String[] aids = ids.split(",");
        for (String aid : aids) {
            //向关联表中插入数据
            ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
            clueActivityRelation.setId(UUIDUtil.getUUID());
            clueActivityRelation.setClueId(id);
            clueActivityRelation.setActivityId(aid);
            int count = clueActivityRelationMapper.insert(clueActivityRelation);
        }
        //关联成功，还要查询最新线索关联的市场活动
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        clueActivityRelation.setClueId(id);
        List<ClueActivityRelation> clueActivityRelations =
                clueActivityRelationMapper.select(clueActivityRelation);
        List<Activity> activityList = new ArrayList<>();
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            Activity activity = activityMapper.selectByPrimaryKey(activityRelation.getActivityId());
            //查询市场活动所有者名称
            User user = userMapper.selectByPrimaryKey(activity.getOwner());
            activity.setOwner(user.getName());
            activityList.add(activity);
        }
        return activityList;
    }

    //线索转换
    @Override
    public void convert(String id,String isCreateTransaction,Transaction transaction) {
        //1、根据线索的主键查询线索的信息
        Clue clue = clueMapper.selectByPrimaryKey(id);

        //2、先将线索中的客户信息取出来保存在客户表中，当该客户不存在的时候，新建客户(按公司名称精准查询)
        Company company = new Company();
        company.setName(clue.getCompany());
        List<Company> companyList = companyMapper.select(company);
        if(companyList.size() == 0){
            //客户不存在，保存客户信息，保存客户备注信息
           company.setAddress(clue.getAddress());
           company.setContactSummary(clue.getContactSummary());
           company.setCreateBy(clue.getCreateBy());
           company.setCreateTime(DateTimeUtil.getSysTime());
           company.setId(UUIDUtil.getUUID());
           company.setNextContactTime(clue.getNextContactTime());
           company.setOwner(clue.getOwner());
           company.setPhone(clue.getPhone());
           company.setWebsite(clue.getWebsite());
           companyMapper.insert(company);
        }else{
            company = companyList.get(0);
        }
        //3、将线索中联系人信息取出来保存在联系人表中
        Contacts contacts = new Contacts();
        contacts.setId(UUIDUtil.getUUID());
        contacts.setAddress(clue.getAddress());
        contacts.setAppellation(clue.getAppellation());
        contacts.setContactSummary(clue.getContactSummary());
        contacts.setCreateBy(clue.getCreateBy());
        contacts.setCreateTime(DateTimeUtil.getSysTime());
        contacts.setCustomerId(company.getId());
        contacts.setEmail(clue.getEmail());
        contacts.setFullname(clue.getFullname());
        contacts.setDescription(clue.getDescription());
        contacts.setJob(clue.getJob());
        contacts.setMphone(clue.getMphone());
        contacts.setNextContactTime(clue.getNextContactTime());
        contacts.setOwner(clue.getOwner());
        contacts.setSource(clue.getSource());
        contactsMapper.insert(contacts);


        //4、线索中的备注信息取出来保存在客户备注中 备注的内容修改在客户模块客户详情页进行修改
        CompanyRemark companyRemark = new CompanyRemark();
        companyRemark.setId(UUIDUtil.getUUID());
        companyRemark.setCreateBy(clue.getCreateBy());
        companyRemark.setCreateTime(DateTimeUtil.getSysTime());
        companyRemark.setCustomerId(company.getId());
        companyRemarkMapper.insert(companyRemark);

        //5、线索中的备注信息取出来保存在联系人备注中 备注的内容修改在联系人模块客户详情页进行修改
        ContactsRemark contactsRemark = new ContactsRemark();
        contactsRemark.setId(UUIDUtil.getUUID());
        contactsRemark.setContactsId(contacts.getId());
        contactsRemark.setCreateBy(clue.getCreateBy());
        contactsRemark.setCreateTime(DateTimeUtil.getSysTime());

        contactsRemarkMapper.insert(contactsRemark);


        //6、将"线索和市场活动的关系"转换到"联系人和市场活动的关系中"
        //先查询当前线索关联的市场活动
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        clueActivityRelation.setClueId(id);
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationMapper.select(clueActivityRelation);
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            //取出市场活动主键
            ContactsActivityRelation contactsActivityRelation = new ContactsActivityRelation();
            contactsActivityRelation.setId(UUIDUtil.getUUID());
            contactsActivityRelation.setActivityId(activityRelation.getActivityId());
            contactsActivityRelation.setContactsId(contacts.getId());
            contactsActivityRelationMapper.insert(contactsActivityRelation);
        }

        //7、如果转换过程中发生了交易，创建一条新的交易，交易信息不全，后面可以通过修改交易来完善交易信息
        if("1".equals(isCreateTransaction)){
            //发生交易了
            transaction.setId(UUIDUtil.getUUID());
            transaction.setCreateBy(clue.getCreateBy());
            transaction.setCreateTime(DateTimeUtil.getSysTime());
            transactionMapper.insert(transaction);


            //8、创建该条交易对应的交易历史以及备注
            //保存交易历史信息
            TransactionHistory transactionHistory = new TransactionHistory();
            transactionHistory.setId(UUIDUtil.getUUID());
            transactionHistory.setCreateBy(clue.getCreateBy());
            transactionHistory.setCreateTime(DateTimeUtil.getSysTime());
            transactionHistory.setExpectedDate(transaction.getExpectedDate());
            transactionHistory.setMoney(transaction.getMoney());
            transactionHistory.setStage(transaction.getStage());
            transactionHistory.setTranId(transaction.getId());
            transactionHistoryMapper.insert(transactionHistory);

            //保存交易备注信息
            TransactionRemark transactionRemark = new TransactionRemark();
            transactionRemark.setId(UUIDUtil.getUUID());
            transactionRemark.setCreateBy(clue.getCreateBy());
            transactionRemark.setCreateTime(DateTimeUtil.getSysTime());
            transactionRemark.setTranId(transaction.getId());
            transactionRemarkMapper.insert(transactionRemark);
        }

        //9.删除线索的备注信息 根据线索id删除
        ClueRemark clueRemark = new ClueRemark();
        clueRemark.setClueId(id);
        clueRemarkMapper.delete(clueRemark);

        //10、删除线索和市场活动的关联关系 delete from 表 where clueId=..
        ClueActivityRelation clueActivityRelation1 = new ClueActivityRelation();
        clueActivityRelation1.setClueId(id);
        clueActivityRelationMapper.delete(clueActivityRelation1);

        //11、删除线索记录
        clueMapper.deleteByPrimaryKey(id);
    }
}
