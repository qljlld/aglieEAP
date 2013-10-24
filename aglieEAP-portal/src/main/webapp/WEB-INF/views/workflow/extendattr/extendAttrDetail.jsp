<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>扩展属性</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/extendattr/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${extendAttr.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="entity" class="control-label">扩展实体:</label>
        		<div class="controls">
        		    <input type="text" id="entity" name="entity"  value="${extendAttr.entity}" placeholder="请输入扩展实体" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="entityID" class="control-label">实例ID:</label>
        		<div class="controls">
        		    <input type="text" id="entityID" name="entityID"  value="${extendAttr.entityID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="name" class="control-label">属性名:</label>
        		<div class="controls">
        		    <input type="text" id="name" name="name"  value="${extendAttr.name}" placeholder="请输入属性名" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="value" class="control-label">属性值:</label>
        		<div class="controls">
        		    <input type="text" id="value" name="value"  value="${extendAttr.value}" placeholder="请输入属性值" class="required" />
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
        				entityID : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				entityID : {
                    required: "<font color='red' size='2' >实例ID不能为空！</font>",
        				
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