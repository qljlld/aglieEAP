<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>工作项</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/workitem/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${workItem.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="name" class="control-label">名称:</label>
        		<div class="controls">
        		    <input type="text" id="name" name="name"  value="${workItem.name}" placeholder="请输入名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="type" class="control-label">工作项类型:</label>
        		<div class="controls">
                    <input type="text" id="type" name="type"  value="${workItem.type}" placeholder="请输入工作项类型" class="required"/>
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${workItem.createTime}' class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="creator" class="control-label">创建者:</label>
        		<div class="controls">
        			<input type="text" id="creator" name="creator"  value="${workItem.creator}" class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <div class="control-group">
        		<label for="startTime" class="control-label">启动时间:</label>
        		<div class="controls">
                    <input type="text" id="startTime" name="startTime" onClick="WdatePicker()" value="${workItem.startTime}" placeholder="请输入启动时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="endTime" class="control-label">结束时间:</label>
        		<div class="controls">
                    <input type="text" id="endTime" name="endTime" onClick="WdatePicker()" value="${workItem.endTime}" placeholder="请输入结束时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="description" class="control-label">描述:</label>
        		<div class="controls">
                    <textarea type="text" id="description" name="description" placeholder="请输入描述" class="required" >${workItem.description}</textarea>
                </div>
        	</div>
            <div class="control-group">
        		<label for="currentState" class="control-label">当前状态:</label>
        		<div class="controls">
                    <input type="text" id="currentState" name="currentState"  value="${workItem.currentState}" placeholder="请输入当前状态" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="participant" class="control-label">参与者:</label>
        		<div class="controls">
        		    <input type="text" id="participant" name="participant"  value="${workItem.participant}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="isTimeOut" class="control-label">是否超时:</label>
        		<div class="controls">
                    <input type="text" id="isTimeOut" name="isTimeOut"  value="${workItem.isTimeOut}" placeholder="请输入是否超时" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="timeOutTime" class="control-label">超时时间:</label>
        		<div class="controls">
                    <input type="text" id="timeOutTime" name="timeOutTime" onClick="WdatePicker()" value="${workItem.timeOutTime}" placeholder="请输入超时时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="remindTime" class="control-label">提醒时间:</label>
        		<div class="controls">
                    <input type="text" id="remindTime" name="remindTime" onClick="WdatePicker()" value="${workItem.remindTime}" placeholder="请输入提醒时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="actionURL" class="control-label">响应URL:</label>
        		<div class="controls">
        		    <input type="text" id="actionURL" name="actionURL"  value="${workItem.actionURL}" placeholder="请输入响应URL" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="actionMask" class="control-label">操作码:</label>
        		<div class="controls">
        		    <input type="text" id="actionMask" name="actionMask"  value="${workItem.actionMask}" placeholder="请输入操作码" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processInstID" class="control-label">所属流程实例:</label>
        		<div class="controls">
        		    <input type="text" id="processInstID" name="processInstID"  value="${workItem.processInstID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processInstName" class="control-label">所属流程实例名:</label>
        		<div class="controls">
        		    <input type="text" id="processInstName" name="processInstName"  value="${workItem.processInstName}" placeholder="请输入所属流程实例名" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="activityInstID" class="control-label">所属活动实例:</label>
        		<div class="controls">
        		    <input type="text" id="activityInstID" name="activityInstID"  value="${workItem.activityInstID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="activityInstName" class="control-label">所属活动实像名:</label>
        		<div class="controls">
        		    <input type="text" id="activityInstName" name="activityInstName"  value="${workItem.activityInstName}" placeholder="请输入所属活动实像名" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processID" class="control-label">所属流程:</label>
        		<div class="controls">
        		    <input type="text" id="processID" name="processID"  value="${workItem.processID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processName" class="control-label">所属流程显示名:</label>
        		<div class="controls">
        		    <input type="text" id="processName" name="processName"  value="${workItem.processName}" placeholder="请输入所属流程显示名" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="allowAgent" class="control-label">是否允许代理:</label>
        		<div class="controls">
                    <input type="text" id="allowAgent" name="allowAgent"  value="${workItem.allowAgent}" placeholder="请输入是否允许代理" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="bizState" class="control-label">业务状态:</label>
        		<div class="controls">
                    <input type="text" id="bizState" name="bizState"  value="${workItem.bizState}" placeholder="请输入业务状态" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="executor" class="control-label">执行者:</label>
        		<div class="controls">
        		    <input type="text" id="executor" name="executor"  value="${workItem.executor}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="executorName" class="control-label">执行者姓名:</label>
        		<div class="controls">
        		    <input type="text" id="executorName" name="executorName"  value="${workItem.executorName}" placeholder="请输入执行者姓名" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="executeTime" class="control-label">执行时间:</label>
        		<div class="controls">
                    <input type="text" id="executeTime" name="executeTime" onClick="WdatePicker()" value="${workItem.executeTime}" placeholder="请输入执行时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="rootProcessInstID" class="control-label">所属根流程实例:</label>
        		<div class="controls">
        		    <input type="text" id="rootProcessInstID" name="rootProcessInstID"  value="${workItem.rootProcessInstID}" placeholder="请输入所属根流程实例" class="required" />
                </div>
        	</div>
    	<c:if test="${action!='view'}">
    	<div class="form-actions">
    		<input id="btnSubimt" class="btn btn-primary" type="button" value="提交"/>&nbsp;	
    		<input id="btnCancel" class="btn" type="button" value="取消"/>
    	</div>
    	</c:if>
 </fieldset>
</form>
<script type="text/javascript">
$(document).ready(function() {
    	//聚焦第一个输入框
    	$("#name").focus();
    	//为inputForm注册validate函数
    	var inputForm=$("#inputForm");
    	inputForm.validate({
    		rules : {
        				creator : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				participant : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				processInstID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				activityInstID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				processID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				executor : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				creator : {
                    required: "<font color='red' size='2' >创建者不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				participant : {
                    required: "<font color='red' size='2' >参与者不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				processInstID : {
                    required: "<font color='red' size='2' >所属流程实例不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				activityInstID : {
                    required: "<font color='red' size='2' >所属活动实例不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				processID : {
                    required: "<font color='red' size='2' >所属流程不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				executor : {
                    required: "<font color='red' size='2' >执行者不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    		},
    		errorPlacement: function (error, element) {  
                error.appendTo(element.parent());  
            },  
            submitHandler: function (form) {  
                form.submit();  
            },  
            errorClass: "error",  
            focusCleanup: true, //被验证的元素获得焦点时移除错误信息  
            success: function (label) {  
                label.html("<span style=\"color:green\"><img alt='合法' src=${ctx}/images/correct.png></img></span>").addClass("success");  
            }  
    	});
    	
    	$("#btnSubimt").click(function(){
        	if(!inputForm.valid()) return false;
            
            var processbar = $("#processbar");
            processbar.processbar({ message: '正在提交...' });
            $.post(inputForm.attr("action"), inputForm.serialize(), function (result) {
                processbar.complete();
                alertMessage(result);
    			if (window.parent&&result.indexOf("成功")>0) {
    				window.parent.$("#actionDialog").data("kendoWindow").close();
    				window.parent.frames["ifrContent"].$("#btnSearch").click();                    
    			}
            });
    	});
    	
    	$("#btnCancel").click(function(){
    		if (window.parent) {
    			window.parent.$("#actionDialog").data("kendoWindow").close();
    		}
    	});
    });
</script>
</body>
</html>