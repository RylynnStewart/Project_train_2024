package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysCar;

/**
 * 购物车Mapper接口
 *
 * @author ryan
 * @date 2024-07-12
 */
public interface SysCarMapper
{
    /**
     * 查询购物车
     *
     * @param id 购物车主键
     * @return 购物车
     */
    public SysCar selectSysCarById(Long id);

    /**
     * 查询购物车列表
     *
     * @param sysCar 购物车
     * @return 购物车集合
     */
    public List<SysCar> selectSysCarList(SysCar sysCar);

    /**
     * 新增购物车
     *
     * @param sysCar 购物车
     * @return 结果
     */
    public int insertSysCar(SysCar sysCar);

    /**
     * 修改购物车
     *
     * @param sysCar 购物车
     * @return 结果
     */
    public int updateSysCar(SysCar sysCar);

    /**
     * 删除购物车
     *
     * @param id 购物车主键
     * @return 结果
     */
    public int deleteSysCarById(Long id);

    /**
     * 批量删除购物车
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCarByIds(Long[] ids);
}
