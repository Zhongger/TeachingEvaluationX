create table course
(
    id           int auto_increment
        primary key,
    course_id    varchar(255) null comment '课程编号',
    course_name  varchar(255) null comment '课程名称',
    dept_id      int          null comment '开始院系，对应sys_dept表的id',
    course_type  varchar(255) null comment '课程性质',
    teacher_id   varchar(255) null comment 's授课教师，对应teacher表的teacher_id',
    course_time  int          null comment '课时',
    course_score double       null comment '学分'
)
    comment '课程信息表';

INSERT INTO tex.course (id, course_id, course_name, dept_id, course_type, teacher_id, course_time, course_score) VALUES (1, '1111', '6513', 100, '选修', 'zhonglaos', 64, 3.6);
INSERT INTO tex.course (id, course_id, course_name, dept_id, course_type, teacher_id, course_time, course_score) VALUES (2, '10002', 'Java程序设计', 104, '选修', 'zhonglaos', 64, 4);


create table evaluation_meta
(
    id      int auto_increment
        primary key,
    content varchar(255) null comment '内容',
    score   double       null comment '分数权重'
)
    comment '评价表-元数据';

INSERT INTO tex.evaluation_meta (id, content, score) VALUES (1, '1、教学任务：教学目的的明确性和具体性，以及与教学大纲要求的相应性等。', 30);
INSERT INTO tex.evaluation_meta (id, content, score) VALUES (2, '2、教学内容：内容阐述的思想性与科学性，知识结构的逻辑性与系统性；双基的落实，重点突出与难点突破；教材处理与分析、挖掘的深度；内容的实用性与适用性，反映本学科的最新研究成果等。
', 20);
INSERT INTO tex.evaluation_meta (id, content, score) VALUES (3, '3、教学组织：教学机智；面向全体学生，因村施教；双边活动的气氛；集中学生的注意力；激发学生的兴趣等。', 10);
INSERT INTO tex.evaluation_meta (id, content, score) VALUES (4, '4、教学基本功：语言规范，清晰；板书简明工整，条理清楚；教态亲切和蔼；仪表端庄大方等。', 10);
INSERT INTO tex.evaluation_meta (id, content, score) VALUES (5, '5、教学方法：启发式教学；师生配合的协调性；讲练的有机结合；利用反馈信息调节教学；直观与形象化的措施(如利用视听辅助设备，采用直观图表、模型等)；讲授深入浅出等。', 10);
INSERT INTO tex.evaluation_meta (id, content, score) VALUES (6, '6、教学效率：知识容量与训练的饱和度；教学时间利用的有效率；学生负担的合理性；课程难度与进度适中性等。
', 10);
INSERT INTO tex.evaluation_meta (id, content, score) VALUES (7, '7、教学效果：教学总体设计的妥当性；概念的正确形成与巩固；学生对学习过程的理解性；学生答问的正确率；学生完成变式变形的正确率；学生智力的开发(如独立思考能力的形成、学习方法的掌握、自学能力的养成)。', 10);


create table student
(
    id         int auto_increment
        primary key,
    student_id varchar(255) null comment '学号，对应sys_user的user_name',
    user_id    int          null comment '对应sys_user的user_id'
)
    comment '学生表';

INSERT INTO tex.student (id, student_id, user_id) VALUES (2, '201712010102', 106);
INSERT INTO tex.student (id, student_id, user_id) VALUES (3, '201112010123', 107);

create table student_course_evaluation
(
    id            int auto_increment
        primary key,
    student_id    varchar(255) null comment '学生id',
    teacher_id    varchar(255) null comment '教师id',
    evaluation_id int          null comment '评价项目id',
    course_id     varchar(255) null comment '课程id',
    grade         double       null comment '评分'
)
    comment '学生评价课程表';

INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (83, '201112010123', 'zhonglaos', 1, '1111', 20);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (84, '201112010123', 'zhonglaos', 2, '1111', 10);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (85, '201112010123', 'zhonglaos', 3, '1111', 5);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (86, '201112010123', 'zhonglaos', 4, '1111', 5);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (87, '201112010123', 'zhonglaos', 5, '1111', 6);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (88, '201112010123', 'zhonglaos', 6, '1111', 5);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (89, '201112010123', 'zhonglaos', 7, '1111', 8);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (90, '201112010123', 'zhonglaos', 1, '10002', 8);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (91, '201112010123', 'zhonglaos', 2, '10002', 2);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (92, '201112010123', 'zhonglaos', 3, '10002', 5);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (93, '201112010123', 'zhonglaos', 4, '10002', 6);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (94, '201112010123', 'zhonglaos', 5, '10002', 1);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (95, '201112010123', 'zhonglaos', 6, '10002', 7);
INSERT INTO tex.student_course_evaluation (id, student_id, teacher_id, evaluation_id, course_id, grade) VALUES (96, '201112010123', 'zhonglaos', 7, '10002', 8);


create table student_teacher_course
(
    id            int auto_increment comment '主键id'
        primary key,
    student_id    varchar(255) null comment '学生用户名',
    course_id     varchar(255) null comment '课程编号',
    teacher_id    varchar(255) null comment '教师用户名',
    select_status varchar(255) null comment '选课状态'
)
    comment '学生选课表';

INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (5, '201112010123', '10002', 'zhonglaos', '已选');
INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (6, '201112010123', '1111', 'zhonglaos', '已选');
INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (7, '201112010123', '1111', 'zhonglaos', '已选');
INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (8, '201112010123', '1111', 'zhonglaos', '已选');
INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (9, '201112010123', '1111', 'zhonglaos', '已选');
INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (10, '201112010123', '1111', 'zhonglaos', '已选');
INSERT INTO tex.student_teacher_course (id, student_id, course_id, teacher_id, select_status) VALUES (11, 'admin', '1111', 'zhonglaos', '已选');


drop table if exists sys_dept;
create table sys_dept
(
    dept_id     bigint auto_increment comment '部门id'
        primary key,
    parent_id   bigint default 0 null comment '父部门id',
    ancestors   varchar(50)      null,
    dept_name   varchar(30)      null,
    order_num   int(4) default 0 null comment '显示顺序',
    leader      varchar(30)      null,
    phone       varchar(30)      null,
    email       varchar(30)      null,
    status      char             null,
    del_flag    char             null,
    create_by   varchar(64)      null,
    create_time datetime         null comment '创建时间',
    update_by   varchar(64)      null,
    update_time datetime         null comment '更新时间'
)
    comment '部门表';

INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (100, 0, '0', '广州商学院', 0, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:20', 'admin', '2020-12-03 19:36:38');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (101, 100, '0,100', '信息技术与工程学院', 1, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:36:38');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (102, 100, '0,100', '管理学院', 2, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:36:04');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (103, 101, '0,100,101', '软件工程专业', 1, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:36:15');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (104, 101, '0,100,101', '计算机科学与技术', 2, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:36:27');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (105, 101, '0,100,101', '网络工程专业', 3, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:36:38');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (108, 102, '0,100,102', '经济管理专业', 1, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:35:52');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (109, 102, '0,100,102', '工商管理专业', 2, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-02 18:27:53', 'admin', '2020-12-03 19:36:04');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (200, 102, '0,100,102', '行政管理专业', 3, 'Zhongger', '15888888888', 'Zhongger@qq.com', '0', '0', 'admin', '2020-12-03 19:37:23', 'admin', '2020-12-03 19:36:04');
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (201, 101, '0,100,101', '信息管理与信息系统', 4, 'Zhongger', '15888888888', 'zhongger@qq.com', '0', '0', 'admin', '2020-12-04 11:12:06', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (202, 101, '0,100,101', '物联网工程', 5, null, null, null, '0', '0', 'admin', '2020-12-04 11:14:29', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (203, 101, '0,100,101', '智能科学与技术', 6, null, null, null, '0', null, 'admin', '2020-12-04 11:16:02', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (204, 102, '0,100,102', '酒店管理', 4, null, null, null, '0', '0', 'admin', '2020-12-04 11:19:48', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (205, 102, '0,100,102', '物流管理', 5, null, null, null, '0', '0', 'admin', '2020-12-04 11:20:24', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (206, 100, '0,100', '经济学院', 3, null, null, null, '0', '0', 'admin', '2020-12-04 11:21:30', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (207, 206, '0,100,206', '国际经济与贸易', 1, null, null, null, '0', '0', 'admin', '2020-12-04 11:22:07', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (208, 206, '0,100,206', '投资学', 2, null, null, null, '0', '0', 'admin', '2020-12-04 11:22:26', null, null);
INSERT INTO tex.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) VALUES (209, 206, '0,100,206', '金融学', 3, null, null, null, '0', '0', 'admin', '2020-12-04 11:22:41', null, null);

drop table if exists sys_role;
create table sys_role
(
    role_id             bigint auto_increment comment '角色ID'
        primary key,
    role_name           varchar(30)             not null comment '角色名称',
    role_key            varchar(100)            not null comment '角色权限字符串',
    role_sort           int(4)                  not null comment '显示顺序',
    data_scope          char        default '1' null comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    menu_check_strictly tinyint(1)  default 1   null comment '菜单树选择项是否关联显示',
    dept_check_strictly tinyint(1)  default 1   null comment '部门树选择项是否关联显示',
    status              char                    not null comment '角色状态（0正常 1停用）',
    del_flag            char        default '0' null comment '删除标志（0代表存在 2代表删除）',
    create_by           varchar(64) default ''  null comment '创建者',
    create_time         datetime                null comment '创建时间',
    update_by           varchar(64) default ''  null comment '更新者',
    update_time         datetime                null comment '更新时间',
    remark              varchar(500)            null comment '备注'
)
    comment '角色信息表';

INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2020-12-02 18:32:36', '', null, '超级管理员');
INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '1', '0', 'admin', '2020-12-02 18:32:36', 'admin', '2020-12-04 16:59:56', '普通角色');
INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (100, '学生', 'student', 3, '1', 1, 1, '0', '0', 'admin', '2020-12-03 19:45:53', 'admin', '2020-12-05 18:44:53', null);
INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (101, '教师', 'teacher', 4, '1', 0, 1, '0', '0', 'admin', '2020-12-03 19:46:38', 'admin', '2020-12-09 20:43:17', null);


drop table if exists sys_menu;
create table sys_menu
(
    menu_id     bigint auto_increment comment '菜单ID'
        primary key,
    menu_name   varchar(50)              not null comment '菜单名称',
    parent_id   bigint       default 0   null comment '父菜单ID',
    order_num   int(4)       default 0   null comment '显示顺序',
    path        varchar(200) default ''  null comment '路由地址',
    component   varchar(255)             null comment '组件路径',
    is_frame    int(1)       default 1   null comment '是否为外链（0是 1否）',
    is_cache    int(1)       default 0   null comment '是否缓存（0缓存 1不缓存）',
    menu_type   char         default ''  null comment '菜单类型（M目录 C菜单 F按钮）',
    visible     char         default '0' null comment '菜单状态（0显示 1隐藏）',
    status      char         default '0' null comment '菜单状态（0正常 1停用）',
    perms       varchar(100)             null comment '权限标识',
    icon        varchar(100) default '#' null comment '菜单图标',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500) default ''  null comment '备注'
)
    comment '菜单权限表';

INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1, '系统管理', 0, 1, 'system', null, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2020-12-02 18:32:36', '', null, '系统管理目录');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2, '系统监控', 0, 9, 'monitor', null, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2020-12-02 18:32:37', 'admin', '2020-12-09 12:48:16', '系统监控目录');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (3, '系统工具', 0, 8, 'tool', null, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2020-12-02 18:32:37', 'admin', '2020-12-08 12:43:01', '系统工具目录');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2020-12-02 18:32:37', '', null, '用户管理菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2020-12-02 18:32:37', '', null, '角色管理菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2020-12-02 18:32:37', '', null, '菜单管理菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (103, '院系管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2020-12-02 18:32:37', 'admin', '2020-12-03 19:27:16', '部门管理菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2020-12-02 18:32:37', '', null, '字典管理菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2020-12-02 18:32:38', '', null, '在线用户菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2020-12-02 18:32:38', '', null, '定时任务菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2020-12-02 18:32:38', '', null, '数据监控菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2020-12-02 18:32:38', '', null, '缓存监控菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2020-12-02 18:32:38', '', null, '表单构建菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2020-12-02 18:32:38', '', null, '代码生成菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2020-12-02 18:32:38', '', null, '系统接口菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2020-12-02 18:32:38', '', null, '操作日志菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2020-12-02 18:32:38', '', null, '登录日志菜单');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2020-12-02 18:32:38', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2020-12-02 18:32:39', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-12-02 18:32:40', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2020-12-02 18:32:41', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2000, '学生管理', 0, 2, 'student', null, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2020-12-02 20:53:29', 'admin', '2020-12-03 20:43:39', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2001, '教师管理', 0, 3, 'teacher', null, 1, 0, 'M', '0', '0', '', 'tree', 'admin', '2020-12-02 20:54:07', 'admin', '2020-12-03 20:43:44', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2002, '课程管理', 0, 4, 'course', null, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2020-12-03 20:45:00', 'admin', '2020-12-04 17:36:43', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2003, '学生信息', 2000, 1, 'info', 'student/info/index', 1, 1, 'C', '0', '0', '', 'people', 'admin', '2020-12-04 12:54:19', 'admin', '2020-12-04 16:28:19', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2004, '教师信息', 2001, 1, 'info', 'teacher/info/index', 1, 1, 'C', '0', '0', '', 'peoples', 'admin', '2020-12-04 16:39:15', 'admin', '2020-12-04 16:39:59', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2005, '课程信息', 2002, 1, 'info', 'course/info/index', 1, 1, 'C', '0', '0', '', 'dict', 'admin', '2020-12-04 17:32:32', 'admin', '2020-12-05 11:35:05', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2006, '我的选课', 0, 5, 'select-course', null, 1, 0, 'M', '0', '0', null, 'edit', 'admin', '2020-12-05 16:04:14', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2007, '选课中心', 2006, 1, 'course', 'select-course/course/index', 1, 1, 'C', '0', '0', 'student:user:list', 'checkbox', 'admin', '2020-12-05 16:06:22', 'admin', '2020-12-05 16:21:09', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2008, '教评管理', 0, 6, 'evaluation', null, 1, 0, 'M', '0', '0', '', 'row', 'admin', '2020-12-08 12:42:43', 'admin', '2020-12-08 14:32:06', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2009, '教评内容', 2008, 1, 'evaluation/index', 'evaluation/index', 1, 1, 'C', '0', '0', '', 'clipboard', 'admin', '2020-12-08 14:30:01', 'admin', '2020-12-08 14:32:13', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2010, '我的教评', 0, 7, 'teacher-evaluation', null, 1, 0, 'M', '0', '0', null, 'dict', 'admin', '2020-12-09 12:48:07', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2011, '教评权重', 2010, 1, 'list', 'teacher-evaluation/index', 1, 1, 'C', '0', '0', '', 'date-range', 'admin', '2020-12-09 12:50:20', 'admin', '2020-12-09 13:04:58', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2012, '教评结果', 2010, 2, 'my-evaluation', 'teacher-evaluation/my-evaluation', 1, 1, 'C', '0', '0', 'teacher:user:list', 'cascader', 'admin', '2020-12-09 13:03:50', 'admin', '2020-12-09 14:44:41', '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2013, '教评结果', 2008, 2, 'evaluation/result', 'evaluation/result', 1, 1, 'C', '0', '0', null, 'drag', 'admin', '2020-12-09 20:13:57', '', null, '');
INSERT INTO tex.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES (2014, '统计分析', 2010, 3, 'teacher-evaluation/result', 'teacher-evaluation/result', 1, 1, 'C', '0', '0', null, 'monitor', 'admin', '2020-12-09 20:43:02', '', null, '');


drop table if exists sys_role;
create table sys_role
(
    role_id             bigint auto_increment comment '角色ID'
        primary key,
    role_name           varchar(30)             not null comment '角色名称',
    role_key            varchar(100)            not null comment '角色权限字符串',
    role_sort           int(4)                  not null comment '显示顺序',
    data_scope          char        default '1' null comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    menu_check_strictly tinyint(1)  default 1   null comment '菜单树选择项是否关联显示',
    dept_check_strictly tinyint(1)  default 1   null comment '部门树选择项是否关联显示',
    status              char                    not null comment '角色状态（0正常 1停用）',
    del_flag            char        default '0' null comment '删除标志（0代表存在 2代表删除）',
    create_by           varchar(64) default ''  null comment '创建者',
    create_time         datetime                null comment '创建时间',
    update_by           varchar(64) default ''  null comment '更新者',
    update_time         datetime                null comment '更新时间',
    remark              varchar(500)            null comment '备注'
)
    comment '角色信息表';

INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2020-12-02 18:32:36', '', null, '超级管理员');
INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '1', '0', 'admin', '2020-12-02 18:32:36', 'admin', '2020-12-04 16:59:56', '普通角色');
INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (100, '学生', 'student', 3, '1', 1, 1, '0', '0', 'admin', '2020-12-03 19:45:53', 'admin', '2020-12-05 18:44:53', null);
INSERT INTO tex.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES (101, '教师', 'teacher', 4, '1', 0, 1, '0', '0', 'admin', '2020-12-03 19:46:38', 'admin', '2020-12-09 20:43:17', null);


drop table if exists sys_role_dept;
create table sys_role_dept
(
    role_id bigint not null comment '角色ID',
    dept_id bigint not null comment '部门ID',
    primary key (role_id, dept_id)
)
    comment '角色和部门关联表';

INSERT INTO tex.sys_role_dept (role_id, dept_id) VALUES (2, 100);
INSERT INTO tex.sys_role_dept (role_id, dept_id) VALUES (2, 101);
INSERT INTO tex.sys_role_dept (role_id, dept_id) VALUES (2, 105);


drop table if exists sys_role_menu;
create table sys_role_menu
(
    role_id bigint not null comment '角色ID',
    menu_id bigint not null comment '菜单ID',
    primary key (role_id, menu_id)
)
    comment '角色和菜单关联表';

INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 2);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 3);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 4);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 100);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 101);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 102);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 103);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 104);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 105);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 106);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 107);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 108);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 109);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 110);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 111);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 112);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 113);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 114);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 115);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 116);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 500);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 501);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1000);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1001);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1002);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1003);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1004);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1005);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1006);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1007);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1008);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1009);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1010);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1011);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1012);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1013);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1014);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1015);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1016);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1017);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1018);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1019);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1020);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1021);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1022);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1023);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1024);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1025);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1026);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1027);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1028);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1029);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1030);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1031);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1032);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1033);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1034);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1035);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1036);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1037);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1038);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1039);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1040);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1041);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1042);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1043);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1044);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1045);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1046);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1047);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1048);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1049);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1050);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1051);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1052);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1053);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1054);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1055);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1056);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1057);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1058);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1059);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (2, 1060);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (100, 2006);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (100, 2007);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (101, 2010);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (101, 2011);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (101, 2012);
INSERT INTO tex.sys_role_menu (role_id, menu_id) VALUES (101, 2014);


drop table if exists sys_user;
create table sys_user
(
    user_id     bigint auto_increment comment '用户ID'
        primary key,
    dept_id     bigint                    null comment '部门ID',
    user_name   varchar(30)               not null comment '用户账号',
    nick_name   varchar(30)               not null comment '用户昵称',
    user_type   varchar(2)   default '00' null comment '用户类型（00系统用户）',
    email       varchar(50)  default ''   null comment '用户邮箱',
    phonenumber varchar(11)  default ''   null comment '手机号码',
    sex         char         default '0'  null comment '用户性别（0男 1女 2未知）',
    avatar      varchar(100) default ''   null comment '头像地址',
    password    varchar(100) default ''   null comment '密码',
    status      char         default '0'  null comment '帐号状态（0正常 1停用）',
    del_flag    char         default '0'  null comment '删除标志（0代表存在 2代表删除）',
    login_ip    varchar(50)  default ''   null comment '最后登录IP',
    login_date  datetime                  null comment '最后登录时间',
    create_by   varchar(64)  default ''   null comment '创建者',
    create_time datetime                  null comment '创建时间',
    update_by   varchar(64)  default ''   null comment '更新者',
    update_time datetime                  null comment '更新时间',
    remark      varchar(500)              null comment '备注'
)
    comment '用户信息表';

INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (1, 103, 'admin', '沈林峰', '00', 'shenlinfeng@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-12-02 18:31:53', 'admin', '2020-12-02 18:31:53', '', null, '管理员');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (2, 105, 'zhongger', '钟哥', '00', 'zhongger@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-12-02 18:31:53', 'admin', '2020-12-02 18:31:53', '', null, '测试员');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (100, 103, 'huangzijian', '黄梓健', '00', '999@qq.com', '13713730555', '0', '', '$2a$10$fAmfFJWBQfjBdpGqw8FUZe6sZTv.DM/WGSaytblveQ1V/ySB3/QN.', '0', '0', '', null, 'admin', '2020-12-03 20:31:03', 'admin', '2020-12-03 20:52:16', '111');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (101, 103, '201712010329', '钟明羿', '00', '973593026@qq.com', '13719730658', '0', '', '$2a$10$9U3pe7LVxduGxF2tWuy5z.2GR6PCTYWQU2r3ZlctEeZeR3L/u6S4y', '0', '2', '', null, 'admin', '2020-12-04 14:12:52', '', null, '学生');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (102, 103, '201712010328', 'zmy', '00', '95346@qq.com', '13719766668', '0', '', '$2a$10$9OpPwALfxssGSgVrlwLvT.LCy71a8YyVfAvc00KHkr1maxcoa5iEW', '0', '2', '', null, 'admin', '2020-12-04 14:21:25', '', null, null);
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (103, 103, '201712010327', 'zmy', '00', '953h46@qq.com', '13719766666', '0', '', '$2a$10$TeI2ksZCynjNOu2627ytzethzFzby1BvFAbJbKEdEwC.Ldu0hPW1y', '0', '2', '', null, 'admin', '2020-12-04 14:22:10', '', null, null);
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (104, 103, '201712010101', 'zmusd', '00', '962@qq.com', '13719756204', '0', '', '$2a$10$PDfCM2Hmh8wM4PUiLmbFTeCN1lxyOLOTmG693A4lvxuja1Ye5mssi', '0', '2', '', null, 'admin', '2020-12-04 14:23:36', '', null, 'ss');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (106, 103, '201712010102', 'zmusd', '00', '9623@qq.com', '13719756202', '0', '', '$2a$10$ZMf8e/x3xp9sbgA428rFkOXJR5i7hspI/.9TNGu9uAJqHc29R3A26', '0', '2', '', null, 'admin', '2020-12-04 14:26:12', '', null, 'ss');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (107, 103, '201112010123', 'ZMY', '00', '965389@qq.com', '15678916520', '0', '', '$2a$10$x0lft/rgOjOYor7w.1REj.5ZXTi0aTnwBXbDARRKCVWtN1o6sASya', '0', '0', '', null, 'admin', '2020-12-04 16:27:01', '', null, '661');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (108, 103, 'LinLaoShi', '林老师', '00', '95shc@qq.com', '17815630689', '1', '', '$2a$10$.VccwuuYzpKq3pxal.B/3.uEuu.oUDbrdP/sMk2/XKKSjZTbzk.fm', '0', '0', '', null, 'admin', '2020-12-04 17:06:10', '', null, '教师');
INSERT INTO tex.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (109, 208, 'zhonglaos', '钟老师', '00', '98852131@qq.com', '13719755845', '0', '', '$2a$10$bh9c9FAQLCUPC/Ewf7gf7ezY/KLXi8Cz6nKU9oSY3OoKELlIQgmIG', '0', '0', '', null, 'admin', '2020-12-05 12:43:38', 'admin', '2020-12-09 14:43:52', null);


drop table if exists sys_user_role;
create table sys_user_role
(
    user_id bigint not null comment '用户ID',
    role_id bigint not null comment '角色ID',
    primary key (user_id, role_id)
)
    comment '用户和角色关联表';

INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (2, 2);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (100, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (101, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (102, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (103, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (104, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (106, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (107, 100);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (108, 101);
INSERT INTO tex.sys_user_role (user_id, role_id) VALUES (109, 101);


create table teacher
(
    id         int auto_increment comment '主键'
        primary key,
    teacher_id varchar(255) null comment '教工号，与sys_user表的user_name关联',
    user_id    int          null comment '与sys_user表的user_id关联'
)
    comment '教师信息表';

INSERT INTO tex.teacher (id, teacher_id, user_id) VALUES (1, 'LinLaoShi', 108);
INSERT INTO tex.teacher (id, teacher_id, user_id) VALUES (2, 'zhonglaos', 109);