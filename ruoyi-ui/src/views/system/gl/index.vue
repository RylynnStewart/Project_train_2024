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
      <el-form-item label="商品状态" prop="goodsStatus">
        <el-select v-model="queryParams.goodsStatus" placeholder="请选择商品状态" clearable>
          <el-option
            v-for="dict in dict.type.goods_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          @click="handleAdd"
          v-hasPermi="['system:gl:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:gl:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:gl:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:gl:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="glList" @selection-change="handleSelectionChange"  @sort-change="handleSortChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="商品id" align="center" prop="goodsId" /> -->
      <el-table-column label="商品名" align="center" prop="goodsName" />
      <el-table-column label="商品价格" align="center" prop="goodsPrice" :sort-orders="['descending','ascending']" sortable="custom"/>
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
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:gl:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="success"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:gl:remove']"
          >删除</el-button>
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

    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="商品名" prop="goodsName">
          <el-input v-model="form.goodsName" placeholder="请输入商品名" />
        </el-form-item>
        <el-form-item label="商品价格" prop="goodsPrice">
          <el-input v-model="form.goodsPrice" placeholder="请输入商品价格" />
        </el-form-item>
        <!-- <el-form-item label="商品状态" prop="goodsStatus">
          <el-radio-group v-model="form.goodsStatus">
            <el-radio
              v-for="dict in dict.type.goods_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item> -->
       <!-- <el-form-item label="商品评价" prop="goodsPj">
          <el-input v-model="form.goodsPj" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="商品喜欢度" prop="goodsLikes">
          <el-input v-model="form.goodsLikes" placeholder="请输入商品喜欢度" /> -->
        </el-form-item>
        <el-form-item label="商品图片" prop="goodsImg">
          <image-upload v-model="form.goodsImg"/>
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
import { listGl, getGl, delGl, addGl, updateGl } from "@/api/system/gl";

export default {
  name: "Gl",
  dicts: ['goods_status'],
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
        goodsStatus: null,
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
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加商品管理";
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
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const goodsIds = row.goodsId || this.ids;
      this.$modal.confirm('是否确认删除商品管理编号为"' + goodsIds + '"的数据项？').then(function() {
        return delGl(goodsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/gl/export', {
        ...this.queryParams
      }, `gl_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
