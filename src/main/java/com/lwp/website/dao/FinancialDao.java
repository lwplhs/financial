package com.lwp.website.dao;

import com.lwp.website.entity.Vo.FinancialVo;

import java.util.List;
import java.util.Map;

public interface FinancialDao {


    List<FinancialVo> findAllFinancial(String searchKey);

    void deleteByPrimaryKey(String id);

    void insert(FinancialVo financialVo);

    int updateStatus(Map map);

}
