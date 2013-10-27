/*package com.agileEAP.workflow.definition;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.agileEAP.utils.*;

*//** 
 Xml元素基类
 
*//*
//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
//[JsonObject(MemberSerialization.OptOut)]
public class ConfigureElement implements IConfigureElement
{
	protected ILogger log = LogManager.GetLogger(ConfigureElement.class);

//C# TO JAVA CONVERTER TODO TASK: There is no preprocessor in Java:
		///#region Properties 成员
	*//** 
	 元素名称
	*//*

	private String privateElementName;
	public final String getElementName()
	{
		return privateElementName;
	}
	public final void setElementName(String value)
	{
		privateElementName = value;
	}

	*//** 
	 元素文本值
	 
	*//*
	private String privateElementValue;
	public final String getElementValue()
	{
		return privateElementValue;
	}
	public final void setElementValue(String value)
	{
		privateElementValue = value;
	}

	*//** 
	 关联XElement对象
	 
	*//*
//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
	//[JsonIgnore]
	private XElement privateCurrent;
	protected final XElement getCurrent()
	{
		return privateCurrent;
	}
	protected final void setCurrent(XElement value)
	{
		privateCurrent = value;
	}

	*//** 
	 父结点
	 
	*//*
//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
	//[JsonIgnore]
	private ConfigureElement privateParent;
	protected final ConfigureElement getParent()
	{
		return privateParent;
	}
	protected final void setParent(ConfigureElement value)
	{
		privateParent = value;
	}

	*//** 
	 特性列表
	 
	*//*
//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
	//[JsonIgnore]
	private java.util.HashMap<String, Object> privateAttibutes;
	protected final java.util.HashMap<String, Object> getAttibutes()
	{
		return privateAttibutes;
	}
	protected final void setAttibutes(java.util.HashMap<String, Object> value)
	{
		privateAttibutes = value;
	}

	*//** 
	属性列表
	 
	*//*
//C# TO JAVA CONVERTER TODO TASK: Java annotations will not correspond to .NET attributes:
	//[JsonIgnore]
	private java.util.HashMap<String, Object> privateProperties;
	protected final java.util.HashMap<String, Object> getProperties()
	{
		return privateProperties;
	}
	protected final void setProperties(java.util.HashMap<String, Object> value)
	{
		privateProperties = value;
	}

	//private static string xmlPath = "WorkflowDefine";
	///// <summary>
	///// xml配置文件
	///// </summary>
	//public static string XmlPath
	//{
	//    get
	//    {
	//        if (!Path.IsPathRooted(xmlPath))
	//        {
	//            string executePath = AppDomain.CurrentDomain.BaseDirectory;

	//            if (!xmlPath.StartsWith(executePath))
	//                xmlPath = Path.Combine(executePath, xmlPath);
	//        }
	//        if (!Directory.Exists(xmlPath)) Directory.CreateDirectory(xmlPath);

	//        return xmlPath;
	//    }
	//    set
	//    {
	//        xmlPath = value;
	//    }
	//}
//C# TO JAVA CONVERTER TODO TASK: There is no preprocessor in Java:
		///#endregion

//C# TO JAVA CONVERTER TODO TASK: There is no preprocessor in Java:
		///#region Construtor
	*//** 
	 构造函数
	 
	*//*
	public ConfigureElement()
	{
		setElementName("workflow");

		setAttibutes(new java.util.HashMap<String, Object>());
		setProperties(new java.util.HashMap<String, Object>());
	}

	*//** 
	 构造函数
	 
	 @param parent
	 @param nodeName
	*//*
	public ConfigureElement(ConfigureElement parent, String nodeName)
	{
		this(parent, nodeName, "");
	}

	*//** 
	 构造函数
	 
	 @param parent
	 @param nodeName
	 @param xElem
	*//*
	public ConfigureElement(ConfigureElement parent, String nodeName, XElement xElem)
	{
		this(parent, nodeName, "", xElem);
	}

	*//** 
	 构造函数
	 
	 @param parent
	 @param nodeName
	 @param nodeValue
	*//*
	public ConfigureElement(ConfigureElement parent, String nodeName, String nodeValue)
	{
		this(parent, nodeName, nodeValue, null);
	}

	*//** 
	 构造函数
	 
	 @param parent
	 @param nodeName
	 @param nodeValue
	 @param xElem
	*//*
	public ConfigureElement(ConfigureElement parent, String nodeName, String nodeValue, XElement xElem)
	{
		setParent(parent);
		setElementName(nodeName);
		setElementValue(nodeValue);

		setAttibutes(new java.util.HashMap<String, Object>());
		setProperties(new java.util.HashMap<String, Object>());

		if (xElem == null)
		{
			return;
		}

		setCurrent((nodeName.equals(xElem.getName().LocalName)) ? xElem : ((xElem.Element(nodeName)) != null) ? xElem.Element(nodeName) : xElem.Descendants(nodeName).FirstOrDefault());
		Initilize(getCurrent());
	}

//C# TO JAVA CONVERTER TODO TASK: There is no preprocessor in Java:
		///#endregion

//C# TO JAVA CONVERTER TODO TASK: There is no preprocessor in Java:
		///#region Methods
	*//** 
	 把对象转换为XElement元素
	 
	 @return 
	*//*
	public XElement ToXElement()
	{
//C# TO JAVA CONVERTER TODO TASK: Lambda expressions and anonymous methods are not converted by C# to Java Converter:
		return new XElement(getElementName(), getAttibutes().Select(o => new XAttribute(o.getKey(), o.getValue())), getProperties().Select(o => new XElement(o.getKey(), o.getValue())), getElementValue());
	}

	*//** 
	 保存
	 
	 @param configFile
	*//*
	public void Save(String fileName)
	{
		if (DotNetToJavaStringHelper.isNullOrEmpty(fileName))
		{
			return;
		}

		ConfigureElement parent = getParent();
		try
		{
			if (parent == null)
			{
				ToXElement().Save(fileName);
				return;
			}

			if (this.getClass() == ProcessDefine.class)
			{
				ToXElement().Save(fileName);
				return;
			}

			while (parent != null && parent.getParent() != null)
			{
				parent = parent.getParent();
			}

			parent.Save(fileName);
		}
		catch (RuntimeException ex)
		{
			log.Error(String.format("Save configure file %1$s error!", fileName), ex);
		}
	}

	//public virtual void Save()
	//{
	//    string configFile = string.Empty;

	//    ConfigureElement parent = this;
	//    while (parent != null && parent.Parent != null) parent = parent.Parent;

	//    if (parent is ProcessDefine)
	//    {
	//        ProcessDefine wf = (ProcessDefine)parent;
	//        Save(System.IO.Path.Combine(XmlPath, string.Format("{0}{1}.xml", wf.Name, wf.Version)));

	//        return;
	//    }

	//    throw new Exception("获取不到默认路径！");
	//}

	*//** 
	 初始化
	 
	*//*
	public void Initilize()
	{
	}

	*//** 
	 初始化
	 
	 @param xElem
	*//*
	public void Initilize(XElement xElem)
	{
		if (xElem == null)
		{
			return;
		}

//C# TO JAVA CONVERTER TODO TASK: Lambda expressions and anonymous methods are not converted by C# to Java Converter:
		xElem.Attributes().ForEach(e =>
		{
			if (!DotNetToJavaStringHelper.isNullOrEmpty(e.getName().LocalName) && !DotNetToJavaStringHelper.isNullOrEmpty(e.getValue()))
			{
				getAttibutes().SafeAdd(e.getName().LocalName, e.getValue().trim());
			}
		}
	   );

//C# TO JAVA CONVERTER TODO TASK: There is no Java equivalent to LINQ queries:
//C# TO JAVA CONVERTER TODO TASK: Lambda expressions and anonymous methods are not converted by C# to Java Converter:
		xElem.Elements().Where(e => e.Elements().Count() == 0).ForEach(e =>
		{
			if (!DotNetToJavaStringHelper.isNullOrEmpty(e.getName().LocalName) && !DotNetToJavaStringHelper.isNullOrEmpty(e.getValue()))
			{
				getProperties().SafeAdd(e.getName().LocalName, e.getValue().trim());
			}
		}
	   );
	}

	*//** 
	 转换为xml字符串
	 
	 @return 
	*//*
	public String ToXml()
	{
		return ToXElement().ToSafeString();
	}

	*//** 
	 新建参数
	 
	 @param xElem
	 @return 
	*//*
	public final java.util.Map.Entry<String, Object> NewArgument(XElement xElem)
	{
		return new KeyValuePair<String, Object>(xElem.Attribute("name").getValue(), xElem.getValue());
	}

	*//** 
	 初始化属性值
	 
	 @param xElem
	 @return 
	*//*
	public final java.util.HashMap<String, Object> InitProperties(XElement xElem)
	{
		java.util.HashMap<String, Object> properties = new java.util.HashMap<String, Object>();
		if (xElem == null)
		{
			return properties;
		}
//C# TO JAVA CONVERTER TODO TASK: There is no equivalent to implicit typing in Java:
		var xProperties = xElem.Element("properties");
		if (xProperties != null)
		{
//C# TO JAVA CONVERTER TODO TASK: There is no equivalent to implicit typing in Java:
			var temp = xProperties.Elements("property").toArray();

//C# TO JAVA CONVERTER TODO TASK: There is no equivalent to implicit typing in Java:
			for (var xProperty : temp)
			{
				String key = xProperty.AttributeValue("name");
				if (!DotNetToJavaStringHelper.isNullOrEmpty(key))
				{
					properties.SafeAdd(key, xProperty.AttributeValue("value"));
				}
			}
		}

		return properties;
	}
//C# TO JAVA CONVERTER TODO TASK: There is no preprocessor in Java:
		///#endregion
}*/