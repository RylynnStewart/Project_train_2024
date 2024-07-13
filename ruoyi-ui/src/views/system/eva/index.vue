<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="评价日期" prop="evaCreate">
        <el-date-picker clearable
          v-model="queryParams.evaCreate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择评价日期">
        </el-date-picker>
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
          v-hasPermi="['system:eva:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:eva:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="evaList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="被评价商品" align="center" prop="evaGoodsname" />
      <el-table-column label="评价内容" align="center" prop="evaContents" />
      <!-- <el-table-column label="评价文件" align="center" prop="evaUserimg" /> -->
     <el-table-column label="评价日期" align="center" prop="evaCreate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.evaCreate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:eva:remove']"
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

    <!-- 添加或修改菜品评价对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
 <!--       <el-form-item label="评价者" prop="evaUsername">
          <el-input v-model="form.evaUsername" placeholder="请输入评价者" />
        </el-form-item> -->
              <el-form-item label="被评商品" prop="evaGoodsname">
                <el-select v-model="form.evaGoodsname" placeholder="请选择被评价商品">
                  <el-option
                    v-for="goods in goodsList"
                    :key="goods.id"
                    :label="goods.goodsName"
                    :value="goods.goodsName"
                  />
                </el-select>
              </el-form-item>

        <el-form-item label="评价内容" prop="evaContents">
          <el-input v-model="form.evaContents" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      <!--  <el-form-item label="评价文件" prop="evaUserimg">
          <file-upload v-model="form.evaUserimg"/>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listEva, getEva, delEva, addEva, updateEva } from "@/api/system/eva";
import { listGl, getGl, delGl, addGl, updateGl } from "@/api/system/gl";
export default {
  name: "Eva",
  data() {
    return {
      youName: this.$store.getters.name,
      nowDate: new Date().toISOString().split("T")[0],
      goodsList:[],
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
        evaUsername: this.$store.getters.name,
        evaGoodsname: null,
        evaContents: null,
        evaUserimg: null,
        evaCreate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        evaGoodsname: [
          { required: true, message: "被评价商品不能为空", trigger: "change" }
        ],
        evaContents: [
          { required: true, message: "评价内容不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getGoodsList();
    // console.log(this.nowDate);
  },
  methods: {
     getGoodsList() {
        // 调用API从另一个表中获取商品数据
        listGl().then(response => {
          // console.log(response);
          this.goodsList = response.rows; // 假设API返回的商品数据是一个数组
           console.log(this.goodsList);
        });
      },
    /** 查询菜品评价列表 */
    getList() {
      this.loading = true;
      listEva(this.queryParams).then(response => {
        this.evaList = response.rows;
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
        evaId: null,
        evaUsername: null,
        evaGoodsname: null,
        evaContents: null,
        evaUserimg: null,
        evaCreate: null
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
      this.ids = selection.map(item => item.evaId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加菜品评价";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const evaId = row.evaId || this.ids
      getEva(evaId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改菜品评价";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.evaId != null) {
            this.form.evaCreate=this.nowDate;
            updateEva(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.form.evaUsername=this.youName;
            this.form.evaCreate=this.nowDate;
            addEva(this.form).then(response => {
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
      const evaIds = row.evaId || this.ids;
      this.$modal.confirm('是否确认删除菜品评价编号为"' + evaIds + '"的数据项？').then(function() {
        return delEva(evaIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/eva/export', {
        ...this.queryParams
      }, `eva_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
