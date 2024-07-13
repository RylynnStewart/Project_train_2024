<template>
  <div class="dashboard-editor-container">
    <panel-group/>
    <div class="charts" id="main" style="height: 350px"></div>
   <el-row :gutter="32">
     <el-col :xs="24" :sm="24" :lg="4">
       <div class="chart-wrapper">
         <!-- 左侧内容 -->
       </div>
     </el-col>
     <el-col :xs="24" :sm="24" :lg="16">
       <div class="chart-wrapper">
         <!-- 中间内容 -->
       </div>
     </el-col>
     <el-col :xs="24" :sm="24" :lg="4">
       <div class="chart-wrapper">
         <!-- 右侧内容 -->
       </div>
     </el-col>
   </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts/core';
import PanelGroup from './dashboard/PanelGroup'
import RaddarChart from './dashboard/RaddarChart'
import PieChart from './dashboard/PieChart'
import BarChart from './dashboard/BarChart'
import { listOrder, getOrder, delOrder, addOrder, updateOrder,getEc } from "@/api/system/order";

import { init, use } from 'echarts/core';
import { LineChart } from 'echarts/charts';
import { TooltipComponent, GridComponent, LegendComponent, ToolboxComponent } from 'echarts/components';
import { CanvasRenderer } from 'echarts/renderers';
use([LineChart, TooltipComponent, GridComponent, LegendComponent, ToolboxComponent, CanvasRenderer]);
export default {
  name: 'Index',
  components: {
    PanelGroup,
    RaddarChart,
    PieChart,
    BarChart
  },
  data() {
    return {

      actualData1:[],
      actualData2:[],
      useList:[],
      mtotal:null,
      dtotal:null,
      mdate:null,
      ddate:null
}
    },
  created() {
    this.getList1();

  },
    mounted() {
      this.moneyExcharts1();
    },
  methods: {
   getList1() {
     this.loading = true;
     getEc().then(response => {
       console.log(response);
       this.loading = false;

       this.useList = response;
       console.log("----");
       console.log(this.useList);
       this.actualData1 = this.useList.rows.slice(0, 8).map(obj => obj.total);
       this.actualData2 = this.useList.rows.slice(0, 8).map(obj => obj.payTime);
       console.log(this.actualData1);
       console.log(this.actualData2);
       this.moneyExcharts1();
     });
   },
moneyExcharts1() {
  this.chart = init(document.getElementById('main'));
  const option = {
    title: {
      text: '近8日流水图',
      left: 'center'
    },
    xAxis: {
      type: 'category',
      data: this.actualData2
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: this.actualData1,
        type: 'effectScatter', // 使用特效散点图
        symbolSize: 15,
        showEffectOn: 'render',
        rippleEffect: {
          brushType: 'stroke'
        },
        itemStyle: {
          color: 'yellow',
          shadowBlur: 10,
          shadowColor: 'rgba(25, 100, 150, 0.5)'
        },
        label: { // 添加 label 显示具体数值
          show: true,
          position: 'top',
          color: 'black' // 可自定义颜色
        }
      },
      {
        data: this.actualData1,
        type: 'line', // 使用线图表连接散点
        lineStyle: {
          type: 'dashed', // 设置虚线样式
          color: {
            type: 'linear',
            x: 0,
            y: 0,
            x2: 0,
            y2: 1,
            colorStops: [{
              offset: 0, color: 'red' // 渐变色起始
            }, {
              offset: 1, color: 'blue' // 渐变色结束
            }],
            global: false // 缺省为 false
          },
          width: 2
        },
        animation: true, // 添加动画效果
        animationDuration: 2000, // 动画时长
        animationEasing: 'elasticOut', // 动画效果
        // label: { // 添加 label 显示具体数值
        //   show: true,
        //   position: 'top',
        //   color: 'black' // 可自定义颜色
        // },
        tooltip: { // 添加 tooltip 显示具体数值
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          }
        }
      }
    ]
  };
  this.chart.setOption(option);
}





  }
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {

  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}
.charts {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }

@media (max-width:1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
