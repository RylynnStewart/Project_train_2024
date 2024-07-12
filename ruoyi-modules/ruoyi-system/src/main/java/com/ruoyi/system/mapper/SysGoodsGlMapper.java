package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysGoodsGl;

/**
 * 商品管理Mapper接口
 * 
 * @author liuhao
 * @date 2024-02-26
 */
public interface SysGoodsGlMapper 
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
     * 删除商品管理
     * 
     * @param goodsId 商品管理主键
     * @return 结果
     */
    public int deleteSysGoodsGlByGoodsId(Long goodsId);

    /**
     * 批量删除商品管理
     * 
     * @param goodsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysGoodsGlByGoodsIds(Long[] goodsIds);

    /**
     * 增加商品数量
     *
     * @param sysGoodsGl 商品管理
     * @return 结果
     */
    public int upSysGoodsGl(SysGoodsGl sysGoodsGl);

}
