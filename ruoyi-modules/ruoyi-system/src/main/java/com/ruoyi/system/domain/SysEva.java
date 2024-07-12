package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 菜品评价对象 sys_eva
 * 
 * @author liuhao
 * @date 2024-03-01
 */
public class SysEva extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 评价ID */
    private Long evaId;

    /** 评价者 */
    @Excel(name = "评价者")
    private String evaUsername;

    /** 被评价商品 */
    @Excel(name = "被评价商品")
    private String evaGoodsname;

    /** 评价内容 */
    @Excel(name = "评价内容")
    private String evaContents;

    /** 评价头像 */
    @Excel(name = "评价头像")
    private String evaUserimg;

    /** 评价日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "评价日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date evaCreate;

    public void setEvaId(Long evaId) 
    {
        this.evaId = evaId;
    }

    public Long getEvaId() 
    {
        return evaId;
    }
    public void setEvaUsername(String evaUsername) 
    {
        this.evaUsername = evaUsername;
    }

    public String getEvaUsername() 
    {
        return evaUsername;
    }
    public void setEvaGoodsname(String evaGoodsname) 
    {
        this.evaGoodsname = evaGoodsname;
    }

    public String getEvaGoodsname() 
    {
        return evaGoodsname;
    }
    public void setEvaContents(String evaContents) 
    {
        this.evaContents = evaContents;
    }

    public String getEvaContents() 
    {
        return evaContents;
    }
    public void setEvaUserimg(String evaUserimg) 
    {
        this.evaUserimg = evaUserimg;
    }

    public String getEvaUserimg() 
    {
        return evaUserimg;
    }
    public void setEvaCreate(Date evaCreate) 
    {
        this.evaCreate = evaCreate;
    }

    public Date getEvaCreate() 
    {
        return evaCreate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("evaId", getEvaId())
            .append("evaUsername", getEvaUsername())
            .append("evaGoodsname", getEvaGoodsname())
            .append("evaContents", getEvaContents())
            .append("evaUserimg", getEvaUserimg())
            .append("evaCreate", getEvaCreate())
            .toString();
    }
}
