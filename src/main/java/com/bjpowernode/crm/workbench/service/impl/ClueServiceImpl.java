package com.bjpowernode.crm.workbench.service.impl;

import cn.hutool.core.util.StrUtil;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import com.bjpowernode.crm.workbench.bean.Activity;
import com.bjpowernode.crm.workbench.bean.Clue;
import com.bjpowernode.crm.workbench.bean.ClueActivityRelation;
import com.bjpowernode.crm.workbench.mapper.ActivityMapper;
import com.bjpowernode.crm.workbench.mapper.ClueActivityRelationMapper;
import com.bjpowernode.crm.workbench.mapper.ClueMapper;
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
}
