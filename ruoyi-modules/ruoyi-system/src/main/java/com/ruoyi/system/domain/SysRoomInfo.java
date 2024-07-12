package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 房间对象 sys_room_info
 *
 * @author ruoyi
 * @date 2024-03-01
 */
public class SysRoomInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long roomId;

    /** 房间名称 */
    @Excel(name = "房间名称")
    private String roomName;

    /** 房间信息 */
    @Excel(name = "房间信息")
    private String roomInfo;

    /** 房间价格 */
    @Excel(name = "房间价格")
    private BigDecimal roomPrices;

    /** 房间状态 */
    @Excel(name = "房间状态")
    private String roomStatus;

    /** 房间图片 */
    @Excel(name = "房间图片")
    private String roomImg;

    /** 房间开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "房间开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date roomDate1;

    /** 房间到期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "房间到期时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date roomDate2;

    /** 房间订购者 */
    @Excel(name = "房间订购者")
    private String roomUsename;

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public Long getRoomId()
    {
        return roomId;
    }
    public void setRoomName(String roomName)
    {
        this.roomName = roomName;
    }

    public String getRoomName()
    {
        return roomName;
    }
    public void setRoomInfo(String roomInfo)
    {
        this.roomInfo = roomInfo;
    }

    public String getRoomInfo()
    {
        return roomInfo;
    }
    public void setRoomPrices(BigDecimal roomPrices)
    {
        this.roomPrices = roomPrices;
    }

    public BigDecimal getRoomPrices()
    {
        return roomPrices;
    }
    public void setRoomStatus(String roomStatus)
    {
        this.roomStatus = roomStatus;
    }

    public String getRoomStatus()
    {
        return roomStatus;
    }
    public void setRoomImg(String roomImg)
    {
        this.roomImg = roomImg;
    }

    public String getRoomImg()
    {
        return roomImg;
    }
    public void setRoomDate1(Date roomDate1)
    {
        this.roomDate1 = roomDate1;
    }

    public Date getRoomDate1()
    {
        return roomDate1;
    }
    public void setRoomDate2(Date roomDate2)
    {
        this.roomDate2 = roomDate2;
    }

    public Date getRoomDate2()
    {
        return roomDate2;
    }
    public void setRoomUsename(String roomUsename)
    {
        this.roomUsename = roomUsename;
    }

    public String getRoomUsename()
    {
        return roomUsename;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("roomId", getRoomId())
                .append("roomName", getRoomName())
                .append("roomInfo", getRoomInfo())
                .append("roomPrices", getRoomPrices())
                .append("roomStatus", getRoomStatus())
                .append("roomImg", getRoomImg())
                .append("roomDate1", getRoomDate1())
                .append("roomDate2", getRoomDate2())
                .append("roomUsename", getRoomUsename())
                .toString();
    }
}
