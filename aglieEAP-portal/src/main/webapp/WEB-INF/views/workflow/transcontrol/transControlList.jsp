<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>流程迁移控制管理</title>
</head>
<body>
    <jsp:include page="../../share/command.jsp"></jsp:include>
    <div id="transControlGrid"></div>    
    <div id="filterDialog" >
        <form id="frmSearch" class="form-horizontal">
            <input id="searchFlags" type="hidden" />
            <fieldset>
            	<div class="control-group">
            		<label for="srcActID" class="control-label">源活动定义ID:</label>
            		<div class="controls">
            			<input type="text" id="srcActID" name="srcActID" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="srcActName" class="control-label">源活动定义名称:</label>
            		<div class="controls">
            			<input type="text" id="srcActName" name="srcActName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="destActID" class="control-label">目标活动定义ID:</label>
            		<div class="controls">
            			<input type="text" id="destActID" name="destActID" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="destActName" class="control-label">目标活动定义名称:</label>
            		<div class="controls">
            			<input type="text" id="destActName" name="destActName" value=""/>
                    </div>
            	</div>
            	<div class="control-group">
            		<label for="processInstID" class="control-label">流程实例ID:</label>
            		<div class="controls">
            			<input type="text" id="processInstID" name="processInstID" value=""/>
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
                    url : "${ctx}/workflow/transcontrol/ajaxList",
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
        var transControlGrid=$("#transControlGrid");
        var kGrid=transControlGrid.kendoGrid({
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
                field : "srcActID",
                title : "源活动定义ID"
            }
                    ,{
                field : "srcActName",
                title : "源活动定义名称"
            }
                    ,{
                field : "destActID",
                title : "目标活动定义ID"
            }
                    ,{
                field : "destActName",
                title : "目标活动定义名称"
            }
                    ,{
                field : "processInstID",
                title : "流程实例ID"
            }
                    ,{
                field : "transTime",
                title : "迁移时间",
                template: '#= kendo.toString(new Date(transTime),"yyyy-MM-dd HH:mm:ss")#'
            }
                 ]
        });

        $("#btnSearch").click(function (e) {
        	$("#searchFlags").val("1");
        	kGrid.data("kendoGrid").dataSource.read();
        	$("#searchFlags").val("");
        	$("#filterDialog").data("kendoWindow").close();  
        });

        transControlGrid.delegate("tbody>tr", "dblclick", function(){
        	commandExecute("view","查看");
        });
    });
    </script>
</body>
</html>