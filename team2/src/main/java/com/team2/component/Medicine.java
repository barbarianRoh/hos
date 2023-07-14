package com.team2.component;


public class Medicine {
    private String entpName;
    private String itemName;

    public Medicine(String entpName, String itemName) {
        this.entpName = entpName;
        this.itemName = itemName;
    }

    public String getEntpName() {
        return entpName;
    }

    public String getItemName() {
        return itemName;
    }
}