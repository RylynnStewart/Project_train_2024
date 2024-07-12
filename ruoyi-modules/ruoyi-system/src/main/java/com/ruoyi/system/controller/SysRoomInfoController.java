package com.ruoyi.system.controller;

import java.util.Date;
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
import com.ruoyi.system.domain.SysRoomInfo;
import com.ruoyi.system.service.ISysRoomInfoService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 房间Controller
 * 
 * @author liuhao
 * @date 2024-02-29
 */
@RestController
@RequestMapping("/info")
public class SysRoomInfoController extends BaseController
{
    @Autowired
    private ISysRoomInfoService sysRoomInfoService;

    /**
     * 查询房间列表
     */
//    @RequiresPermissions("system:info:list")
    @GetMapping("/list")
    public TableDataInfo list(SysRoomInfo sysRoomInfo)
    {
        startPage();
        List<SysRoomInfo> list = sysRoomInfoService.selectSysRoomInfoList(sysRoomInfo);
        return getDataTable(list);
    }

    /**
     * 导出房间列表
     */
//    @RequiresPermissions("system:info:export")
    @Log(title = "房间", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRoomInfo sysRoomInfo)
    {
        List<SysRoomInfo> list = sysRoomInfoService.selectSysRoomInfoList(sysRoomInfo);
        ExcelUtil<SysRoomInfo> util = new ExcelUtil<SysRoomInfo>(SysRoomInfo.class);
        util.exportExcel(response, list, "房间数据");
    }

    /**
     * 获取房间详细信息
     */
//    @RequiresPermissions("system:info:query")
    @GetMapping(value = "/{roomId}")
    public AjaxResult getInfo(@PathVariable("roomId") Long roomId)
    {
        return success(sysRoomInfoService.selectSysRoomInfoByRoomId(roomId));
    }

    /**
     * 新增房间
     */
//    @RequiresPermissions("system:info:add")
    @Log(title = "房间", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRoomInfo sysRoomInfo)
    {
        return toAjax(sysRoomInfoService.insertSysRoomInfo(sysRoomInfo));
    }

    /**
     * 修改房间
     */
//    @RequiresPermissions("system:info:edit")
    @Log(title = "房间", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRoomInfo sysRoomInfo)
    {
        return toAjax(sysRoomInfoService.updateSysRoomInfo(sysRoomInfo));
    }

    /**
     * 删除房间
     */
//    @RequiresPermissions("system:info:remove")
    @Log(title = "房间", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomIds}")
    public AjaxResult remove(@PathVariable Long[] roomIds)
    {
        return toAjax(sysRoomInfoService.deleteSysRoomInfoByRoomIds(roomIds));
    }

    /**
     * 清退房间
     * */
    @PostMapping("/OutRoom")
    public AjaxResult outRoom(Date date){
        return toAjax(sysRoomInfoService.outRoom(date));
    }

}
