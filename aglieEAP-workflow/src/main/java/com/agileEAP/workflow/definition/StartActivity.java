package com.agileEAP.workflow.definition;

//[Remark("开始活动")]
public class StartActivity extends Activity
{
	/** 
	 工作流表单
	 
	*/
	private String eForm;
	public final String geteForm()
	{
		return eForm;
	}
	public final void seteForm(String value)
	{
		eForm= value;
	}
}