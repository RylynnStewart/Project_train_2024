<template>
  <div class="app-container home">
    <el-container>
      <el-aside class="full-height-aside">
        <div class="image-content">
          <img src="../../img/img.png" alt="Left Image" class="image" />
        </div>
      </el-aside>
      <el-main>
        <h3>以下为推荐菜品</h3>
        <div class="grid-content bg-purple">
          <el-carousel :interval="2000" arrow="always" height="200px">
            <el-carousel-item v-for="image in item" :key="image.id">

             <img :src="image.src" class="carousel-image" style="object-fit: cover; width: 100%; height: 100%;" />
             <h3 class="carousel-item-title"style="color: aqua;">{{ image.title }}</h3>
            </el-carousel-item>
          </el-carousel>
        </div>
            <h3>以下为推荐房间</h3>
         <div class="grid-content bg-purple" style="margin-top: 100px;">
          <el-carousel :interval="2000" arrow="always" height="200px">
            <el-carousel-item v-for="image in item2" :key="image.id">

             <img :src="image.src" class="carousel-image" style="object-fit: cover; width: 100%; height: 100%;" />
              <h3 class="carousel-item-title" style="color: aqua;">{{ image.title }}</h3>
            </el-carousel-item>
          </el-carousel>
        </div>

      </el-main>
    </el-container>
  </div>
</template>


<script>
export default {
  data() {
    return {
      item: [
        { id: 1, src: require('../../img/s1.jpg'),title: '套餐1' },
        { id: 2, src: require('../../img/s2.jpg'),title: '套餐2' },
        { id: 3, src: require('../../img/s3.jpg'),title: '套餐3' },
      ],
      item2: [
        { id: 1, src: require('../../img/f1.jpg'),title: '房间1' },
        { id: 2, src: require('../../img/f2.jpg'),title: '房间2' },
        { id: 3, src: require('../../img/f3.jpg'),title: '房间3' },
      ],
    };
  },
};
</script>

<style scoped lang="scss">
  .el-header, .el-footer {
    background-color: #ffffff;
    color: #333;
    text-align: center;
    line-height: 60px;
  }

  .el-aside {
    background-color: #ffffff;
    color: #333;
    text-align: center;
    line-height: 200px;
  }

  .el-main {
    background-color: #ffffff;
    color: #333;
    text-align: center;
    line-height: 160px;
  }

  body > .el-container {
    // margin-bottom: 40px;
  }

  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }

  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }


  .el-main,
  .el-footer {
    height: 100vh; /* 将右侧容器高度设置为页面高度的一半 */
  }
.el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 1;
    line-height: 300px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #ffffff;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #ffffff;
  }
  /* 其他样式... */
 .full-height-aside {
   height: 100vh; /* 设置aside高度为页面高度 */

   .image-content {
     height: 100%; /* 设置图片容器的高度为100% */
     display: flex;
     // justify-content: center;
     align-items: center;
     // overflow: hidden; /* 隐藏溢出部分 */

     .image {
       width: 100%; /* 让图片宽度填充整个容器 */
       object-fit: cover; /* 让图片等比例缩放以完全显示图片 */
       /* 如果您希望图片完全填充容器，可以使用 object-fit: cover; */

       /* 如果您希望保持原始图片大小，可以移除 object-fit 属性 */
     }
   }
 }
 .carousel-image {
     width: 100%; /* 让图片宽度填充整个走马灯项 */
     height: 80%; /* 让图片高度填充整个走马灯项 */
     object-fit: cover; /* 让图片等比例缩放以完全显示图片 */
   }
   .carousel-item-wrapper {
     position: relative;
     width: 100%;
     height: 100%;
   }

   .carousel-item-title {
     position: absolute;
     bottom: 10px; /* 调整标题距离底部的距离 */
     left: 10px; /* 调整标题距离左侧的距离 */
     z-index: 1; /* 设置标题的堆叠顺序，确保标题位于图片上方 */
     color: white; /* 设置标题的颜色 */
     font-size: 16px; /* 设置标题的字体大小 */
   }
</style>
