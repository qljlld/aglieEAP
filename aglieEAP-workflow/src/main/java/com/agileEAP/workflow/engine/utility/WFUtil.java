package com.agileEAP.workflow.engine.utility;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import com.agileEAP.security.service.ShiroDbRealm.ShiroUser;
import com.agileEAP.workflow.definition.Activity;
import com.agileEAP.workflow.engine.exception.WorkflowException;
import com.agileEAP.workflow.engine.trace.Trace;
/** 
 工作流上下文
 
*/
public final class WFUtil
{
	/** 
	 Gets or sets the current user
	 
	*/
	public static ShiroUser getUser()
	{
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();

		return user;
	}

	/** 
	 默认最小时间
	 
	*/
	public final static java.util.Date minDate = new java.util.Date(2000, 1, 1);

	/** 
	 默认最大时间
	 
	*/
	public final static java.util.Date MaxDate = new java.util.Date(2099, 1, 1);

	/** 
	 默认变量前缀
	 
	*/
	public final static char ExpressionVariablePrefix = ':';

	/** 
	 处理异常
	 
	 @param exception
	*/
	public static void HandleException(WorkflowException exception)
	{
		Trace.Print(exception);
		throw exception;
	}
	
	public static Activity getActivity(List<Activity> activities,String activityDefID)
	{
		if(activities==null) return null;
		
		for(Activity activity:activities)
		{
			if(activity.getID().equals(activityDefID))
			{
				return activity;
			}
		}
		
		return null;
	}
}