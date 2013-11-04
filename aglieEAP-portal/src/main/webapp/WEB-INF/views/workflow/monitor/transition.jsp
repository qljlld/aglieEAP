﻿@inherits AgileEAP.MVC.ViewEngines.Razor.WebViewPage<IPageOfList<AgileEAP.Workflow.Domain.Transition>>
@{
    Layout = "../Shared/_Kendo.cshtml";
}
@using AgileEAP.MVC
@using AgileEAP.Core
@using Kendo.Mvc.UI
@using AgileEAP.Workflow.Domain;
@Html.BuilderToolbar()
@(Html.Kendo().Grid<Transition>()
    .Name("Grid")
    .Columns(columns =>
    {
        columns.Bound(o => o.SrcActInstName).Title("源活动");
        columns.Bound(o => o.DestActInstName).Title("目标活动");
        columns.Bound(o => o.ProcessInstName).Title("流程实例");
        columns.Bound(o => o.TransTime).Title("迁移时间").Format("{0:yyyy-MM-dd HH:mm:ss}");
    })
    .Pageable(o =>
    {
        o.PageSizes(new int[] { 10, 15, 20 });
        o.Messages(m => { m.ItemsPerPage("项每页"); });
    })
    .Sortable()
    .Filterable()
    .DataSource(dataSource => dataSource
        .Ajax()
        .Read(read => read.Action("Transition_Filter", "Monitor")).PageSize(Configure.Get<int>("PageSize", 15))
    )
)