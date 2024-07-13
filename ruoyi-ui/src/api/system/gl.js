import request from '@/utils/request'

// 查询商品管理列表
export function listGl(query) {
  return request({
    url: '/system/gl/list',
    method: 'get',
    params: query
  })
}

// 查询商品管理详细
export function getGl(goodsId) {
  return request({
    url: '/system/gl/' + goodsId,
    method: 'get'
  })
}

// 新增商品管理
export function addGl(data) {
  return request({
    url: '/system/gl',
    method: 'post',
    data: data
  })
}

// 修改商品管理
export function updateGl(data) {
  return request({
    url: '/system/gl',
    method: 'put',
    data: data
  })
}

// 删除商品管理
export function delGl(goodsId) {
  return request({
    url: '/system/gl/' + goodsId,
    method: 'delete'
  })
}
// 增加商品数量
export function upSP(data) {
  return request({
    url: '/system/gl/upSP',
    method: 'post',
    data: data
  })
}
