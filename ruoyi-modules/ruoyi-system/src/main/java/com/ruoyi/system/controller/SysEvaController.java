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
import com.ruoyi.system.domain.SysEva;
import com.ruoyi.system.service.ISysEvaService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 菜品评价Controller
 * 
 * @author liuhao
 * @date 2024-03-01
 */
@RestController
@RequestMapping("/eva")
public class SysEvaController extends BaseController
{
    @Autowired
    private ISysEvaService sysEvaService;

    /**
     * 查询菜品评价列表
     */
    @RequiresPermissions("system:eva:list")
    @GetMapping("/list")
    public TableDataInfo list(SysEva sysEva)
    {
        startPage();
        List<SysEva> list = sysEvaService.selectSysEvaList(sysEva);
        return getDataTable(list);
    }

    /**
     * 导出菜品评价列表
     */
    @RequiresPermissions("system:eva:export")
    @Log(title = "菜品评价", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEva sysEva)
    {
        List<SysEva> list = sysEvaService.selectSysEvaList(sysEva);
        ExcelUtil<SysEva> util = new ExcelUtil<SysEva>(SysEva.class);
        util.exportExcel(response, list, "菜品评价数据");
    }

    /**
     * 获取菜品评价详细信息
     */
    @RequiresPermissions("system:eva:query")
    @GetMapping(value = "/{evaId}")
    public AjaxResult getInfo(@PathVariable("evaId") Long evaId)
    {
        return success(sysEvaService.selectSysEvaByEvaId(evaId));
    }

    /**
     * 新增菜品评价
     */
    @RequiresPermissions("system:eva:add")
    @Log(title = "菜品评价", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEva sysEva)
    {
        return toAjax(sysEvaService.insertSysEva(sysEva));
    }

    /**
     * 修改菜品评价
     */
    @RequiresPermissions("system:eva:edit")
    @Log(title = "菜品评价", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEva sysEva)
    {
        return toAjax(sysEvaService.updateSysEva(sysEva));
    }

    /**
     * 删除菜品评价
     */
    @RequiresPermissions("system:eva:remove")
    @Log(title = "菜品评价", businessType = BusinessType.DELETE)
	@DeleteMapping("/{evaIds}")
    public AjaxResult remove(@PathVariable Long[] evaIds)
    {
        return toAjax(sysEvaService.deleteSysEvaByEvaIds(evaIds));
    }
}
