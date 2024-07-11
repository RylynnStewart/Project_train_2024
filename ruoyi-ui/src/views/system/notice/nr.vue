<template>
  <div class="email-content">
    <div class="email-header">
      <h1>{{ noticeData.noticeTitle }}</h1>
      <div class="email-info">
        <div class="email-sender">
          公告发起人：<span>{{ noticeData.createBy }}</span>
        </div>
        <div class="email-date">
          时间：<span>{{ noticeData.createTime }}</span>
        </div>
      </div>

    </div>
    <div class="email-body">
      <div v-html="noticeData.noticeContent"></div>
    </div>
	<el-button type="primary" @click="$router.back()">返回</el-button>
  </div>
</template>


<style scoped>
.email-content {
  background-image: url(../img/img.png); /* 替换为您的背景图片路径 */
  background-color: rgba(174, 251, 255, 0.5); /* 背景颜色透明度 */
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  background-repeat: no-repeat; /* 不平铺 */
  background-position: center bottom; /* 图片位于底部中间 */
  background-size: 100% auto; /* 图片宽度100%，高度自适应 */
}




.email-header {
  margin-bottom: 20px;
  text-align: center;
}

.email-header h2 {
  font-size: 24px;
  margin-bottom: 10px;
  color: #333;
}

.email-info {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 10px;
	border-bottom:  solid rgba(118, 99, 125, 0.5);
}

.email-info div {
  margin-right: 20px;
}

.email-info span {
  color: #666;
}

.email-body {
  line-height: 1.8;
  color: #333;
  height: 700px;
  text-align: center; /* 文字居中 */
}

.email-body p {
  margin-bottom: 10px;
  border-bottom: rgba(239, 79, 202, 0.7);
  font-size: 50px; /* 放大文字大小 */
}


.email-sender span {
  color: #fd0505;
}

.email-accepter span {
  color: #1c94f4;
}
</style>

<script>
export default {
  name: "noticeContent",
  data() {
    return {
      noticeData: null
    };
  },
  created() {
    this.noticeData = JSON.parse(this.$route.query.noticeData);
    console.log(this.noticeData);
  },
  methods: {}
};
</script>
