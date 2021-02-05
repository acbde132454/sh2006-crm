package com.bjpowernode.crm.base.exception;

import com.bjpowernode.crm.base.constants.CrmEnum;
import lombok.Data;

@Data
public class CrmException extends RuntimeException {


        private CrmEnum crmEnum;

        public CrmException(CrmEnum crmEnum){
            super();//调用父类的构造方法，如果不调用，我们获取不到堆栈中的异常信息
            this.crmEnum = crmEnum;
        }
}
