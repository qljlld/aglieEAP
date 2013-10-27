package com.agileEAP.workflow.definition;


//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
//[Remark("结束活动")]
public class EndActivity extends Activity
{
	/** 
	 激活规则
	 
	*/
	private ActivateRule activateRule;
	public final ActivateRule getActivateRule()
	{
		return activateRule;
	}
	public final void setActivateRule(ActivateRule value)
	{
		activateRule = value;
	}
}