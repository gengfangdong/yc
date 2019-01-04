prompt PL/SQL Developer import file
prompt Created on 2019年1月4日 by my
set feedback off
set define off
prompt Creating ABOUT...
create table ABOUT
(
  about_id           VARCHAR2(64) not null,
  about_titile       VARCHAR2(500) not null,
  about_title_page   VARCHAR2(500) not null,
  about_introduction VARCHAR2(500) not null,
  about_keywords     VARCHAR2(500) not null,
  about_release_time VARCHAR2(100) not null,
  about_status       VARCHAR2(2) not null,
  about_context      VARCHAR2(2000) not null,
  about_creater      VARCHAR2(100) not null,
  about_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column ABOUT.about_id
  is '关于我们id';
comment on column ABOUT.about_titile
  is '关于我们标题';
comment on column ABOUT.about_title_page
  is '关于我们封面url';
comment on column ABOUT.about_introduction
  is '关于我们简介';
comment on column ABOUT.about_keywords
  is '关于我们关键字  以逗号分隔  5个关键字';
comment on column ABOUT.about_release_time
  is '发布时间';
comment on column ABOUT.about_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column ABOUT.about_context
  is '关于我们内容';
comment on column ABOUT.about_creater
  is '关于我们创建人';
comment on column ABOUT.about_createtime
  is '关于我们创建时间';
alter table ABOUT
  add constraint ABOUT_ID primary key (ABOUT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating APPLY...
create table APPLY
(
  apply_id         VARCHAR2(64) not null,
  name             VARCHAR2(100) not null,
  sex              VARCHAR2(4) not null,
  brithday         VARCHAR2(20) not null,
  indentity_number VARCHAR2(40) not null,
  political_status VARCHAR2(4) not null,
  phone_number     VARCHAR2(15) not null,
  mail             VARCHAR2(50) not null,
  department       VARCHAR2(300) not null,
  job              VARCHAR2(300) not null,
  address          VARCHAR2(500) not null,
  other            VARCHAR2(1000),
  project_id       VARCHAR2(64) not null,
  creater          VARCHAR2(64) not null,
  createtime       VARCHAR2(100) not null,
  position         VARCHAR2(100) not null,
  check_status     VARCHAR2(2) not null,
  isdelete         VARCHAR2(2) not null,
  apply_caogery    VARCHAR2(2) not null,
  applydate        VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table APPLY
  is '报名信息';
comment on column APPLY.apply_id
  is '申请id';
comment on column APPLY.name
  is '姓名';
comment on column APPLY.sex
  is '性别  0为男  1为女';
comment on column APPLY.brithday
  is '出生日期';
comment on column APPLY.indentity_number
  is '身份证号	';
comment on column APPLY.political_status
  is '政治面貌  0党员 1群众 2民主党派';
comment on column APPLY.phone_number
  is '手机号码';
comment on column APPLY.mail
  is '电子邮箱';
comment on column APPLY.department
  is '所在部门';
comment on column APPLY.job
  is '任职岗位';
comment on column APPLY.address
  is '通讯地址	';
comment on column APPLY.other
  is '其他信息';
comment on column APPLY.project_id
  is '项目id';
comment on column APPLY.creater
  is '创建人';
comment on column APPLY.createtime
  is '创建时间';
comment on column APPLY.position
  is '任职职务';
comment on column APPLY.check_status
  is '审核状态 0为未审核  1为审核通过 2为审核不通过';
comment on column APPLY.isdelete
  is '是否删除 0为未删除 1为删除';
comment on column APPLY.apply_caogery
  is '报名类别 0为个人';
comment on column APPLY.applydate
  is '申请日期';
alter table APPLY
  add constraint APPLY_ID primary key (APPLY_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating APPLY_UNIT...
create table APPLY_UNIT
(
  applyunit_id      VARCHAR2(64) not null,
  applyunit_caogery VARCHAR2(10) not null,
  applyunit_date    VARCHAR2(100),
  applyunit_name    VARCHAR2(100) not null,
  applyunit_person  VARCHAR2(100) not null,
  applyunit_phone   VARCHAR2(20) not null,
  applyunit_mail    VARCHAR2(50) not null,
  applyunit_file    VARCHAR2(120) not null,
  creater           VARCHAR2(64) not null,
  createtime        VARCHAR2(100) not null,
  project_id        VARCHAR2(64) not null,
  applyunit_status  VARCHAR2(2) not null,
  isdelete          VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table APPLY_UNIT
  is '报名信息---单位';
comment on column APPLY_UNIT.applyunit_id
  is '单位报名id';
comment on column APPLY_UNIT.applyunit_caogery
  is '报名类别 默认1  单位';
comment on column APPLY_UNIT.applyunit_date
  is '报名日期';
comment on column APPLY_UNIT.applyunit_name
  is '报名单位';
comment on column APPLY_UNIT.applyunit_person
  is '联系人';
comment on column APPLY_UNIT.applyunit_phone
  is '联系人电话';
comment on column APPLY_UNIT.applyunit_mail
  is '联系人邮箱';
comment on column APPLY_UNIT.applyunit_file
  is '报名名单';
comment on column APPLY_UNIT.creater
  is '创建人';
comment on column APPLY_UNIT.createtime
  is '创建时间';
comment on column APPLY_UNIT.project_id
  is '项目id';
comment on column APPLY_UNIT.applyunit_status
  is '审核状态 0未审核 1审核通过 2 审核不通过';
comment on column APPLY_UNIT.isdelete
  is '是否删除 0为未删除 1为删除 ';
alter table APPLY_UNIT
  add constraint APPLYUNIT_ID primary key (APPLYUNIT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLASSPLAN...
create table CLASSPLAN
(
  classplan_id      VARCHAR2(64) not null,
  classplan_context VARCHAR2(2000) not null,
  creater           VARCHAR2(100) not null,
  createtime        VARCHAR2(100) not null,
  classplan_name    VARCHAR2(200) not null,
  isdelete          VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table CLASSPLAN
  is '课程方案';
comment on column CLASSPLAN.classplan_id
  is '课程目录id';
comment on column CLASSPLAN.classplan_context
  is '课程目录内容';
comment on column CLASSPLAN.creater
  is '创建人';
comment on column CLASSPLAN.createtime
  is '创建时间';
comment on column CLASSPLAN.classplan_name
  is '课程目录名字';
comment on column CLASSPLAN.isdelete
  is '0为未删除 1为删除';
alter table CLASSPLAN
  add constraint CLASSPLAN_ID primary key (CLASSPLAN_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CONSTOMFILE...
create table CONSTOMFILE
(
  freeco_id   VARCHAR2(64) not null,
  oldfilename VARCHAR2(200) not null,
  newfilename VARCHAR2(200) not null,
  creater     VARCHAR2(200) not null,
  createtime  VARCHAR2(100) not null,
  isdelete    VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table CONSTOMFILE
  is '定制班次文件信息';
comment on column CONSTOMFILE.freeco_id
  is '定制班次id';
comment on column CONSTOMFILE.oldfilename
  is '旧的文件名';
comment on column CONSTOMFILE.newfilename
  is '新的文件名';
comment on column CONSTOMFILE.creater
  is '创建人';
comment on column CONSTOMFILE.createtime
  is '创建时间';
comment on column CONSTOMFILE.isdelete
  is '是否删除';

prompt Creating COURSE...
create table COURSE
(
  course_id      VARCHAR2(64) not null,
  first_course   VARCHAR2(200) not null,
  second_course  VARCHAR2(200) not null,
  third_course   VARCHAR2(200) not null,
  course_context VARCHAR2(1000) not null,
  creater        VARCHAR2(100) not null,
  createtime     VARCHAR2(100) not null,
  isdelete       VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table COURSE
  is '课程目录';
comment on column COURSE.course_id
  is '课程id';
comment on column COURSE.first_course
  is '一级目录';
comment on column COURSE.second_course
  is '二级目录';
comment on column COURSE.third_course
  is '三级目录';
comment on column COURSE.course_context
  is '课程正文';
comment on column COURSE.creater
  is '创建人';
comment on column COURSE.createtime
  is '创建时间';
comment on column COURSE.isdelete
  is '0为未删除  1为删除';
alter table COURSE
  add constraint COURSE_ID primary key (COURSE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating COURSE_COSTOM...
create table COURSE_COSTOM
(
  courseco_id         VARCHAR2(64) not null,
  courseco_name       VARCHAR2(100) not null,
  courseco_data       VARCHAR2(100) not null,
  courseco_pernum     VARCHAR2(10) not null,
  courseco_address    VARCHAR2(100) not null,
  courseco_person     VARCHAR2(100) not null,
  courseco_phone      VARCHAR2(30) not null,
  courseco_creater    VARCHAR2(64) not null,
  courseco_createtime VARCHAR2(100) not null,
  courseco_updater    VARCHAR2(64) not null,
  courseco_updatetime VARCHAR2(100) not null,
  courseco_isdelete   VARCHAR2(2) not null,
  courseco_status     VARCHAR2(2) not null,
  courseco_outline    VARCHAR2(500) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table COURSE_COSTOM
  is '课程定制';
comment on column COURSE_COSTOM.courseco_id
  is '课程定制id';
comment on column COURSE_COSTOM.courseco_name
  is '课程定制班级名称';
comment on column COURSE_COSTOM.courseco_data
  is '课程定制举办日期';
comment on column COURSE_COSTOM.courseco_pernum
  is '课程定制计划参加人数';
comment on column COURSE_COSTOM.courseco_address
  is '课程定制举办地点';
comment on column COURSE_COSTOM.courseco_person
  is '课程定制联系人';
comment on column COURSE_COSTOM.courseco_phone
  is '课程定制联系电话';
comment on column COURSE_COSTOM.courseco_creater
  is '课程定制创建人';
comment on column COURSE_COSTOM.courseco_createtime
  is '课程定制创建时间';
comment on column COURSE_COSTOM.courseco_updater
  is '课程定制修改人';
comment on column COURSE_COSTOM.courseco_updatetime
  is '课程定制修改时间';
comment on column COURSE_COSTOM.courseco_isdelete
  is '课程定制是否删除 0 为未删除  1为删除';
comment on column COURSE_COSTOM.courseco_status
  is '课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课';
comment on column COURSE_COSTOM.courseco_outline
  is '课程定制大纲';
alter table COURSE_COSTOM
  add constraint COURSECO_ID primary key (COURSECO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CULTURE...
create table CULTURE
(
  culture_id           VARCHAR2(64) not null,
  culture_titile       VARCHAR2(500) not null,
  culture_title_page   VARCHAR2(500) not null,
  culture_introduction VARCHAR2(500) not null,
  culture_keywords     VARCHAR2(500) not null,
  culture_release_time VARCHAR2(100) not null,
  culture_status       VARCHAR2(2) not null,
  culture_context      VARCHAR2(4000) not null,
  culture_creater      VARCHAR2(100) not null,
  culture_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column CULTURE.culture_id
  is '培养id';
comment on column CULTURE.culture_titile
  is '培养标题';
comment on column CULTURE.culture_title_page
  is '培养封面url';
comment on column CULTURE.culture_introduction
  is '培养简介';
comment on column CULTURE.culture_keywords
  is '培养关键字  以逗号分隔  5个关键字';
comment on column CULTURE.culture_release_time
  is '发布时间';
comment on column CULTURE.culture_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column CULTURE.culture_context
  is '培养内容';
comment on column CULTURE.culture_creater
  is '培养创建人';
comment on column CULTURE.culture_createtime
  is '培养创建时间';
alter table CULTURE
  add constraint CULTURE_ID primary key (CULTURE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EUSER...
create table EUSER
(
  euser_id              VARCHAR2(64) not null,
  euser_name            VARCHAR2(200) not null,
  euser_companyname     VARCHAR2(500) not null,
  euser_department      VARCHAR2(500) not null,
  euser_hold            VARCHAR2(500) not null,
  euser_sex             VARCHAR2(2) not null,
  euser_indentitynumber VARCHAR2(200) not null,
  euser_phone           VARCHAR2(100) not null,
  euser_isdelete        VARCHAR2(2) not null,
  euser_creater         VARCHAR2(64) not null,
  euser_createtime      VARCHAR2(100) not null,
  euser_updater         VARCHAR2(64) not null,
  euser_updatetime      VARCHAR2(100) not null,
  euser_remark          VARCHAR2(2000) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table EUSER
  is '导入的用户信息表';
comment on column EUSER.euser_id
  is '人员id';
comment on column EUSER.euser_name
  is '人员名字';
comment on column EUSER.euser_companyname
  is '单位';
comment on column EUSER.euser_department
  is '部门';
comment on column EUSER.euser_hold
  is '职务';
comment on column EUSER.euser_sex
  is '性别';
comment on column EUSER.euser_indentitynumber
  is '身份证号';
comment on column EUSER.euser_phone
  is '联系方式';
comment on column EUSER.euser_isdelete
  is '是否删除 0为未删除 1为已删除';
comment on column EUSER.euser_creater
  is '导入人';
comment on column EUSER.euser_createtime
  is '导入时间';
comment on column EUSER.euser_updater
  is '修改人';
comment on column EUSER.euser_updatetime
  is '修改时间';
comment on column EUSER.euser_remark
  is '备注';
alter table EUSER
  add constraint EUSER_ID primary key (EUSER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EXPERT...
create table EXPERT
(
  expert_id           VARCHAR2(64) not null,
  expert_titile       VARCHAR2(500) not null,
  expert_title_page   VARCHAR2(500) not null,
  expert_introduction VARCHAR2(500) not null,
  expert_keywords     VARCHAR2(500) not null,
  expert_release_time VARCHAR2(100) not null,
  expert_status       VARCHAR2(2) not null,
  expert_context      VARCHAR2(2000) not null,
  expert_creater      VARCHAR2(100) not null,
  expert_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column EXPERT.expert_id
  is '专家id';
comment on column EXPERT.expert_titile
  is '专家标题';
comment on column EXPERT.expert_title_page
  is '专家封面url';
comment on column EXPERT.expert_introduction
  is '专家简介';
comment on column EXPERT.expert_keywords
  is '专家关键字  以逗号分隔  5个关键字';
comment on column EXPERT.expert_release_time
  is '发布时间';
comment on column EXPERT.expert_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column EXPERT.expert_context
  is '专家内容';
comment on column EXPERT.expert_creater
  is '专家创建人';
comment on column EXPERT.expert_createtime
  is '专家创建时间';
alter table EXPERT
  add constraint EXPERT_ID primary key (EXPERT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating FIGCLASS...
create table FIGCLASS
(
  figclass_id          VARCHAR2(64) not null,
  figclass_name        VARCHAR2(100) not null,
  figclass_deparment   VARCHAR2(100) not null,
  figclass_address     VARCHAR2(200) not null,
  figclass_start_date  VARCHAR2(100) not null,
  figclass_end_date    VARCHAR2(100) not null,
  figclass_class_start VARCHAR2(100) not null,
  figclass_class_end   VARCHAR2(100) not null,
  figclass_pernum      VARCHAR2(20) not null,
  figclass_phone       VARCHAR2(20) not null,
  figclass_person      VARCHAR2(100) not null,
  figclass_status      VARCHAR2(2) not null,
  figclass_creater     VARCHAR2(64) not null,
  figclass_createtime  VARCHAR2(100) not null,
  figclass_updater     VARCHAR2(64) not null,
  figclass_updatetime  VARCHAR2(100) not null,
  figclass_isdelete    VARCHAR2(2) not null,
  figclass_numstatus   VARCHAR2(2) not null,
  figclass_caogery     VARCHAR2(2) not null,
  figclass_outline     VARCHAR2(2000) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table FIGCLASS
  is '拼班';
comment on column FIGCLASS.figclass_id
  is '拼班id';
comment on column FIGCLASS.figclass_name
  is '拼班培训名称';
comment on column FIGCLASS.figclass_deparment
  is '拼班发起单位';
comment on column FIGCLASS.figclass_address
  is '拼班开课地点';
comment on column FIGCLASS.figclass_start_date
  is '拼班开始日期';
comment on column FIGCLASS.figclass_end_date
  is '拼班截止日期';
comment on column FIGCLASS.figclass_class_start
  is '拼班开课日期';
comment on column FIGCLASS.figclass_class_end
  is '拼班结课日期';
comment on column FIGCLASS.figclass_pernum
  is '拼班容纳人数';
comment on column FIGCLASS.figclass_phone
  is '拼班联系电话';
comment on column FIGCLASS.figclass_person
  is '拼班联系人';
comment on column FIGCLASS.figclass_status
  is '拼班状态0为未审核1为审核通过2为审核未通过3为开班中4结课';
comment on column FIGCLASS.figclass_creater
  is '拼班创建人';
comment on column FIGCLASS.figclass_createtime
  is '拼班创建时间';
comment on column FIGCLASS.figclass_updater
  is '拼班更新人';
comment on column FIGCLASS.figclass_updatetime
  is '拼班更新时间';
comment on column FIGCLASS.figclass_isdelete
  is '拼班是否删除';
comment on column FIGCLASS.figclass_numstatus
  is '拼班名单是否上传';
comment on column FIGCLASS.figclass_caogery
  is '拼班种类 1为课程0为方案2为自由';
comment on column FIGCLASS.figclass_outline
  is '大纲';
alter table FIGCLASS
  add constraint FIGCLASS_ID primary key (FIGCLASS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating FIGFILE...
create table FIGFILE
(
  figclass_id VARCHAR2(64) not null,
  oldfilename VARCHAR2(200) not null,
  newfilename VARCHAR2(200) not null,
  creater     VARCHAR2(200) not null,
  createtime  VARCHAR2(100) not null,
  isdelete    VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table FIGFILE
  is '拼班文件';
comment on column FIGFILE.figclass_id
  is '拼班id';
comment on column FIGFILE.oldfilename
  is '旧的文件名';
comment on column FIGFILE.newfilename
  is '新的文件名';
comment on column FIGFILE.creater
  is '创建人';
comment on column FIGFILE.createtime
  is '创建时间';
comment on column FIGFILE.isdelete
  is '是否删除';

prompt Creating FREE_COSTOM...
create table FREE_COSTOM
(
  freeco_id         VARCHAR2(64) not null,
  freeco_name       VARCHAR2(100) not null,
  freeco_data       VARCHAR2(100) not null,
  freeco_datanum    VARCHAR2(10),
  freeco_pernum     VARCHAR2(10) not null,
  freeco_address    VARCHAR2(100) not null,
  freeco_person     VARCHAR2(100) not null,
  freeco_phone      VARCHAR2(30) not null,
  freeco_creater    VARCHAR2(64) not null,
  freeco_createtime VARCHAR2(100) not null,
  freeco_updater    VARCHAR2(64) not null,
  freeco_updatetime VARCHAR2(100) not null,
  freeco_isdelete   VARCHAR2(2) not null,
  freeco_status     VARCHAR2(2) not null,
  freeco_outline    VARCHAR2(500) not null,
  freeco_gaoery     VARCHAR2(2) not null,
  freeco_numfile    VARCHAR2(2) not null,
  freeco_day        VARCHAR2(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table FREE_COSTOM
  is '自由定制';
comment on column FREE_COSTOM.freeco_id
  is '自由定制ID';
comment on column FREE_COSTOM.freeco_name
  is '自由定制班次名称';
comment on column FREE_COSTOM.freeco_data
  is '自由定制举办日期';
comment on column FREE_COSTOM.freeco_datanum
  is '自由定制举办天数';
comment on column FREE_COSTOM.freeco_pernum
  is '自由定制参加人数';
comment on column FREE_COSTOM.freeco_address
  is '自由定制举办地点';
comment on column FREE_COSTOM.freeco_person
  is '自由定制联系人';
comment on column FREE_COSTOM.freeco_phone
  is '自由定制联系电话';
comment on column FREE_COSTOM.freeco_creater
  is '自由定制创建人';
comment on column FREE_COSTOM.freeco_createtime
  is '自由定制创建时间';
comment on column FREE_COSTOM.freeco_updater
  is '自由定制修改人';
comment on column FREE_COSTOM.freeco_updatetime
  is '自由定制修改时间';
comment on column FREE_COSTOM.freeco_isdelete
  is '自由定制是否删除 0为未删除1为已删除';
comment on column FREE_COSTOM.freeco_status
  is '自由定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课';
comment on column FREE_COSTOM.freeco_outline
  is '自由定制大纲';
comment on column FREE_COSTOM.freeco_gaoery
  is '分类 1为课程0为方案2为自由';
comment on column FREE_COSTOM.freeco_numfile
  is '是否长传名单 0为上传 1为已上传';
comment on column FREE_COSTOM.freeco_day
  is '方案定制0天数';
alter table FREE_COSTOM
  add constraint FREECO_ID primary key (FREECO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating IUSER...
create table IUSER
(
  user_id          VARCHAR2(64) not null,
  user_loginname   VARCHAR2(100) not null,
  user_name        VARCHAR2(100) not null,
  user_phone       VARCHAR2(100) not null,
  user_mail        VARCHAR2(100),
  user_companyname VARCHAR2(200) not null,
  user_department  VARCHAR2(200) not null,
  user_job         VARCHAR2(200),
  user_hold        VARCHAR2(200) not null,
  user_password    VARCHAR2(100) not null,
  createtime       VARCHAR2(100) not null,
  isadmin          VARCHAR2(2) not null,
  user_status      VARCHAR2(2) not null,
  user_area        VARCHAR2(100),
  user_address     VARCHAR2(100),
  isdelete         VARCHAR2(2) not null,
  user_ydphone     VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table IUSER
  is '用户';
comment on column IUSER.user_id
  is '用户id';
comment on column IUSER.user_loginname
  is '登录名称';
comment on column IUSER.user_name
  is '姓名';
comment on column IUSER.user_phone
  is '座机';
comment on column IUSER.user_mail
  is '邮箱';
comment on column IUSER.user_companyname
  is '单位名称';
comment on column IUSER.user_department
  is '所在部门';
comment on column IUSER.user_job
  is '任职岗位';
comment on column IUSER.user_hold
  is '担任职务';
comment on column IUSER.user_password
  is '密码';
comment on column IUSER.createtime
  is '创建时间';
comment on column IUSER.isadmin
  is '是否为管理员  0为否  1为是';
comment on column IUSER.user_status
  is '人员状态 0为暂停 1为使用';
comment on column IUSER.user_area
  is '区域';
comment on column IUSER.user_address
  is '住址';
comment on column IUSER.isdelete
  is '是否删除 0为未删除 1为删除';
comment on column IUSER.user_ydphone
  is '移动电话';
alter table IUSER
  add constraint USER_ID primary key (USER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating NEWS...
create table NEWS
(
  news_id           VARCHAR2(64) not null,
  news_titile       VARCHAR2(500) not null,
  news_title_page   VARCHAR2(500) not null,
  news_introduction VARCHAR2(500) not null,
  news_keywords     VARCHAR2(500) not null,
  news_release_time VARCHAR2(100) not null,
  news_status       VARCHAR2(2) not null,
  news_context      VARCHAR2(2000) not null,
  news_creater      VARCHAR2(100) not null,
  news_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column NEWS.news_id
  is '新闻id';
comment on column NEWS.news_titile
  is '新闻标题';
comment on column NEWS.news_title_page
  is '新闻封面url';
comment on column NEWS.news_introduction
  is '新闻简介';
comment on column NEWS.news_keywords
  is '新闻关键字  以逗号分隔  5个关键字';
comment on column NEWS.news_release_time
  is '发布时间';
comment on column NEWS.news_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column NEWS.news_context
  is '新闻内容';
comment on column NEWS.news_creater
  is '新闻创建人';
comment on column NEWS.news_createtime
  is '新闻创建时间';
alter table NEWS
  add constraint NEWS_ID primary key (NEWS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating NOTICE...
create table NOTICE
(
  notice_id           VARCHAR2(64) not null,
  notice_titile       VARCHAR2(500) not null,
  notice_title_page   VARCHAR2(500) not null,
  notice_introduction VARCHAR2(500) not null,
  notice_keywords     VARCHAR2(500) not null,
  notice_release_time VARCHAR2(100) not null,
  notice_status       VARCHAR2(2) not null,
  notice_context      VARCHAR2(2000) not null,
  notice_creater      VARCHAR2(100) not null,
  notice_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column NOTICE.notice_id
  is '通知公告id';
comment on column NOTICE.notice_titile
  is '通知公告标题';
comment on column NOTICE.notice_title_page
  is '通知公告封面url';
comment on column NOTICE.notice_introduction
  is '通知公告简介';
comment on column NOTICE.notice_keywords
  is '通知公告关键字  以逗号分隔  5个关键字';
comment on column NOTICE.notice_release_time
  is '发布时间';
comment on column NOTICE.notice_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column NOTICE.notice_context
  is '通知公告内容';
comment on column NOTICE.notice_creater
  is '通知公告创建人';
comment on column NOTICE.notice_createtime
  is '通知公告创建时间';
alter table NOTICE
  add constraint NOTICE_ID primary key (NOTICE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PROGARM_COSTOM...
create table PROGARM_COSTOM
(
  programco_id         VARCHAR2(64) not null,
  programco_name       VARCHAR2(100) not null,
  programco_data       VARCHAR2(100) not null,
  programco_pernum     VARCHAR2(10) not null,
  programco_address    VARCHAR2(100) not null,
  programco_person     VARCHAR2(100) not null,
  programco_phone      VARCHAR2(30) not null,
  programco_creater    VARCHAR2(64) not null,
  programco_createtime VARCHAR2(100) not null,
  programco_updater    VARCHAR2(64) not null,
  programco_updatetime VARCHAR2(100) not null,
  programco_isdelete   VARCHAR2(2) not null,
  programco_status     VARCHAR2(2) not null,
  programco_outline    VARCHAR2(500) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table PROGARM_COSTOM
  is '方案定制';
comment on column PROGARM_COSTOM.programco_id
  is '方案定制id';
comment on column PROGARM_COSTOM.programco_name
  is '方案定制班次名称';
comment on column PROGARM_COSTOM.programco_data
  is '方案定制举办日期';
comment on column PROGARM_COSTOM.programco_pernum
  is '方案定制计划参加人数';
comment on column PROGARM_COSTOM.programco_address
  is '方案定制举办地点';
comment on column PROGARM_COSTOM.programco_person
  is '方案定制联系人';
comment on column PROGARM_COSTOM.programco_phone
  is '方案定制联系方式';
comment on column PROGARM_COSTOM.programco_creater
  is '方案定制创建人';
comment on column PROGARM_COSTOM.programco_createtime
  is '方案定制创建时间';
comment on column PROGARM_COSTOM.programco_updater
  is '方案定制修改人';
comment on column PROGARM_COSTOM.programco_updatetime
  is '方案定制修改时间';
comment on column PROGARM_COSTOM.programco_isdelete
  is '方案定制是否删除0为未删除1为已删除';
comment on column PROGARM_COSTOM.programco_status
  is '方案定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课';
comment on column PROGARM_COSTOM.programco_outline
  is '方案定制大纲';
alter table PROGARM_COSTOM
  add constraint PROGRAMCO_ID primary key (PROGRAMCO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PROJECT...
create table PROJECT
(
  project_id         VARCHAR2(64) not null,
  project_name       VARCHAR2(200) not null,
  project_date       VARCHAR2(100) not null,
  project_context    VARCHAR2(2000) not null,
  project_creater    VARCHAR2(100) not null,
  project_createtime VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table PROJECT
  is '项目';
comment on column PROJECT.project_id
  is '项目id';
comment on column PROJECT.project_name
  is '项目名称';
comment on column PROJECT.project_date
  is '项目添加日期';
comment on column PROJECT.project_context
  is '项目内容';
comment on column PROJECT.project_creater
  is '创建人';
comment on column PROJECT.project_createtime
  is '创建时间';
alter table PROJECT
  add constraint PROJECT_ID primary key (PROJECT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PROJECTVIEW...
create table PROJECTVIEW
(
  projectview_id           VARCHAR2(64) not null,
  projectview_titile       VARCHAR2(500) not null,
  projectview_title_page   VARCHAR2(500) not null,
  projectview_introduction VARCHAR2(500) not null,
  projectview_keywords     VARCHAR2(500) not null,
  projectview_release_time VARCHAR2(100) not null,
  projectview_status       VARCHAR2(2) not null,
  projectview_context      VARCHAR2(2000) not null,
  projectview_creater      VARCHAR2(100) not null,
  projectview_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table PROJECTVIEW
  is '项目概况';
comment on column PROJECTVIEW.projectview_id
  is '项目概况id';
comment on column PROJECTVIEW.projectview_titile
  is '项目概况标题';
comment on column PROJECTVIEW.projectview_title_page
  is '项目概况封面url';
comment on column PROJECTVIEW.projectview_introduction
  is '项目概况简介';
comment on column PROJECTVIEW.projectview_keywords
  is '项目概况关键字  以逗号分隔  5个关键字';
comment on column PROJECTVIEW.projectview_release_time
  is '发布时间';
comment on column PROJECTVIEW.projectview_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column PROJECTVIEW.projectview_context
  is '项目概况内容';
comment on column PROJECTVIEW.projectview_creater
  is '项目概况创建人';
comment on column PROJECTVIEW.projectview_createtime
  is '项目概况创建时间';
alter table PROJECTVIEW
  add constraint PROJECTVIEW_ID primary key (PROJECTVIEW_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROTATIONPIC...
create table ROTATIONPIC
(
  rotationpic_id           VARCHAR2(64) not null,
  rotationpic_titile       VARCHAR2(500) not null,
  rotationpic_title_page   VARCHAR2(500) not null,
  rotationpic_introduction VARCHAR2(500) not null,
  rotationpic_keywords     VARCHAR2(500) not null,
  rotationpic_release_time VARCHAR2(100) not null,
  rotationpic_status       VARCHAR2(2) not null,
  rotationpic_context      VARCHAR2(2000) not null,
  rotationpic_creater      VARCHAR2(100) not null,
  rotationpic_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column ROTATIONPIC.rotationpic_id
  is '通知公告id';
comment on column ROTATIONPIC.rotationpic_titile
  is '通知公告标题';
comment on column ROTATIONPIC.rotationpic_title_page
  is '通知公告封面url';
comment on column ROTATIONPIC.rotationpic_introduction
  is '通知公告简介';
comment on column ROTATIONPIC.rotationpic_keywords
  is '通知公告关键字  以逗号分隔  5个关键字';
comment on column ROTATIONPIC.rotationpic_release_time
  is '发布时间';
comment on column ROTATIONPIC.rotationpic_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column ROTATIONPIC.rotationpic_context
  is '通知公告内容';
comment on column ROTATIONPIC.rotationpic_creater
  is '通知公告创建人';
comment on column ROTATIONPIC.rotationpic_createtime
  is '通知公告创建时间';
alter table ROTATIONPIC
  add constraint ROTATIONPIC_ID primary key (ROTATIONPIC_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating RULES...
create table RULES
(
  rules_id           VARCHAR2(64) not null,
  rules_titile       VARCHAR2(500) not null,
  rules_title_page   VARCHAR2(500) not null,
  rules_introduction VARCHAR2(500) not null,
  rules_keywords     VARCHAR2(500) not null,
  rules_release_time VARCHAR2(100) not null,
  rules_status       VARCHAR2(2) not null,
  rules_context      VARCHAR2(2000) not null,
  rules_creater      VARCHAR2(100) not null,
  rules_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column RULES.rules_id
  is '规章公告id';
comment on column RULES.rules_titile
  is '规章公告标题';
comment on column RULES.rules_title_page
  is '规章公告封面url';
comment on column RULES.rules_introduction
  is '规章公告简介';
comment on column RULES.rules_keywords
  is '规章公告关键字  以逗号分隔  5个关键字';
comment on column RULES.rules_release_time
  is '发布时间';
comment on column RULES.rules_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column RULES.rules_context
  is '规章公告内容';
comment on column RULES.rules_creater
  is '规章公告创建人';
comment on column RULES.rules_createtime
  is '规章公告创建时间';
alter table RULES
  add constraint RULES_ID primary key (RULES_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SCHEDULEDSHIFT...
create table SCHEDULEDSHIFT
(
  scheduled_id            VARCHAR2(64) not null,
  scheduled_initiator     VARCHAR2(100) not null,
  scheduled_address       VARCHAR2(200) not null,
  scheduled_start         VARCHAR2(100) not null,
  scheduled_end           VARCHAR2(100) not null,
  scheduled_class_start   VARCHAR2(100) not null,
  scheduled_class_end     VARCHAR2(100) not null,
  scheduled_class_pnumber VARCHAR2(100) not null,
  scheduled_class_context VARCHAR2(2000) not null,
  scheduled_other_context VARCHAR2(2000) not null,
  creater                 VARCHAR2(100) not null,
  createtime              VARCHAR2(100) not null,
  isdelete                VARCHAR2(2) not null,
  scheduled_status        VARCHAR2(2) not null,
  scheduled_name          VARCHAR2(200) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SCHEDULEDSHIFT
  is '规定班次';
comment on column SCHEDULEDSHIFT.scheduled_id
  is '规定班次ID';
comment on column SCHEDULEDSHIFT.scheduled_initiator
  is '发起单位';
comment on column SCHEDULEDSHIFT.scheduled_address
  is '培训开课地点';
comment on column SCHEDULEDSHIFT.scheduled_start
  is '报名开始日期';
comment on column SCHEDULEDSHIFT.scheduled_end
  is '报名截止日期';
comment on column SCHEDULEDSHIFT.scheduled_class_start
  is '预计开课日期';
comment on column SCHEDULEDSHIFT.scheduled_class_end
  is '预计结课日期';
comment on column SCHEDULEDSHIFT.scheduled_class_pnumber
  is '班级容纳人数';
comment on column SCHEDULEDSHIFT.scheduled_class_context
  is '课程大纲';
comment on column SCHEDULEDSHIFT.scheduled_other_context
  is '其他相关信息';
comment on column SCHEDULEDSHIFT.creater
  is '创建人';
comment on column SCHEDULEDSHIFT.createtime
  is '创建时间';
comment on column SCHEDULEDSHIFT.isdelete
  is '是否删除';
comment on column SCHEDULEDSHIFT.scheduled_status
  is '状态  0为未开始 1为进行中 2为未开课 3为开课中 4为结课';
comment on column SCHEDULEDSHIFT.scheduled_name
  is '规定班次名称';
alter table SCHEDULEDSHIFT
  add constraint SCHEDULED_ID primary key (SCHEDULED_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SCHEDULED_FILE...
create table SCHEDULED_FILE
(
  scheduled_id      VARCHAR2(64) not null,
  scheduled_file    VARCHAR2(200) not null,
  scheduled_oldfile VARCHAR2(200) not null,
  creater           VARCHAR2(100) not null,
  createtime        VARCHAR2(100) not null,
  isdelete          VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SCHEDULED_FILE
  is '定制班次文件';
comment on column SCHEDULED_FILE.scheduled_id
  is '规定班次id';
comment on column SCHEDULED_FILE.scheduled_file
  is '文件uuid名字';
comment on column SCHEDULED_FILE.scheduled_oldfile
  is '文件原名';
comment on column SCHEDULED_FILE.creater
  is '创建人';
comment on column SCHEDULED_FILE.createtime
  is '创建时间';
comment on column SCHEDULED_FILE.isdelete
  is '是否删除 0为未删除 1为已删除';

prompt Creating SOLUTION...
create table SOLUTION
(
  solution_id           VARCHAR2(64) not null,
  solution_titile       VARCHAR2(500) not null,
  solution_title_page   VARCHAR2(500) not null,
  solution_introduction VARCHAR2(500) not null,
  solution_keywords     VARCHAR2(500) not null,
  solution_release_time VARCHAR2(100) not null,
  solution_status       VARCHAR2(2) not null,
  solution_context      VARCHAR2(2000) not null,
  solution_creater      VARCHAR2(100) not null,
  solution_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column SOLUTION.solution_id
  is '解决id';
comment on column SOLUTION.solution_titile
  is '解决标题';
comment on column SOLUTION.solution_title_page
  is '解决封面url';
comment on column SOLUTION.solution_introduction
  is '解决简介';
comment on column SOLUTION.solution_keywords
  is '解决关键字  以逗号分隔  5个关键字';
comment on column SOLUTION.solution_release_time
  is '发布时间';
comment on column SOLUTION.solution_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column SOLUTION.solution_context
  is '解决内容';
comment on column SOLUTION.solution_creater
  is '解决创建人';
comment on column SOLUTION.solution_createtime
  is '解决创建时间';
alter table SOLUTION
  add constraint SOLUTION_ID primary key (SOLUTION_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SSUSER...
create table SSUSER
(
  ssu_id         VARCHAR2(64) not null,
  ssu_userid     VARCHAR2(64) not null,
  ssu_ssid       VARCHAR2(64) not null,
  ssu_usernumber VARCHAR2(100) not null,
  ssu_username   VARCHAR2(100) not null,
  ssu_ydphone    VARCHAR2(100) not null,
  ssu_phone      VARCHAR2(50) not null,
  ssu_department VARCHAR2(100) not null,
  ssu_creater    VARCHAR2(100) not null,
  ssu_createtime VARCHAR2(100) not null,
  ssu_isdelete   VARCHAR2(2) not null,
  ssu_status     VARCHAR2(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SSUSER
  is '规定班次报名信息';
comment on column SSUSER.ssu_id
  is 'id';
comment on column SSUSER.ssu_userid
  is '用户id';
comment on column SSUSER.ssu_ssid
  is '规定班次id';
comment on column SSUSER.ssu_usernumber
  is '报名人数';
comment on column SSUSER.ssu_username
  is '联系人';
comment on column SSUSER.ssu_ydphone
  is '联系人移动电话';
comment on column SSUSER.ssu_phone
  is '联系人电话';
comment on column SSUSER.ssu_department
  is '联系人单位';
comment on column SSUSER.ssu_creater
  is '报名人';
comment on column SSUSER.ssu_createtime
  is '报名时间';
comment on column SSUSER.ssu_isdelete
  is '是否删除 0为未删除 1为删除';
comment on column SSUSER.ssu_status
  is '报名状态 0为成功 1为失败';
alter table SSUSER
  add constraint SSU_ID primary key (SSU_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TAX...
create table TAX
(
  tax_id           VARCHAR2(64) not null,
  tax_titile       VARCHAR2(500) not null,
  tax_title_page   VARCHAR2(500) not null,
  tax_introduction VARCHAR2(500) not null,
  tax_keywords     VARCHAR2(500) not null,
  tax_release_time VARCHAR2(100) not null,
  tax_status       VARCHAR2(2) not null,
  tax_context      VARCHAR2(2000) not null,
  tax_creater      VARCHAR2(100) not null,
  tax_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column TAX.tax_id
  is '领税id';
comment on column TAX.tax_titile
  is '领税标题';
comment on column TAX.tax_title_page
  is '领税封面url';
comment on column TAX.tax_introduction
  is '领税简介';
comment on column TAX.tax_keywords
  is '领税关键字  以逗号分隔  5个关键字';
comment on column TAX.tax_release_time
  is '发布时间';
comment on column TAX.tax_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column TAX.tax_context
  is '领税内容';
comment on column TAX.tax_creater
  is '领税创建人';
comment on column TAX.tax_createtime
  is '领税创建时间';
alter table TAX
  add constraint TAX_ID primary key (TAX_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TEACHING...
create table TEACHING
(
  teaching_id           VARCHAR2(64) not null,
  teaching_titile       VARCHAR2(500) not null,
  teaching_title_page   VARCHAR2(500) not null,
  teaching_introduction VARCHAR2(500) not null,
  teaching_keywords     VARCHAR2(500) not null,
  teaching_release_time VARCHAR2(100) not null,
  teaching_status       VARCHAR2(2) not null,
  teaching_context      VARCHAR2(2000) not null,
  teaching_creater      VARCHAR2(100) not null,
  teaching_createtime   VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column TEACHING.teaching_id
  is '教材id';
comment on column TEACHING.teaching_titile
  is '教材标题';
comment on column TEACHING.teaching_title_page
  is '教材封面url';
comment on column TEACHING.teaching_introduction
  is '教材简介';
comment on column TEACHING.teaching_keywords
  is '教材关键字  以逗号分隔  5个关键字';
comment on column TEACHING.teaching_release_time
  is '发布时间';
comment on column TEACHING.teaching_status
  is '发布状态  0为保存  1为待发布  2为发布。。';
comment on column TEACHING.teaching_context
  is '教材内容';
comment on column TEACHING.teaching_creater
  is '教材创建人';
comment on column TEACHING.teaching_createtime
  is '教材创建时间';
alter table TEACHING
  add constraint TEACHING_ID primary key (TEACHING_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USER_CONSTOM...
create table USER_CONSTOM
(
  userid     VARCHAR2(64) not null,
  constom_id VARCHAR2(64) not null,
  status     VARCHAR2(2) not null,
  isdelete   VARCHAR2(2) not null,
  creater    VARCHAR2(64) not null,
  createtime VARCHAR2(100) not null,
  updater    VARCHAR2(64) not null,
  updatetime VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table USER_CONSTOM
  is '参与某个定制班次的用户';
comment on column USER_CONSTOM.userid
  is '人员id';
comment on column USER_CONSTOM.constom_id
  is '定制班次id';
comment on column USER_CONSTOM.status
  is '状态0为报名中1为报名成功';
comment on column USER_CONSTOM.isdelete
  is '0为未删除1为已删除';
comment on column USER_CONSTOM.creater
  is '创建人';
comment on column USER_CONSTOM.createtime
  is '创建成功';
comment on column USER_CONSTOM.updater
  is '修改人';
comment on column USER_CONSTOM.updatetime
  is '修改成功';

prompt Creating USER_FIGCLASS...
create table USER_FIGCLASS
(
  userid      VARCHAR2(64) not null,
  figclass_id VARCHAR2(64) not null,
  status      VARCHAR2(2) not null,
  isdelete    VARCHAR2(2) not null,
  creater     VARCHAR2(64) not null,
  createtime  VARCHAR2(100) not null,
  updater     VARCHAR2(64) not null,
  updatetime  VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table USER_FIGCLASS
  is '参与某个拼班的用户';
comment on column USER_FIGCLASS.userid
  is '人员id';
comment on column USER_FIGCLASS.figclass_id
  is '拼班id';
comment on column USER_FIGCLASS.status
  is '状态0为报名中1为报名成功';
comment on column USER_FIGCLASS.isdelete
  is '0为未删除1为已删除';
comment on column USER_FIGCLASS.creater
  is '创建人';
comment on column USER_FIGCLASS.createtime
  is '创建成功';
comment on column USER_FIGCLASS.updater
  is '修改人';
comment on column USER_FIGCLASS.updatetime
  is '修改成功';

prompt Creating USER_PROJECT...
create table USER_PROJECT
(
  user_id    VARCHAR2(64) not null,
  project_id VARCHAR2(64) not null,
  isdelete   VARCHAR2(2) not null,
  status     VARCHAR2(2) not null,
  createtime VARCHAR2(100) not null,
  up_id      VARCHAR2(64) not null,
  ssu_id     VARCHAR2(64) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table USER_PROJECT
  is '用户参与的项目表规定班次';
comment on column USER_PROJECT.user_id
  is '用户id';
comment on column USER_PROJECT.project_id
  is '项目id';
comment on column USER_PROJECT.isdelete
  is '是否删除 0为未删除 1为删除';
comment on column USER_PROJECT.status
  is '状态 0为报名中 1为成功 2为失败';
comment on column USER_PROJECT.createtime
  is '创建时间';
comment on column USER_PROJECT.up_id
  is 'ID';
comment on column USER_PROJECT.ssu_id
  is '项目记录id';
alter table USER_PROJECT
  add constraint UP_ID primary key (UP_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for ABOUT...
alter table ABOUT disable all triggers;
prompt Disabling triggers for APPLY...
alter table APPLY disable all triggers;
prompt Disabling triggers for APPLY_UNIT...
alter table APPLY_UNIT disable all triggers;
prompt Disabling triggers for CLASSPLAN...
alter table CLASSPLAN disable all triggers;
prompt Disabling triggers for CONSTOMFILE...
alter table CONSTOMFILE disable all triggers;
prompt Disabling triggers for COURSE...
alter table COURSE disable all triggers;
prompt Disabling triggers for COURSE_COSTOM...
alter table COURSE_COSTOM disable all triggers;
prompt Disabling triggers for CULTURE...
alter table CULTURE disable all triggers;
prompt Disabling triggers for EUSER...
alter table EUSER disable all triggers;
prompt Disabling triggers for EXPERT...
alter table EXPERT disable all triggers;
prompt Disabling triggers for FIGCLASS...
alter table FIGCLASS disable all triggers;
prompt Disabling triggers for FIGFILE...
alter table FIGFILE disable all triggers;
prompt Disabling triggers for FREE_COSTOM...
alter table FREE_COSTOM disable all triggers;
prompt Disabling triggers for IUSER...
alter table IUSER disable all triggers;
prompt Disabling triggers for NEWS...
alter table NEWS disable all triggers;
prompt Disabling triggers for NOTICE...
alter table NOTICE disable all triggers;
prompt Disabling triggers for PROGARM_COSTOM...
alter table PROGARM_COSTOM disable all triggers;
prompt Disabling triggers for PROJECT...
alter table PROJECT disable all triggers;
prompt Disabling triggers for PROJECTVIEW...
alter table PROJECTVIEW disable all triggers;
prompt Disabling triggers for ROTATIONPIC...
alter table ROTATIONPIC disable all triggers;
prompt Disabling triggers for RULES...
alter table RULES disable all triggers;
prompt Disabling triggers for SCHEDULEDSHIFT...
alter table SCHEDULEDSHIFT disable all triggers;
prompt Disabling triggers for SCHEDULED_FILE...
alter table SCHEDULED_FILE disable all triggers;
prompt Disabling triggers for SOLUTION...
alter table SOLUTION disable all triggers;
prompt Disabling triggers for SSUSER...
alter table SSUSER disable all triggers;
prompt Disabling triggers for TAX...
alter table TAX disable all triggers;
prompt Disabling triggers for TEACHING...
alter table TEACHING disable all triggers;
prompt Disabling triggers for USER_CONSTOM...
alter table USER_CONSTOM disable all triggers;
prompt Disabling triggers for USER_FIGCLASS...
alter table USER_FIGCLASS disable all triggers;
prompt Disabling triggers for USER_PROJECT...
alter table USER_PROJECT disable all triggers;
prompt Deleting USER_PROJECT...
delete from USER_PROJECT;
commit;
prompt Deleting USER_FIGCLASS...
delete from USER_FIGCLASS;
commit;
prompt Deleting USER_CONSTOM...
delete from USER_CONSTOM;
commit;
prompt Deleting TEACHING...
delete from TEACHING;
commit;
prompt Deleting TAX...
delete from TAX;
commit;
prompt Deleting SSUSER...
delete from SSUSER;
commit;
prompt Deleting SOLUTION...
delete from SOLUTION;
commit;
prompt Deleting SCHEDULED_FILE...
delete from SCHEDULED_FILE;
commit;
prompt Deleting SCHEDULEDSHIFT...
delete from SCHEDULEDSHIFT;
commit;
prompt Deleting RULES...
delete from RULES;
commit;
prompt Deleting ROTATIONPIC...
delete from ROTATIONPIC;
commit;
prompt Deleting PROJECTVIEW...
delete from PROJECTVIEW;
commit;
prompt Deleting PROJECT...
delete from PROJECT;
commit;
prompt Deleting PROGARM_COSTOM...
delete from PROGARM_COSTOM;
commit;
prompt Deleting NOTICE...
delete from NOTICE;
commit;
prompt Deleting NEWS...
delete from NEWS;
commit;
prompt Deleting IUSER...
delete from IUSER;
commit;
prompt Deleting FREE_COSTOM...
delete from FREE_COSTOM;
commit;
prompt Deleting FIGFILE...
delete from FIGFILE;
commit;
prompt Deleting FIGCLASS...
delete from FIGCLASS;
commit;
prompt Deleting EXPERT...
delete from EXPERT;
commit;
prompt Deleting EUSER...
delete from EUSER;
commit;
prompt Deleting CULTURE...
delete from CULTURE;
commit;
prompt Deleting COURSE_COSTOM...
delete from COURSE_COSTOM;
commit;
prompt Deleting COURSE...
delete from COURSE;
commit;
prompt Deleting CONSTOMFILE...
delete from CONSTOMFILE;
commit;
prompt Deleting CLASSPLAN...
delete from CLASSPLAN;
commit;
prompt Deleting APPLY_UNIT...
delete from APPLY_UNIT;
commit;
prompt Deleting APPLY...
delete from APPLY;
commit;
prompt Deleting ABOUT...
delete from ABOUT;
commit;
prompt Loading ABOUT...
insert into ABOUT (about_id, about_titile, about_title_page, about_introduction, about_keywords, about_release_time, about_status, about_context, about_creater, about_createtime)
values ('Abouta0180d42253f4db18919cba6fec82e36', '关于我们标题1', 'ac9e3587-043f-4e14-93a2-c78c81db943e.jpg', '关于我们标题', '关于我们标题', '2018-11-26', '0', '<p><em><img alt="cool" src="http://localhost:8081/ssmtest/admin/pages/wise/ckeditor/plugins/smiley/images/shades_smile.png" style="height:23px; width:23px" title="cool" />关于我们标题</em></p>' || chr(10) || '', 'admin', '2018-12-07 14:42:52');
commit;
prompt 1 records loaded
prompt Loading APPLY...
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('applye9c9176b5ca042b0b19a08f53198de39', '耿方栋', '1', '2018-12-05', '130528199711073614', '0', '15732186819', '447422439@qq.com', '部门', '岗位', '地址', '其他', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'admin', '2018-12-11 11:20:22', '职务', '1', '1', '0', '2018-08-01');
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('apply9055f81bee6d4ca2b49e5410a9f10720', '耿方栋', '0', '2018-12-18', '130528199711073614', '0', '15732186819', '447422439@qq.com', 'bumen', 'asd', 'aasd', 'asd', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24 14:30:00', 'asd', '0', '0', '0', '2018-12-24 14:30:00');
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('apply5ff3ad5c9e374f5086f6f5862e6328dd', '耿方栋', '0', '2018-12-18', '130528199711073614', '0', '15732186819', '447422439@qq.com', 'bumen', 'asd', 'aasd', 'asd', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24 14:30:04', 'asd', '0', '0', '0', '2018-12-24 14:30:04');
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('apply8cd6275cde724f2f8ae2b168e4986e6c', '耿方栋', '0', '2018-12-18', '130528199711073614', '0', '15732186819', '447422439@qq.com', 'bumen', 'asd', 'aasd', 'asd', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24 14:30:13', 'asd', '0', '0', '0', '2018-12-24 14:30:13');
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('applyd1347d219248417daaf58bfd7b736bb5', '耿方栋', '0', '2018-12-18', '130528199711073614', '0', '15732186819', '447422439@qq.com', 'bumen', 'asd', 'aasd', 'asd', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24 14:30:16', 'asd', '0', '0', '0', '2018-12-24 14:30:16');
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('apply2f9bd2bb4c764940ab79ab15d5dd938b', '耿方栋', '0', '2018-12-18', '130528199711073614', '0', '15732186819', '447422439@qq.com', 'bumen', 'asd', 'aasd', 'asd', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24 14:30:20', 'asd', '0', '1', '0', '2018-12-24 14:30:20');
insert into APPLY (apply_id, name, sex, brithday, indentity_number, political_status, phone_number, mail, department, job, address, other, project_id, creater, createtime, position, check_status, isdelete, apply_caogery, applydate)
values ('apply2e82d41410494d79a830363f4ff43554', '耿方栋', '0', '2018-12-04', '1305281997110736', '0', '15732186819', '447422439@qq.com', '部门', '职务', '地址', '其他', 'Project0628afcfdc344240abe971bbcdaf0cf5', 'admin', '2018-12-19 17:09:54', '岗位', '0', '0', '0', '2018-12-19 17:09:54');
commit;
prompt 7 records loaded
prompt Loading APPLY_UNIT...
insert into APPLY_UNIT (applyunit_id, applyunit_caogery, applyunit_date, applyunit_name, applyunit_person, applyunit_phone, applyunit_mail, applyunit_file, creater, createtime, project_id, applyunit_status, isdelete)
values ('aunit90112b9349814f608c69bd3303bc5dbd', '1', '2018-12-13', '1', '1', '1', '1', '报名表格.xlsx', 'admin', '2018-12-12 09:57:56', 'Project0628afcfdc344240abe971bbcdaf0cf5', '1', '1');
insert into APPLY_UNIT (applyunit_id, applyunit_caogery, applyunit_date, applyunit_name, applyunit_person, applyunit_phone, applyunit_mail, applyunit_file, creater, createtime, project_id, applyunit_status, isdelete)
values ('aunit8b10e6329419446f8d8ddc46d6354a9b', '1', '2018-12-11', '1', '1', '1', '1', '报名表格.xlsx', 'admin', '2018-12-12 10:00:10', 'Project0628afcfdc344240abe971bbcdaf0cf5', '0', '1');
insert into APPLY_UNIT (applyunit_id, applyunit_caogery, applyunit_date, applyunit_name, applyunit_person, applyunit_phone, applyunit_mail, applyunit_file, creater, createtime, project_id, applyunit_status, isdelete)
values ('aunit7f4e67083b2647199cd6a5841db94735', '1', '2018-12-24', '1', '耿方栋', '15732186819', '447422439@qq.com', '学员名单上传1218.xlsx', 'admin', '2018-12-24 14:27:32', 'Project0628afcfdc344240abe971bbcdaf0cf5', '0', '0');
insert into APPLY_UNIT (applyunit_id, applyunit_caogery, applyunit_date, applyunit_name, applyunit_person, applyunit_phone, applyunit_mail, applyunit_file, creater, createtime, project_id, applyunit_status, isdelete)
values ('aunit36e389fe89984f5a903cb4d1b0b328bd', '1', '2018-12-11', '单位', '人', '15732186819', '447422439@qq.com', '培训通知.docx', 'admin', '2018-12-11 10:52:27', 'Project0628afcfdc344240abe971bbcdaf0cf5', '0', '1');
insert into APPLY_UNIT (applyunit_id, applyunit_caogery, applyunit_date, applyunit_name, applyunit_person, applyunit_phone, applyunit_mail, applyunit_file, creater, createtime, project_id, applyunit_status, isdelete)
values ('aunit22b4c9c99fa74e8e85d81a4efd6de587', '1', '2019-01-04', '1', '2', '15732186819', '447422439@qq.com', '1218 (1).xlsx', 'admin', '2019-01-04 08:41:51', 'Project0628afcfdc344240abe971bbcdaf0cf5', '1', '0');
commit;
prompt 5 records loaded
prompt Loading CLASSPLAN...
insert into CLASSPLAN (classplan_id, classplan_context, creater, createtime, classplan_name, isdelete)
values ('clasfe962df1499f49d290f4ed301b645b73', '<table border="1" cellpadding="1" cellspacing="1" style="width:500px">' || chr(10) || '' || chr(9) || '<caption>课程表啊</caption>' || chr(10) || '' || chr(9) || '<tbody>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>哈哈</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>爱迪生阿萨德</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td><img alt="cool" src="http://localhost:8081/ssmtest/admin/pages/wise/ckeditor/plugins/smiley/images/shades_smile.png" style="height:23px; width:23px" title="cool" /></td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '</tbody>' || chr(10) || '</table>' || chr(10) || '' || chr(10) || '<p>&nbsp;</p>' || chr(10) || '', 'admin', '2018-12-13 11:28:18', '课程方案', '1');
insert into CLASSPLAN (classplan_id, classplan_context, creater, createtime, classplan_name, isdelete)
values ('clas1568ed7eb7f145d995bb07debfac50f9', '<table border="1" cellpadding="1" cellspacing="1" style="width:500px">' || chr(10) || '' || chr(9) || '<tbody>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>课程表1</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>课程表2</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '</tbody>' || chr(10) || '</table>' || chr(10) || '' || chr(10) || '<p>&nbsp;</p>' || chr(10) || '', 'admin', '2018-12-26 08:47:32', '测试课程方案', '0');
commit;
prompt 2 records loaded
prompt Loading CONSTOMFILE...
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con938ba49b18e043a782dba9cb8734768a', '2018-end.pdf', '17462dd0-45c2-4609-8174-72b76c204bfb.pdf', 'usere5717411aff340d69fafb92f60bbc03a', '2019-21-02 02:21:41', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con23ec09afce4444bbb5956d472e2db4ed', '修改.txt', '31528eb7-4711-477e-9721-2b3291da8794.txt', 'usere5717411aff340d69fafb92f60bbc03a', '2019-20-02 08:20:21', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con86af05d682974c8f94e47a9f84f920c1', '1218 (1).xlsx', 'e106a29b-ef96-4618-9b49-aa140922483d.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-54-03 04:54:05', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con81e6b79208ad4aebb3bb042bdb85427d', '1218 (1).xlsx', 'b545974e-6000-4f9c-ad2e-6f2f43c60c44.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-03-03 11:03:28', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con23ec09afce4444bbb5956d472e2db4ed', '修改.txt', '31528eb7-4711-477e-9721-2b3291da8794.txt', 'usere5717411aff340d69fafb92f60bbc03a', '2019-20-02 08:20:21', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con23ec09afce4444bbb5956d472e2db4ed', '修改.txt', '31528eb7-4711-477e-9721-2b3291da8794.txt', 'usere5717411aff340d69fafb92f60bbc03a', '2019-20-02 08:20:21', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con387786871b0641f580d9ffb539def70d', '1218 (1).xlsx', 'd561bab0-ef70-48a2-8866-fcc6d1a6f2b5.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03 10:01:29', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('cona5abb9805bbe4b93905ceb232e11f406', '1218 (1).xlsx', 'e09b8bd5-192e-4685-8afb-aac86519dd92.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-02-03 10:02:08', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con4ec2fa16db2d462e83075757881a3955', '1218 (1).xlsx', '840108fc-c28f-4aa9-b36f-f6506bccdc42.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-02-03 10:02:56', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con203fc7fe0f6a4291a4982c054234e798', '1218 (1).xlsx', 'c7c4c078-2018-45af-aa20-1a9a9df2a624.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-04-03 10:04:56', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con346e45ed83f5458ba7224c87dad138ce', '2018届毕业生就业推荐表(1).doc', 'bb17fff4-e81f-493a-8559-cd9fa54d8860.doc', 'usere5717411aff340d69fafb92f60bbc03a', '2018-54-31 01:54:00', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con346e45ed83f5458ba7224c87dad138ce', '2018-end.pdf', 'c9b852f8-6fd0-489b-9893-38ce09b74860.pdf', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-31 13:56:45', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con5bff30f34316493f8fe3704646843228', '2018-end.pdf', 'e40137d0-a3d7-4877-b5b3-490dd15438d7.pdf', 'usere5717411aff340d69fafb92f60bbc03a', '2018-22-31 03:22:53', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('cone172a1618cc14a8eb2adff15d81020e3', 'Aga.Controls.dll', 'd60fa192-1d20-412f-b9b5-51ea1eecb2b6.dll', 'usere5717411aff340d69fafb92f60bbc03a', '2018-17-29 11:17:16', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('cone172a1618cc14a8eb2adff15d81020e3', 'Aga.Controls.dll', 'd60fa192-1d20-412f-b9b5-51ea1eecb2b6.dll', 'usere5717411aff340d69fafb92f60bbc03a', '2018-17-29 11:17:16', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('cone172a1618cc14a8eb2adff15d81020e3', 'Aga.Controls.dll', 'd60fa192-1d20-412f-b9b5-51ea1eecb2b6.dll', 'usere5717411aff340d69fafb92f60bbc03a', '2018-17-29 11:17:16', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con60e93d20a6534ae6aff3c922f6651573', '20180806kdxf.sql', 'db5b7238-b168-4997-af9d-54d134a4d529.sql', 'usere5717411aff340d69fafb92f60bbc03a', '2018-53-29 04:53:09', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con346e45ed83f5458ba7224c87dad138ce', '2018届毕业生就业推荐表(1).doc', 'bb17fff4-e81f-493a-8559-cd9fa54d8860.doc', 'usere5717411aff340d69fafb92f60bbc03a', '2018-54-31 01:54:00', '1');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con5bff30f34316493f8fe3704646843228', '2018-end.pdf', 'e40137d0-a3d7-4877-b5b3-490dd15438d7.pdf', 'usere5717411aff340d69fafb92f60bbc03a', '2018-22-31 03:22:53', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con1e8830ee1988446ea3b8d2a875dbe701', '1218 (1).xlsx', '00ca81d1-fa8d-4b5b-84f6-0444956ecc35.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-59-03 04:59:22', '0');
insert into CONSTOMFILE (freeco_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('con73bcdcbd673944f29233e59b19fdbff0', '1218 (1).xlsx', 'bd4653cc-cbfb-438b-91a3-0b02fc622fe5.xlsx', 'usere5717411aff340d69fafb92f60bbc03a', '2019-05-03 05:05:06', '0');
commit;
prompt 21 records loaded
prompt Loading COURSE...
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('coursed90fc46135b64f58a92c0cf2609a24d4', '一级目录啊1', '二级目录啊', '三级目录啊', '<p><strong>其味无穷二群二<img alt="angry" src="http://localhost:8081/ssmtest/admin/pages/wise/ckeditor/plugins/smiley/images/angry_smile.png" style="height:23px; width:23px" title="angry" /></strong></p>' || chr(10) || '', 'admin', '2018-12-12 19:02:29', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('courseeebd7b36675f4d1e8cf3489d8d6d7379', '一级目录1', '二级目录1', '三级目录1', '<p>测试</p>' || chr(10) || '', 'admin', '2018-12-17 14:55:50', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('course5515a1e0e4d3434bbb8acbb3c7943894', '一级目录2', '二级目录2', '三级目录2', '<p>测试</p>' || chr(10) || '', 'admin', '2018-12-17 14:56:14', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('coursea72e690356854c2b9ddd3ea8de8460ec', '一级目录3', '二级目录3', '三级目录3', '<p>测试</p>' || chr(10) || '', 'admin', '2018-12-17 14:57:02', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('coursebce2556688f14c2fb7a03c2881cda760', '一级目录3', '二级目录3', '三级目录3', '<p>测试</p>' || chr(10) || '', 'admin', '2018-12-17 14:57:07', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('coursec89a109020eb4b5d9846efdee80d5b1b', '啊哈哈', '鞍山嗷嗷', '啊大', '<p><strong>安达市大多aa</strong></p>' || chr(10) || '', 'admin', '2018-12-12 18:26:25', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('coursea588a8b3c0474ecaa16bd3f60ea3cb6d', '啊哈哈', '阿达', '鞍山dd', '<p><strong>&nbsp;鞍山撒大 啊</strong></p>' || chr(10) || '', 'admin', '2018-12-12 18:26:42', '1');
insert into COURSE (course_id, first_course, second_course, third_course, course_context, creater, createtime, isdelete)
values ('course4574b61411334654af2ec94caf1c6f36', '文科', '文学', '文学发展史', '<table border="1" cellpadding="1" cellspacing="1" style="width:500px">' || chr(10) || '' || chr(9) || '<tbody>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '</tbody>' || chr(10) || '</table>' || chr(10) || '' || chr(10) || '<p>&nbsp;</p>' || chr(10) || '', 'admin', '2019-01-04 10:56:31', '0');
commit;
prompt 8 records loaded
prompt Loading COURSE_COSTOM...
prompt Table is empty
prompt Loading CULTURE...
prompt Table is empty
prompt Loading EUSER...
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus6bc4675d41e54ac1bbe8f3954f8393b0', '是是是', '对对', '对对', '对对', '1', '131126199811093829', '15703288762', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eusa2e8fc7de649404a9b3a9d5b1d79f5e6', '李甜2', '奥奥', '啊啊吧', '研发', '0', '131126199327182714', '18732154322', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', '32');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus3fcf539323d749d5843f3b1c1dd39769', '是是是', '对对', '对对', '对对', '1', '131126199811093820', '15703288762', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus1bd20ae2f22e4d9788b2269cc71a29d5', '是是是', '对对', '对对', '对对', '1', '131126199811093830', '15703288762', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus42bc8c555e2e4e32bd50e43eec2ee65c', '是是是', '对对', '对对', '对对', '1', '131126199811093832', '15703288762', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus0c5f6c90cff14c7d94c076330bbdb9b8', '是是是', '对对', '对对', '对对', '1', '131126199811093829', '15703288762', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus04f9a4412b9e4fe29a9651da7530ddeb', '李甜甜', '奥奥', '啊啊吧', '研发', '0', '131126199327182714', '18732154322', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '32');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eusb128bcc736bd41a8b2da4b918eb3c1dc', '是是是', '对对', '对对', '对对', '1', '131126199811093820', '15703288762', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eusf6751129979f441a908117de6dbf8f50', '是是是', '对对', '对对', '对对', '1', '131126199811093829', '15703288762', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus98075493497f4240bc16c94b3a0075d0', '张宇', '工作', '部门', '职务', '0', '130528199711073614', '1573186819', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-22', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', '备注');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eusd79281b9cbd0419498ac487504706e2f', '王官舍', '河北师范大学', '物联网', '学生', '0', '130528199711073615', '15732186819', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-22', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '备注啊');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus6a5f005fa7714b27b31711aef65f0ae1', '张宇', '工作', '部门', '职务', '0', '130528199711073614', '1573186819', '0', 'user25187ab0ff4c405d871aa3c25259be18', '2019-01-01', 'user25187ab0ff4c405d871aa3c25259be18', '2019-01-02', '备注');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus4b542fb125ec4dbc8ff453bc1f83cbd7', '是是是', '对对', '对对', '对对', '1', '131126199811093829', '15703288762', '0', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', '11');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('euse50ed3cb905f4c9a91808bbc70f61eae', '李某人', '河北师范大学', '教务1', '学生', '0', '130528199711073614', '15732186819', '0', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24', '备注啊');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus3f233e139b134639bbf6c442dfdfa00f', '王官舍', '河北师范大学', '物联网', '学生', '0', '130528199711073615', '15732186819', '0', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24', '备注啊');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eusaac85dfb238342959bbd3acb2d0e2473', '李甜2', '奥奥', '啊啊吧', '研发', '0', '131126199327182714', '18732154322', '0', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', '32');
insert into EUSER (euser_id, euser_name, euser_companyname, euser_department, euser_hold, euser_sex, euser_indentitynumber, euser_phone, euser_isdelete, euser_creater, euser_createtime, euser_updater, euser_updatetime, euser_remark)
values ('eus2c163fa940654ce4beea20141235f1f6', '是是是', '对对', '对对', '对对', '1', '131126199811093832', '15703288762', '0', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', '11');
commit;
prompt 17 records loaded
prompt Loading EXPERT...
prompt Table is empty
prompt Loading FIGCLASS...
insert into FIGCLASS (figclass_id, figclass_name, figclass_deparment, figclass_address, figclass_start_date, figclass_end_date, figclass_class_start, figclass_class_end, figclass_pernum, figclass_phone, figclass_person, figclass_status, figclass_creater, figclass_createtime, figclass_updater, figclass_updatetime, figclass_isdelete, figclass_numstatus, figclass_caogery, figclass_outline)
values ('fig28a4446c7b9948f397a9b95071b30aef', '我日他妈', '河北省', '河北省石家庄市', '2019-01-03', '2019-01-04', '2019-01-05', '2019-01-06', '51', '15732186819', '耿方栋', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-38-02 09:38:52', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', '1', '0', '1', 'course4574b61411334654af2ec94caf1c6f36');
insert into FIGCLASS (figclass_id, figclass_name, figclass_deparment, figclass_address, figclass_start_date, figclass_end_date, figclass_class_start, figclass_class_end, figclass_pernum, figclass_phone, figclass_person, figclass_status, figclass_creater, figclass_createtime, figclass_updater, figclass_updatetime, figclass_isdelete, figclass_numstatus, figclass_caogery, figclass_outline)
values ('fig11759218eb1c4bd68164d65f951b5773', '待审核拼班班次', '人事', '河北省石家庄市', '2019-01-02', '2019-01-04', '2019-01-11', '2019-01-25', '52', '15732186819', '耿方栋', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-27-02 02:27:01', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', '1', '0', '1', 'course4574b61411334654af2ec94caf1c6f36');
insert into FIGCLASS (figclass_id, figclass_name, figclass_deparment, figclass_address, figclass_start_date, figclass_end_date, figclass_class_start, figclass_class_end, figclass_pernum, figclass_phone, figclass_person, figclass_status, figclass_creater, figclass_createtime, figclass_updater, figclass_updatetime, figclass_isdelete, figclass_numstatus, figclass_caogery, figclass_outline)
values ('figbbe12143316547e9848f5f68cd2533ef', 'asd', 'asd ', ' a ', '2018-12-17', '2018-12-18', '2019-01-01', '2019-01-02', '51', '15732186819', '123', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2018-22-31 03:22:14', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-36-01 10:36:31', '0', '0', '0', 'clas1568ed7eb7f145d995bb07debfac50f9');
commit;
prompt 3 records loaded
prompt Loading FIGFILE...
insert into FIGFILE (figclass_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('fig28a4446c7b9948f397a9b95071b30aef', '2018届毕业生就业推荐表(1).doc', '1b8f1710-7d7d-49e9-bb7b-13dbd3a25b01.doc', 'usere5717411aff340d69fafb92f60bbc03a', '2019-38-02 09:38:52', '0');
insert into FIGFILE (figclass_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('fig11759218eb1c4bd68164d65f951b5773', '2018-end.pdf', 'e8fcd3d1-1ab0-49e9-9d85-fb025dafac43.pdf', 'usere5717411aff340d69fafb92f60bbc03a', '2019-27-02 02:27:01', '0');
insert into FIGFILE (figclass_id, oldfilename, newfilename, creater, createtime, isdelete)
values ('figbbe12143316547e9848f5f68cd2533ef', '2018届毕业生就业推荐表(1).doc', '108d4e4c-5d96-434c-9016-edada365f906.doc', 'usere5717411aff340d69fafb92f60bbc03a', '2018-22-31 03:22:14', '0');
commit;
prompt 3 records loaded
prompt Loading FREE_COSTOM...
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con938ba49b18e043a782dba9cb8734768a', '待审核定制班次', '2019-01-09', null, '51', '河北省石家庄市', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-21-02 02:21:41', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-06-03 02:06:48', '0', '1', 'course4574b61411334654af2ec94caf1c6f36', '1', '0', null);
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con23ec09afce4444bbb5956d472e2db4ed', '期为', '2019-01-09', null, '24', '啊', '切ww', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-20-02 08:20:21', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03 19:24:09', '0', '0', ',course4574b61411334654af2ec94caf1c6f36', '1', '0', null);
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con86af05d682974c8f94e47a9f84f920c1', '测试天数', '2019-01-02', null, '51', '测试天数', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-54-03 04:54:05', 'usere5717411aff340d69fafb92f60bbc03a', '2019-54-03 04:54:05', '0', '0', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '0.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con81e6b79208ad4aebb3bb042bdb85427d', 'asd', '2019-01-07', null, '51', 'gffgf', '15732186819', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-03-03 11:03:28', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-47-03 07:47:29', '0', '2', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '0.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con387786871b0641f580d9ffb539def70d', '方案定制1', '2019-01-03', null, '51', '河北省石家庄市', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03 10:01:29', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03 10:01:29', '0', '0', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '0.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('cona5abb9805bbe4b93905ceb232e11f406', '课程定制测试', '2019-01-03', null, '51', '河北省石家庄市河北师范大学', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-02-03 10:02:08', 'usere5717411aff340d69fafb92f60bbc03a', '2019-02-03 10:02:08', '0', '0', 'course4574b61411334654af2ec94caf1c6f36', '1', '0', null);
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con4ec2fa16db2d462e83075757881a3955', '方案定制测试2', '2019-01-03', null, '51', '河北省石家庄市', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-02-03 10:02:56', 'usere5717411aff340d69fafb92f60bbc03a', '2019-02-03 10:02:56', '0', '0', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '3.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con203fc7fe0f6a4291a4982c054234e798', '方案定制3', '2019-01-03', null, '52', '河北省邢台市', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-04-03 10:04:56', 'usere5717411aff340d69fafb92f60bbc03a', '2019-04-03 10:04:56', '0', '0', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '0.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con5bff30f34316493f8fe3704646843228', 'asd', '2018-12-25', null, '51', 'asdsa', 'asdads', '12345678909', 'usere5717411aff340d69fafb92f60bbc03a', '2018-22-31 03:22:53', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-01', '0', '1', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '1', '0.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con346e45ed83f5458ba7224c87dad138ce', '我日方案定制项目', '2018-12-31', null, '51', '河北省石家庄市', '耿方栋', '1573186819', 'usere5717411aff340d69fafb92f60bbc03a', '2018-54-31 01:54:00', 'usere5717411aff340d69fafb92f60bbc03a', '2018-56-31 13:56:55', '1', '0', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '0.5');
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con1e8830ee1988446ea3b8d2a875dbe701', '自由定制测试', '2019-01-03', '20', '51', 'sad', '耿方栋', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-59-03 04:59:22', 'usere5717411aff340d69fafb92f60bbc03a', '2019-59-03 04:59:22', '0', '0', '自由定制', '2', '0', null);
insert into FREE_COSTOM (freeco_id, freeco_name, freeco_data, freeco_datanum, freeco_pernum, freeco_address, freeco_person, freeco_phone, freeco_creater, freeco_createtime, freeco_updater, freeco_updatetime, freeco_isdelete, freeco_status, freeco_outline, freeco_gaoery, freeco_numfile, freeco_day)
values ('con73bcdcbd673944f29233e59b19fdbff0', '1.5天测试', '2019-01-17', null, '51', '爱迪生', '阿萨德', '15732186819', 'usere5717411aff340d69fafb92f60bbc03a', '2019-05-03 05:05:06', 'usere5717411aff340d69fafb92f60bbc03a', '2019-05-03 05:05:06', '0', '0', 'clas1568ed7eb7f145d995bb07debfac50f9', '0', '0', '1.5');
commit;
prompt 12 records loaded
prompt Loading IUSER...
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('userba20a7264d4443bcb09e1057e0f610c7', '15732186849', '耿方栋3', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '123456', '2018-12-20 14:52:39', '0', '1', null, null, '0', '15732186849');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('usere5717411aff340d69fafb92f60bbc03a', '15732186819', '耿方栋', '010-12345678', '447422439@qq.com', '河北省石家庄市', '物联网', null, '学生', '123456', '2018-12-31 13:47:49', '0', '1', null, null, '0', '15732186819');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('user2be12e4d0fac4949ad67ff9a6cfd01e6', '15732186810', '耿方栋2', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '111111', '2018-12-20 14:51:48', '1', '1', null, null, '0', '15732186810');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('userf400b60f133a4e6a93f2eb1c7790ff78', '15732186840', '耿方栋4', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '111111', '2018-12-20 14:55:41', '0', '1', null, null, '0', '15732186840');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('usera1ba713743d940f48f777745f487c9c5', '15732186842', '姓名', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '111111', '2018-12-20 14:57:10', '0', '1', null, null, '0', '15732186842');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('userc767fe8ea2aa478da30000c61b2e8d89', '15732186844', '姓名', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '111111', '2018-12-20 14:59:07', '0', '1', null, null, '1', '15732186844');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('user4c7bada441c4425fab6abaccda4b9308', '15732186817', '姓名', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '111111', '2018-12-20 14:59:41', '0', '1', null, null, '0', '15732186817');
insert into IUSER (user_id, user_loginname, user_name, user_phone, user_mail, user_companyname, user_department, user_job, user_hold, user_password, createtime, isadmin, user_status, user_area, user_address, isdelete, user_ydphone)
values ('user25187ab0ff4c405d871aa3c25259be18', '15732186811', '耿方栋3', '010-12345678', '447422439@qq.com', '单位', '所在部门', null, '担任职务', '111111', '2019-01-01 11:49:55', '0', '1', null, null, '0', '15732186811');
commit;
prompt 8 records loaded
prompt Loading NEWS...
prompt Table is empty
prompt Loading NOTICE...
prompt Table is empty
prompt Loading PROGARM_COSTOM...
prompt Table is empty
prompt Loading PROJECT...
insert into PROJECT (project_id, project_name, project_date, project_context, project_creater, project_createtime)
values ('Project0628afcfdc344240abe971bbcdaf0cf5', '1', '2018-12-11', '<p>12<img alt="cool" src="http://localhost:8081/ssmtest/admin/pages/wise/ckeditor/plugins/smiley/images/shades_smile.png" style="height:23px; width:23px" title="cool" /></p>' || chr(10) || '', 'admin', '2018-12-10 10:45:55');
insert into PROJECT (project_id, project_name, project_date, project_context, project_creater, project_createtime)
values ('Project7634101e00c84a019d0bf4a86c7a2621', '项目', '2018-12-18', '<table border="1" cellpadding="1" cellspacing="1" style="width:500px">' || chr(10) || '' || chr(9) || '<tbody>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '<tr>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '<td>&nbsp;</td>' || chr(10) || '' || chr(9) || '' || chr(9) || '</tr>' || chr(10) || '' || chr(9) || '</tbody>' || chr(10) || '</table>' || chr(10) || '' || chr(10) || '<p>&nbsp;</p>' || chr(10) || '', 'admin', '2019-01-03 19:18:49');
commit;
prompt 2 records loaded
prompt Loading PROJECTVIEW...
insert into PROJECTVIEW (projectview_id, projectview_titile, projectview_title_page, projectview_introduction, projectview_keywords, projectview_release_time, projectview_status, projectview_context, projectview_creater, projectview_createtime)
values ('ProjectViewfb71eb0cb8954fc0a69ee4497734ed3d', '项目概况标题1', 'b0e3dec9-9efb-4400-9c80-58caaecad8da.jpg', '项目概况标题', '项目概况标题', '2018-12-11', '1', '<p><strong>项目概况标题<img alt="laugh" src="http://localhost:8081/ssmtest/admin/pages/wise/ckeditor/plugins/smiley/images/teeth_smile.png" style="height:23px; width:23px" title="laugh" /></strong></p>' || chr(10) || '', 'admin', '2018-12-07 15:19:55');
commit;
prompt 1 records loaded
prompt Loading ROTATIONPIC...
insert into ROTATIONPIC (rotationpic_id, rotationpic_titile, rotationpic_title_page, rotationpic_introduction, rotationpic_keywords, rotationpic_release_time, rotationpic_status, rotationpic_context, rotationpic_creater, rotationpic_createtime)
values ('RotationPic9348e34f384d4e178b149a145ac1d96d', '测试轮播图', 'a29f1621-3619-466f-8f64-9106042db954.jpg', '简介', '爱迪生', '2019-01-03', '1', '<p>阿萨德</p>' || chr(10) || '', 'admin', '2019-01-03 18:31:41');
commit;
prompt 1 records loaded
prompt Loading RULES...
insert into RULES (rules_id, rules_titile, rules_title_page, rules_introduction, rules_keywords, rules_release_time, rules_status, rules_context, rules_creater, rules_createtime)
values ('rules7762b06ea1b349c8aa8d700d09674a2d', '招生简章', '338753b3-cbde-4955-911e-c538a2299823.jpg', '简介1', '关键字1', '2018-12-26', '0', '<p>当你孤单你会想起谁1</p>' || chr(10) || '', 'admin', '2018-12-26 18:14:32');
insert into RULES (rules_id, rules_titile, rules_title_page, rules_introduction, rules_keywords, rules_release_time, rules_status, rules_context, rules_creater, rules_createtime)
values ('rules53d5b2bdf30d4b01a42643f19099999c', '招生简章3', '9e2264dc-4928-4538-89be-74fe3ab5f3ef.jpg', '简介3', '关键字3', '2018-12-28', '0', '<p>333</p>' || chr(10) || '', 'admin', '2018-12-28 10:08:40');
insert into RULES (rules_id, rules_titile, rules_title_page, rules_introduction, rules_keywords, rules_release_time, rules_status, rules_context, rules_creater, rules_createtime)
values ('rulesd8cc0cd06b6c46269ad7e3fd30a55010', '招生简章1', '7bd5ad3f-224f-4052-b4d5-52878a3f218f.jpg', '简介1', '关键字', '2018-12-28', '0', '<p>111</p>' || chr(10) || '', 'admin', '2018-12-28 09:31:45');
insert into RULES (rules_id, rules_titile, rules_title_page, rules_introduction, rules_keywords, rules_release_time, rules_status, rules_context, rules_creater, rules_createtime)
values ('rules820c406fd7794d65bbcebf69e54b0cc4', '招生简章2', '276b66ab-ee8a-46fa-be69-84a439c2206b.jpg', '简介2', '关键字2', '2018-12-28', '0', '<p>222</p>' || chr(10) || '', 'admin', '2018-12-28 10:08:32');
insert into RULES (rules_id, rules_titile, rules_title_page, rules_introduction, rules_keywords, rules_release_time, rules_status, rules_context, rules_creater, rules_createtime)
values ('rulesb4dff4e9b9ea4b629a4eeaff4ff73d2f', '招生简章4', '729b226d-976a-4872-a0b4-ac6d3fb2f32e.jpg', '简介4', '关键字4', '2018-12-28', '0', '<p>444</p>' || chr(10) || '', 'admin', '2018-12-28 10:08:48');
insert into RULES (rules_id, rules_titile, rules_title_page, rules_introduction, rules_keywords, rules_release_time, rules_status, rules_context, rules_creater, rules_createtime)
values ('ruleseb16adf472814a869c738cf01f38172a', '招生简章5', '3c2111fa-9326-4651-b208-cea6d9d4eb2d.jpg', '简介4', '关键字4', '2018-12-28', '1', '<p>555</p>' || chr(10) || '', 'admin', '2018-12-28 10:09:12');
commit;
prompt 6 records loaded
prompt Loading SCHEDULEDSHIFT...
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '发起单位', '培训开课单位', '2018-12-10', '2018-12-12', '2018-12-14', '2018-12-22', '20', '<p>课程大纲</p>' || chr(10) || '', '<p>其他相关信息</p>' || chr(10) || '', 'admin', '2018-12-14 17:49:36', '0', '2', '班次名称');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schef8dedd73132481483856f6dca50e1d6', '河北省', '石家庄', '2018-12-25', '2018-12-26', '2018-12-27', '2018-12-28', '10', '<p>啊</p>' || chr(10) || '', '<p>啊</p>' || chr(10) || '', 'admin', '2018-12-24 14:23:15', '0', '2', '报名未开始');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('sch5384f17ffeb342989b35880c712646ee', '发起单位', '开课地点', '2018-12-14', '2018-12-16', '2018-12-14', '2018-12-15', '14', '<p>课程大纲</p>' || chr(10) || '', '<p>其他信息</p>' || chr(10) || '', 'admin', '2018-12-14 17:58:25', '0', '2', '吧此名称');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('sch02e4a15a214a418b9bbf7d9f725c6eab', '发起单位', '开课地点', '2018-12-03', '2018-12-12', '2018-12-14', '2018-12-15', '14', '<p>课程大纲</p>' || chr(10) || '', '<p>其他信息</p>' || chr(10) || '', 'admin', '2018-12-13 22:38:01', '1', '0', 'undefined');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schfec09054457345f58cbab60bcc941675', '发起单位', '开课地点', '2018-12-03', '2018-12-12', '2018-12-14', '2018-12-15', '14', '<p>课程大纲</p>' || chr(10) || '', '<p>其他信息</p>' || chr(10) || '', 'admin', '2018-12-13 22:40:24', '1', '0', 'undefined');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('sch4865d37591c94a75ad7e932447c5e2c2', '发起单位', '开课地点', '2018-12-03', '2018-12-12', '2018-12-14', '2018-12-15', '14', '<p>课程大纲</p>' || chr(10) || '', '<p>其他信息</p>' || chr(10) || '', 'admin', '2018-12-13 22:40:55', '1', '0', 'undefined');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('sch69a03d2ebaaa41e095ac504c8955df2d', '132213', '123123', '2019-01-04', '2019-01-05', '2019-01-09', '2019-01-16', '222', '<p>12312</p>' || chr(10) || '', '<p>321</p>' || chr(10) || '', 'admin', '2019-01-03 19:28:02', '0', '0', 'xintest');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schd12d008e987242d79a4e88e49ccb9048', '132213', '123123', '2019-01-04', '2019-01-05', '2019-01-09', '2019-01-16', '222', '<p>12312</p>' || chr(10) || '', '<p>321</p>' || chr(10) || '', 'admin', '2019-01-03 19:28:03', '1', '0', 'xintest');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schc82cbb1da6c04847b603737a1eabe066', '132213', '123123', '2019-01-04', '2019-01-05', '2019-01-09', '2019-01-16', '222', '<p>12312</p>' || chr(10) || '', '<p>321</p>' || chr(10) || '', 'admin', '2019-01-03 19:28:05', '1', '0', 'xintest');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schfdcc9df0749e4157af22ee2d5e628f2e', '发起单位', '开课地点', '2018-12-03', '2018-12-12', '2018-12-14', '2018-12-15', '14', '<p>课程大纲</p>' || chr(10) || '', '<p>其他信息</p>' || chr(10) || '', 'admin', '2018-12-13 22:39:07', '1', '0', 'undefined');
insert into SCHEDULEDSHIFT (scheduled_id, scheduled_initiator, scheduled_address, scheduled_start, scheduled_end, scheduled_class_start, scheduled_class_end, scheduled_class_pnumber, scheduled_class_context, scheduled_other_context, creater, createtime, isdelete, scheduled_status, scheduled_name)
values ('schc14da158f4d74bff8373b9daffe9e328', '河北', '石家庄', '2018-12-28', '2018-12-29', '2018-12-31', '2019-01-01', '10', '<p>大</p>' || chr(10) || '', '<p>去</p>' || chr(10) || '', 'admin', '2018-12-24 09:34:44', '0', '2', '班次名称');
commit;
prompt 11 records loaded
prompt Loading SCHEDULED_FILE...
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'a4515011-2c0c-4576-a2ac-0e511dc398e2.doc', '测试内容.doc', 'admin', '2018-12-14 10:43:09', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'ee4ae784-694b-4769-8ee4-d925490de4d0.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 10:43:09', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schef8dedd73132481483856f6dca50e1d6', '4baf99e8-a887-417f-83e2-03b46ac25d0c.doc', '2018届毕业生就业推荐表(1).doc', 'admin', '2018-12-24 14:23:15', '0');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('sch4865d37591c94a75ad7e932447c5e2c2', 'e211c18a-2bfe-4247-9b36-3caddac38d39.jpg', 'Chrysanthemum.jpg', 'admin', '2018-12-13 22:40:55', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('sch4865d37591c94a75ad7e932447c5e2c2', '1762d2bd-eda6-4f27-bdf5-5435b71d8c6d.jpg', 'Desert.jpg', 'admin', '2018-12-13 22:40:55', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('sch69a03d2ebaaa41e095ac504c8955df2d', 'ea21795b-b0d1-4bfd-9614-73e8957677b8.jpg', 'Desert.jpg', 'admin', '2019-01-03 19:28:02', '0');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schd12d008e987242d79a4e88e49ccb9048', 'b44f3d9c-61d8-4b07-8e41-f4c303b5abee.jpg', 'Desert.jpg', 'admin', '2019-01-03 19:28:03', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schc82cbb1da6c04847b603737a1eabe066', '2123b12c-727d-4b04-a170-49724b8a67b0.jpg', 'Desert.jpg', 'admin', '2019-01-03 19:28:05', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '56d8bea2-5931-4ab9-957e-94a3ba229cf5.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '56d8bea2-5931-4ab9-957e-94a3ba229cf5.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '56d8bea2-5931-4ab9-957e-94a3ba229cf5.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '56d8bea2-5931-4ab9-957e-94a3ba229cf5.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '56d8bea2-5931-4ab9-957e-94a3ba229cf5.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', 'b6afdd96-5040-4897-bd1c-b048ac1e53ad.doc', '测试内容.doc', 'admin', '2018-12-14 17:40:25', '0');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schbac5e6e142cf4651b6c7bf1fff2bf898', '108f0d18-8219-4450-aff6-7aec61fd45be.docx', '固定表变长表测试数据罗列测试流程和结果.docx', 'admin', '2018-12-14 17:49:36', '0');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('sch5384f17ffeb342989b35880c712646ee', '3b1d7da2-6228-431f-bbed-9d8103806265.doc', '测试内容.doc', 'admin', '2018-12-14 17:58:25', '1');
insert into SCHEDULED_FILE (scheduled_id, scheduled_file, scheduled_oldfile, creater, createtime, isdelete)
values ('schc14da158f4d74bff8373b9daffe9e328', '4f6557e2-3498-48f4-afef-74a463133d37.doc', '2018届毕业生就业推荐表(1).doc', 'admin', '2018-12-24 09:34:44', '0');
commit;
prompt 23 records loaded
prompt Loading SOLUTION...
prompt Table is empty
prompt Loading SSUSER...
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu05ef5f5ca2424af3b21cfd1d6ef840b2', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-24', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu93c0dcfe820f4ea0a8fedf40948cc441', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋', '15732186819', '010-12345678', '物联网', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssuf14be3ed9d1d44eb86c69cc800e31738', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '5', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssuaadee1051c224ce7a46d9fdd8e66236d', 'usere5717411aff340d69fafb92f60bbc03a', 'schef8dedd73132481483856f6dca50e1d6', '2', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu48f008397995455d9a03a37b337c6957', 'usere5717411aff340d69fafb92f60bbc03a', 'sch5384f17ffeb342989b35880c712646ee', '3', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu32e7d2d981594f69b06ac49c3a1ca652', 'usere5717411aff340d69fafb92f60bbc03a', 'schc14da158f4d74bff8373b9daffe9e328', '3', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu8317fc324839401d964fbc37565ccf27', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-22', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssuaccbb8dabced43b1beadd2cfa2eac440', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋2', '15732186810', '010-12345678', '所在部门', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24', '0', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu192763aeeaa24ee692fdb9e6d2ba7c69', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '10', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu2b0b3f3cbde148efb5d6097d92b7b4ea', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-29', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssuc32dc3ccb91745af8d3891a1ca047bf7', 'usere5717411aff340d69fafb92f60bbc03a', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋', '15732186819', '010-12345678', '所在部门', 'usere5717411aff340d69fafb92f60bbc03a', '2018-12-24', '1', '0');
insert into SSUSER (ssu_id, ssu_userid, ssu_ssid, ssu_usernumber, ssu_username, ssu_ydphone, ssu_phone, ssu_department, ssu_creater, ssu_createtime, ssu_isdelete, ssu_status)
values ('ssu6a7c894b674c405ea841570fbf9318d8', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '3', '耿方栋2', '15732186810', '010-12345678', '所在部门', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2018-12-24', '1', '0');
commit;
prompt 12 records loaded
prompt Loading TAX...
prompt Table is empty
prompt Loading TEACHING...
prompt Table is empty
prompt Loading USER_CONSTOM...
insert into USER_CONSTOM (userid, constom_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus98075493497f4240bc16c94b3a0075d0', 'con5bff30f34316493f8fe3704646843228', '1', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-01', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-01');
insert into USER_CONSTOM (userid, constom_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus98075493497f4240bc16c94b3a0075d0', 'con5bff30f34316493f8fe3704646843228', '1', '0', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-01', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-01');
commit;
prompt 2 records loaded
prompt Loading USER_FIGCLASS...
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus98075493497f4240bc16c94b3a0075d0', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-01', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus98075493497f4240bc16c94b3a0075d0', 'fig28a4446c7b9948f397a9b95071b30aef', '1', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-02', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus6a5f005fa7714b27b31711aef65f0ae1', 'fig28a4446c7b9948f397a9b95071b30aef', '1', '1', 'user25187ab0ff4c405d871aa3c25259be18', '2019-01-02', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus6bc4675d41e54ac1bbe8f3954f8393b0', 'fig11759218eb1c4bd68164d65f951b5773', '1', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eusa2e8fc7de649404a9b3a9d5b1d79f5e6', 'fig11759218eb1c4bd68164d65f951b5773', '1', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus42bc8c555e2e4e32bd50e43eec2ee65c', 'fig11759218eb1c4bd68164d65f951b5773', '1', '1', 'usere5717411aff340d69fafb92f60bbc03a', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus6a5f005fa7714b27b31711aef65f0ae1', 'figbbe12143316547e9848f5f68cd2533ef', '1', '0', 'user25187ab0ff4c405d871aa3c25259be18', '2019-01-01', 'user25187ab0ff4c405d871aa3c25259be18', '2019-01-01');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus4b542fb125ec4dbc8ff453bc1f83cbd7', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eusaac85dfb238342959bbd3acb2d0e2473', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus2c163fa940654ce4beea20141235f1f6', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus4b542fb125ec4dbc8ff453bc1f83cbd7', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eusaac85dfb238342959bbd3acb2d0e2473', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus2c163fa940654ce4beea20141235f1f6', 'figbbe12143316547e9848f5f68cd2533ef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus4b542fb125ec4dbc8ff453bc1f83cbd7', 'fig11759218eb1c4bd68164d65f951b5773', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eusaac85dfb238342959bbd3acb2d0e2473', 'fig11759218eb1c4bd68164d65f951b5773', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus2c163fa940654ce4beea20141235f1f6', 'fig11759218eb1c4bd68164d65f951b5773', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus4b542fb125ec4dbc8ff453bc1f83cbd7', 'fig28a4446c7b9948f397a9b95071b30aef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eusaac85dfb238342959bbd3acb2d0e2473', 'fig28a4446c7b9948f397a9b95071b30aef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
insert into USER_FIGCLASS (userid, figclass_id, status, isdelete, creater, createtime, updater, updatetime)
values ('eus2c163fa940654ce4beea20141235f1f6', 'fig28a4446c7b9948f397a9b95071b30aef', '1', '1', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03', 'user2be12e4d0fac4949ad67ff9a6cfd01e6', '2019-01-03');
commit;
prompt 19 records loaded
prompt Loading USER_PROJECT...
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus6bc4675d41e54ac1bbe8f3954f8393b0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2019-01-03', 'up6dd722cf62ad45e8a9ca78364bccdec1', 'ssu93c0dcfe820f4ea0a8fedf40948cc441');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusa2e8fc7de649404a9b3a9d5b1d79f5e6', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2019-01-03', 'up5efb7b04ef984205a6ee93fe378c823b', 'ssu93c0dcfe820f4ea0a8fedf40948cc441');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-24', 'up678dadee19c3494f95ab372a884646c0', 'ssu05ef5f5ca2424af3b21cfd1d6ef840b2');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-24', 'up6c39a502b5da4cf7a5849945f4e7a382', 'ssu05ef5f5ca2424af3b21cfd1d6ef840b2');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus42bc8c555e2e4e32bd50e43eec2ee65c', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2019-01-03', 'up89e1101ceb714e6db8ba7fdb27d2c7df', 'ssu93c0dcfe820f4ea0a8fedf40948cc441');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-29', 'up06f49353dbc8431eb1cda48106223598', 'ssuf14be3ed9d1d44eb86c69cc800e31738');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-29', 'up6ea2fed40ccd4d03a5a6b0e5ae239e8c', 'ssuf14be3ed9d1d44eb86c69cc800e31738');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schef8dedd73132481483856f6dca50e1d6', '1', '0', '2018-12-29', 'up25a0d5c6258e4b56bfb81927bc42e7f7', 'ssuaadee1051c224ce7a46d9fdd8e66236d');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schef8dedd73132481483856f6dca50e1d6', '1', '0', '2018-12-29', 'up7073e1174c9445548b199e635d56c10b', 'ssuaadee1051c224ce7a46d9fdd8e66236d');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'sch5384f17ffeb342989b35880c712646ee', '1', '0', '2018-12-29', 'upf42301f746c148758118fe02c33000c5', 'ssu48f008397995455d9a03a37b337c6957');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'sch5384f17ffeb342989b35880c712646ee', '1', '0', '2018-12-29', 'up5dc0325d063446a0bf62c268e3104b85', 'ssu48f008397995455d9a03a37b337c6957');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schc14da158f4d74bff8373b9daffe9e328', '1', '0', '2018-12-29', 'upcca4db387caa42f8b99023bb498ffc84', 'ssu32e7d2d981594f69b06ac49c3a1ca652');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schc14da158f4d74bff8373b9daffe9e328', '1', '0', '2018-12-29', 'upc769558f3778465fa4f9a4a8427c8dea', 'ssu32e7d2d981594f69b06ac49c3a1ca652');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-22', 'upf7e0449e2ec046089df476c886ed7eda', 'ssu8317fc324839401d964fbc37565ccf27');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-22', 'up714671518fc64a01a42e1e11f34cd93c', 'ssu8317fc324839401d964fbc37565ccf27');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('euse50ed3cb905f4c9a91808bbc70f61eae', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '0', '0', '2018-12-24', 'upde8cb54adf994050b9e67ab3bd34b0e4', 'ssuaccbb8dabced43b1beadd2cfa2eac440');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus3f233e139b134639bbf6c442dfdfa00f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '0', '0', '2018-12-24', 'up082dcacacc0547f1b923a5bb486bc9da', 'ssuaccbb8dabced43b1beadd2cfa2eac440');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-29', 'up6073176e801c422bb0f22afc18851a13', 'ssu192763aeeaa24ee692fdb9e6d2ba7c69');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-29', 'upa4a6079f8f8246f08ebadf05fea83e96', 'ssu192763aeeaa24ee692fdb9e6d2ba7c69');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-29', 'up74b70f6cf0cd4666a8c89d54ffedbfdc', 'ssu2b0b3f3cbde148efb5d6097d92b7b4ea');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-29', 'upb9729f85dc764e2099d0ad77310bf918', 'ssu2b0b3f3cbde148efb5d6097d92b7b4ea');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus98075493497f4240bc16c94b3a0075d0', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-24', 'up5e18c88929a548d59aa461acf9bf6599', 'ssuc32dc3ccb91745af8d3891a1ca047bf7');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eusd79281b9cbd0419498ac487504706e2f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-24', 'up8ab008586b424ec48c7168ff9bd12b04', 'ssuc32dc3ccb91745af8d3891a1ca047bf7');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('euse50ed3cb905f4c9a91808bbc70f61eae', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-24', 'upafcb0d210f7b4def84b20930879a7cd2', 'ssu6a7c894b674c405ea841570fbf9318d8');
insert into USER_PROJECT (user_id, project_id, isdelete, status, createtime, up_id, ssu_id)
values ('eus3f233e139b134639bbf6c442dfdfa00f', 'schbac5e6e142cf4651b6c7bf1fff2bf898', '1', '0', '2018-12-24', 'up043af5aab4494fbeb2640d0f02c555f8', 'ssu6a7c894b674c405ea841570fbf9318d8');
commit;
prompt 25 records loaded
prompt Enabling triggers for ABOUT...
alter table ABOUT enable all triggers;
prompt Enabling triggers for APPLY...
alter table APPLY enable all triggers;
prompt Enabling triggers for APPLY_UNIT...
alter table APPLY_UNIT enable all triggers;
prompt Enabling triggers for CLASSPLAN...
alter table CLASSPLAN enable all triggers;
prompt Enabling triggers for CONSTOMFILE...
alter table CONSTOMFILE enable all triggers;
prompt Enabling triggers for COURSE...
alter table COURSE enable all triggers;
prompt Enabling triggers for COURSE_COSTOM...
alter table COURSE_COSTOM enable all triggers;
prompt Enabling triggers for CULTURE...
alter table CULTURE enable all triggers;
prompt Enabling triggers for EUSER...
alter table EUSER enable all triggers;
prompt Enabling triggers for EXPERT...
alter table EXPERT enable all triggers;
prompt Enabling triggers for FIGCLASS...
alter table FIGCLASS enable all triggers;
prompt Enabling triggers for FIGFILE...
alter table FIGFILE enable all triggers;
prompt Enabling triggers for FREE_COSTOM...
alter table FREE_COSTOM enable all triggers;
prompt Enabling triggers for IUSER...
alter table IUSER enable all triggers;
prompt Enabling triggers for NEWS...
alter table NEWS enable all triggers;
prompt Enabling triggers for NOTICE...
alter table NOTICE enable all triggers;
prompt Enabling triggers for PROGARM_COSTOM...
alter table PROGARM_COSTOM enable all triggers;
prompt Enabling triggers for PROJECT...
alter table PROJECT enable all triggers;
prompt Enabling triggers for PROJECTVIEW...
alter table PROJECTVIEW enable all triggers;
prompt Enabling triggers for ROTATIONPIC...
alter table ROTATIONPIC enable all triggers;
prompt Enabling triggers for RULES...
alter table RULES enable all triggers;
prompt Enabling triggers for SCHEDULEDSHIFT...
alter table SCHEDULEDSHIFT enable all triggers;
prompt Enabling triggers for SCHEDULED_FILE...
alter table SCHEDULED_FILE enable all triggers;
prompt Enabling triggers for SOLUTION...
alter table SOLUTION enable all triggers;
prompt Enabling triggers for SSUSER...
alter table SSUSER enable all triggers;
prompt Enabling triggers for TAX...
alter table TAX enable all triggers;
prompt Enabling triggers for TEACHING...
alter table TEACHING enable all triggers;
prompt Enabling triggers for USER_CONSTOM...
alter table USER_CONSTOM enable all triggers;
prompt Enabling triggers for USER_FIGCLASS...
alter table USER_FIGCLASS enable all triggers;
prompt Enabling triggers for USER_PROJECT...
alter table USER_PROJECT enable all triggers;
set feedback on
set define on
prompt Done.
