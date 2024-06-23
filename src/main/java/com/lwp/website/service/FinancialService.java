package com.lwp.website.service;

import com.lwp.website.entity.Vo.DictVo;
import com.lwp.website.entity.Vo.FinancialVo;
import com.lwp.website.entity.Vo.RecordVo;

import java.util.List;

public interface FinancialService {


    List<FinancialVo> getFinancialList(String searchKey);

    String saveFinancial(FinancialVo financialVo);

    Boolean updateStatus(String ids);

    List<DictVo> queryDic();

    String saveRecord(RecordVo recordVo);


}
