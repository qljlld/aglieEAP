package com.agileEAP.portal.jms;

import java.util.HashMap;
import java.util.Map;

import javax.jms.Destination;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;


/**
 * JMS用户变更消息生产者.
 * 
 * 使用jmsTemplate将用户变更消息分别发送到queue与topic.
 * 
 * @author calvin
 */

public class NotifyMessageProducer {

	private static Logger logger = LoggerFactory.getLogger(NotifyMessageProducer.class);
	
	private JmsTemplate jmsTemplate;
	private Destination notifyQueue;
	private Destination notifyTopic;

	public void sendQueue(final TradeRecord tradeRecord) {
		sendMessage(tradeRecord, notifyQueue);
	}

	public void sendTopic(final TradeRecord tradeRecord) {
		sendMessage(tradeRecord, notifyTopic);
	}

	/**
	 * 使用jmsTemplate最简便的封装convertAndSend()发送Map类型的消息.
	 */
	private void sendMessage(TradeRecord tradeRecord, Destination destination) {
		Map map = new HashMap();
		map.put("tranCode", tradeRecord.getTranCode());
		map.put("goodsCode", tradeRecord.getGoodsCode());
		map.put("destination", destination.getClass().getName());

		logger.info("sendMessage=tranCode:{}, goodsCode:{},destination:{}", map.get("tranCode"), map.get("goodsCode"),destination.getClass().getName());
		
		jmsTemplate.convertAndSend(destination, map);
	}

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public void setNotifyQueue(Destination notifyQueue) {
		this.notifyQueue = notifyQueue;
	}

	public void setNotifyTopic(Destination nodifyTopic) {
		this.notifyTopic = nodifyTopic;
	}
}
