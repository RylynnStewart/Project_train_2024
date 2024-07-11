<template>
  <div class="product-details">
    <div class="page-container">
      <h1 class="page-title">商品详情展示页</h1>
    </div>
    <el-row :gutter="20">
      <el-col :xs="24" :sm="12">
        <div class="product-image">
          <img :src="fangjianData.roomImg" alt="Product Image">
        </div>
      </el-col>
      <el-col :xs="24" :sm="12">
        <div class="product-info">
          <h1>商品名称：{{ fangjianData.roomName }}</h1>
          <p class="price">单价: {{ fangjianData.roomPrices }}</p>
          <!-- <p class="likes">点赞数: {{ fangjianData.roomImg }}</p> -->
          <el-tag type="danger">{{fangjianData.roomInfo}}</el-tag>
        </div>
      </el-col>
    </el-row>
    <el-button type="primary" @click="$router.back()">返回</el-button>
  </div>
</template>

<script>
export default {
  name: "fangjianinfo",
  data() {
    return {
      fangjianData: null
    };
  },
  created() {
    this.fangjianData = JSON.parse(this.$route.query.fangjianData);
    console.log(this.fangjianData);
  },
  methods: {}
};
</script>

<style scoped>
.product-details {
  padding: 20px;
}

.product-image img {
  max-width: 100%;
  height: auto;
}

.product-info {
  padding: 20px;
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
</style>
