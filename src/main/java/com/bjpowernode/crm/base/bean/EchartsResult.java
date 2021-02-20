package com.bjpowernode.crm.base.bean;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class EchartsResult {

    private List<String> titles;
    private List<Map<String,String>> maps;
}
