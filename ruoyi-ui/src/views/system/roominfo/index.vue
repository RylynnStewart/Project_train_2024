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
      <el-form-item label="房间价格" prop="roomPrices">
        <el-input
          v-model="queryParams.roomPrices"
          placeholder="请输入房间价格"
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
          @click="handleAdd"
          v-hasPermi="['system:roominfo:add']"
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
          v-hasPermi="['system:roominfo:edit']"
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
          v-hasPermi="['system:roominfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:roominfo:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="roominfoList" @selection-change="handleSelectionChange" @sort-change="handleSortChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键" align="center" prop="roomId" /> -->
      <el-table-column label="房间名称" align="center" prop="roomName" />
      <el-table-column label="房间信息" align="center" prop="roomInfo">
        <template slot-scope="scope">
          <div>
            <el-tag
              v-for="info in scope.row.roomInfo ? scope.row.roomInfo.split(',') : []"
              :key="info"
              :type="shouldHighlight(info) ? 'success' : 'info'"
            >
              {{ info }}
            </el-tag>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="房间价格" align="center" prop="roomPrices" />
      <el-table-column label="房间状态" align="center" prop="roomStatus" :sort-orders="['descending','ascending']" sortable="custom">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_room_status" :value="scope.row.roomStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="房间图片" align="center" prop="roomImg" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.roomImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button :span="1.5"
            size="mini"
            type="primary"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:roominfo:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="success"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:roominfo:remove']"
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

    <!-- 添加或修改房间对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="房间名称" prop="roomName">
          <el-input v-model="form.roomName" placeholder="请输入房间名称" />
        </el-form-item>
        <el-form-item label="房间信息" prop="roomInfo">
            <el-checkbox-group v-model="form.roomInfo" @change="handleRoomInfoChange">
              <el-checkbox v-for="dict in dict.type.sys_room_info" :key="dict.value" :label="dict.value">
                {{dict.label}}
              </el-checkbox>
            </el-checkbox-group>
          </el-form-item>
        <el-form-item label="房间价格" prop="roomPrices">
          <el-input v-model="form.roomPrices" placeholder="请输入房间价格" />
        </el-form-item>
        <el-form-item label="房间图片" prop="roomImg">
          <image-upload v-model="form.roomImg"/>
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
import { listRoominfo, getRoominfo, delRoominfo, addRoominfo, updateRoominfo } from "@/api/system/roominfo";

export default {
  name: "Roominfo",
  dicts: ['sys_room_status', 'sys_room_info'],
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
    handleSortChange(column) {
          this.queryParams.orderByColumn = column.prop;//查询字段是表格中字段名字
          this.queryParams.isAsc = column.order;//动态取值排序顺序
          this.getList();
        },
      shouldHighlight(info) {
            // 根据具体的条件判断是否需要高亮显示标签
            // 这里可以根据您的业务逻辑来判断是否需要高亮显示
            // 例如：return info === '特殊信息' 或者 return info.includes('特殊');
            return false; // 默认都不高亮
          },
    // 房间信息选项改变时的事件处理程序
        handleRoomInfoChange(newValue) {
          // 互斥选择逻辑判断
          if (newValue.includes('6人房') && newValue.includes('5人房')) {
            newValue = newValue.filter(item => item !== '5人房');
          }
          if (newValue.includes('大桌') && newValue.includes('小桌')) {
            newValue = newValue.filter(item => item !== '小桌');
          }
          this.form.roomInfo = newValue;
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
        roomInfo: [],
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
      const roomId = row.roomId || this.ids
      getRoominfo(roomId).then(response => {
        this.form = response.data;
        this.form.roomInfo = this.form.roomInfo.split(",");
        this.open = true;
        this.title = "修改房间";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.roomInfo = this.form.roomInfo.join(",");
          if (this.form.roomId != null) {
            updateRoominfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
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
