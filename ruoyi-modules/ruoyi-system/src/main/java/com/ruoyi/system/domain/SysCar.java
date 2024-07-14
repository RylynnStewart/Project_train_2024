package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 购物车对象 sys_car
 *
 * @author lengyunzhe
 * @date 2024-07-12
 */
public class SysCar extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 购物车Id */
    private Long id;

    /** 购物车商品名 */
    @Excel(name = "购物车商品名")
    private String carName;

    /** 购物车商品数量 */
    @Excel(name = "购物车商品数量")
    private String carQuantity;

    /** 购物车商品价格 */
    @Excel(name = "购物车商品价格")
    private BigDecimal carPrices;

    /** 购物车主姓名 */
    @Excel(name = "购物车主姓名")
    private String carUsername;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCarName(String carName)
    {
        this.carName = carName;
    }

    public String getCarName()
    {
        return carName;
    }
    public void setCarQuantity(String carQuantity)
    {
        this.carQuantity = carQuantity;
    }

    public String getCarQuantity()
    {
        return carQuantity;
    }
    public void setCarPrices(BigDecimal carPrices)
    {
        this.carPrices = carPrices;
    }

    public BigDecimal getCarPrices()
    {
        return carPrices;
    }
    public void setCarUsername(String carUsername)
    {
        this.carUsername = carUsername;
    }

    public String getCarUsername()
    {
        return carUsername;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("carName", getCarName())
            .append("carQuantity", getCarQuantity())
            .append("carPrices", getCarPrices())
            .append("carUsername", getCarUsername())
            .toString();
    }
}
