package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysEva;

/**
 * 菜品评价Service接口
 * 
 * @author liuhao
 * @date 2024-03-01
 */
public interface ISysEvaService 
{
    /**
     * 查询菜品评价
     * 
     * @param evaId 菜品评价主键
     * @return 菜品评价
     */
    public SysEva selectSysEvaByEvaId(Long evaId);

    /**
     * 查询菜品评价列表
     * 
     * @param sysEva 菜品评价
     * @return 菜品评价集合
     */
    public List<SysEva> selectSysEvaList(SysEva sysEva);

    /**
     * 新增菜品评价
     * 
     * @param sysEva 菜品评价
     * @return 结果
     */
    public int insertSysEva(SysEva sysEva);

    /**
     * 修改菜品评价
     * 
     * @param sysEva 菜品评价
     * @return 结果
     */
    public int updateSysEva(SysEva sysEva);

    /**
     * 批量删除菜品评价
     * 
     * @param evaIds 需要删除的菜品评价主键集合
     * @return 结果
     */
    public int deleteSysEvaByEvaIds(Long[] evaIds);

    /**
     * 删除菜品评价信息
     * 
     * @param evaId 菜品评价主键
     * @return 结果
     */
    public int deleteSysEvaByEvaId(Long evaId);
}
