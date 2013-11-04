﻿<!-- @{
    Style.Require("tab_" + Theme);
    Style.Require("ActivityDetail_" + Theme);
    Script.Require("tab").AtHead();
    Script.Require("angularjs").AtHead();
    Script.Require("ActivityDetailjs").AtHead();
    Layout = "../Shared/_LayoutWorkflow.cshtml";
    var activity = JsonConvert.SerializeObject(ViewData["Activity"]);
    var workContext = EngineContext.Current.Resolve<IWorkContext>();
    var currentUser = workContext.User;
    var currentSkin = workContext.Theme;
} -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>活动配置</title>
<link href="${ctx}/themes/default/workflowDesigner/workflowDesigner.css" rel="stylesheet">
<link href="${ctx}/themes/default/tab.css" rel="stylesheet">
<link href="${ctx}/js/contextMenu/jquery.contextMenu.css" rel="stylesheet"	type="text/css" />
<script src="${ctx}/js/jquery.contextMenu.js"	type="text/javascript"></script>
<script src="${ctx}/js/tab/tab.js"	type="text/javascript"></script>
<script src="${ctx}/js/angularjs.js" type="text/javascript"></script>
<script type="text/javascript">

    $(document).ready(function () {
        switchTab('basic');
        var processDefID = $.query.get("ProcessDefID");
        var activityID = $.query.get("ActivityID");
        var ProcessDefine = window.parent.$("#actionDialog").find("#bg_div_iframe")[0].contentWindow.processDefine;
        for (var i = 0; i < ProcessDefine.Activities.length; i++) {
            if (ProcessDefine.Activities[i].ID == activityID) {//&&processDefID == ProcessDefine.ID ) {
                CurentActivity = ProcessDefine.Activities[i];
                switch (ProcessDefine.Activities[i].ActivityType) {
                    case "StartActivity": ProcessDefine.Activities[i].ActivityType = "StartActivity";
                        initStartActivity(ProcessDefine.Activities[i]);
                        break;
                    case "ManualActivity": ProcessDefine.Activities[i].ActivityType = "ManualActivity";
                        initManualActivity(ProcessDefine.Activities[i]);
                        break;
                    case "RouterActivity": ProcessDefine.Activities[i].ActivityType = "RouterActivity";
                        initRouterActivity(ProcessDefine.Activities[i]);
                        break;
                    case "SubflowActivity": ProcessDefine.Activities[i].ActivityType = "SubflowActivity";
                        initSubflowActivity(ProcessDefine.Activities[i]);
                        break;
                    case "AutoActivity": ProcessDefine.Activities[i].ActivityType = "AutoActivity";
                        initAutoActivity(ProcessDefine.Activities[i]);
                        break;
                    case "EndActivity": ProcessDefine.Activities[i].ActivityType = "EndActivity";
                        initEndActivity(ProcessDefine.Activities[i]);
                        break;
                    case "ProcessActivity": ProcessDefine.Activities[i].ActivityType = "ProcessActivity";
                        initProcessActivity(ProcessDefine.Activities[i]);
                        break;
                }
            }
        }

    });

</script>
</head>
<body>
<ul id="tabcontainer">
    <li id="basic" class="tabBg1" onclick="switchTab('basic');">基本</li>
    <li id="participantor" class="tabBg2" onclick="switchTab('participantor');">参与者</li>
    <li id="form" class="tabBg3" onclick="switchTab('form');">表单</li>
    <li id="limit" class="tabBg3" onclick="switchTab('limit');">限制</li>
    <li id="task" class="tabBg3" onclick="switchTab('task');">任务</li>
    <li id="event" class="tabBg3" onclick="switchTab('event');">事件</li>
    <li id="rollback" class="tabBg3" onclick="switchTab('rollback');">回退</li>
    <li id="freeActivity" class="tabBg3" onclick="switchTab('freeActivity');">自由流</li>
    <li id="activateRule" class="tabBg5" onclick="switchTab('activateRule');">策略</li>
</ul>
<div id="main_bg">
    <div id="main_bg2" ng-controller="initProcessDefine">
        <div id="tabbasic">
            @*  基本*@
            <div class="div_row" style="width: 100%">
                <div class="div_row_lable">
                    <label>
                        活动 ID
                    </label>
                </div>
                <div class="div_row_input">
                    <input type="text" id="activity_id" style="width: 500px" ng-model="Ativity().NewID" /><span>
                    </span>
                </div>
            </div>
            <div class="div_row" style="clear: both; width: 100%">
                <div class="div_row_lable">
                    <label>
                        活动名称
                    </label>
                </div>
                <div class="div_row_input">
                    <input type="text" id="activity_name" style="width: 500px" ng-model="Ativity().Name" />
                </div>
            </div>
            <div class="div_row" id="row_splitType" style="clear: both">
                <div class="div_row_lable" id="lable_splitType">
                    <label>
                        分支模式
                    </label>
                </div>
                <div class="div_row_input">
                    <select id="splittype" ng-model="Ativity().SplitType">
                        <option value="AND">全部分支</option>
                        <option value="XOR">单一分支</option>
                        <option value="OR">多路分支</option>
                    </select>
                </div>
            </div>
            <div class="div_row" id="row_joinType">
                <div class="div_row_lable" id="lable_joinType">
                    <label>
                        聚合模式
                    </label>
                </div>
                <div class="div_row_input" id="input_joinType">
                    <select id="jointyple" ng-model="Ativity().JoinType">
                        <option value="AND">全部聚合</option>
                        <option value="XOR">单一聚合</option>
                        <option value="OR">多路聚合</option>
                    </select>
                </div>
            </div>
            <div class="div_row" id="row_propertyandproxy">
                <div class="div_row_lable" id="lable_allowproxy">
                    <label class="label">
                        允许代理
                    </label>
                </div>
                <div class="div_row_input" id="input_allowproxy">
                    <input type="checkbox" id="chbAllowAgent" ng-model="Ativity().AllowAgent" />
                </div>
            </div>
            <div class="div_row" id="row_priority">
                <div class="div_row_lable" id="lable_priority">
                    <label class="label">
                        分割事务
                    </label>
                </div>
                <div class="div_row_input" id="input_priority">
                    <input type="checkbox" id="chbIsSplitTransaction" ng-model="Ativity().IsSplitTransaction" />
                </div>
            </div>
            <div class="div_row" style="height: 200px;" id="row_description">
                <div class="div_row_lable">
                    <label>
                        描 述
                    </label>
                </div>
                <div class="div_row_input">
                    <textarea id="txtDescription" style="height: 180px; width: 600px;" ng-model="Ativity().Description"></textarea>
                </div>
            </div>
            <div class="div_row_left" id="row_businessSet">
                业务设置
            </div>
            <div class="div_row_left_content" id="row_isSpecifyURL">
                <div class="div_row_lable" style="width: 100%; text-align: left">
                    <input type="radio" id="rbDefaultURL" name="BusinessSetting" checked="checked" ng_click="businessSet('rbDefaultURL')" />默认URL
                </div>
            </div>
            @*   <div class="div_row_left_content" id="row_urltype">
                <div class="div_row_lable" style="width: 100%; text-align: left">
                    <input type="radio" id="rbTask" value="人工任务" name="BusinessSetting" />人工任务
                </div>
            </div>*@
            <div class="div_row_left_content" id="row_CustomizeURL">
                <div class="div_row_lable" style="width: 100%; text-align: left">
                    <input type="radio" id="rbCustomizeURL" name="BusinessSetting" ng_click="businessSet('rbCustomizeURL')" />自定义URL
                </div>
                <div class="div_row_input">
                    <input type="text" id="txtSpecifyURL" style="width: 100%;" ng-model="CustomURL().SpecifyURL" />
                </div>
            </div>
        </div>
        <div id="tabparticipantor">
            @*  参与者*@
            <div class="tabparticipantor_list">
                <div class="tabparticipantor_row">
                    <div class="tabparticipantor_lable">
                        <input type="radio" id="rblOrganization" value="从参与者列表获得" name="ParticipantType"
                            ng-click="chooseParticipantorType('rblOrganization')" checked="checked" />从参与者列表获得
                    </div>
                    <div class="tabparticipantor_input" style="float: right">
                        <span ng-click="addParticipant()" class='btn_add' title='添加'></span><span class='btn_delete'
                            ng-click="delParticipantor()" title="删除"></span>
                    </div>
                </div>
                <div id="orgorrole" style="height: 230px">
                    <table style="width: 100%; text-align: center;" id="gvOrgizationOrRole_container">
                        <thead>
                            <tr>
                                <th>选择</th>
                                <th>序号</th>
                                <th>参与者ID</th>
                                <th>名称</th>
                                <th>参与者类型</th>
                            </tr>
                        </thead>
                        <tr ng-repeat="participantor in Participant().Participantors">
                            <td>
                                <input id='radioId' type='radio' value='{{participantor.ID}}' name='radioId' />
                            </td>
                            <td>{{participantor.SortOrder}}</td>
                            <td>{{participantor.ID}}</td>
                            <td>{{participantor.Name}}</td>
                            <td>{{participantor.ParticipantorType}}</td>
                        </tr>
                    </table>
                </div>
                <div class="div_row_left">
                    <input type="checkbox" id="ckbIsAllowAppointParticipants" value="允许前驱活动根据如上列表指派活动参与者"
                        ng-model="Participant().AllowAppointParticipants" />
                    允许前驱活动根据如上列表指派活动参与者
                </div>
            </div>
            <div class="div_row_left">
                <input type="radio" id="rblProcessStarter" value="流程启动者" ng-click="chooseParticipantorType('rblProcessStarter')"
                    name="ParticipantType" />
                流程启动者
            </div>
            <div class="tabparticipantor_row">
                <div class="tabparticipantor_lable">
                    <input type="radio" id="rblSpecialActivity" value="活动执行者" ng-click="chooseParticipantorType('rblSpecialActivity')"
                        name="ParticipantType" />活动执行者
                </div>
                <div class="tabparticipantor_input" style="width: 80%">
                    <input type="text" id="txtspecialActivity" style="width: 100%" ng-model="Participant().ParticipantValue" />
                </div>
            </div>
            <div class="tabparticipantor_row">
                <div class="tabparticipantor_lable">
                    <input type="radio" id="rblParticipantRule" ng-click="chooseParticipantorType('rblParticipantRule')"
                        value="参与者规则" name="ParticipantType" />参与者规则
                </div>
                <div class="tabparticipantor_input" style="width: 80%">
                    <input type="text" id="txtParticipantRule" style="width: 100%" ng-model="Participant().ParticipantValue" />
                </div>
            </div>
        </div>
        <div id="tabform">
            @* 表单*@
            <div class="div_row" style="width: 100%">
                <div class="div_row_lable" style="width: 69px">
                    业务表单名
                </div>
                <div class="div_row_input" style="width: 30%">
                    <input type="text" id="txtDataSource" ng-model="Form().DataSource" />
                </div>
                <div class="div_row_lable">
                    标题
                </div>
                <div class="div_row_input" style="width: 30%">
                    <input type="text" id="txtTitle" ng-model="Form().Title" />
                </div>
                <div class="div_row_lable">
                    <a id="formDesigner" ng-click="FormDesigner();">设计表单</a>
                </div>
            </div>
            <div class="div_row" style="width: 100%">
                <div class="div_row_lable">
                    参数配置
                </div>
                <div class="div_row_input" style="width: 80px; float: right; text-align: right">
                    <span ng-click="chooseParameter();" class='btn_choose_form' title='选择'></span><span
                        ng-click="addParameter();" class='btn_add' title='添加'></span><span class='btn_delete'
                            ng-click="delParameter()" title="删除"></span>
                </div>
            </div>
            <div id="div_specialcontrol" class="div_row" style="height: 400px; overflow: auto;
                width: 100%">
                <table style="width: 100%; text-align: center;" id="tblParameter">
                    <thead>
                        <tr>
                            <th>选择</th>
                            <th>显示名称</th>
                            <th>名称</th>
                            <th>类型</th>
                            <th>控件</th>
                            <th>必填</th>
                            <th>默认值</th>
                            <th>访问方式</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tr ng-repeat="Field in Form().Fields">
                        <td>
                            <input id='formId' type='radio' value='{{Field.Name}}' name='radioId' />
                        </td>
                        <td>
                            <input type="text" ng-model="Field.Text" /></td>
                        <td>
                            <input type="text" ng-model="Field.Name" /></td>
                        <td>
                            <select ng-model="Field.DataType">
                                <option value="Integer" selected="selected">整数</option>
                                <option value="Float">浮点数</option>
                                <option value="DateTime">日期</option>
                                <option value="String">字符串</option>
                                <option value="Boolean">布尔型</option>
                            </select></td>
                        <td>
                            <select ng-model="Field.ControlType">
                                <option value="Text">文本</option>
                                <option value="TextBox">单项输入框</option>
                                <option value="TextArea">多行输入框</option>
                                <option value="Radio">单选按钮</option>
                                <option value="CheckBox">复选框</option>
                                <option value="DropDown">下拉框</option>
                                <option value="Email">邮箱控件</option>
                                <option value="Button">按钮</option>
                                <option value="DatePicker">日期控件</option>
                                <option value="MonthPicker">月份控件</option>
                                <option value="YearPicker">年份控件</option>
                                <option value="SingleCombox">单选项列表</option>
                                <option value="MultiCombox">多选项列表</option>
                                <option value="ChooseBox">选择列表</option>
                                <option value="ChooseTree">选择树</option>
                                <option value="Combox">选择框</option>
                            </select></td>
                        <td>
                            <input type="checkbox" ng-model="Field.Required" /></td>
                        <td>
                            <input type="text" ng-model="Field.DefaultValue" /></td>
                        <td>
                            <select ng-model="Field.AccessPattern">
                                <option value="ReadOnly">只读</option>
                                <option value="Write" selected="selected">读写</option>
                            </select></td>
                        <td><span class="btn_up" title='上移' ng-click="executeOperate(Field.Name+'up$#')"></span>
                            <span style="float: left">｜</span><span class="btn_down" title='下移' ng-click="executeOperate(Field.Name+'down$#')">
                            </span><span style="float: left">｜</span><span class="btn_form_control_config" title='配置'
                                ng-click="configureField(Field)"></span></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="tablimit">
            @*  时间限制*@
            <div class="div_row_left">
                <input type="checkbox" id="chbIsTimeLimitSet" ng-click="SetLimit()" ng-model="TimeLimit().IsTimeLimitSet" />启用时间限制
            </div>
            <div id="limitConfigure">
                <div class="div_row_left">
                    日历设置
                </div>
                <div id="strategy">
                    <div class="limitConfigure_left">
                        选择日历：
                    </div>
                    <div class="div_row_input">
                        @* <agile:Combox runat="server" ID="cboCalendarType" IsSingle="true" />*@
                        <input type="text" id="cboCalendarType" disabled="disabled" value="默认日历" />
                    </div>
                </div>
                <div class="div_row_left">
                    时间限制策略
                </div>
                <div>
                    <div class="limitConfigure_left">
                        <input type="radio" id="rabTimeLimitStrategy" name="TimeLimit" value="时限" ng-click="chooseLimit('rabTimeLimitStrategy')" />时限
                    </div>
                    <div class="div_row_input">
                        <input type="text" id="txtLimitTimeHour" ng-model="TimeLimit().TimeLimitInfo.LimitTimeHour"
                            width="40px" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />小时
                        <input type="text" id="txtLimitTimeMinute" ng-model="TimeLimit().TimeLimitInfo.LimitTimeMinute"
                            width="40px" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />分钟
                    </div>
                </div>
                <div>
                    <div class="limitConfigure_left">
                        <input type="radio" id="rabRelevantLimitTime" name="TimeLimit" value="相关数据" ng-click="chooseLimit('rabRelevantLimitTime')" />相关数据
                    </div>
                    <div class="div_row_input" style="width: 80%">
                        <input type="text" id="txtRelevantData" width="100%" ng-model="TimeLimit().TimeLimitInfo.RelevantData" />
                    </div>
                </div>
                <div class="limitConfigure_left" style="width: 100%; text-align: left">
                    <input type="checkbox" id="chbIsSendMessageForOvertime" value="启用邮件通知" ng-model="TimeLimit().TimeLimitInfo.IsSendMessageForOvertime" />启用邮件通知
                </div>
                <div class="div_row_left">
                    超时预警策略
                </div>
                <div>
                    <div class="limitConfigure_left">
                        <input type="radio" id="rabRemindLimtTime" name="RemindLimtTime" value="提前" ng-click="chooseRemind('rabRemindLimtTime')" />提前
                    </div>
                    <div class="div_row_input">
                        <input type="text" id="txtRemindLimtTimeHour" ng-model="TimeLimit().RemindInfo.RemindLimtTimeHour"
                            width="40px" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                            cssclass="littletext textright" />
                        小时
                        <input type="text" id="txtRemindLimtTimeMinute" ng-model="TimeLimit().RemindInfo.RemindLimtTimeMinute"
                            width="40px" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                            cssclass="littletext textright" />
                        分钟
                    </div>
                </div>
                <div>
                    <div class="limitConfigure_left">
                        <input type="radio" id="rabRemindRelevantLimitTime" name="RemindLimtTime" value="相关数据"
                            ng-click="chooseRemind('rabRemindRelevantLimitTime')" />相关数据
                    </div>
                    <div class="div_row_input" style="width: 80%">
                        <input type="text" id="txtRemindRelevantData" style="width: 100%" ng-model="TimeLimit().RemindInfo.RemindRelevantData" />
                    </div>
                </div>
                <div class="limitConfigure_left">
                    <input type="checkbox" id="chbisSendMessageForRemind" ng-model="TimeLimit().RemindInfo.IsSendMessageForRemind" />启用邮件通知
                </div>
            </div>
        </div>
        <div id="tabtask">
            @* 多工作项*@
            <div class="div_row_left">
                <input type="checkbox" id="chbIsMulWIValid" value="启动多工作项设置" ng-click="enableMulwi()"
                    ng-model="MultiWorkItem().IsMulWIValid" />启动多工作项设置
            </div>
            <div class="MulWIValidConfigure">
                <div class="div_row_left">
                    多工作项分配策略
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblParticipantNumber" name="WorkitemNumStrategy" ng-click="WorkItemNum('rblParticipantNumber')">按参与者设置个数领取工作项
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblOperatorNumber" name="WorkitemNumStrategy" ng-click="WorkItemNum('rblOperatorNumber')" />按操作员个数领取工作项
                </div>
                <div class="div_row">
                    <div class="div_row_lable" style="width: 25%">
                        顺序执行工作项:
                    </div>
                    <div class="div_row_input" style="margin-left: 12px; width: 200px;">
                        <input type="radio" id="rabYIsSequentialExecute" name="SequentialExecute" ng-click="SequentialExecute('rabYIsSequentialExecute')" />是
                        <input type="radio" id="rabNIsSequentialExecute" name="SequentialExecute" ng-click="SequentialExecute('rabNIsSequentialExecute')" />否
                    </div>
                </div>
                <div class="div_row_left">
                    完成规则设定
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblFinishAll" name="FinishRule" ng-click="FinishRuleType('rblFinishAll')" />全部完成
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblSpecifyNum" name="FinishRule" ng-click="FinishRuleType('rblSpecifyNum')" />完成个数
                </div>
                <div class="div_row" style="width: 100%">
                    <div class="div_row_lable" style="width: 89px">
                        要求完成个数
                    </div>
                    <div class="div_row_input">
                        <input type="text" ng-model="MultiWorkItem().FinishRquiredNum" id="txtFinishRquiredNum"
                            onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                    </div>
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblSpecifyPercent" name="FinishRule" ng-click="FinishRuleType('rblSpecifyPercent')" />完成百分比
                </div>
                <div class="div_row" style="width: 100%">
                    <div class="div_row_lable" style="width: 89px">
                        要求完成百分比
                    </div>
                    <div class="div_row_input">
                        <input type="text" ng-model="MultiWorkItem().FinishRequiredPercent" id="txtFinishRequiredPercent"
                            onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                        %
                    </div>
                </div>
                <div class="div_row_left">
                    <div class="div_row_lable" style="width: 15%">
                        自动终止未完成工作项:
                    </div>
                    <div class="div_row_input">
                        <input type="radio" id="rabYIsAutoCancel" name="AutoCancel" ng-click="AutoCancel('rabYIsAutoCancel')" />是
                        <input type="radio" id="rabNIsAutoCancel" name="AutoCancel" ng-click="AutoCancel('rabNIsAutoCancel')" />否
                    </div>
                </div>
            </div>
        </div>
        <div id="tabevent">
            @*      <%--触发事件 --%>*@
            <div class="tabparticipantor_row">
                <div style="float: left">
                    事件配置
                </div>
                <div style="float: right">
                    <span ng-click="addTriggerEvent()" class='btn_add' title='添加'></span><span class='btn_delete'
                        ng-click="delTriggerEvent()" title="删除"></span>
                </div>
            </div>
            <div style="height: 400px; width: 100%; overflow: auto;">
                <table style="width: 100%; text-align: center;" id="tblTriggerEvent">
                    <thead>
                        <tr>
                            <th>选择</th>
                            <th>触发时机</th>
                            <th>事件动作</th>
                            <th>调用方式</th>
                        </tr>
                    </thead>
                    <tr ng-repeat="TriggerEvent in TriggerEvents()">
                        <td>
                            <input id='triggerEventId' type='radio' value='{{TriggerEvent.ID}}' name='radioId' />
                        </td>
                        <td>
                            <select ng-model="TriggerEvent.TriggerEventType">
                                <option value="ActivityBeforeCreate">活动创建前</option>
                                <option value="ActivityBeforeStart">活动启动前</option>
                                <option value="ActivityAfterStart">活动启动后</option>
                                <option value="ActivityAfterOverTime">活动超时后</option>
                                <option value="ActivityAfterTerminate">活动终止后</option>
                                <option value="ActivityCompleted">活动完成后</option>
                                <option value="ActivityBeforeRemind">活动提醒前</option>
                                <option value="WorkItemBeforeCreate">工作项创建前</option>
                                <option value="WorkItemAtferCreate">工作项创建后</option>
                                <option value="WorkItemExecuting">工作项执行时</option>
                                <option value="WorkItemCompleted">工作项完成后</option>
                                <option value="WorkItemError">工作项执行出错时</option>
                                <option value="WorkItemCanncel">工作项取消</option>
                                <option value="WorkItemOverTime">工作项超时</option>
                                <option value="WorkItemSuspended">工作项挂起</option>
                            </select></td>
                        <td>
                            <input type="text" ng-model="TriggerEvent.EventAction" /></td>
                        <td>
                            <select ng-model="TriggerEvent.InvokePattern">
                                <option value="Synchronous">同步</option>
                                <option value="Asynchronous">异步</option>
                            </select></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="tabrollback">
            @*  <%--回退 --%>*@
            <div class="div_row">
                <div class="div_row_lable">
                    类型
                </div>
                <div class="div_row_input">
                    <select id="cboRollbackType" ng-model="RollBack().ActionPattern">
                        <option value="Method">方法</option>
                        <option value="WebService">Web服务</option>
                        <option value="BusinessOperation">业务操作</option>
                    </select>
                </div>
            </div>
            <div class="div_row">
                <div class="div_row_lable">
                    动作
                </div>
                <div class="div_row_input" style="width: 80%">
                    <input type="text" id="txtRollbackAction" style="width: 100%" ng-model="RollBack().ApplicationUri" />
                </div>
            </div>
            <div class="div_row_left">
                参数配置表
            </div>
            <div style="height: 400px; width: 100%; overflow: auto;">
                <table style="width: 100%; text-align: center;" id="tblRollBack">
                    <thead>
                        <tr>
                            <th>选择</th>
                            <th>值</th>
                            <th>方向</th>
                        </tr>
                    </thead>
                    <tr ng-repeat="Parameter in RollBack().Parameters">
                        <td>
                            <input id='rollBackid' type='radio' value='{{Parameter.Name}}' name='radioId' />
                        </td>
                        <td>{{Parameter.Value}}</td>
                        <td>{{Parameter.Direction}}</td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="tabfreeActivity">
            @*  <%--自由流 --%>*@
            <div class="div_row_left">
                <input type="checkbox" id="chbIsFreeActivity" value="设置该活动为自由活动" ng-click="chooseFree()"
                    ng-model="FreeFlowRule().IsFreeActivity" />设置该活动为自由活动
            </div>
            <div class="FreeActivity">
                <div class="div_row_left">
                    自由范围设置策略
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblFreeWithinProcess" name="FreeRangeStrategy" ng-click="choosescopeFree('rblFreeWithinProcess')" />在该流程范围内任意自由
                </div>
                <div id="freeactivity" class="div_row" style="width: 100%">
                    <div class="div_row_lable" style="width: 180px; text-align: left">
                        <input type="radio" id="rblFreeWithinActivities" name="FreeRangeStrategy" ng-click="choosescopeFree('rblFreeWithinActivities')" />在指定活动列表范围内自由
                    </div>
                    <div class="div_row_input" style="width: 80px; text-align: right; float: right;">
                        <span ng-click="addFreeRange();" class='btn_add' title='添加'></span><span class='btn_delete'
                            ng-click="delFreeRange()" title="删除"></span>
                    </div>
                </div>
                <div id="freerangetable" class="div_row_left" style="height: 210px; overflow: auto;">
                    <table style="width: 100%; text-align: center;" id="tblFreeRange">
                        <thead>
                            <tr>
                                <th>选择</th>
                                <th>活动ID</th>
                                <th>活动名称</th>
                            </tr>
                        </thead>
                        <tr ng-repeat="FreeRangeActivity in FreeFlowRule().FreeRangeActivities">
                            <td>
                                <input id='FreeRangeActivityid' type='radio' value='{{FreeRangeActivity.ID}}' name='radioId' />
                            </td>
                            <td>
                                <input type="text" ng-model="FreeRangeActivity.ID" /></td>
                            <td>
                                <input type="text" ng-model="FreeRangeActivity.Name" /></td>
                        </tr>
                    </table>
                </div>
                <div class="div_row_left">
                    <input type="radio" id="rblFreeWithinNextActivites" name="FreeRangeStrategy" ng-click="choosescopeFree('rblFreeWithinNextActivites')" />在后继活动范围内自由
                </div>
                <div class="div_row_left">
                    自由流设置规则
                </div>
                <div class="div_row_left">
                    <input type="checkbox" id="chbIsOnlyLimitedManualActivity" ng-model="FreeFlowRule().IsOnlyLimitedManualActivity" />流向的目标活动仅限于人工活动
                </div>
            </div>
        </div>
        <div id="tabactivateRule">
            @* <%--启动策略 --%>*@
            <div class="div_row_left">
                可选规则
            </div>
            <div class="div_row_left">
                <input type="radio" id="rblDirectRunning" name="ActivateRule" ng-click="ActivateRuleType('rblDirectRunning')" />直接运行
            </div>
            <div class="div_row_left">
                <input type="radio" id="rblDisenabled" name="ActivateRule" ng-click="ActivateRuleType('rblDisenabled')" />待激活
            </div>
            <div class="div_row_left">
                <input type="radio" id="rblAutoAfter" name="ActivateRule" ng-click="ActivateRuleType('rblAutoAfter')" />由规则逻辑值返回确定
            </div>
            <div class="div_row">
                <div class="div_row_lable">
                    规则逻辑
                </div>
                <div class="div_row_input" style="width: 80%">
                    <input type="text" id="txtActivateRuleApp" style="width: 600px" ng-model="ActivateRule().ActivateRuleApp" />
                </div>
            </div>
            <div class="div_row_left" style="height: 30px; border-bottom: 1px solid #CECECE;">
                (注：激活规则确定该活动在流程流转至此时将以何种方式激活，激活规则返回值为1或True时均可直接激活，否则为待激活)
            </div>
            <div class="div_row_left">
                重新启动规则
            </div>
            <div class="div_row_left" style="margin-left: 20px">
                <input type="radio" id="rbFirstParticipantor" name="resetActivateRule" value="最初参与者"
                    ng-click="ResetParticipant('rbFirstParticipantor')" />最初参与者
                <input type="radio" id="rbLastParticipantor" name="resetActivateRule" value="最终参与者"
                    ng-click="ResetParticipant('rbLastParticipantor')" />最终参与者
            </div>
            <div class="div_row_left">
                <input type="checkbox" id="chbIsSpecifyURL" ng-model="ResetURL().IsSpecifyURL" />
                重新设置URL
            </div>
            <div class="div_row">
                <div class="div_row_lable">
                    URL类型
                </div>
                <div class="div_row_input">
                    @*<agile:combox runat="server" id="cboURLType" issingle="true" />*@
                    <select id="cboURLType" ng-model="ResetURL().URLType">
                        <option value="DefaultURL">默认URL</option>
                        <option value="ManualProcess">人工处理</option>
                        <option value="CustomURL">Web页面</option>
                    </select>
                </div>
            </div>
            <div class="div_row" style="clear: both;">
                <div class="div_row_lable">
                    调用URL
                </div>
                <div class="div_row_input">
                    <input type="text" id="txt2SpecifyURL" style="width: 600px" ng-model="ResetURL().SpecifyURL" />
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="hdnActionState" />
<input type="hidden" id="hdnParticipantors" />
<input type="hidden" id="hdnFormControlSettings" />
<input type="hidden" id="hdnActivities" />
<!--These need to be at the end of the page to ensure that all the controls requiring
scripts have been rendered-->
</body>
</html>
