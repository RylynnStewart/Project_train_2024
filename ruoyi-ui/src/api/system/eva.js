import request from '@/utils/request'

// 查询菜品评价列表
export function listEva(query) {
  return request({
    url: '/system/eva/list',
    method: 'get',
    params: query
  })
}

// 查询菜品评价详细
export function getEva(evaId) {
  return request({
    url: '/system/eva/' + evaId,
    method: 'get'
  })
}

// 新增菜品评价
export function addEva(data) {
  return request({
    url: '/system/eva',
    method: 'post',
    data: data
  })
}

// 修改菜品评价
export function updateEva(data) {
  return request({
    url: '/system/eva',
    method: 'put',
    data: data
  })
}

// 删除菜品评价
export function delEva(evaId) {
  return request({
    url: '/system/eva/' + evaId,
    method: 'delete'
  })
}
