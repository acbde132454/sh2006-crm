package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.bean.Activity;
import com.bjpowernode.crm.workbench.bean.Clue;
import com.bjpowernode.crm.workbench.bean.Transaction;

import java.util.List;

public interface ClueService {
    List<Clue> clueList(Clue clue);

    Clue clueDetail(String id);

    void unbind(String clueId, String activityId);

    List<Activity> queryActivityByName(String id,String name);

    List<Activity> bind(String id, String ids);

    void convert(String id, String isCreateTransaction, Transaction transaction);
}
