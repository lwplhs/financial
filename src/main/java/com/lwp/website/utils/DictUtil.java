package com.lwp.website.utils;

import cn.hutool.core.util.ObjectUtil;
import com.lwp.website.entity.Vo.DictVo;
import com.lwp.website.service.DictService;
import com.lwp.website.service.FinancialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * 参照获取
 * @Auther: liweipeng
 * @Date: 2020/09/28/16:46
 * @Description:
 */
@Component
public class DictUtil {

    private static DictService dictService;

    private static FinancialService financialService;

    @Autowired
    public void setDictService(DictService dictService){
        DictUtil.dictService = dictService;
    }


    @Autowired
    public void setFinancialService(FinancialService financialService){
        DictUtil.financialService = financialService;
    }

    public static List<Map<String,Object>> getDictByType(String dictType){

        List<DictVo> dictVoList = ObjectUtil.equal(dictType, "理财名称") ? financialService.queryDic() : dictService.getListByName(dictType);
        List<Map<String,Object>> list = new ArrayList();
        for (int i = 0; i < dictVoList.size(); i++) {
            Map<String,Object> map = new HashMap<>();
            DictVo dictVo = dictVoList.get(i);
            map.put("key",dictVo.getName());
            map.put("value",dictVo.getDescribe());
            list.add(map);
        }
        return list;
    }

    /**
     * 根据 key和类型获取value
     * @param dictType
     * @param key
     * @return
     */
    public static String getDictValue(String dictType,String key){

        String value = dictService.getDictValue(dictType,key);

        return value;
    }

}
