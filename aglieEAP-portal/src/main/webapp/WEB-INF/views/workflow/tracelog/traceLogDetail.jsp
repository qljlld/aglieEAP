<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>流程跟踪日志</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/tracelog/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${traceLog.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="actionType" class="control-label">操作:</label>
        		<div class="controls">
                    <input type="text" id="actionType" name="actionType"  value="${traceLog.actionType}" placeholder="请输入操作" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="operator" class="control-label">操作人:</label>
        		<div class="controls">
        		    <input type="text" id="operator" name="operator"  value="${traceLog.operator}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="clientIP" class="control-label">IP地址:</label>
        		<div class="controls">
        		    <input type="text" id="clientIP" name="clientIP"  value="${traceLog.clientIP}" placeholder="请输入IP地址" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processID" class="control-label">流程ID:</label>
        		<div class="controls">
        		    <input type="text" id="processID" name="processID"  value="${traceLog.processID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processInstID" class="control-label">流程实例ID:</label>
        		<div class="controls">
        		    <input type="text" id="processInstID" name="processInstID"  value="${traceLog.processInstID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="activityID" class="control-label">活动ID:</label>
        		<div class="controls">
        		    <input type="text" id="activityID" name="activityID"  value="${traceLog.activityID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="activityInstID" class="control-label">活动实例ID:</label>
        		<div class="controls">
        		    <input type="text" id="activityInstID" name="activityInstID"  value="${traceLog.activityInstID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="workItemID" class="control-label">工作项ID:</label>
        		<div class="controls">
        		    <input type="text" id="workItemID" name="workItemID"  value="${traceLog.workItemID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="message" class="control-label">消息:</label>
        		<div class="controls">
        		    <input type="text" id="message" name="message"  value="${traceLog.message}" placeholder="请输入消息" class="required" />
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
        				operator : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				processID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				processInstID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				activityID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				activityInstID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				workItemID : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				operator : {
                    required: "<font color='red' size='2' >操作人不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				processID : {
                    required: "<font color='red' size='2' >流程ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				processInstID : {
                    required: "<font color='red' size='2' >流程实例ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				activityID : {
                    required: "<font color='red' size='2' >活动ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				activityInstID : {
                    required: "<font color='red' size='2' >活动实例ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				workItemID : {
                    required: "<font color='red' size='2' >工作项ID不能为空！</font>",
        				
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