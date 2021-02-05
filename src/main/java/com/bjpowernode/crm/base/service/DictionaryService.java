package com.bjpowernode.crm.base.service;

import com.bjpowernode.crm.base.bean.DictionaryValue;

import java.util.List;

public interface DictionaryService {
    List<DictionaryValue> dictionaryValuesList();

    DictionaryValue queryDictionTypeByCode(String typeCode);

    void saveDictionaryValue(DictionaryValue dictionaryValue);
}
