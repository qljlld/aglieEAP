<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>流程定义</title>
</head>
<body>
<form id="inputForm" action="${ctx}/workflow/processdef/${action}" method="post" class="form-horizontal">
    <input type="hidden" id='id' name="id" value="${processDef.id}"/>
        <fieldset>
            <div class="control-group">
        		<label for="name" class="control-label">名称:</label>
        		<div class="controls">
        		    <input type="text" id="name" name="name"  value="${processDef.name}" placeholder="请输入名称" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="text" class="control-label">显示名:</label>
        		<div class="controls">
        		    <input type="text" id="text" name="text"  value="${processDef.text}" placeholder="请输入显示名" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="content" class="control-label">流程内容:</label>
        		<div class="controls">
        		    <input type="text" id="content" name="content"  value="${processDef.content}" placeholder="请输入流程内容" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="categoryID" class="control-label">所属分类:</label>
        		<div class="controls">
        		    <input type="text" id="categoryID" name="categoryID"  value="${processDef.categoryID}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="currentState" class="control-label">当前状态:</label>
        		<div class="controls">
                    <input type="text" id="currentState" name="currentState"  value="${processDef.currentState}" placeholder="请输入当前状态" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="currentFlag" class="control-label">是否当前版本:</label>
        		<div class="controls">
                    <input type="text" id="currentFlag" name="currentFlag"  value="${processDef.currentFlag}" placeholder="请输入是否当前版本" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="startor" class="control-label">流程启动者:</label>
        		<div class="controls">
        		    <input type="text" id="startor" name="startor"  value="${processDef.startor}" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="isActive" class="control-label">是否有活动实例:</label>
        		<div class="controls">
                    <input type="text" id="isActive" name="isActive"  value="${processDef.isActive}" placeholder="请输入是否有活动实例" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="version" class="control-label">版本:</label>
        		<div class="controls">
        		    <input type="text" id="version" name="version"  value="${processDef.version}" placeholder="请输入版本" class="required" />
                </div>
        	</div>
            <div class="control-group">
        		<label for="description" class="control-label">描述:</label>
        		<div class="controls">
                    <textarea type="text" id="description" name="description" placeholder="请输入描述" class="required" >${processDef.description}</textarea>
                </div>
        	</div>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="createTime" class="control-label">创建时间:</label>
        		<div class="controls">
                    <input type="text" id="createTime" name="createTime" value='${processDef.createTime}' class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <c:if test="${action=='view'}">
        	<div class="control-group">
        		<label for="creator" class="control-label">创建者:</label>
        		<div class="controls">
        			<input type="text" id="creator" name="creator"  value="${processDef.creator}" class="readonly" readonly="readonly"/>
                </div>
        	</div>
            </c:if>
            <div class="control-group">
        		<label for="modifyTime" class="control-label">修改时间:</label>
        		<div class="controls">
                    <input type="text" id="modifyTime" name="modifyTime" onClick="WdatePicker()" value="${processDef.modifyTime}" placeholder="请输入修改时间" class="required"/>
                </div>
        	</div>
            <div class="control-group">
        		<label for="modifier" class="control-label">修改人:</label>
        		<div class="controls">
        		    <input type="text" id="modifier" name="modifier"  value="${processDef.modifier}" placeholder="请输入修改人" class="required" />
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
        				categoryID : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				startor : {
        					required: true,
        					
        					maxlength: 18    
        				},
        				creator : {
        					required: true,
        					
        					maxlength: 18    
        				},
    		},
    		messages : {
    				categoryID : {
                    required: "<font color='red' size='2' >所属分类不能为空！</font>",
        				
    					maxlength:jQuery.validator.format("<font color='red' size='2' >请输入一个 长度最多是 {0} 的字符串</font>")   
    				}, 
    				startor : {
                    required: "<font color='red' size='2' >流程启动者不能为空！</font>",
        				
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