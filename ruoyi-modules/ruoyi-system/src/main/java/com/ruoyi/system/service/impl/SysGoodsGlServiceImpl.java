package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysGoodsGlMapper;
import com.ruoyi.system.domain.SysGoodsGl;
import com.ruoyi.system.service.ISysGoodsGlService;

/**
 * 商品管理Service业务层处理
 *
 *
 * @author xuaofeng
 * @date 2024-07-12
 */
@Service
public class SysGoodsGlServiceImpl implements ISysGoodsGlService 
{
    @Autowired
    private SysGoodsGlMapper sysGoodsGlMapper;

    /**
     * 查询商品管理
     * 
     * @param goodsId 商品管理主键
     * @return 商品管理
     */
    @Override
    public SysGoodsGl selectSysGoodsGlByGoodsId(Long goodsId)
    {
        return sysGoodsGlMapper.selectSysGoodsGlByGoodsId(goodsId);
    }

    /**
     * 查询商品管理列表
     * 
     * @param sysGoodsGl 商品管理
     * @return 商品管理
     */
    @Override
    public List<SysGoodsGl> selectSysGoodsGlList(SysGoodsGl sysGoodsGl)
    {
        return sysGoodsGlMapper.selectSysGoodsGlList(sysGoodsGl);
    }

    /**
     * 新增商品管理
     * 
     * @param sysGoodsGl 商品管理
     * @return 结果
     */
    @Override
    public int insertSysGoodsGl(SysGoodsGl sysGoodsGl)
    {
        return sysGoodsGlMapper.insertSysGoodsGl(sysGoodsGl);
    }

    /**
     * 修改商品管理
     * 
     * @param sysGoodsGl 商品管理
     * @return 结果
     */
    @Override
    public int updateSysGoodsGl(SysGoodsGl sysGoodsGl)
    {
        return sysGoodsGlMapper.updateSysGoodsGl(sysGoodsGl);
    }

    /**
     * 批量删除商品管理
     * 
     * @param goodsIds 需要删除的商品管理主键
     * @return 结果
     */
    @Override
    public int deleteSysGoodsGlByGoodsIds(Long[] goodsIds)
    {
        return sysGoodsGlMapper.deleteSysGoodsGlByGoodsIds(goodsIds);
    }

    /**
     * 删除商品管理信息
     * 
     * @param goodsId 商品管理主键
     * @return 结果
     */
    @Override
    public int deleteSysGoodsGlByGoodsId(Long goodsId)
    {
        return sysGoodsGlMapper.deleteSysGoodsGlByGoodsId(goodsId);
    }


    /**
     * 购买后实现商品购买数量的增加
     *  @param goodsId 商品管理主键
     *   @return 结果
     * */

    @Override
    public int upSysGoodsGl(SysGoodsGl sysGoodsGl)
    {
        return sysGoodsGlMapper.updateSysGoodsGl(sysGoodsGl);
    }

}
