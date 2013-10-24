<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>活动实例</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/activityinst/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${activityInst.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="name" class="control-label">名称:</label>
        		<div class="controls">
        		    <input type="text" id="name" name="name"  value="${activityInst.name}" placeholder="请输入名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="type" class="control-label">活动类型:</label>
        		<div class="controls">
                    <input type="text" id="type" name="type"  value="${activityInst.type}" placeholder="请输入活动类型" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="currentState" class="control-label">当前状态:</label>
        		<div class="controls">
                    <input type="text" id="currentState" name="currentState"  value="${activityInst.currentState}" placeholder="请输入当前状态" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="startTime" class="control-label">启动时间:</label>
        		<div class="controls">
                    <input type="text" id="startTime" name="startTime" onClick="WdatePicker()" value="${activityInst.startTime}" placeholder="请输入启动时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="endTime" class="control-label">结束时间:</label>
        		<div class="controls">
                    <input type="text" id="endTime" name="endTime" onClick="WdatePicker()" value="${activityInst.endTime}" placeholder="请输入结束时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="subProcessInstID" class="control-label">子流程实例ID:</label>
        		<div class="controls">
        		    <input type="text" id="subProcessInstID" name="subProcessInstID"  value="${activityInst.subProcessInstID}" placeholder="请输入子流程实例ID" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="activityDefID" class="control-label">活动定义ID:</label>
        		<div class="controls">
        		    <input type="text" id="activityDefID" name="activityDefID"  value="${activityInst.activityDefID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processInstID" class="control-label">所属流程实例:</label>
        		<div class="controls">
        		    <input type="text" id="processInstID" name="processInstID"  value="${activityInst.processInstID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="rollbackFlag" class="control-label">回退标志:</label>
        		<div class="controls">
                    <input type="text" id="rollbackFlag" name="rollbackFlag"  value="${activityInst.rollbackFlag}" placeholder="请输入回退标志" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="description" class="control-label">描述:</label>
        		<div class="controls">
                    <textarea type="text" id="description" name="description" placeholder="请输入描述" class="required" >${activityInst.description}</textarea>
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${activityInst.createTime}' class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
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
        				activityDefID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				processInstID : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				activityDefID : {
                    required: "<font color='red' size='2' >活动定义ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				processInstID : {
                    required: "<font color='red' size='2' >所属流程实例不能为空！</font>",
        				
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