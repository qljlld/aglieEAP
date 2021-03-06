﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>角色管理</title>
</head>
<body>
    <jsp:include page="../../share/command.jsp"></jsp:include>
    <div id="roleGrid"></div>    
    <div id="filterDialog" >
        <form id="frmSearch" class="form-horizontal">
            <input id="searchFlags" type="hidden" />
            <fieldset>
            	<div class="control-group">
            		<label for="name" class="control-label">角色名称:</label>
            		<div class="controls">
            			<input type="text" id="name" name="name" value=""/>
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
    	setDetailWindowHeight(250);
    	setFilterWindowHeight(160);
        var dataSource = new kendo.data.DataSource({
            transport : {
                read : {
                    type : "post",
                    url : "${ctx}/security/role/ajaxList",
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
        var roleGrid=$("#roleGrid");

        if($.query.get("entry")=="chooseRole")
       	{
            columns=[ 
                         {
                             field : "id",
                             title : "主键",
                             hidden : true
                         }
                         ,{
                             field : "id",
                            	template:"<input id='#=id#' type='checkbox' />",
                             title : "<input type='checkbox' onclick='toggleCheckbox(this);' />选择",
                             width: 60
                         }
                         ,{
                             field : "name",
                             title : "角色名称"
                         }
                         ,{
                             field : "description",
                             title : "描述"
                         }
                         ];
       	}
        else
        {
            columns=[ 
                         {
                             field : "id",
                             title : "主键",
                             hidden : true
                         }
                         ,{
                             field : "name",
                             title : "角色名称"
                         }
                         ,{
                             field : "description",
                             title : "描述"
                         }
                         ];        	
        }
        var kGrid=roleGrid.kendoGrid({
            dataSource : dataSource,
            selectable: "multiple",
            change: function(){
            	 this.select().find(":checkbox").click();
            },
            dataBound: function(e){
                if($.query.get("entry")=="chooseRole")
                {
                	var roles="${roles}".split(",");
                	for(var i in roles)
               		{
               			$("#"+roles[i]).prop("checked",true);
               		}
                }
            },
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
            columns : columns
        });

        $("#btnSearch").click(function (e) {
        	$("#searchFlags").val("1");
        	kGrid.data("kendoGrid").dataSource.read();
        	$("#searchFlags").val("");
        	$("#filterDialog").data("kendoWindow").close();  
        });
        

        if($.query.get("entry")!="chooseRole")
        {
	        roleGrid.delegate("tbody>tr", "dblclick", function(){
	        	commandExecute("view","查看");
	        });        	
        }                
    });
    
    function toggleCheckbox(me)
    {
    	$("#roleGrid").find(":checkbox").prop("checked",me.checked);
    }
    
    function configPrivilege(title)
    {
		var roleId = $(".k-state-selected:first").find("td:first").text();
		if (roleId == null || roleId == undefined || roleId == "") {
			alertMessage("请先选择一行数据");
			return false;
		}
    	openDialog("${ctx}/security/role/privilege?roleId="+roleId, title, 500,550);
    }
    
	function save()
	{       
        var processbar = $("#processbar");
        processbar.processbar({ message: '正在提交...' });
        
        var ids=[];
		 $("input:checked").each(function()
		{
			 ids.push(this.id);
		});
		
		if (ids.length==0) {
			alertMessage("请先选择角色");
			return false;
		}	
    
        $.post("${ctx}/security/operator/role/save", {operatorId:$.query.get("operatorId"),ids:ids.join(",")}, function (result) {
            processbar.complete();
            alertMessage(result);
			if (window.parent&&result.indexOf("成功")>0) {
				window.parent.$("#actionDialog").data("kendoWindow").close();
				window.parent.frames["ifrContent"].$("#btnSearch").click();                    
			}
        });
	}
    </script>
</body>
</html>