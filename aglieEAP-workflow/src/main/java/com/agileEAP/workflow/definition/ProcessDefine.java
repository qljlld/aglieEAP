package com.agileEAP.workflow.definition;

import com.agileEAP.utils.Reflections;
/** 
 工作流定义类
 
*/
public class ProcessDefine 
{

	/** 
	 版本
	 
	*/
	private String version;
	public final String getVersion()
	{
		return version;
	}
	public final void setVersion(String value)
	{
		version= value;
	}

	/** 
	 作者
	 
	*/
	private String author;
	public final String getAuthor()
	{
		return author;
	}
	public final void setAuthor(String value)
	{
		author= value;
	}

	/** 
	 流程ID
	 
	*/
	private String id;
	public final String getID()
	{
		return id;
	}
	public final void setID(String value)
	{
		id= value;
	}

	/** 
	 描述
	 
	*/
	private String description;
	public final String getDescription()
	{
		return description;
	}
	public final void setDescription(String value)
	{
		description= value;
	}

	/** 
	 工作流名称
	 
	*/
	private String name;
	public final String getName()
	{
		return name;
	}
	public final void setName(String value)
	{
		name=value;
	}

	/** 
	 优先级
	 
	*/
	private PriorityType priority=PriorityType.Middle;
	public final PriorityType getPriority()
	{
		return priority;
	}
	public final void setPriority(PriorityType value)
	{
		priority=value;
	}


	/** 
	 是否分离事物
	 
	*/
	private String isSplitTransaction;
	public final String getIsSplitTransaction()
	{
		return isSplitTransaction;
	}
	public final void setIsSplitTransaction(String value)
	{
		isSplitTransaction= value;
	}

	/** 
	 时间限制
	 
	*/

	private TimeLimit timeLimit;
	public final TimeLimit getTimeLimit()
	{
		return timeLimit;
	}
	public final void setTimeLimit(TimeLimit value)
	{
		timeLimit = value;
	}

	/** 
	 触发事件
	 
	*/

	private java.util.ArrayList<TriggerEvent> triggerEvents;
	public final java.util.ArrayList<TriggerEvent> getTriggerEvents()
	{
		return triggerEvents;
	}
	public final void setTriggerEvents(java.util.ArrayList<TriggerEvent> value)
	{
		triggerEvents = value;
	}

	/** 
	 流程启动类型
	 
	*/

	private String starterType;
	public final String getStarterType()
	{
		return starterType;
	}
	public final void setStarterType(String value)
	{
		starterType = value;
	}

	/** 
	 流程启动者
	 
	*/

	private java.util.ArrayList<Participantor> initiators;
	public final java.util.ArrayList<Participantor> getInitiators()
	{
		return initiators;
	}
	public final void setInitiators(java.util.ArrayList<Participantor> value)
	{
		initiators = value;
	}

	private String startURL="/workflow/eform";
	public final String getStartURL()
	{
		return startURL;
	}
	public final void setStartURL(String value)
	{
		startURL= value;
	}

	/** 
	 工作流连接列表
	 
	*/
	private java.util.ArrayList<Transition> transitions;
	public final java.util.ArrayList<Transition> getTransitions()
	{
		return transitions;
	}
	public final void setTransitions(java.util.ArrayList<Transition> value)
	{
		transitions = value;
	}

	/** 
	 工作流活动列表
	 
	*/
	private java.util.ArrayList<Activity> activities;
	public final java.util.ArrayList<Activity> getActivities()
	{
		return activities;
	}
	public final void setActivities(java.util.ArrayList<Activity> value)
	{
		activities = value;
	}

	/** 
	 开始活动
	 
	*/
//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
	//[Newtonsoft.Json.JsonIgnore]
	public final StartActivity getStartActivity()
	{
		if (getActivities() == null)
		{
			return null;
		}

		for(Activity activity : getActivities())
		{
			if(activity instanceof StartActivity)
			{
				return (StartActivity)activity;
			}
		}
		return  null;
	}

	/** 
	 结束活动
	 
	*/
	public final EndActivity getEndActivity()
	{
		if (getActivities() == null)
		{
			return null;
		}
		
		for(Activity activity : getActivities())
		{
			if(activity instanceof EndActivity)
			{
				return (EndActivity)activity;
			}
		}
		return  null;
	}

	/** 
	 业务变量
	 
	*/
	private java.util.ArrayList<BizVariable> bizVariables;
	public final java.util.ArrayList<BizVariable> getBizVariables()
	{
		return bizVariables;
	}
	public final void setBizVariables(java.util.ArrayList<BizVariable> value)
	{
		bizVariables = value;
	}

	/** 
	 注释
	 
	*/
	private java.util.ArrayList<Note> notes;
	public final java.util.ArrayList<Note> getNotes()
	{
		return notes;
	}
	public final void setNotes(java.util.ArrayList<Note> value)
	{
		notes = value;
	}


	/** 
	 添加或修改活动
	 
	 @param oldActivityID
	 @param activity
	*/
	public final void SafeAddActivity(String oldActivityID, Activity activity)
	{
		if (this.getActivities() == null)
		{
			this.setActivities(new java.util.ArrayList<Activity>());
		}

		Object parent =Reflections.getFieldValue(activity, "parent");
		if (parent == null)
		{
			Reflections.setFieldValue(activity, "parent", this);
		}

		for(Transition transition :getTransitions())
		{
			if (oldActivityID.equals(transition.getSrcActivity()))
			{
				transition.setSrcActivity(activity.getID());
			}
			if (oldActivityID.equals(transition.getDestActivity()))
			{
				transition.setDestActivity(activity.getID());
			}
		}

		int index = -1;
		for (int i = 0; i < getActivities().size(); i++)
		{
			if (getActivities().get(i).getID().equals(oldActivityID))
			{
				index = i;
				break;
			}
		}

		if (index != -1)
		{
			activity.setStyle(getActivities().get(index).getStyle());
			getActivities().remove(index);
			getActivities().add(index, activity);
		}
		else
		{
			getActivities().add(activity);
		}
	}
}