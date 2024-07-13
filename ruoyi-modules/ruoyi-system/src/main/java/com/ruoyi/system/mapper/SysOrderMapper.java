package com.ruoyi.system.mapper;
import java.util.List;
import com.ruoyi.system.domain.SysOrder;

/**
 * 交易订单Mapper接口
 * 
 * @author HuChangtao
 * @date 2024-07-12
 */
public interface SysOrderMapper
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
     * 删除交易订单
     * 
     * @param id 交易订单主键
     * @return 结果
     */
    public int deleteSysOrderById(Long id);

    /**
     * 批量删除交易订单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysOrderByIds(Long[] ids);

    /**
     * 查询交易订单的日期与交易额
     */
    public List<SysOrder> selectEc(SysOrder sysOrder);
}
