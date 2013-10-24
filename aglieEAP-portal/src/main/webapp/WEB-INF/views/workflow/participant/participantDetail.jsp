<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>流程参与者</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/participant/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${participant.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="name" class="control-label">名称:</label>
        		<div class="controls">
        		    <input type="text" id="name" name="name"  value="${participant.name}" placeholder="请输入名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="participantType" class="control-label">参与者类型:</label>
        		<div class="controls">
                    <input type="text" id="participantType" name="participantType"  value="${participant.participantType}" placeholder="请输入参与者类型" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="participantID" class="control-label">参与者值ID:</label>
        		<div class="controls">
        		    <input type="text" id="participantID" name="participantID"  value="${participant.participantID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="workItemID" class="control-label">工作项ID:</label>
        		<div class="controls">
        		    <input type="text" id="workItemID" name="workItemID"  value="${participant.workItemID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="workItemState" class="control-label">工作项状态:</label>
        		<div class="controls">
                    <input type="text" id="workItemState" name="workItemState"  value="${participant.workItemState}" placeholder="请输入工作项状态" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="partiInType" class="control-label">参与类型:</label>
        		<div class="controls">
                    <input type="text" id="partiInType" name="partiInType"  value="${participant.partiInType}" placeholder="请输入参与类型" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="delegateType" class="control-label">代办类型:</label>
        		<div class="controls">
                    <input type="text" id="delegateType" name="delegateType"  value="${participant.delegateType}" placeholder="请输入代办类型" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="participantIndex" class="control-label">参与顺序:</label>
        		<div class="controls">
                    <input type="text" id="participantIndex" name="participantIndex"  value="${participant.participantIndex}" placeholder="请输入参与顺序" class="required"/>
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${participant.createTime}' class="readonly" readonly="readonly"/>
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
        				participantID : {
        					required: true,
        					
        					maxlength: 0    
        				},
        				workItemID : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				participantID : {
                    required: "<font color='red' size='2' >参与者值ID不能为空！</font>",
        				
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