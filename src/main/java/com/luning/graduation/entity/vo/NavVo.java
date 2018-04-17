package com.luning.graduation.entity.vo;

import java.util.List;

public class NavVo {
    private String text;

    private String icon;

    private List<NavSonVo> subset;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<NavSonVo> getSubset() {
        return subset;
    }

    public void setSubset(List<NavSonVo> subset) {
        this.subset = subset;
    }
}
