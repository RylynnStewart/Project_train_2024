package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 商品管理对象 sys_goods_gl
 * 
 * @author liuhao
 * @date 2024-02-26
 */
public class SysGoodsGl extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品id */
    private Long goodsId;

    /** 商品名 */
    @Excel(name = "商品名")
    private String goodsName;

    /** 商品价格 */
    @Excel(name = "商品价格")
    private Double goodsPrice;

    /** 商品状态 */
    @Excel(name = "商品状态")
    private String goodsStatus;

    /** 商品评价 */
    @Excel(name = "商品评价")
    private String goodsPj;

    /** 商品喜欢度 */
    @Excel(name = "商品喜欢度")
    private Long goodsLikes;

    /** 商品图片 */
    @Excel(name = "商品图片")
    private String goodsImg;

    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setGoodsName(String goodsName) 
    {
        this.goodsName = goodsName;
    }

    public String getGoodsName() 
    {
        return goodsName;
    }
    public void setGoodsPrice(Double goodsPrice) 
    {
        this.goodsPrice = goodsPrice;
    }

    public Double getGoodsPrice() 
    {
        return goodsPrice;
    }
    public void setGoodsStatus(String goodsStatus) 
    {
        this.goodsStatus = goodsStatus;
    }

    public String getGoodsStatus() 
    {
        return goodsStatus;
    }
    public void setGoodsPj(String goodsPj) 
    {
        this.goodsPj = goodsPj;
    }

    public String getGoodsPj() 
    {
        return goodsPj;
    }
    public void setGoodsLikes(Long goodsLikes) 
    {
        this.goodsLikes = goodsLikes;
    }

    public Long getGoodsLikes() 
    {
        return goodsLikes;
    }
    public void setGoodsImg(String goodsImg) 
    {
        this.goodsImg = goodsImg;
    }

    public String getGoodsImg() 
    {
        return goodsImg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("goodsId", getGoodsId())
            .append("goodsName", getGoodsName())
            .append("goodsPrice", getGoodsPrice())
            .append("goodsStatus", getGoodsStatus())
            .append("goodsPj", getGoodsPj())
            .append("goodsLikes", getGoodsLikes())
            .append("goodsImg", getGoodsImg())
            .toString();
    }
}
