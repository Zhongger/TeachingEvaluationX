<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--教师数据-->
      <el-col :span="20" :xs="24">
        <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
          <el-form-item label="教师号" prop="userName">
            <el-input
              v-model="queryParams.userName"
              placeholder="请输入教师号"
              clearable
              size="small"
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>


          <el-form-item>
            <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">

        </el-row>

        <el-table v-loading="loading" :data="userList">
          <el-table-column type="selection" width="50" align="center"/>
          <el-table-column label="编号" align="center" prop="id"/>
          <el-table-column label="教师号" align="center" prop="teacherId" :show-overflow-tooltip="true"/>
          <el-table-column label="教师姓名" align="center" prop="name" :show-overflow-tooltip="true"/>
          <el-table-column label="所属院系" align="center" prop="deptName" :show-overflow-tooltip="true"/>
          <el-table-column label="性别" align="center" prop="sex" :show-overflow-tooltip="true">
            <template slot-scope="scope">
              {{scope.row.sex===0?'男':'女'}}
            </template>
          </el-table-column>
          <el-table-column label="手机号码" align="center" prop="phone" width="120"/>
          <el-table-column label="电子邮箱" align="center" prop="email" width="120"/>
        </el-table>

        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-col>
    </el-row>


  </div>
</template>

<script>
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";
  import {listTeacher} from "@/api/teacher/teacher";

  export default {
    name: "student",
    components: {Treeselect},
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
        // 教师表格数据
        userList: null,
        // 弹出层标题
        title: "",
        // 院系树选项
        deptOptions: undefined,
        // 是否显示弹出层
        open: false,
        // 院系名称
        deptName: undefined,
        // 默认密码
        initPassword: undefined,
        // 日期范围
        dateRange: [],
        // 状态数据字典
        statusOptions: [],
        // 性别状态字典
        sexOptions: [],
        // 岗位选项
        postOptions: [],
        // 角色选项
        roleOptions: [],
        // 表单参数
        form: {},
        defaultProps: {
          children: "children",
          label: "label"
        },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          userName: undefined
        },

      };
    },
    watch: {},
    created() {
      this.getList();
    },
    methods: {
      /** 查询教师列表 */
      getList() {
        this.loading = true;

        listTeacher(this.queryParams).then(
          response => {
            this.userList = response.rows;
            this.total = response.total;
            this.loading = false;
          }
        );
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.page = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.dateRange = [];
        this.resetForm("queryForm");
        this.handleQuery();
      },

    }
  };
</script>
