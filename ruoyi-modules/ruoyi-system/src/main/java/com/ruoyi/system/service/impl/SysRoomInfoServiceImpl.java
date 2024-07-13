package com.ruoyi.system.service.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysRoomInfoMapper;
import com.ruoyi.system.domain.SysRoomInfo;
import com.ruoyi.system.service.ISysRoomInfoService;

/**
 * 房间Service业务层处理
 * 
 * @author liuhao
 * @date 2024-02-29
 */
@Service
public class SysRoomInfoServiceImpl implements ISysRoomInfoService 
{
    @Autowired
    private SysRoomInfoMapper sysRoomInfoMapper;

    /**
     * 查询房间
     * 
     * @param roomId 房间主键
     * @return 房间
     */
    @Override
    public SysRoomInfo selectSysRoomInfoByRoomId(Long roomId)
    {
        return sysRoomInfoMapper.selectSysRoomInfoByRoomId(roomId);
    }

    /**
     * 查询房间列表
     * 
     * @param sysRoomInfo 房间
     * @return 房间
     */
    @Override
    public List<SysRoomInfo> selectSysRoomInfoList(SysRoomInfo sysRoomInfo)
    {
        return sysRoomInfoMapper.selectSysRoomInfoList(sysRoomInfo);
    }

    /**
     * 新增房间
     * 
     * @param sysRoomInfo 房间
     * @return 结果
     */
    @Override
    public int insertSysRoomInfo(SysRoomInfo sysRoomInfo)
    {
        return sysRoomInfoMapper.insertSysRoomInfo(sysRoomInfo);
    }

    /**
     * 修改房间
     * 
     * @param sysRoomInfo 房间
     * @return 结果
     */
    @Override
    public int updateSysRoomInfo(SysRoomInfo sysRoomInfo)
    {
        return sysRoomInfoMapper.updateSysRoomInfo(sysRoomInfo);
    }

    /**
     * 批量删除房间
     * 
     * @param roomIds 需要删除的房间主键
     * @return 结果
     */
    @Override
    public int deleteSysRoomInfoByRoomIds(Long[] roomIds)
    {
        return sysRoomInfoMapper.deleteSysRoomInfoByRoomIds(roomIds);
    }

    /**
     * 删除房间信息
     * 
     * @param roomId 房间主键
     * @return 结果
     */
    @Override
    public int deleteSysRoomInfoByRoomId(Long roomId)
    {
        return sysRoomInfoMapper.deleteSysRoomInfoByRoomId(roomId);
    }

    @Override
    public int outRoom(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = new Date();
        String formattedDate = sdf.format(date1);
        System.out.println(formattedDate);

        return sysRoomInfoMapper.outRoom(date1);
    }
}
