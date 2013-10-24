<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>代理项</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/agentitem/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${agentItem.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="type" class="control-label">代理项类型:</label>
        		<div class="controls">
                    <input type="text" id="type" name="type"  value="${agentItem.type}" placeholder="请输入代理项类型" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="relatedBizID" class="control-label">代理业务ID:</label>
        		<div class="controls">
        		    <input type="text" id="relatedBizID" name="relatedBizID"  value="${agentItem.relatedBizID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="isValid" class="control-label">是否生效:</label>
        		<div class="controls">
                    <input type="text" id="isValid" name="isValid"  value="${agentItem.isValid}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="agentPrivilege" class="control-label">代理权限:</label>
        		<div class="controls">
                    <input type="text" id="agentPrivilege" name="agentPrivilege"  value="${agentItem.agentPrivilege}" placeholder="请输入代理权限" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="agentID" class="control-label">所属代理:</label>
        		<div class="controls">
        		    <input type="text" id="agentID" name="agentID"  value="${agentItem.agentID}" />
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
        				relatedBizID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				agentID : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				relatedBizID : {
                    required: "<font color='red' size='2' >代理业务ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				agentID : {
                    required: "<font color='red' size='2' >所属代理不能为空！</font>",
        				
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