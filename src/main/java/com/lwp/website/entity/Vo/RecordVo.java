package com.lwp.website.entity.Vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

public class RecordVo {


    private String id;

    private String financialId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime recordTime;

    private Double recordAmount;

    private Double totalIncome;

    private Double lastIncome;


    private Integer totalDay;

    private Integer lastDay;

    private Double totalRate;

    private Double lastRate;

    private Double totalIncomeWan;

    private Double lastIncomeWan;

    private Double totalOneDayIncome;

    private Double lastOneDayIncome;

    private Double totalOneDayIncomeWan;

    private Double lastOneDayIncomeWan;

    private LocalDateTime createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFinancialId() {
        return financialId;
    }

    public void setFinancialId(String financialId) {
        this.financialId = financialId;
    }

    public LocalDateTime getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(LocalDateTime recordTime) {
        this.recordTime = recordTime;
    }

    public Double getRecordAmount() {
        return recordAmount;
    }

    public void setRecordAmount(Double recordAmount) {
        this.recordAmount = recordAmount;
    }

    public Double getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(Double totalIncome) {
        this.totalIncome = totalIncome;
    }

    public Double getLastIncome() {
        return lastIncome;
    }

    public void setLastIncome(Double lastIncome) {
        this.lastIncome = lastIncome;
    }

    public Integer getTotalDay() {
        return totalDay;
    }

    public void setTotalDay(Integer totalDay) {
        this.totalDay = totalDay;
    }

    public Integer getLastDay() {
        return lastDay;
    }

    public void setLastDay(Integer lastDay) {
        this.lastDay = lastDay;
    }

    public Double getTotalRate() {
        return totalRate;
    }

    public void setTotalRate(Double totalRate) {
        this.totalRate = totalRate;
    }

    public Double getLastRate() {
        return lastRate;
    }

    public void setLastRate(Double lastRate) {
        this.lastRate = lastRate;
    }

    public Double getTotalIncomeWan() {
        return totalIncomeWan;
    }

    public void setTotalIncomeWan(Double totalIncomeWan) {
        this.totalIncomeWan = totalIncomeWan;
    }

    public Double getLastIncomeWan() {
        return lastIncomeWan;
    }

    public void setLastIncomeWan(Double lastIncomeWan) {
        this.lastIncomeWan = lastIncomeWan;
    }

    public Double getTotalOneDayIncome() {
        return totalOneDayIncome;
    }

    public void setTotalOneDayIncome(Double totalOneDayIncome) {
        this.totalOneDayIncome = totalOneDayIncome;
    }

    public Double getLastOneDayIncome() {
        return lastOneDayIncome;
    }

    public void setLastOneDayIncome(Double lastOneDayIncome) {
        this.lastOneDayIncome = lastOneDayIncome;
    }

    public Double getTotalOneDayIncomeWan() {
        return totalOneDayIncomeWan;
    }

    public void setTotalOneDayIncomeWan(Double totalOneDayIncomeWan) {
        this.totalOneDayIncomeWan = totalOneDayIncomeWan;
    }

    public Double getLastOneDayIncomeWan() {
        return lastOneDayIncomeWan;
    }

    public void setLastOneDayIncomeWan(Double lastOneDayIncomeWan) {
        this.lastOneDayIncomeWan = lastOneDayIncomeWan;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
}
