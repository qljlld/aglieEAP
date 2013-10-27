<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>工作项管理</title>
</head>
<body>
    <jsp:include page="../../share/command.jsp"></jsp:include>
    <div id="workItemGrid"></div>    
    <div id="filterDialog" >
        <form id="frmSearch" class="form-horizontal">
            <input id="searchFlags" type="hidden" />
            <fieldset>
            	<div class="control-group">
            		<label for="name" class="control-label">名称:</label>
            		<div class="controls">
            			<input type="text" id="name" name="name" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="creator" class="control-label">创建者:</label>
            		<div class="controls">
            			<input type="text" id="creator" name="creator" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="creatorName" class="control-label">创建者姓名:</label>
            		<div class="controls">
            			<input type="text" id="creatorName" name="creatorName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="participant" class="control-label">参与者:</label>
            		<div class="controls">
            			<input type="text" id="participant" name="participant" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="actionURL" class="control-label">响应URL:</label>
            		<div class="controls">
            			<input type="text" id="actionURL" name="actionURL" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="actionMask" class="control-label">操作码:</label>
            		<div class="controls">
            			<input type="text" id="actionMask" name="actionMask" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="processInstID" class="control-label">所属流程实例:</label>
            		<div class="controls">
            			<input type="text" id="processInstID" name="processInstID" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="processInstName" class="control-label">所属流程实例名:</label>
            		<div class="controls">
            			<input type="text" id="processInstName" name="processInstName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="activityInstID" class="control-label">所属活动实例:</label>
            		<div class="controls">
            			<input type="text" id="activityInstID" name="activityInstID" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="activityInstName" class="control-label">所属活动实像名:</label>
            		<div class="controls">
            			<input type="text" id="activityInstName" name="activityInstName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="processID" class="control-label">所属流程:</label>
            		<div class="controls">
            			<input type="text" id="processID" name="processID" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="processName" class="control-label">所属流程显示名:</label>
            		<div class="controls">
            			<input type="text" id="processName" name="processName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="executor" class="control-label">执行者:</label>
            		<div class="controls">
            			<input type="text" id="executor" name="executor" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="executorName" class="control-label">执行者姓名:</label>
            		<div class="controls">
            			<input type="text" id="executorName" name="executorName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="rootProcessInstID" class="control-label">所属根流程实例:</label>
            		<div class="controls">
            			<input type="text" id="rootProcessInstID" name="rootProcessInstID" value=""/>
                    </div>
            	</div>
            	<div class="form-actions">
            		<input id="btnSearch" class="btn btn-primary" type="button" value="查询"/>&nbsp;	
            		<input id="btnCancel" class="btn" type="button" value="清除" onclick="clearFilterValues()"/>
            	</div>
            </fieldset>
        </form>
    </div>
    <script type="text/javascript">
    $(document).ready(function () {
        var dataSource = new kendo.data.DataSource({
            transport : {
                read : {
                    type : "post",
                    url : "${ctx}/workflow/workitem/ajaxList",
                    dataType : "json",
                    contentType : "application/json"
                },
                parameterMap : function(options, operation) {
                    if (operation == "read") {               
                        var $form = $("#frmSearch");
                        var formData = $form.serialize().split('&');
                        
                        if($("#searchFlags").val()=="1")options.page=1;
                        
                        var requestPageData = {
                                page : options.page,    //当前页
                                pageSize : options.pageSize,//每页显示个数,
                                data:{}
                            };
                        $(formData).each(function () {
                            var nvp = this.split('=');
                            var nvpvalue=$form.find('*[name=' + nvp[0] + ']').first().val();
                            if(nvpvalue!="")
                            {
                            	requestPageData.data[nvp[0]] =nvpvalue; 
                            }
                        });	                
                        
                        return kendo.stringify(requestPageData);
                    }
                }
            },
            batch : true,
            pageSize : 10, //每页显示个数
            schema : {
                data : function(d) {
                    return d.data;  //响应到页面的数据
                },
                total : function(d) {
                    return d.total;   //总条数
                }
            },
            serverPaging : true,
            serverFiltering : true,
            serverSorting : true

        });
        var workItemGrid=$("#workItemGrid");
        var kGrid=workItemGrid.kendoGrid({
            dataSource : dataSource,
            selectable: "multiple",
            height : $(document).height()-55,
            pageable : {
                messages : {
                    display : "{0} - {1} 共 {2} 条数据",
                    empty : "没有要显示的数据",
                    page : "Page",
                    of : "of {0}", // {0} is total amount of pages
                    itemsPerPage : "项 每页",
                    first : "首页",
                    previous : "前一页",
                    next : "下一页",
                    last : "最后一页",
                    refresh : "刷新"
                }
            },
            columns : [ 
            {
                field : "id",
                title : "主键",
                hidden : true
            }
            ,{
                field : "name",
                title : "名称"
            }
                            ,{
                field : "createTime",
                title : "创建时间",
                template: '#= kendo.toString(new Date(createTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                    ,{
                field : "creator",
                title : "创建者"
            }
                    ,{
                field : "creatorName",
                title : "创建者姓名"
            }
                    ,{
                field : "startTime",
                title : "启动时间",
                template: '#= kendo.toString(new Date(startTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                    ,{
                field : "endTime",
                title : "结束时间",
                template: '#= kendo.toString(new Date(endTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                    ,{
                field : "description",
                title : "描述"
            }
                            ,{
                field : "participant",
                title : "参与者"
            }
                            ,{
                field : "timeOutTime",
                title : "超时时间",
                template: '#= kendo.toString(new Date(timeOutTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                    ,{
                field : "remindTime",
                title : "提醒时间",
                template: '#= kendo.toString(new Date(remindTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                    ,{
                field : "actionURL",
                title : "响应URL"
            }
                    ,{
                field : "actionMask",
                title : "操作码"
            }
                    ,{
                field : "processInstID",
                title : "所属流程实例"
            }
                    ,{
                field : "processInstName",
                title : "所属流程实例名"
            }
                    ,{
                field : "activityInstID",
                title : "所属活动实例"
            }
                    ,{
                field : "activityInstName",
                title : "所属活动实像名"
            }
                    ,{
                field : "processID",
                title : "所属流程"
            }
                    ,{
                field : "processName",
                title : "所属流程显示名"
            }
                                    ,{
                field : "executor",
                title : "执行者"
            }
                    ,{
                field : "executorName",
                title : "执行者姓名"
            }
                    ,{
                field : "executeTime",
                title : "执行时间",
                template: '#= kendo.toString(new Date(executeTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                    ,{
                field : "rootProcessInstID",
                title : "所属根流程实例"
            }
         ]
        });

        $("#btnSearch").click(function (e) {
        	$("#searchFlags").val("1");
        	kGrid.data("kendoGrid").dataSource.read();
        	$("#searchFlags").val("");
        	$("#filterDialog").data("kendoWindow").close();  
        });

        workItemGrid.delegate("tbody>tr", "dblclick", function(){
        	commandExecute("view","查看");
        });
    });
    </script>
</body>
</html>