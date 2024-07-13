import request from '@/utils/request'

// 查询人员列表
export function listEmp(query) {
  return request({
    url: '/system/emp/list',
    method: 'get',
    params: query
  })
}

// 查询人员详细
export function getEmp(empName) {
  return request({
    url: '/system/emp/' + empName,
    method: 'get'
  })
}

// 新增人员
export function addEmp(data) {
  return request({
    url: '/system/emp',
    method: 'post',
    data: data
  })
}

// 修改人员
export function updateEmp(data) {
  return request({
    url: '/system/emp',
    method: 'put',
    data: data
  })
}

// 删除人员
export function delEmp(empName) {
  return request({
    url: '/system/emp/' + empName,
    method: 'delete'
  })
}
