import request from '@/utils/request'

// 查询测试列表
export function listCeshi(query) {
  return request({
    url: '/system/ceshi/list',
    method: 'get',
    params: query
  })
}

// 查询测试详细
export function getCeshi(useId) {
  return request({
    url: '/system/ceshi/' + useId,
    method: 'get'
  })
}

// 新增测试
export function addCeshi(data) {
  return request({
    url: '/system/ceshi',
    method: 'post',
    data: data
  })
}

// 修改测试
export function updateCeshi(data) {
  return request({
    url: '/system/ceshi',
    method: 'put',
    data: data
  })
}

// 删除测试
export function delCeshi(useId) {
  return request({
    url: '/system/ceshi/' + useId,
    method: 'delete'
  })
}
