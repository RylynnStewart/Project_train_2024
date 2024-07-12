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
import com.ruoyi.system.domain.SysGoodsGl;
import com.ruoyi.system.service.ISysGoodsGlService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 商品管理Controller
 * 
 * @author xuaofeng
 * @date 2024-07-12
 */
@RestController
@RequestMapping("/gl")
public class SysGoodsGlController extends BaseController
{
    @Autowired
    private ISysGoodsGlService sysGoodsGlService;

    /**
     * 查询商品管理列表
     */
    @RequiresPermissions("system:gl:list")
    @GetMapping("/list")
    public TableDataInfo list(SysGoodsGl sysGoodsGl)
    {
        startPage();
        List<SysGoodsGl> list = sysGoodsGlService.selectSysGoodsGlList(sysGoodsGl);
        return getDataTable(list);
    }

    /**
     * 导出商品管理列表
     */
    @RequiresPermissions("system:gl:export")
    @Log(title = "商品管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysGoodsGl sysGoodsGl)
    {
        List<SysGoodsGl> list = sysGoodsGlService.selectSysGoodsGlList(sysGoodsGl);
        ExcelUtil<SysGoodsGl> util = new ExcelUtil<SysGoodsGl>(SysGoodsGl.class);
        util.exportExcel(response, list, "商品管理数据");
    }

    /**
     * 获取商品管理详细信息
     */
    @RequiresPermissions("system:gl:query")
    @GetMapping(value = "/{goodsId}")
    public AjaxResult getInfo(@PathVariable("goodsId") Long goodsId)
    {
        return success(sysGoodsGlService.selectSysGoodsGlByGoodsId(goodsId));
    }

    /**
     * 新增商品管理
     */
    @RequiresPermissions("system:gl:add")
    @Log(title = "商品管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysGoodsGl sysGoodsGl)
    {
        return toAjax(sysGoodsGlService.insertSysGoodsGl(sysGoodsGl));
    }

    /**
     * 修改商品管理
     */
    @RequiresPermissions("system:gl:edit")
    @Log(title = "商品管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysGoodsGl sysGoodsGl)
    {
        return toAjax(sysGoodsGlService.updateSysGoodsGl(sysGoodsGl));
    }

    /**
     * 删除商品管理
     */
    @RequiresPermissions("system:gl:remove")
    @Log(title = "商品管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{goodsIds}")
    public AjaxResult remove(@PathVariable Long[] goodsIds)
    {
        return toAjax(sysGoodsGlService.deleteSysGoodsGlByGoodsIds(goodsIds));
    }

    /**
     * 增加商品数量
     */

    @PostMapping("/upSP")
    public AjaxResult upSP(@RequestBody SysGoodsGl sysGoodsGl)
    {
        return toAjax(sysGoodsGlService.upSysGoodsGl(sysGoodsGl));
    }
}
