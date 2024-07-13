import request from '@/utils/request'

// 查询aa列表
export function listMyceshi(query) {
  return request({
    url: '/system/myceshi/list',
    method: 'get',
    params: query
  })
}

// 查询aa详细
export function getMyceshi(myname) {
  return request({
    url: '/system/myceshi/' + myname,
    method: 'get'
  })
}

// 新增aa
export function addMyceshi(data) {
  return request({
    url: '/system/myceshi',
    method: 'post',
    data: data
  })
}

// 修改aa
export function updateMyceshi(data) {
  return request({
    url: '/system/myceshi',
    method: 'put',
    data: data
  })
}

// 删除aa
export function delMyceshi(myname) {
  return request({
    url: '/system/myceshi/' + myname,
    method: 'delete'
  })
}
