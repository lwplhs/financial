package com.lwp.website.utils;

import java.util.ArrayList;
import java.util.List;

public class BaseUtil {

    /**
     * 将 ids 转化成list
     * @param ids
     * @return
     */
    public static List<String> toList(String ids){
        List<String> list = new ArrayList();
        String[] args = ids.split(",");
        if(null != args && args.length > 0){
            for(int i = 0;i < args.length;i++){
                list.add(args[i]);
            }
        }
        return list;
    }

}
