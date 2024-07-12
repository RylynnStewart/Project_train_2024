package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysOrder;

/**
 * 交易订单Service接口
 * 
 * @author liuhao
 * @date 2024-02-29
 */
public interface ISysOrderService 
{
    /**
     * 查询交易订单
     * 
     * @param id 交易订单主键
     * @return 交易订单
     */
    public SysOrder selectSysOrderById(Long id);

    /**
     * 查询交易订单列表
     * 
     * @param sysOrder 交易订单
     * @return 交易订单集合
     */
    public List<SysOrder> selectSysOrderList(SysOrder sysOrder);

    /**
     * 新增交易订单
     * 
     * @param sysOrder 交易订单
     * @return 结果
     */
    public int insertSysOrder(SysOrder sysOrder);

    /**
     * 修改交易订单
     * 
     * @param sysOrder 交易订单
     * @return 结果
     */
    public int updateSysOrder(SysOrder sysOrder);

    /**
     * 批量删除交易订单
     * 
     * @param ids 需要删除的交易订单主键集合
     * @return 结果
     */
    public int deleteSysOrderByIds(Long[] ids);

    /**
     * 删除交易订单信息
     * 
     * @param id 交易订单主键
     * @return 结果
     */
    public int deleteSysOrderById(Long id);

    /**
     * 查询最后十条交易数据
     *
     * @param
     * @return
     */
    public List<SysOrder> selectEc(SysOrder sysOrder);
}
