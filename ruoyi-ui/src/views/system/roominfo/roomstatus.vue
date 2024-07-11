<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="房间名称" prop="roomName">
        <el-input
          v-model="queryParams.roomName"
          placeholder="请输入房间名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间状态" prop="roomStatus">
        <el-select v-model="queryParams.roomStatus" placeholder="请选择房间状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_room_status"
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
          @click="outRoom"
          v-hasPermi="['system:roominfo:add']"
        >一键清退</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="roominfoList" @selection-change="handleSelectionChange">
      <el-table-column label="房间名称" align="center" prop="roomName" />
      <el-table-column label="房间价格" align="center" prop="roomPrices" />
      <el-table-column label="房间状态" align="center" prop="roomStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_room_status" :value="scope.row.roomStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="房间图片" align="center" prop="roomImg" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.roomImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
     <el-table-column label="上下架" align="center" class-name="small-padding fixed-width">
      <template slot-scope="scope">
           <el-button
             size="mini"
             type="primary"
             icon="el-icon-edit"
             @click="handleUpdate(scope.row)"
             v-show="scope.row.roomStatus === '0' || scope.row.roomStatus === '2'"
             v-hasPermi="['system:roominfo:edit']"
           >上架</el-button>
            <el-button
              size="mini"
              type="success"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-show="scope.row.roomStatus === '1'"
              v-hasPermi="['system:roominfo:edit']"
            >下架</el-button>
            <el-button
              size="mini"
              type="warning"
              icon="el-icon-edit"
              @click="handleUpdate2(scope.row)"
              v-show="scope.row.roomStatus === '3'"
              v-hasPermi="['system:roominfo:edit']"
            >清退</el-button>
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

    <!-- 添加或修改房间对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRoominfo, getRoominfo, delRoominfo, addRoominfo, updateRoominfo, OutRoom } from "@/api/system/roominfo";

export default {
  name: "Roominfo",
  dicts: ['sys_room_status'],
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
      // 房间表格数据
      roominfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        roomName: null,
        roomInfo: null,
        roomPrices: null,
        roomStatus: null,
        roomImg: null
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
    /**清退房间*/
    outRoom(){
      OutRoom();
    },
    /** 查询房间列表 */
    getList() {
      this.loading = true;
      listRoominfo(this.queryParams).then(response => {
        this.roominfoList = response.rows;
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
        roomId: null,
        roomName: null,
        roomInfo: null,
        roomPrices: null,
        roomStatus: null,
        roomImg: null
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
      this.ids = selection.map(item => item.roomId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加房间";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const roomId = row.roomId || this.ids;
      getRoominfo(roomId).then(response => {
        this.form = response.data;
        this.open = true;
        if (this.form.roomStatus === '0' || this.form.roomStatus === '2') {
          this.form.roomStatus = 1; // 设置为上架状态
          this.title = "上架房间？";
          this.$refs['confirmButton'].textContent = "上架";
          this.$refs['confirmButton'].onclick = () => {
            this.submitForm('上架');
          };
        } else if (this.form.roomStatus === '1') {
          this.form.roomStatus = 2; // 设置为下架状态
          this.title = "下架房间？";
          this.$refs['confirmButton'].textContent = "下架";
          this.$refs['confirmButton'].onclick = () => {
            this.submitForm('下架');
          };
        }
      });
    },
    /** 清退按钮操作 */
    handleUpdate2(row) {
      this.reset();
      const roomId = row.roomId || this.ids;
      getRoominfo(roomId).then(response => {
        this.title = "清退房间？";
        this.form = response.data;
        this.form.roomStatus = 1; // 设置为清退状态
        this.open = true;
      });
    },

    /** 提交按钮 */
    submitForm(action) {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.roomId != null) {
            if (action === '上架') {
              this.form.roomStatus = 1; // 上架操作
            } else if (action === '下架') {
              this.form.roomStatus = 2; // 下架操作
            }
            updateRoominfo(this.form).then(response => {
              this.$modal.msgSuccess("操作成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRoominfo(this.form).then(response => {
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
      const roomIds = row.roomId || this.ids;
      this.$modal.confirm('是否确认删除房间编号为"' + roomIds + '"的数据项？').then(function() {
        return delRoominfo(roomIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/roominfo/export', {
        ...this.queryParams
      }, `roominfo_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
