package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 交易订单对象 sys_order
 * 
 * @author HuChangtao
 * @date 2024-07-12
 */
public class SysOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 购买人 */
    @Excel(name = "购买人")
    private String userName;

    /** 订单名称 */
    @Excel(name = "订单名称")
    private String name;

    /** 订单id */
    @Excel(name = "订单id")
    private String orderId;

    /** 支付宝订单号 */
    @Excel(name = "支付宝订单号")
    private String alipayNo;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 商品id */
    @Excel(name = "商品id")
    private Long goodsId;

    /** 总价格 */
    @Excel(name = "总价格")
    private BigDecimal total;

    /** 状态 */
    @Excel(name = "状态")
    private String state;

    /** 配送地址 */
    @Excel(name = "配送地址")
    private String location;

    /** 配送日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "配送日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date getDate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setAlipayNo(String alipayNo) 
    {
        this.alipayNo = alipayNo;
    }

    public String getAlipayNo() 
    {
        return alipayNo;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }
    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setTotal(BigDecimal total) 
    {
        this.total = total;
    }

    public BigDecimal getTotal() 
    {
        return total;
    }
    public void setState(String state) 
    {
        this.state = state;
    }

    public String getState() 
    {
        return state;
    }
    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
    }
    public void setGetDate(Date getDate) 
    {
        this.getDate = getDate;
    }

    public Date getGetDate() 
    {
        return getDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userName", getUserName())
            .append("name", getName())
            .append("orderId", getOrderId())
            .append("alipayNo", getAlipayNo())
            .append("createTime", getCreateTime())
            .append("payTime", getPayTime())
            .append("goodsId", getGoodsId())
            .append("total", getTotal())
            .append("state", getState())
            .append("location", getLocation())
            .append("getDate", getGetDate())
            .toString();
    }
}
