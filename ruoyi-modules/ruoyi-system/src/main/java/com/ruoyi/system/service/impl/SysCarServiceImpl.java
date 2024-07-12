package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysCarMapper;
import com.ruoyi.system.domain.SysCar;
import com.ruoyi.system.service.ISysCarService;

/**
 * 购物车Service业务层处理
 * 
 * @author liuhao
 * @date 2024-02-28
 */
@Service
public class SysCarServiceImpl implements ISysCarService 
{
    @Autowired
    private SysCarMapper sysCarMapper;

    /**
     * 查询购物车
     * 
     * @param id 购物车主键
     * @return 购物车
     */
    @Override
    public SysCar selectSysCarById(Long id)
    {
        return sysCarMapper.selectSysCarById(id);
    }

    /**
     * 查询购物车列表
     * 
     * @param sysCar 购物车
     * @return 购物车
     */
    @Override
    public List<SysCar> selectSysCarList(SysCar sysCar)
    {
        return sysCarMapper.selectSysCarList(sysCar);
    }

    /**
     * 新增购物车
     * 
     * @param sysCar 购物车
     * @return 结果
     */
    @Override
    public int insertSysCar(SysCar sysCar)
    {
        return sysCarMapper.insertSysCar(sysCar);
    }

    /**
     * 修改购物车
     * 
     * @param sysCar 购物车
     * @return 结果
     */
    @Override
    public int updateSysCar(SysCar sysCar)
    {
        return sysCarMapper.updateSysCar(sysCar);
    }

    /**
     * 批量删除购物车
     * 
     * @param ids 需要删除的购物车主键
     * @return 结果
     */
    @Override
    public int deleteSysCarByIds(Long[] ids)
    {
        return sysCarMapper.deleteSysCarByIds(ids);
    }

    /**
     * 删除购物车信息
     * 
     * @param id 购物车主键
     * @return 结果
     */
    @Override
    public int deleteSysCarById(Long id)
    {
        return sysCarMapper.deleteSysCarById(id);
    }
}
