<template>
  <div class="app-container">
    <el-row :gutter="50">
      <!--院系数据-->
      <el-col :span="4" :xs="24">


      </el-col>
      <!--用户数据-->
      <el-col :span="20" :xs="24">

        <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="50" align="left"/>
          <el-table-column label="教师编号" align="left" prop="teacherId" :show-overflow-tooltip="false"/>
          <el-table-column label="教师" align="left" prop="teacherName" :show-overflow-tooltip="false"/>
          <el-table-column label="院系" align="left" prop="deptName" :show-overflow-tooltip="false"/>
          <el-table-column label="总评分" width="100" align="center" prop="grade" :show-overflow-tooltip="true"/>
          <el-table-column
            label="操作"
            align="center"
            width="160"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['student:user:list']"
              >修改
              </el-button>
              <el-button
                v-if="scope.row.userId !== 1"
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['student:user:list']"
              >删除
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-key"
                v-if="scope.row.selectStatus==='已选'"
                @click="handleResetPwd(scope.row)"
                v-hasPermi="['student:user:list']"
              >评价
              </el-button>
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
      </el-col>
    </el-row>

    <!-- 添加或修改参数配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item  label="课程编号" prop="courseId">
              <el-input v-model="form.courseId" placeholder="请输入课程编号，如10001"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="课程名称" prop="courseName">
              <el-input v-model="form.courseName" placeholder="请输入课程名称"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="开设院系" prop="deptId">
              <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择开设院系"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="课程性质" prop="courseType">
              <el-select v-model="form.courseType" placeholder="请选择">
                <el-option
                  v-for="item in courseTypeOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>


        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="课时" prop="courseTime">
              <el-select v-model="form.courseTime" placeholder="请选择">
                <el-option
                  v-for="item in courseTimeOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>

            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="学分" prop="courseScore">
              <el-input v-model="form.courseScore" placeholder="请输入学分"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>

          <el-col :span="12">
            <el-form-item label="授课老师">
              <el-select v-model="form.teacherId" placeholder="请选择">
                <el-option
                  v-for="item in teacherOptions"
                  :key="item.teacherId"
                  :label="item.name"
                  :value="item.teacherId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>

        </el-row>

        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          <el-checkbox v-model="upload.updateSupport"/>
          是否更新已经存在的用户数据
          <el-link type="info" style="font-size:12px" @click="importTemplate">下载模板</el-link>
        </div>
        <div class="el-upload__tip" style="color:red" slot="tip">提示：仅允许导入“xls”或“xlsx”格式文件！</div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {
    listUser,
    getUser,
    delUser,
    updateUser,
    exportUser,
    resetUserPwd,
    changeUserStatus,
    importTemplate
  } from "@/api/system/user";
  import{addSelectCourse,deleteSelectCourse} from "@/api/student/student"
  import {listEvaluationResult} from "@/api/evaluation/evaluation"
  import {getToken} from "@/utils/auth";
  import {listTeacher} from "@/api/teacher/teacher";
  import {addCourse,listSelectCourse} from "@/api/course/course";
  import {treeselect} from "@/api/system/dept";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "User",
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
        // 用户表格数据
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
        //授课老师
        teacherOptions: [],
        courseTypeOptions: [{
          value: '必修',
          label: '必修'
        }, {
          value: '选修',
          label: '选修'
        }],
        courseTimeOptions: [{
          value: '32',
          label: '32'
        }, {
          value: '64',
          label: '64'
        }, {
          value: '128',
          label: '128'
        }],
        // 表单参数
        form: {},
        //选课参数
        selectCourse:{
          courseId: '',
          teacherId: ''
        },

        defaultProps: {
          children: "children",
          label: "label"
        },
        // 用户导入参数
        upload: {
          // 是否显示弹出层（用户导入）
          open: false,
          // 弹出层标题（用户导入）
          title: "",
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的用户数据
          updateSupport: 0,
          // 设置上传的请求头部
          headers: {Authorization: "Bearer " + getToken()},
          // 上传的地址
          url: process.env.VUE_APP_BASE_API + "/system/user/importData"
        },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          courseName: undefined,
          status: undefined,
          deptId: undefined
        },
        // 表单校验
        rules: {
          userName: [
            {required: true, message: "课程编号不能为空", trigger: "blur"}
          ],
          nickName: [
            {required: true, message: "课程名称不能为空", trigger: "blur"}
          ],
          deptId: [
            {required: true, message: "开设院系不能为空", trigger: "change"}
          ],
          password: [
            {required: true, message: "学分不能为空", trigger: "blur"}
          ]
        }
      };
    },
    watch: {
      // 根据名称筛选院系树
      deptName(val) {
        this.$refs.tree.filter(val);
      }
    },
    created() {
      this.getList();
      this.getTreeselect();
      this.getDicts("sys_normal_disable").then(response => {
        this.statusOptions = response.data;
      });
      this.getDicts("sys_user_sex").then(response => {
        this.sexOptions = response.data;
      });
      this.getConfigKey("sys.user.initPassword").then(response => {
        this.initPassword = response.msg;
      });

    },
    methods: {
      /** 查询用户列表 */
      getList() {
        this.loading = true;
        listEvaluationResult(this.queryParams).then(response => {
            this.userList = response.rows;
            this.total = response.total;
            this.loading = false;
          }
        );

      },
      /** 查询院系下拉树结构 */
      getTreeselect() {
        treeselect().then(response => {
          this.deptOptions = response.data;
        });
      },
      // 筛选节点
      filterNode(value, data) {
        if (!value) return true;
        return data.label.indexOf(value) !== -1;
      },
      // 节点单击事件
      handleNodeClick(data) {
        this.queryParams.deptId = data.id;
        this.getList();
      },
      // 用户状态修改
      handleStatusChange(row) {
        let text = row.status === "0" ? "启用" : "停用";
        this.$confirm('确认要"' + text + '""' + row.userName + '"用户吗?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function () {
          return changeUserStatus(row.userId, row.status);
        }).then(() => {
          this.msgSuccess(text + "成功");
        }).catch(function () {
          row.status = row.status === "0" ? "1" : "0";
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
          courseId: undefined,
          deptId: undefined,
          courseName: undefined,
          courseType: undefined,
          teacherId: undefined,
          courseTime: undefined,
          courseScore: undefined
        };
        this.resetForm("form");
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
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.userId);
        this.single = selection.length != 1;
        this.multiple = !selection.length;
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.getTreeselect();
        this.open = true;
        this.title = "添加课程";
        listTeacher().then(response=>{
          this.teacherOptions=response.rows;
        });

      },
      /** 修改按钮操作 */
      handleUpdate(row) {

        const courseId = row.courseId || this.ids;
        this.$confirm('是否选择【'+row.courseName+'】课程？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (row.selectStatus==='已选'){
              this.$message({
              type: 'info',
              message: '此课程已选，无法继续选课'
            });
          }else {
            this.selectCourse.teacherId=row.teacherId;
            this.selectCourse.courseId=row.courseId;
            addSelectCourse(this.selectCourse).then(response=>{
              this.getList();
              this.$message({
                type: 'success',
                message: '选课成功!'
              });
            });

          }

        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消选课'
          });
        });


      },

      /** 提交按钮 */
      submitForm: function () {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.userId != undefined) {
              updateUser(this.form).then(response => {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addCourse(this.form).then(response =>{
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const userIds = row.userId || this.ids;
        this.$confirm('是否确认退选【' + row.courseName + '】课程?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(() =>{
          if (row.selectStatus==='未选'){
            this.$message({
              type: 'info',
              message: '此课程未选，无法退选此课'
            });
          }else {
            this.selectCourse.teacherId=row.teacherId;
            this.selectCourse.courseId=row.courseId;
            deleteSelectCourse(this.selectCourse).then(response =>{
              this.$message({
                type: 'success',
                message: '退选成功!'
              });
              this.getList();
            });

          }

        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消退选'
          });
        });
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams;
        this.$confirm('是否确认导出所有用户数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function () {
          return exportUser(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
      },
      /** 导入按钮操作 */
      handleImport() {
        this.upload.title = "用户导入";
        this.upload.open = true;
      },
      /** 下载模板操作 */
      importTemplate() {
        importTemplate().then(response => {
          this.download(response.msg);
        });
      },
      // 文件上传中处理
      handleFileUploadProgress(event, file, fileList) {
        this.upload.isUploading = true;
      },
      // 文件上传成功处理
      handleFileSuccess(response, file, fileList) {
        this.upload.open = false;
        this.upload.isUploading = false;
        this.$refs.upload.clearFiles();
        this.$alert(response.msg, "导入结果", {dangerouslyUseHTMLString: true});
        this.getList();
      },
      // 提交上传文件
      submitFileForm() {
        this.$refs.upload.submit();
      }
    }
  };
</script>
