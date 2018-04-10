package com.luning.graduation;

import com.google.common.collect.ImmutableMap;

import java.util.Map;

/**
 * @author ln
 * 贷款类型枚举类
 */

public enum LoanTypeEnum {
    /**
     * 贷款产品类型定义
     */
    DAILY_CONSUME(1, "个人日常消费"),
    RENOVATION_CONSUME(2, "装修"),
    TOUR_CONSUME(3, "旅游"),
    EDUCATE_CONSUME(4, "教育"),
    MEDICAL_CONSUME(5, "医疗");

    private Integer code;
    private String msg;

    LoanTypeEnum(Integer code, String msg) {
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

    public static String getName(int code) {
        for (LoanTypeEnum e : LoanTypeEnum.values()) {
            if (code == e.code) {
                return e.msg;
            }
        }
        return "";
    }
}
