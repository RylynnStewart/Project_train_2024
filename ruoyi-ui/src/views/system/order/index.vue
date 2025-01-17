<template>
  <div class="app-container">
    
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange" @sort-change="handleSortChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="id" /> -->
      <el-table-column label="购买人" align="center" prop="userName" />
      <el-table-column label="订单名称" align="center" prop="name" />
      <el-table-column label="订单id" align="center" prop="orderId" />
      <el-table-column label="支付宝订单号" align="center" prop="alipayNo" />
      <el-table-column label="更新时间" align="center" prop="payTime" width="180" :sort-orders="['descending','ascending']" sortable="custom">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="商品id" align="center" prop="goodsId" /> -->
      <el-table-column label="总价格" align="center" prop="total" />
      <el-table-column label="状态" align="center" prop="state">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order2_state" :value="scope.row.state"/>
        </template>
      </el-table-column>
      <el-table-column label="配送地址" align="center" prop="location" />
     <el-table-column label="配送日期" align="center" prop="getDate" width="180">
       <template slot-scope="scope">
         <span>{{ parseTime(scope.row.getDate, '{y}-{m}-{d}') }}</span>
       </template>
     </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:order:edit']"
            :disabled="scope.row.goodsId===1"
          >配送</el-button>
 <!--         <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:order:remove']"
          >删除</el-button> -->
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

    <!-- 添加或修改交易订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
       <el-form-item label="配送地址" prop="location" :rules="[ { required: true, message: '配送地址不能为空', trigger: 'blur' } ]">
          <el-input v-model="form.location" placeholder="请输入配送地址(可以选择堂食)" />
        </el-form-item>
       <el-form-item label="配送日期" prop="getDate">
             <el-date-picker
               v-model="form.getDate"
               type="datetime"
               placeholder="选择日期和时间"
               format="yyyy-MM-dd"
               value-format="yyyy-MM-dd"
             ></el-date-picker>
           </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确定</el-button>
        <el-button @click="cancel">取消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/system/order";

export default {
  name: "Order",
  dicts: ['sys_order2_state'],
  data() {
    return {
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
      // 交易订单表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: this.$store.getters.name,
        name: null,
        orderId: null,
        alipayNo: null,
        payTime: null,
        goodsId: null,
        total: null,
        state: null,
        location: null,
        getDate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        payTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    handleSortChange(column) {
          this.queryParams.orderByColumn = column.prop;//查询字段是表格中字段名字
          this.queryParams.isAsc = column.order;//动态取值排序顺序
          this.getList();
        },
    /** 查询交易订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
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
        id: null,
        userName: this.$store.getters.name,
        name: null,
        orderId: null,
        alipayNo: null,
        createTime: null,
        payTime: null,
        goodsId: null,
        total: null,
        state: null,
        location: null,
        getDate: null
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
      this.title = "添加交易订单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改交易订单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 获取当前日期对象
          const currentDate = new Date();
          const selectedDate = new Date(this.form.getDate);  // 假设日期选择框的 v-model 为 form.getDate
          console.log(currentDate);
          console.log(selectedDate);

               if (selectedDate < currentDate) {
                 this.$message.error('选择的日期不能早于当前日期');
                 return; // 阻止表单提交
               }


          if (this.form.id != null) {
            this.form.goodsId=1;
            updateOrder(this.form).then(response => {
              console.log(this.form.goodsId);
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除交易订单编号为"' + ids + '"的数据项？').then(function() {
        return delOrder(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
