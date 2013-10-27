package com.agileEAP.workflow.definition;


/** 
 注释
*/

public class Note 
{

	/** 
	 标题
	 
	*/

	private String title;
	public final String getTitle()
	{
		return title;
	}
	public final void setTitle(String value)
	{
		title = value;
	}

	/** 
	 内容
	 
	*/

	private String content;
	public final String getContent()
	{
		return content;
	}
	public final void setContent(String value)
	{
		content = value;
	}

	/** 
	 名称
	 
	*/
	private String name;
	public final String getName()
	{
		return name;
	}
	public final void setName(String value)
	{
		name= value;
	}
}