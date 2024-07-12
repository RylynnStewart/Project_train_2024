package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.SysCar;
import com.ruoyi.system.service.ISysCarService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 购物车Controller
 *
 * @author ryan
 * @date 2024-07-12
 */
@RestController
@RequestMapping("/car")
public class SysCarController extends BaseController
{
    @Autowired
    private ISysCarService sysCarService;

    /**
     * 查询购物车列表
     */
    @RequiresPermissions("system:car:list")
    @GetMapping("/list")
    public TableDataInfo list(SysCar sysCar)
    {
        startPage();
        List<SysCar> list = sysCarService.selectSysCarList(sysCar);
        return getDataTable(list);
    }

    /**
     * 导出购物车列表
     */
    @RequiresPermissions("system:car:export")
    @Log(title = "购物车", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCar sysCar)
    {
        List<SysCar> list = sysCarService.selectSysCarList(sysCar);
        ExcelUtil<SysCar> util = new ExcelUtil<SysCar>(SysCar.class);
        util.exportExcel(response, list, "购物车数据");
    }

    /**
     * 获取购物车详细信息
     */
    @RequiresPermissions("system:car:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysCarService.selectSysCarById(id));
    }

    /**
     * 新增购物车
     */
    @RequiresPermissions("system:car:add")
    @Log(title = "购物车", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCar sysCar)
    {
        return toAjax(sysCarService.insertSysCar(sysCar));
    }

    /**
     * 修改购物车
     */
    @RequiresPermissions("system:car:edit")
    @Log(title = "购物车", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCar sysCar)
    {
        return toAjax(sysCarService.updateSysCar(sysCar));
    }

    /**
     * 删除购物车
     */
    @RequiresPermissions("system:car:remove")
    @Log(title = "购物车", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysCarService.deleteSysCarByIds(ids));
    }
}
