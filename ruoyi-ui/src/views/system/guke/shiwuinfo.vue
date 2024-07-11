<template>
  <div class="product-details">
    <div class="page-container">
      <h1 class="page-title">商品详情展示页</h1>
    </div>
    <el-row :gutter="20">
           <el-col :xs="24" :sm="12" class="image-col">
             <div class="product-image">
               <img :src="shiwuData.goodsImg" alt="Product Image">
             </div>
           </el-col>
      <el-col :xs="24" :sm="12">
        <div class="product-info">
          <h1>商品名称：{{ shiwuData.goodsName }}</h1>
          <p class="price">单价: {{ shiwuData.goodsPrice }}</p>
          <el-tag type="danger">{{shiwuData.goodsPj}}</el-tag>
        </div>
      </el-col>
    </el-row>
   <h2 class="forum-title">商品评价</h2>
       <div class="forum-reviews-list">
         <div v-for="review in evaList" :key="review.id" class="forum-review">
           <div class="review-header">
             <div class="reviewer-info">
               <span class="reviewer-name">{{ review.evaUsername }}</span>
             </div>
             <div class="review-date">{{ parseTime(review.evaCreate, '{y}-{m}-{d}') }}</div>
           </div>
           <div class="review-content">
             <p class="review-text">{{ review.evaContents }}</p>
             <div class="review-image" v-if="review.evaUserimg">
               <img :src="review.evaUserimg" alt="Review Image">
             </div>
           </div>
         </div>
       </div>
       <pagination
         v-show="total > 0"
         :total="total"
         :page.sync="queryParams.pageNum"
         :limit.sync="queryParams.pageSize"
         @pagination="getList"
       />
    <el-button type="primary" @click="$router.back()">返回</el-button>
  </div>
</template>

<script>
  import { listEva, getEva, delEva, addEva, updateEva } from "@/api/system/eva";
export default {
  name: "shiwuinfo",
  data() {
    return {
      shiwuData: null,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 菜品评价表格数据
      evaList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        evaUsername: null,
        evaGoodsname: null,
        evaContents: null,
        evaUserimg: null,
        evaCreate: null
      },
      // 表单参数
      form: {},
    };
  },
  created() {

    this.shiwuData = JSON.parse(this.$route.query.shiwuData);
    this.queryParams.evaGoodsname = this.shiwuData.goodsName;
    this.getList();
    // console.log(this.shiwuData);
  },
  methods: {
    /** 查询菜品评价列表 */
    getList() {
      this.loading = true;
      listEva(this.queryParams).then(response => {
        this.evaList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
  }
};
</script>

<style scoped>
.product-details {
  padding: 20px;
}

.product-image img {
  max-width: 100%;
  height: 200px;
}

.product-info {
  padding: 20px;
}
.image-col {
  display: flex;
  justify-content: center;
  align-items: center;
  
}
h1 {
  font-size: 24px;
  margin-bottom: 10px;
}

.price, .likes {
  font-size: 18px;
  margin-bottom: 15px;
}
page-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* 将页面高度设置为视窗高度，实现垂直居中 */
}

.page-title {
  text-align: center;
  font-size: 32px;
  /* 如果需要其他样式，可以在这里添加 */
}

.forum-reviews {
  padding: 20px;
}

.forum-title {
  text-align: center;
  font-size: 24px;
  margin-bottom: 20px;
}

.forum-reviews-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.forum-review {
  border: 1px solid #ccc;
  padding: 15px;
  border-radius: 5px;
}

.review-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.reviewer-info {
  display: flex;
  align-items: center;
}

.reviewer-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 10px;
}

.review-date {
  font-size: 14px;
  color: #888;
}

.review-content {
  padding: 10px 0;
}

.review-title {
  font-size: 18px;
  margin-bottom: 10px;
}

.review-text {
  margin-bottom: 10px;
}

.review-image img {
  max-width: 100%;
  height: auto;
}
</style>
