package com.ruoyi.system.mapper;


import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.SysRoomInfo;

/**
 * 房间Mapper接口
 * 
 * @author liuhao
 * @date 2024-02-29
 */
public interface SysRoomInfoMapper 
{
    /**
     * 查询房间
     * 
     * @param roomId 房间主键
     * @return 房间
     */
    public SysRoomInfo selectSysRoomInfoByRoomId(Long roomId);

    /**
     * 查询房间列表
     * 
     * @param sysRoomInfo 房间
     * @return 房间集合
     */
    public List<SysRoomInfo> selectSysRoomInfoList(SysRoomInfo sysRoomInfo);

    /**
     * 新增房间
     * 
     * @param sysRoomInfo 房间
     * @return 结果
     */
    public int insertSysRoomInfo(SysRoomInfo sysRoomInfo);

    /**
     * 修改房间
     * 
     * @param sysRoomInfo 房间
     * @return 结果
     */
    public int updateSysRoomInfo(SysRoomInfo sysRoomInfo);

    /**
     * 删除房间
     * 
     * @param roomId 房间主键
     * @return 结果
     */
    public int deleteSysRoomInfoByRoomId(Long roomId);

    /**
     * 批量删除房间
     * 
     * @param roomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRoomInfoByRoomIds(Long[] roomIds);

     /**
      * 一键清退房间
      *
      * */

     public int outRoom(Date date);
}
