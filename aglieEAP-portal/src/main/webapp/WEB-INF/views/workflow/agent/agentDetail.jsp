<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>工作代理</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/agent/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${agent.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="agentFrom" class="control-label">委托人:</label>
        		<div class="controls">
        		    <input type="text" id="agentFrom" name="agentFrom"  value="${agent.agentFrom}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="agentTo" class="control-label">代理人:</label>
        		<div class="controls">
        		    <input type="text" id="agentTo" name="agentTo"  value="${agent.agentTo}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="agentToType" class="control-label">代理人类型:</label>
        		<div class="controls">
                    <input type="text" id="agentToType" name="agentToType"  value="${agent.agentToType}" placeholder="请输入代理人类型" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="agentType" class="control-label">代理方式:</label>
        		<div class="controls">
                    <input type="text" id="agentType" name="agentType"  value="${agent.agentType}" placeholder="请输入代理方式" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="startTime" class="control-label">生效时间:</label>
        		<div class="controls">
                    <input type="text" id="startTime" name="startTime" onClick="WdatePicker()" value="${agent.startTime}" placeholder="请输入生效时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="endTime" class="control-label">结束时间:</label>
        		<div class="controls">
                    <input type="text" id="endTime" name="endTime" onClick="WdatePicker()" value="${agent.endTime}" placeholder="请输入结束时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="agentReason" class="control-label">代理原因:</label>
        		<div class="controls">
        		    <input type="text" id="agentReason" name="agentReason"  value="${agent.agentReason}" placeholder="请输入代理原因" class="required" />
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="creator" class="control-label">创建者:</label>
        		<div class="controls">
        			<input type="text" id="creator" name="creator"  value="${agent.creator}" class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${agent.createTime}' class="readonly" readonly="readonly"/>
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
        				agentFrom : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				agentTo : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				creator : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				agentFrom : {
                    required: "<font color='red' size='2' >委托人不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				agentTo : {
                    required: "<font color='red' size='2' >代理人不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				creator : {
                    required: "<font color='red' size='2' >创建者不能为空！</font>",
        				
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