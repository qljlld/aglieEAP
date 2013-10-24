<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>工作流表单</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/processform/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${processForm.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="workItemID" class="control-label">工作项ID:</label>
        		<div class="controls">
        		    <input type="text" id="workItemID" name="workItemID"  value="${processForm.workItemID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="bizTable" class="control-label">业务表:</label>
        		<div class="controls">
        		    <input type="text" id="bizTable" name="bizTable"  value="${processForm.bizTable}" placeholder="请输入业务表" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="bizID" class="control-label">业务ID:</label>
        		<div class="controls">
        		    <input type="text" id="bizID" name="bizID"  value="${processForm.bizID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="keyWord" class="control-label">查询关键字:</label>
        		<div class="controls">
                    <textarea type="text" id="keyWord" name="keyWord" placeholder="请输入查询关键字" class="required" >${processForm.keyWord}</textarea>
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${processForm.createTime}' class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="creator" class="control-label">创建者:</label>
        		<div class="controls">
        			<input type="text" id="creator" name="creator"  value="${processForm.creator}" class="readonly" readonly="readonly"/>
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
        				workItemID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				bizID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				creator : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				workItemID : {
                    required: "<font color='red' size='2' >工作项ID不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				bizID : {
                    required: "<font color='red' size='2' >业务ID不能为空！</font>",
        				
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