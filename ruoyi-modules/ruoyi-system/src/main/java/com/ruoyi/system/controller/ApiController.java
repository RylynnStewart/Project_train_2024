package com.ruoyi.system.controller;//package com.ruoyi.system.controller;
//
//import com.example.alipay.dao.GoodsMapper;
//import com.example.alipay.dao.OrdersMapper;
//import com.example.alipay.entity.Goods;
//import com.example.alipay.entity.Sys_order;
//import org.mybatis.spring.annotation.MapperScan;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.bind.annotation.*;
//
//import javax.annotation.Resource;
//import java.math.BigDecimal;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//
//@CrossOrigin(origins = "*")
//@RestController
//@RequestMapping("/api")
//@MapperScan("com.example.alipay.dao")
//public class ApiController {
//
//    @Resource
//    private GoodsMapper goodsMapper;
//
//    @Resource
//    private OrdersMapper ordersMapper;
//
//    @GetMapping("/goods")
//    public List<Goods> getGoods() {
//        return goodsMapper.selectList(null);
//    }
//
//    @GetMapping("/orders")
//    public List<Sys_order> getOrders() {
//        return ordersMapper.selectList(null);
//    }
//
//    @Transactional
//    @PostMapping("/buy")
//    public boolean buy(@RequestParam Integer goodsId) {
//        Goods goods = goodsMapper.selectById(goodsId);
//        int store = goods.getStore() - 1;
//        if (store < 0) {
//            return false;
//        }
//        Date date = new Date();
//        Sys_order sysorder = new Sys_order();
//        sysorder.setGoodsId(goodsId);
//        sysorder.setCreateTime(date);
//        sysorder.setName("购买" + goods.getName() + "订单");
//        sysorder.setOrderId(new SimpleDateFormat("yyyyMMdd").format(date) + System.currentTimeMillis());
//        sysorder.setTotal(goods.getPrice().multiply(BigDecimal.ONE));
//
//        goods.setStore(store);
//        return ordersMapper.insert(sysorder) > 0 &&  goodsMapper.updateById(goods) > 0;
//    }
//}
