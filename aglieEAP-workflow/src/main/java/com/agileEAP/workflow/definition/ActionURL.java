package com.agileEAP.workflow.definition;

/** 
 响应URL
 
*/

public class ActionURL 
{
	/** 
	 是否自定义URL
	 
	*/
	private boolean isSpecifyURL=false;
	public  boolean getIsSpecifyURL()
	{
		return isSpecifyURL;
	}
	public  void setIsSpecifyURL(boolean value)
	{
		isSpecifyURL= value;
	}

	/** 
	 URL类型,LogicalProcess(逻辑处理),WebURL(web展现),Other(其他)
	 
	*/
	private URLType urlType=URLType.CustomURL;
	public final URLType getURLType()
	{
		return urlType;
	}
	public final void setURLType(URLType value)
	{
		urlType=value;
	}

	/** 
	 调用URL
	 
	*/
	private String specifyURL;
	public final String getSpecifyURL()
	{
		return specifyURL;
	}
	public final void setSpecifyURL(String value)
	{
		specifyURL= value;
	}

	/** 
	 人工处理
	 
	*/
	private CustomAction privateManualProcess;
	public final CustomAction getManualProcess()
	{
		return privateManualProcess;
	}
	public final void setManualProcess(CustomAction value)
	{
		privateManualProcess = value;
	}
}