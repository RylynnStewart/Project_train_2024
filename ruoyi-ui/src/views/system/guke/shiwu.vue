<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="商品名" prop="goodsName">
        <el-input
          v-model="queryParams.goodsName"
          placeholder="请输入商品名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品价格" prop="goodsPrice">
        <el-input
          v-model="queryParams.goodsPrice"
          placeholder="请输入商品价格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

  <el-row :gutter="10" class="mb8">
    <el-col :span="1.5">
      <el-button
        type="primary"
        plain
        icon="el-icon-plus"
        size="mini"
        @click="payAll"
      >支付</el-button>
      <span> 目前价格总额：￥{{ totalAmount }}</span>
    </el-col>
  </el-row>

    <el-table v-loading="loading" :data="glList" @selection-change="handleSelectionChange"  @sort-change="handleSortChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <!-- <el-table-column label="商品id" align="center" prop="goodsId" /> -->
      <el-table-column label="商品名" align="center" prop="goodsName" />
      <el-table-column label="商品价格" align="center" prop="goodsPrice" :sort-orders="['descending','ascending']" sortable="custom"/>
        <el-table-column label="购买数量" align="center">
           <template slot-scope="scope">
             <el-input-number v-model="scope.row.quantity" @change="handleQuantityChange(scope.row)" :min="0" :max="10"></el-input-number>
           </template>
         </el-table-column>
      <el-table-column label="商品状态" align="center" prop="goodsStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.goods_status" :value="scope.row.goodsStatus"/>
        </template>
      </el-table-column>
      <!-- <el-table-column label="商品评价" align="center" prop="goodsPj" />
      <el-table-column label="商品喜欢度" align="center" prop="goodsLikes" /> -->
      <el-table-column label="商品图片" align="center" prop="goodsImg" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.goodsImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="primary"
            
            @click="payOne(scope.row)"

          >购买</el-button>
          <el-button
            size="mini"
            type="danger"

            @click="looknr(scope.row)"

          >详情</el-button>
          <el-button
            size="mini"
            type="success"
          
            @click="addcar(scope.row)"

          >加入购物车</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />


  </div>
</template>

<script>
import { listGl, getGl, delGl, addGl, updateGl,upSP } from "@/api/system/gl";
import { listCar, getCar, delCar, addCar, updateCar } from "@/api/system/car";
export default {
  name: "Gl",
  dicts: ['goods_status'],
  data() {
    return {
      carData:{
        carName: null,
        carQuantity: null,
        carPrices: null,
        carUsername: null
      },
      rowAmount: 0,
       totalAmount: 0,
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
      // 商品管理表格数据
      glList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        goodsName: null,
        goodsPrice: null,
        goodsStatus: 1,
        goodsPj: null,
        goodsLikes: null,
        goodsImg: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
         goodsName: [
                { required: true, message: '请输入商品名', trigger: 'blur' }
              ],
              goodsPrice: [
                { required: true, message: '请输入商品价格', trigger: 'blur' },
                { pattern: /^\d+(\.\d+)?$/, message: '商品价格必须为数字且可以带小数' }
              ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    addcar(row){
      if (!row.quantity) {
        this.$modal.msgError("购买数量不能为空");
        return; // 终止后续功能
      }
      this.carData.carName = row.goodsName;
      this.carData.carPrices = row.goodsPrice;
      this.carData.carQuantity = row.quantity;
      this.carData.carUsername = this.$store.getters.name;
      addCar(this.carData).then(response => {
        this.$modal.msgSuccess("新增成功");
      });
    },


    payAll() {
     if (this.totalAmount === 0) {
         this.$message.error("支付金额不能为0");
         return; // 终止后续功能
       }
      window.open("http://localhost:9201/alipay/pay?subject="+  this.$store.getters.name +"食物商品&traceNo=" + Math.floor(Date.now() / 1000) + "&totalAmount=" +this.totalAmount)
      this.$message.success("请求支付宝成功")
    },
    payOne(row) {
      console.log(this.rowAmount);
      if (!row.quantity) {
          this.$message.error("数量不能为0");
          return; // 终止后续功能
        }
        this.rowAmount=row.goodsPrice*row.quantity;
      console.log(this.rowAmount);
      window.open("http://localhost:9201/alipay/pay?subject="+this.$store.getters.name + row.goodsName + "&traceNo=" + Math.floor(Date.now() / 1000) + "&totalAmount=" + this.rowAmount)
      this.$message.success("请求支付宝成功");
      //购买数量增加
      const newlikes=row.goodsLikes + row.quantity;;
      // console.log(row);
      // console.log(newlikes);
      if (row.goodsId != null)
      {row.goodsLikes=newlikes;
        upSP(row).then(response => {

          console.log(row);
          this.$modal.msgSuccess("修改成功");
          this.getList();
        });
       }
    },
    looknr(row) {
       this.$router.push({
         path: '/guke/shiwuinfo',
         query: { shiwuData: JSON.stringify(row) }
       });
     },
   handleSelectionChange(selection) {
        // 只计算已上架商品的价格总额
        const validSelection = selection.filter(item => item.goodsStatus === '1');
        this.totalAmount = validSelection.reduce((total, item) => total + item.goodsPrice * item.quantity, 0);
      },
        handleQuantityChange(row) {
          this.calculateTotalAmount(this.glList.filter(item => item.quantity > 0));
        },
        calculateTotalAmount(selection) {
          this.totalAmount = selection.reduce((total, item) => total + item.goodsPrice * item.quantity, 0);
        },
    handleSortChange(column) {
          this.queryParams.orderByColumn = column.prop;//查询字段是表格中字段名字
          this.queryParams.isAsc = column.order;//动态取值排序顺序
          this.getList();
        },
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listGl(this.queryParams).then(response => {
        this.glList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        goodsId: null,
        goodsName: null,
        goodsPrice: null,
        goodsStatus: null,
        goodsPj: null,
        goodsLikes: null,
        goodsImg: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.goodsId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const goodsId = row.goodsId || this.ids
      getGl(goodsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改商品管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.goodsId != null) {
            updateGl(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGl(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    }
  }
};
</script>
