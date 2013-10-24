<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>流程实例</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/processinst/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${processInst.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="name" class="control-label">名称:</label>
        		<div class="controls">
        		    <input type="text" id="name" name="name"  value="${processInst.name}" placeholder="请输入名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processDefID" class="control-label">流程定义ID:</label>
        		<div class="controls">
        		    <input type="text" id="processDefID" name="processDefID"  value="${processInst.processDefID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="processDefName" class="control-label">流程名称:</label>
        		<div class="controls">
        		    <input type="text" id="processDefName" name="processDefName"  value="${processInst.processDefName}" placeholder="请输入流程名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="parentProcessID" class="control-label">父流程:</label>
        		<div class="controls">
        		    <input type="text" id="parentProcessID" name="parentProcessID"  value="${processInst.parentProcessID}" placeholder="请输入父流程" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="parentActivityID" class="control-label">父活动:</label>
        		<div class="controls">
        		    <input type="text" id="parentActivityID" name="parentActivityID"  value="${processInst.parentActivityID}" placeholder="请输入父活动" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="currentState" class="control-label">当前状态:</label>
        		<div class="controls">
                    <input type="text" id="currentState" name="currentState"  value="${processInst.currentState}" placeholder="请输入当前状态" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="limitTime" class="control-label">限期时间:</label>
        		<div class="controls">
                    <input type="text" id="limitTime" name="limitTime" onClick="WdatePicker()" value="${processInst.limitTime}" placeholder="请输入限期时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="startTime" class="control-label">启动时间:</label>
        		<div class="controls">
                    <input type="text" id="startTime" name="startTime" onClick="WdatePicker()" value="${processInst.startTime}" placeholder="请输入启动时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="endTime" class="control-label">结束时间:</label>
        		<div class="controls">
                    <input type="text" id="endTime" name="endTime" onClick="WdatePicker()" value="${processInst.endTime}" placeholder="请输入结束时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="finalTime" class="control-label">终止时间:</label>
        		<div class="controls">
                    <input type="text" id="finalTime" name="finalTime" onClick="WdatePicker()" value="${processInst.finalTime}" placeholder="请输入终止时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="remindTime" class="control-label">提醒时间:</label>
        		<div class="controls">
                    <input type="text" id="remindTime" name="remindTime" onClick="WdatePicker()" value="${processInst.remindTime}" placeholder="请输入提醒时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="isTimeOut" class="control-label">是否超时:</label>
        		<div class="controls">
                    <input type="text" id="isTimeOut" name="isTimeOut"  value="${processInst.isTimeOut}" placeholder="请输入是否超时" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="timeOutTime" class="control-label">超时时间:</label>
        		<div class="controls">
                    <input type="text" id="timeOutTime" name="timeOutTime" onClick="WdatePicker()" value="${processInst.timeOutTime}" placeholder="请输入超时时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="processVersion" class="control-label">所属流程版本:</label>
        		<div class="controls">
        		    <input type="text" id="processVersion" name="processVersion"  value="${processInst.processVersion}" placeholder="请输入所属流程版本" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="description" class="control-label">描述:</label>
        		<div class="controls">
                    <textarea type="text" id="description" name="description" placeholder="请输入描述" class="required" >${processInst.description}</textarea>
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="creator" class="control-label">创建者:</label>
        		<div class="controls">
        			<input type="text" id="creator" name="creator"  value="${processInst.creator}" class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${processInst.createTime}' class="readonly" readonly="readonly"/>
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
        				processDefID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				creator : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				processDefID : {
                    required: "<font color='red' size='2' >流程定义ID不能为空！</font>",
        				
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