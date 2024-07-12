package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysGoodsGl;

/**
 * 商品管理Service接口
 * 
 * @author xuaofeng
 * @date 2024-07-11
 */
public interface ISysGoodsGlService 
{
    /**
     * 查询商品管理
     * 
     * @param goodsId 商品管理主键
     * @return 商品管理
     */
    public SysGoodsGl selectSysGoodsGlByGoodsId(Long goodsId);

    /**
     * 查询商品管理列表
     * 
     * @param sysGoodsGl 商品管理
     * @return 商品管理集合
     */
    public List<SysGoodsGl> selectSysGoodsGlList(SysGoodsGl sysGoodsGl);

    /**
     * 新增商品管理
     * 
     * @param sysGoodsGl 商品管理
     * @return 结果
     */
    public int insertSysGoodsGl(SysGoodsGl sysGoodsGl);

    /**
     * 修改商品管理
     * 
     * @param sysGoodsGl 商品管理
     * @return 结果
     */
    public int updateSysGoodsGl(SysGoodsGl sysGoodsGl);

    /**
     * 批量删除商品管理
     * 
     * @param goodsIds 需要删除的商品管理主键集合
     * @return 结果
     */
    public int deleteSysGoodsGlByGoodsIds(Long[] goodsIds);

    /**
     * 删除商品管理信息
     * 
     * @param goodsId 商品管理主键
     * @return 结果
     */
    public int deleteSysGoodsGlByGoodsId(Long goodsId);
    /**
     * 购买后数量增加
     *
     * @param goodsId 商品管理主键
     * @return 结果
     */
    public int upSysGoodsGl(SysGoodsGl sysGoodsGl);
}
