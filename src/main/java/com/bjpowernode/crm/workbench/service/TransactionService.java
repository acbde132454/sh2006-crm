package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.bean.Transaction;

import java.util.List;
import java.util.Map;

public interface TransactionService {
    List<String> queryCustomerName(String customerName);

    String queryPossibilityByStage(String stage, Map<String, String> map);

    Transaction queryById(String id);

    List<Map<String, String>> queryStage(Integer index,String id, Map<String, String> map);
}
