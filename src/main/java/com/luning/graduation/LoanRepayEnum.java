package com.luning.graduation;

import com.google.common.collect.ImmutableMap;

import java.util.Map;

/**
 * @author ln
 * 还款类型枚举类
 */

public enum LoanRepayEnum {

    /**
     * 还款类型
     */
    EQUAL_AMOUNT(1, "每月等额"),
    INTEREST_PRINCIPAL(2, "先息后本");

    private Integer code;
    private String msg;

    LoanRepayEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Map<String, Object> toMap() {
        return ImmutableMap.<String, Object>builder()
                .put("code", code)
                .put("msg", msg)
                .build();
    }

    public static String getName(int code){
        for(LoanRepayEnum e:LoanRepayEnum.values()){
            if(code==e.code) {
                return e.msg;
            }
        }
        return "";
    }
}
