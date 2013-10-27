/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2013/10/27 10:54:35                          */
/*==============================================================*/


alter table WF_ActivityInst
   drop constraint PK_WF_ACTIVITYINST
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_ActivityInst')
            and   type = 'U')
   drop table WF_ActivityInst
go

alter table WF_Agent
   drop constraint PK_WF_AGENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_Agent')
            and   type = 'U')
   drop table WF_Agent
go

alter table WF_AgentCandidate
   drop constraint PK_WF_AGENTCANDIDATE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_AgentCandidate')
            and   type = 'U')
   drop table WF_AgentCandidate
go

alter table WF_AgentItem
   drop constraint PK_WF_AGENTITEM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_AgentItem')
            and   type = 'U')
   drop table WF_AgentItem
go

alter table WF_ExtendAttr
   drop constraint PK_WF_EXTENDATTR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_ExtendAttr')
            and   type = 'U')
   drop table WF_ExtendAttr
go

alter table WF_Participant
   drop constraint PK_WF_PARTICIPANT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_Participant')
            and   type = 'U')
   drop table WF_Participant
go

alter table WF_ProcessDef
   drop constraint PK_WF_PROCESSDEF
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_ProcessDef')
            and   type = 'U')
   drop table WF_ProcessDef
go

alter table WF_ProcessForm
   drop constraint PK_WF_PROCESSFORM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_ProcessForm')
            and   type = 'U')
   drop table WF_ProcessForm
go

alter table WF_ProcessInst
   drop constraint PK_WF_PROCESSINST
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_ProcessInst')
            and   type = 'U')
   drop table WF_ProcessInst
go

alter table WF_TraceLog
   drop constraint PK_WF_TRACELOG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_TraceLog')
            and   type = 'U')
   drop table WF_TraceLog
go

alter table WF_TransControl
   drop constraint PK_WF_TRANSCONTROL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_TransControl')
            and   type = 'U')
   drop table WF_TransControl
go

alter table WF_Transition
   drop constraint PK_WF_TRANSITION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_Transition')
            and   type = 'U')
   drop table WF_Transition
go

alter table WF_WorkItem
   drop constraint PK_WF_WORKITEM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WF_WorkItem')
            and   type = 'U')
   drop table WF_WorkItem
go

/*==============================================================*/
/* Table: WF_ActivityInst                                       */
/*==============================================================*/
create table WF_ActivityInst (
   ID                   varchar(36)          not null,
   Name                 varchar(32)          null,
   Type                 smallint             null,
   CurrentState         smallint             null,
   StartTime            datetime             null,
   EndTime              datetime             null,
   SubProcessInstID     varchar(36)          null,
   ActivityDefID        varchar(36)          not null,
   ProcessInstID        varchar(36)          not null,
   RollbackFlag         smallint             null,
   Description          varchar(256)         null,
   CreateTime           datetime             null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_ActivityInst') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_ActivityInst' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '活动实例', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '活动类型',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CurrentState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'CurrentState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前状态',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'CurrentState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'StartTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'StartTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '启动时间',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'StartTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EndTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'EndTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结束时间',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'EndTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SubProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'SubProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '子流程实例ID',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'SubProcessInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActivityDefID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'ActivityDefID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '活动定义ID',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'ActivityDefID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'ProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属流程实例',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'ProcessInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RollbackFlag')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'RollbackFlag'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回退标志',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'RollbackFlag'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ActivityInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_ActivityInst', 'column', 'CreateTime'
go

alter table WF_ActivityInst
   add constraint PK_WF_ACTIVITYINST primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_Agent                                              */
/*==============================================================*/
create table WF_Agent (
   ID                   varchar(36)          not null,
   AgentFrom            varchar(36)          not null,
   AgentTo              varchar(36)          not null,
   AgentToType          smallint             null,
   AgentType            smallint             null,
   StartTime            datetime             null,
   EndTime              datetime             null,
   AgentReason          varchar(128)         null,
   Creator              varchar(36)          not null,
   CreateTime           datetime             null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_Agent') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_Agent' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '工作代理', 
   'user', @CurrentUser, 'table', 'WF_Agent'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentFrom')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentFrom'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托人',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentFrom'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentTo')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentTo'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理人',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentTo'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentToType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentToType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理人类型',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentToType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理方式',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'StartTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'StartTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '生效时间',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'StartTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EndTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'EndTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结束时间',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'EndTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentReason')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentReason'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理原因',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'AgentReason'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'Creator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建者',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'Creator'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Agent')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_Agent', 'column', 'CreateTime'
go

alter table WF_Agent
   add constraint PK_WF_AGENT primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_AgentCandidate                                     */
/*==============================================================*/
create table WF_AgentCandidate (
   ID                   varchar(36)          not null,
   AgentToID            varchar(36)          not null,
   AgentToName          varchar(32)          null,
   AgentToType          smallint             null,
   AgentFrom            varchar(36)          not null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_AgentCandidate') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_AgentCandidate' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '代理候选人', 
   'user', @CurrentUser, 'table', 'WF_AgentCandidate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentCandidate')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentCandidate')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentToID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentToID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理人',
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentToID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentCandidate')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentToName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentToName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理人名称',
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentToName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentCandidate')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentToType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentToType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理人类型',
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentToType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentCandidate')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentFrom')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentFrom'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托人ID',
   'user', @CurrentUser, 'table', 'WF_AgentCandidate', 'column', 'AgentFrom'
go

alter table WF_AgentCandidate
   add constraint PK_WF_AGENTCANDIDATE primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_AgentItem                                          */
/*==============================================================*/
create table WF_AgentItem (
   ID                   varchar(36)          not null,
   Type                 smallint             null,
   RelatedBizID         varchar(36)          not null,
   IsValid              smallint             not null,
   AgentPrivilege       smallint             null,
   AgentID              varchar(36)          not null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_AgentItem') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_AgentItem' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '代理项', 
   'user', @CurrentUser, 'table', 'WF_AgentItem'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理项类型',
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RelatedBizID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'RelatedBizID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理业务ID',
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'RelatedBizID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsValid')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'IsValid'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否生效',
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'IsValid'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentPrivilege')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'AgentPrivilege'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理权限',
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'AgentPrivilege'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_AgentItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AgentID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'AgentID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属代理',
   'user', @CurrentUser, 'table', 'WF_AgentItem', 'column', 'AgentID'
go

alter table WF_AgentItem
   add constraint PK_WF_AGENTITEM primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_ExtendAttr                                         */
/*==============================================================*/
create table WF_ExtendAttr (
   ID                   varchar(36)          not null,
   Entity               varchar(32)          null,
   EntityID             varchar(36)          not null,
   Name                 varchar(32)          null,
   Value                varchar(128)         null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_ExtendAttr') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_ExtendAttr' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '扩展属性', 
   'user', @CurrentUser, 'table', 'WF_ExtendAttr'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ExtendAttr')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ExtendAttr')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Entity')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'Entity'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '扩展实体',
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'Entity'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ExtendAttr')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EntityID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'EntityID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实例ID',
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'EntityID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ExtendAttr')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '属性名',
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ExtendAttr')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Value')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'Value'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '属性值',
   'user', @CurrentUser, 'table', 'WF_ExtendAttr', 'column', 'Value'
go

alter table WF_ExtendAttr
   add constraint PK_WF_EXTENDATTR primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_Participant                                        */
/*==============================================================*/
create table WF_Participant (
   ID                   varchar(36)          not null,
   Name                 varchar(32)          null,
   ParticipantType      smallint             null,
   ParticipantID        varchar(1)           not null,
   WorkItemID           varchar(36)          not null,
   WorkItemState        smallint             null,
   PartiInType          smallint             null,
   DelegateType         smallint             null,
   ParticipantIndex     int                  null,
   CreateTime           datetime             null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_Participant') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_Participant' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '流程参与者', 
   'user', @CurrentUser, 'table', 'WF_Participant'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParticipantType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ParticipantType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与者类型',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ParticipantType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParticipantID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ParticipantID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与者值ID',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ParticipantID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WorkItemID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'WorkItemID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工作项ID',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'WorkItemID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WorkItemState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'WorkItemState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工作项状态',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'WorkItemState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'PartiInType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'PartiInType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与类型',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'PartiInType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DelegateType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'DelegateType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代办类型',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'DelegateType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParticipantIndex')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ParticipantIndex'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与顺序',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'ParticipantIndex'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Participant')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_Participant', 'column', 'CreateTime'
go

alter table WF_Participant
   add constraint PK_WF_PARTICIPANT primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_ProcessDef                                         */
/*==============================================================*/
create table WF_ProcessDef (
   ID                   varchar(36)          not null,
   Name                 varchar(32)          null,
   Text                 varchar(64)          null,
   Content              varchar(1)           null,
   CategoryID           varchar(36)          not null,
   CurrentState         smallint             null,
   CurrentFlag          smallint             null,
   Startor              varchar(36)          not null,
   IsActive             smallint             null,
   Version              varchar(16)          null,
   Description          varchar(256)         null,
   CreateTime           datetime             null,
   Creator              varchar(36)          not null,
   ModifyTime           datetime             null,
   Modifier             varchar(36)          null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_ProcessDef') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_ProcessDef' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '流程定义', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Text')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Text'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '显示名',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Text'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Content')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Content'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程内容',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Content'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CategoryID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CategoryID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属分类',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CategoryID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CurrentState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CurrentState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前状态',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CurrentState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CurrentFlag')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CurrentFlag'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否当前版本',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CurrentFlag'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Startor')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Startor'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程启动者',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Startor'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsActive')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'IsActive'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否有活动实例',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'IsActive'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Version')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Version'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '版本',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Version'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Creator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建者',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Creator'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessDef')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Modifier')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Modifier'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改人',
   'user', @CurrentUser, 'table', 'WF_ProcessDef', 'column', 'Modifier'
go

alter table WF_ProcessDef
   add constraint PK_WF_PROCESSDEF primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_ProcessForm                                        */
/*==============================================================*/
create table WF_ProcessForm (
   ID                   varchar(36)          not null,
   WorkItemID           varchar(36)          not null,
   BizTable             varchar(32)          null,
   BizID                varchar(36)          not null,
   KeyWord              varchar(512)         null,
   CreateTime           datetime             null,
   Creator              varchar(36)          not null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_ProcessForm') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_ProcessForm' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '工作流表单', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WorkItemID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'WorkItemID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工作项ID',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'WorkItemID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BizTable')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'BizTable'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务表',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'BizTable'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BizID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'BizID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务ID',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'BizID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'KeyWord')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'KeyWord'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '查询关键字',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'KeyWord'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'Creator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建者',
   'user', @CurrentUser, 'table', 'WF_ProcessForm', 'column', 'Creator'
go

alter table WF_ProcessForm
   add constraint PK_WF_PROCESSFORM primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_ProcessInst                                        */
/*==============================================================*/
create table WF_ProcessInst (
   ID                   varchar(36)          not null,
   Name                 varchar(32)          null,
   ProcessDefID         varchar(36)          not null,
   ProcessDefName       varchar(32)          null,
   ParentProcessID      varchar(36)          null,
   ParentActivityID     varchar(36)          null,
   CurrentState         smallint             null,
   LimitTime            datetime             null,
   StartTime            datetime             null,
   EndTime              datetime             null,
   FinalTime            datetime             null,
   RemindTime           datetime             null,
   IsTimeOut            smallint             null,
   TimeOutTime          datetime             null,
   ProcessVersion       varchar(16)          null,
   Description          varchar(256)         null,
   Creator              varchar(36)          not null,
   CreateTime           datetime             null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_ProcessInst') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_ProcessInst' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '流程实例', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessDefID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ProcessDefID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程定义ID',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ProcessDefID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessDefName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ProcessDefName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程名称',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ProcessDefName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentProcessID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ParentProcessID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '父流程',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ParentProcessID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentActivityID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ParentActivityID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '父活动',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ParentActivityID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CurrentState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'CurrentState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前状态',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'CurrentState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'LimitTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'LimitTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '限期时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'LimitTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'StartTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'StartTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '启动时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'StartTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EndTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'EndTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结束时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'EndTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FinalTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'FinalTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '终止时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'FinalTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RemindTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'RemindTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提醒时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'RemindTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsTimeOut')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'IsTimeOut'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否超时',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'IsTimeOut'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TimeOutTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'TimeOutTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超时时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'TimeOutTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessVersion')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ProcessVersion'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属流程版本',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'ProcessVersion'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'Creator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建者',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'Creator'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_ProcessInst')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_ProcessInst', 'column', 'CreateTime'
go

alter table WF_ProcessInst
   add constraint PK_WF_PROCESSINST primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_TraceLog                                           */
/*==============================================================*/
create table WF_TraceLog (
   ID                   varchar(36)          not null,
   ActionType           smallint             null,
   Operator             varchar(36)          not null,
   ClientIP             varchar(16)          null,
   ProcessID            varchar(36)          not null,
   ProcessInstID        varchar(36)          not null,
   ActivityID           varchar(36)          not null,
   ActivityInstID       varchar(36)          not null,
   WorkItemID           varchar(36)          not null,
   Message              varchar(128)         null,
   CreateTime           datetime             null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_TraceLog') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_TraceLog' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '流程跟踪日志', 
   'user', @CurrentUser, 'table', 'WF_TraceLog'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActionType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ActionType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ActionType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Operator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'Operator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作人',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'Operator'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ClientIP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ClientIP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'IP地址',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ClientIP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ProcessID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程ID',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ProcessID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程实例ID',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ProcessInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActivityID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ActivityID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '活动ID',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ActivityID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActivityInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ActivityInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '活动实例ID',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'ActivityInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WorkItemID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'WorkItemID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工作项ID',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'WorkItemID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Message')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'Message'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '消息',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'Message'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TraceLog')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_TraceLog', 'column', 'CreateTime'
go

alter table WF_TraceLog
   add constraint PK_WF_TRACELOG primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_TransControl                                       */
/*==============================================================*/
create table WF_TransControl (
   ID                   varchar(36)          not null,
   SrcActID             varchar(36)          not null,
   SrcActName           varchar(32)          null,
   DestActID            varchar(36)          not null,
   DestActName          varchar(32)          null,
   ProcessInstID        varchar(36)          not null,
   TransTime            datetime             not null,
   TransWeight          float(16)            null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_TransControl') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_TransControl' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '流程迁移控制', 
   'user', @CurrentUser, 'table', 'WF_TransControl'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SrcActID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'SrcActID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源活动定义ID',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'SrcActID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SrcActName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'SrcActName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源活动定义名称',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'SrcActName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DestActID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'DestActID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标活动定义ID',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'DestActID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DestActName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'DestActName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标活动定义名称',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'DestActName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'ProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程实例ID',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'ProcessInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TransTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'TransTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '迁移时间',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'TransTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_TransControl')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TransWeight')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'TransWeight'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '迁移权重',
   'user', @CurrentUser, 'table', 'WF_TransControl', 'column', 'TransWeight'
go

alter table WF_TransControl
   add constraint PK_WF_TRANSCONTROL primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_Transition                                         */
/*==============================================================*/
create table WF_Transition (
   ID                   varchar(36)          not null,
   SrcActID             varchar(36)          not null,
   SrcActInstID         varchar(36)          not null,
   SrcActInstName       varchar(32)          null,
   SrcActName           varchar(32)          null,
   DestActInstID        varchar(36)          not null,
   DestActInstName      varchar(32)          null,
   DestActID            varchar(36)          not null,
   DestActName          varchar(32)          null,
   ProcessInstID        varchar(36)          not null,
   ProcessInstName      varchar(32)          null,
   TransTime            datetime             not null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_Transition') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_Transition' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '流程迁移记录', 
   'user', @CurrentUser, 'table', 'WF_Transition'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SrcActID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源活动定义ID',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SrcActInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源活动ID',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SrcActInstName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActInstName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源活动名称',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActInstName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SrcActName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源活动定义名称',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'SrcActName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DestActInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标活动ID',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DestActInstName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActInstName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标活动名称',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActInstName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DestActID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标活动定义ID',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DestActName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标活动定义名称',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'DestActName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'ProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程实例ID',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'ProcessInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'ProcessInstName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '流程实例名称',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'ProcessInstName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_Transition')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TransTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'TransTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '迁移时间',
   'user', @CurrentUser, 'table', 'WF_Transition', 'column', 'TransTime'
go

alter table WF_Transition
   add constraint PK_WF_TRANSITION primary key nonclustered (ID)
go

/*==============================================================*/
/* Table: WF_WorkItem                                           */
/*==============================================================*/
create table WF_WorkItem (
   ID                   varchar(36)          not null,
   Name                 varchar(32)          null,
   Type                 smallint             null,
   CreateTime           datetime             null,
   Creator              varchar(36)          not null,
   CreatorName          varchar(16)          null,
   StartTime            datetime             null,
   EndTime              datetime             null,
   Description          varchar(256)         null,
   CurrentState         smallint             null,
   Participant          varchar(36)          not null,
   IsTimeOut            smallint             null,
   TimeOutTime          datetime             null,
   RemindTime           datetime             null,
   ActionURL            varchar(128)         null,
   ActionMask           varchar(16)          null,
   ProcessInstID        varchar(36)          not null,
   ProcessInstName      varchar(32)          null,
   ActivityInstID       varchar(36)          not null,
   ActivityInstName     varchar(32)          null,
   ProcessID            varchar(36)          not null,
   ProcessName          varchar(32)          null,
   AllowAgent           smallint             null,
   BizState             smallint             null,
   Executor             varchar(36)          not null,
   ExecutorName         varchar(16)          null,
   ExecuteTime          datetime             null,
   RootProcessInstID    varchar(36)          null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('WF_WorkItem') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'WF_WorkItem' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '工作项', 
   'user', @CurrentUser, 'table', 'WF_WorkItem'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工作项类型',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Creator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建者',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Creator'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreatorName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'CreatorName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建者姓名',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'CreatorName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'StartTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'StartTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '启动时间',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'StartTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EndTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'EndTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结束时间',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'EndTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CurrentState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'CurrentState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前状态',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'CurrentState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Participant')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Participant'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与者',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Participant'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsTimeOut')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'IsTimeOut'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否超时',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'IsTimeOut'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TimeOutTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'TimeOutTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超时时间',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'TimeOutTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RemindTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'RemindTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提醒时间',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'RemindTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActionURL')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActionURL'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '响应URL',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActionURL'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActionMask')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActionMask'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作码',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActionMask'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属流程实例',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessInstName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessInstName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属流程实例名',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessInstName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActivityInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActivityInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属活动实例',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActivityInstID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ActivityInstName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActivityInstName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属活动实像名',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ActivityInstName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属流程',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ProcessName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属流程显示名',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ProcessName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AllowAgent')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'AllowAgent'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许代理',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'AllowAgent'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BizState')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'BizState'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务状态',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'BizState'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Executor')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Executor'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '执行者',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'Executor'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ExecutorName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ExecutorName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '执行者姓名',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ExecutorName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ExecuteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ExecuteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '执行时间',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'ExecuteTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('WF_WorkItem')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RootProcessInstID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'RootProcessInstID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属根流程实例',
   'user', @CurrentUser, 'table', 'WF_WorkItem', 'column', 'RootProcessInstID'
go

alter table WF_WorkItem
   add constraint PK_WF_WORKITEM primary key nonclustered (ID)
go

