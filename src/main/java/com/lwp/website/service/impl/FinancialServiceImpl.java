package com.lwp.website.service.impl;

import com.lwp.website.dao.FinancialDao;
import com.lwp.website.entity.Vo.DictVo;
import com.lwp.website.entity.Vo.FinancialVo;
import com.lwp.website.entity.Vo.RecordVo;
import com.lwp.website.service.FinancialService;
import com.lwp.website.utils.BaseUtil;
import com.lwp.website.utils.StringUtil;
import com.lwp.website.utils.UUID;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FinancialServiceImpl implements FinancialService {


    @Resource
    private FinancialDao financialDao;

    @Override
    public List<FinancialVo> getFinancialList(String searchKey) {
        return financialDao.findAllFinancial(searchKey);
    }


    @Override
    public String saveFinancial(FinancialVo financialVo) {
        if(StringUtil.isNull(financialVo.getId())) {
            financialVo.setId(UUID.createID());
        }
        financialDao.insert(financialVo);
        return "保存成功";
    }


    @Override
    public Boolean updateStatus(String ids) {

        List<String> temp = BaseUtil.toList(ids);
        if(!StringUtil.isNull(temp)){
            Map<String,Object> map = new HashMap<>();
            map.put("ids",temp);
            int count = financialDao.updateStatus(map);
            if(count > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<DictVo> queryDic() {

        List<FinancialVo> financialList = this.getFinancialList("");


        List<DictVo> list = new ArrayList<>();
        financialList.stream().forEach(financialVo -> {
            DictVo dictVo = new DictVo();
            dictVo.setName(financialVo.getId());
            dictVo.setDescribe(financialVo.getFinancialName());
            list.add(dictVo);
        });

        return list;
    }


    @Override
    public String saveRecord(RecordVo recordVo) {
        return null;
    }
}
