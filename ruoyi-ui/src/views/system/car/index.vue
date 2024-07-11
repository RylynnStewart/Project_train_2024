<template>
  <div class="app-container">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:car:remove']"
        >删除</el-button>
      </el-col>
<el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="payAll"
        >全部购买</el-button>
        <span> 目前价格总额：￥{{ totalAmount }}</span>
      </el-col>
      <!-- <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar> -->
    </el-row>

    <el-table v-loading="loading" :data="carList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="购物车Id" align="center" prop="id" /> -->
      <!-- <el-table-column label="购物车主姓名" align="center" prop="carUsername" /> -->
      <el-table-column label="购物车商品名" align="center" prop="carName" />
      <el-table-column label="购物车商品数量" align="center" prop="carQuantity" />
      <el-table-column label="购物车商品价格" align="center" prop="carPrices" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
         <el-button
           size="mini"
           type="text"
           icon="el-icon-edit"
           @click="payOne(scope.row)"

         >购买</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:car:remove']"
          >移除购物车</el-button>
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

    <!-- 添加或修改购物车对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="购物车商品名" prop="carName">
          <el-input v-model="form.carName" placeholder="请输入购物车商品名" />
        </el-form-item>
        <el-form-item label="购物车商品数量" prop="carQuantity">
          <el-input v-model="form.carQuantity" placeholder="请输入购物车商品数量" />
        </el-form-item>
        <el-form-item label="购物车商品价格" prop="carPrices">
          <el-input v-model="form.carPrices" placeholder="请输入购物车商品价格" />
        </el-form-item>
        <el-form-item label="购物车主姓名" prop="carUsername">
          <el-input v-model="form.carUsername" placeholder="请输入购物车主姓名" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCar, getCar, delCar, addCar, updateCar } from "@/api/system/car";

export default {
  name: "Car",
  data() {
    return {
      rowAmount:0,
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
      // 购物车表格数据
      carList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        carName: null,
        carQuantity: null,
        carPrices: null,
        carUsername: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    payAll() {
     if (this.totalAmount === 0) {
         this.$message.error("支付金额不能为0");
         return; // 终止后续功能
       }
      window.open("http://localhost:9201/alipay/pay?subject="+  this.$store.getters.name +"食物商品&traceNo=" + Math.floor(Date.now() / 1000) + "&totalAmount=" +this.totalAmount)
      this.$message.success("请求支付宝成功");
this.ids = this.carList.map(item => item.id);
  this.handleDelete2();
    },
    payOne(row) {
      console.log(row);
      this.rowAmount = row.carPrices * row.carQuantity;
      console.log(this.rowAmount);
      if (this.rowAmount === 0) {
        this.$message.error("支付金额不能为0");
        return; // 终止后续功能
      }
      window.open("http://localhost:9201/alipay/pay?subject=" + this.$store.getters.name + row.carName + "&traceNo=" + Math.floor(Date.now() / 1000) + "&totalAmount=" + this.rowAmount);
      this.$message.success("请求支付宝成功");

      // 删除购物车数据
      const ids = row.id || this.ids;
      delCar(ids).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      });
    },

    /** 查询购物车列表 */
   getList() {
     this.loading = true;
     listCar(this.queryParams).then(response => {
       this.carList = response.rows;
       this.total = response.total;
       this.loading = false;

       // 计算总价格
       this.calculateTotalAmount();
     });
   },
   calculateTotalAmount() {
     this.totalAmount = this.carList.reduce((total, item) => {
       return total + item.carQuantity * item.carPrices;
     }, 0);
   },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        carName: null,
        carQuantity: null,
        carPrices: null,
        carUsername: null
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加购物车";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCar(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改购物车";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCar(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCar(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleDelete2() {
      const ids = this.ids;
      // 删除购物车数据
      delCar(ids).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除购物车编号为"' + ids + '"的数据项？').then(function() {
        return delCar(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/car/export', {
        ...this.queryParams
      }, `car_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
