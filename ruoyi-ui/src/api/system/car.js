import request from '@/utils/request'

// 查询购物车列表
export function listCar(query) {
  return request({
    url: '/system/car/list',
    method: 'get',
    params: query
  })
}

// 查询购物车详细
export function getCar(id) {
  return request({
    url: '/system/car/' + id,
    method: 'get'
  })
}

// 新增购物车
export function addCar(data) {
  return request({
    url: '/system/car',
    method: 'post',
    data: data
  })
}

// 修改购物车
export function updateCar(data) {
  return request({
    url: '/system/car',
    method: 'put',
    data: data
  })
}

// 删除购物车
export function delCar(id) {
  return request({
    url: '/system/car/' + id,
    method: 'delete'
  })
}
