package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysEvaMapper;
import com.ruoyi.system.domain.SysEva;
import com.ruoyi.system.service.ISysEvaService;

/**
 * 菜品评价Service业务层处理
 * 
 * @author liuhao
 * @date 2024-03-01
 */
@Service
public class SysEvaServiceImpl implements ISysEvaService 
{
    @Autowired
    private SysEvaMapper sysEvaMapper;

    /**
     * 查询菜品评价
     * 
     * @param evaId 菜品评价主键
     * @return 菜品评价
     */
    @Override
    public SysEva selectSysEvaByEvaId(Long evaId)
    {
        return sysEvaMapper.selectSysEvaByEvaId(evaId);
    }

    /**
     * 查询菜品评价列表
     * 
     * @param sysEva 菜品评价
     * @return 菜品评价
     */
    @Override
    public List<SysEva> selectSysEvaList(SysEva sysEva)
    {
        return sysEvaMapper.selectSysEvaList(sysEva);
    }

    /**
     * 新增菜品评价
     * 
     * @param sysEva 菜品评价
     * @return 结果
     */
    @Override
    public int insertSysEva(SysEva sysEva)
    {
        return sysEvaMapper.insertSysEva(sysEva);
    }

    /**
     * 修改菜品评价
     * 
     * @param sysEva 菜品评价
     * @return 结果
     */
    @Override
    public int updateSysEva(SysEva sysEva)
    {
        return sysEvaMapper.updateSysEva(sysEva);
    }

    /**
     * 批量删除菜品评价
     * 
     * @param evaIds 需要删除的菜品评价主键
     * @return 结果
     */
    @Override
    public int deleteSysEvaByEvaIds(Long[] evaIds)
    {
        return sysEvaMapper.deleteSysEvaByEvaIds(evaIds);
    }

    /**
     * 删除菜品评价信息
     * 
     * @param evaId 菜品评价主键
     * @return 结果
     */
    @Override
    public int deleteSysEvaByEvaId(Long evaId)
    {
        return sysEvaMapper.deleteSysEvaByEvaId(evaId);
    }
}
