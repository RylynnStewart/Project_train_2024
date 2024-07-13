import request from '@/utils/request'

// 查询房间列表
export function listRoominfo(query) {
  return request({
    url: '/system/info/list',
    method: 'get',
    params: query
  })
}

// 查询房间详细
export function getRoominfo(roomId) {
  return request({
    url: '/system/info/' + roomId,
    method: 'get'
  })
}

// 新增房间
export function addRoominfo(data) {
  return request({
    url: '/system/info',
    method: 'post',
    data: data
  })
}

// 修改房间
export function updateRoominfo(data) {
  return request({
    url: '/system/info',
    method: 'put',
    data: data
  })
}

// 删除房间
export function delRoominfo(roomId) {
  return request({
    url: '/system/info/' + roomId,
    method: 'delete'
  })
}

// 清退房间
export function  OutRoom(data){
  return request({
    url: '/system/info/OutRoom',
    method: 'post',
     data: data
  })
}
