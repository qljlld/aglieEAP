<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>流程迁移控制</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/transcontrol/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${transControl.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="srcActID" class="control-label">源活动定义ID:</label>
        		<div class="controls">
        		    <input type="text" id="srcActID" name="srcActID"  value="${transControl.srcActID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="srcActName" class="control-label">源活动定义名称:</label>
        		<div class="controls">
        		    <input type="text" id="srcActName" name="srcActName"  value="${transControl.srcActName}" placeholder="请输入源活动定义名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="destActID" class="control-label">目标活动定义ID:</label>
        		<div class="controls">
        		    <input type="text" id="destActID" name="destActID"  value="${transControl.destActID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="destActName" class="control-label">目标活动定义名称:</label>
        		<div class="controls">
        		    <input type="text" id="destActName" name="destActName"  value="${transControl.destActName}" placeholder="请输入目标活动定义名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processInstID" class="control-label">流程实例ID:</label>
        		<div class="controls">
        		    <input type="text" id="processInstID" name="processInstID"  value="${transControl.processInstID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="transTime" class="control-label">迁移时间:</label>
        		<div class="controls">
                    <input type="text" id="transTime" name="transTime" onClick="WdatePicker()" value="${transControl.transTime}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="transWeight" class="control-label">迁移权重:</label>
        		<div class="controls">
                    <input type="text" id="transWeight" name="transWeight"  value="${transControl.transWeight}" placeholder="请输入迁移权重" class="required"/>
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
        				srcActID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				destActID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				processInstID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				transTime : {
                            required: true 
        				},
    		},
    		messages : {
    				srcActID : {
                    required: "<font color='red' size='2' >源活动定义ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				destActID : {
                    required: "<font color='red' size='2' >目标活动定义ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				processInstID : {
                    required: "<font color='red' size='2' >流程实例ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				transTime : {
                    required: "<font color='red' size='2' >迁移时间不能为空！</font>"
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