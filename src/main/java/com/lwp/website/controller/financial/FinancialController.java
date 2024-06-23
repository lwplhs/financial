package com.lwp.website.controller.financial;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lwp.website.controller.BaseController;
import com.lwp.website.entity.Bo.RestResponseBo;
import com.lwp.website.entity.Vo.FinancialVo;
import com.lwp.website.entity.Vo.RecordVo;
import com.lwp.website.service.FinancialService;
import com.lwp.website.utils.InvalidUtil;
import com.lwp.website.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller()
@RequestMapping("/financial")
public class FinancialController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(FinancialController.class);

    @Autowired
    private FinancialService financialService;


    @GetMapping(value = "/manager")
    public String toPageManager(){
        return this.render("/admin/financial/manager");
    }

    @GetMapping(value = "/add")
    public String toPageAdd(Model model){
        //普通用户
        FinancialVo financialVo = new FinancialVo();
        model.addAttribute("financial",financialVo);
        model.addAttribute("action","add");
        return this.render("/admin/financial/add");
    }

    @GetMapping(value = "/addRecord")
    public String toPageAddRecord(Model model, @RequestParam(value = "id") String id){
        //普通用户
        RecordVo recordVo = new RecordVo();
        model.addAttribute("record",recordVo);
        model.addAttribute("action", StringUtil.isNull(id) ? "add" : "addAssign");
        return this.render("/admin/financial/addRecord");
    }


    @PostMapping(value = "/getFinancialList")
    public String getUser(Model model,
                          @RequestParam(value="pageNum",defaultValue = "1") int pageNum,
                          @RequestParam(value = "limit",defaultValue = "10") int limit,
                          @RequestParam(value = "searchKey", defaultValue = "") String searchKey) {
        LOGGER.info("-------------------获取理财数据 第" + pageNum + "页，" + limit + "条数据------------------");
        Page<FinancialVo> page = PageHelper.startPage(pageNum, limit);
        List<FinancialVo> list = financialService.getFinancialList(searchKey);
        LOGGER.info("-------------------获取理财数据结束------------------");
        model.addAttribute("financialList", list);
        model.addAttribute("total", page.getTotal());
        return this.render("/admin/financial/manager::list");
    }


    /**
     *
     * @param financialVo
     * @param bindingResult
     * @return
     */
    @PostMapping("/saveFinancial")
    @ResponseBody
    public RestResponseBo saveFinancial(
                                   @Validated @ModelAttribute FinancialVo financialVo,
                                   BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return InvalidUtil.error(LOGGER,bindingResult);
        }
        LOGGER.info("-------------------参数校验成功------------------");
        LOGGER.info("-------------------开始保存记录------------------");
        String result = financialService.saveFinancial(financialVo);
        LOGGER.info("-------------------保存记录结束------------------");
        return RestResponseBo.ok("1",result);
    }


    /**
     *
     * @param recordVo
     * @param bindingResult
     * @return
     */
    @PostMapping("/saveRecord")
    @ResponseBody
    public RestResponseBo saveRecord(
            @Validated @ModelAttribute RecordVo recordVo,
            BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return InvalidUtil.error(LOGGER,bindingResult);
        }
        LOGGER.info("-------------------参数校验成功------------------");
        LOGGER.info("-------------------开始保存记录------------------");
        String result = financialService.saveRecord(recordVo);
        LOGGER.info("-------------------保存记录结束------------------");
        return RestResponseBo.ok("1",result);
    }


    /**
     * 根据id更新数据
     * @param ids
     * @return
     */
    @PostMapping(value = "/updateStatus")
    @ResponseBody
    public RestResponseBo updateUser(@RequestParam(value = "ids") String ids,
                                     @RequestParam(value = "searchKey",defaultValue = "") String searchKey){
        LOGGER.info("-------------------修改用户状态------------------");
        financialService.updateStatus(ids);
        return RestResponseBo.ok(1,1,"更新成功");
    }

}
