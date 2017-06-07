//package com.luckcloud.h5.wx.util;
//
//import java.awt.Image;
//import java.io.InputStream;
//import java.io.Writer;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.dom4j.Document;
//import org.dom4j.DocumentHelper;
//import org.dom4j.Element;
//import org.dom4j.io.SAXReader;
//
///**
// * XML消息处理工具类
// * 
// * @author tiangai
// * @since 2014-06-30 Am 11:57
// * @version 1.0
// */
//public class XmlMessageUtil {
//	/**
//	 * 解析微信发来的请求（XML）
//	 * 
//	 * @param request
//	 * @return
//	 * @throws Exception
//	 */
//	@SuppressWarnings("unchecked")
//	public static Map<String, String> parseXml(HttpServletRequest request)
//			throws Exception {
//		// 将解析结果存储在HashMap中
//		Map<String, String> map = new HashMap<String, String>();
//		// 从request中取得输入流
//		InputStream inputStream = request.getInputStream();
//		// 读取输入流
//		SAXReader reader = new SAXReader();
//		Document document = reader.read(inputStream);
//		// 得到xml根元素
//		Element root = document.getRootElement();
//		// 得到根元素的所有子节点
//		List<Element> elementList = root.elements();
//		// 遍历所有子节点
//		for (Element e : elementList)
//			map.put(e.getName(), e.getText());
//		// 释放资源
//		inputStream.close();
//		inputStream = null;
//		return map;
//	}
//	
//	/**
//	 * 解析微信发来的请求（XML）
//	 * 
//	 * @param request
//	 * @return
//	 * @throws Exception
//	 */
//	@SuppressWarnings("unchecked")
//	public static Map<String, String> parseXmlByString(String xml)
//			throws Exception {
//		// 将解析结果存储在HashMap中
//		Map<String, String> map = new HashMap<String, String>();
//		// 将字符串转为XML
//		Document document = DocumentHelper.parseText(xml); 
//		// 得到xml根元素
//		Element root = document.getRootElement();
//		// 得到根元素的所有子节点
//		List<Element> elementList = root.elements();
//		// 遍历所有子节点
//		for (Element e : elementList)
//			map.put(e.getName(), e.getText());
//		// 释放资源
//		root = null;
//		document = null;
//		return map;
//	}
//
//	/**
//	 * 文本消息对象转换成xml
//	 * 
//	 * @param textMessage
//	 *            文本消息对象
//	 * @return xml
//	 */
//	public static String textMessageToXml(ReplyText textMessage) {
//		xstream.alias("xml", textMessage.getClass());
//		return xstream.toXML(textMessage);
//	}
//
//	/**
//	 * 图片消息对象转换成xml
//	 * 
//	 * @param imageMessage
//	 *            图片消息对象
//	 * @return xml
//	 */
//	public static String imageMessageToXml(Image imageMessage) {
//		xstream.alias("xml", imageMessage.getClass());
//		return xstream.toXML(imageMessage);
//	}
//
//	/**
//	 * 语音消息对象转换成xml
//	 * 
//	 * @param voiceMessage
//	 *            语音消息对象
//	 * @return xml
//	 */
//	public static String voiceMessageToXml(Voice voiceMessage) {
//		xstream.alias("xml", voiceMessage.getClass());
//		return xstream.toXML(voiceMessage);
//	}
//
//	/**
//	 * 视频消息对象转换成xml
//	 * 
//	 * @param videoMessage
//	 *            视频消息对象
//	 * @return xml
//	 */
//	public static String videoMessageToXml(Video videoMessage) {
//		xstream.alias("xml", videoMessage.getClass());
//		return xstream.toXML(videoMessage);
//	}
//
//	/**
//	 * 音乐消息对象转换成xml
//	 * 
//	 * @param musicMessage
//	 *            音乐消息对象
//	 * @return xml
//	 */
//	public static String musicMessageToXml(ReplyMusic musicMessage) {
//		xstream.alias("xml", musicMessage.getClass());
//		return xstream.toXML(musicMessage);
//	}
//
//	/**
//	 * 图文消息对象转换成xml
//	 * 
//	 * @param newsMessage
//	 *            图文消息对象
//	 * @return xml
//	 */
//	public static String newsMessageToXml(News newsMessage) {
//		xstream.alias("xml", newsMessage.getClass());
//		xstream.alias("item", new ReplyArticle().getClass());
//		return xstream.toXML(newsMessage);
//	}
//
//	/**
//	 * 扩展xstream，使其支持CDATA块
//	 * 
//	 * @date 2013-05-19
//	 */
//	@SuppressWarnings("rawtypes")
//	private static XStream xstream = new XStream(new XppDriver() {
//		public HierarchicalStreamWriter createWriter(Writer out) {
//			return new PrettyPrintWriter(out) {
//				// 对所有xml节点的转换都增加CDATA标记
//				boolean cdata = true;
//
//				public void startNode(String name, Class clazz) {
//					super.startNode(name, clazz);
//				}
//
//				protected void writeText(QuickWriter writer, String text) {
//					if (cdata) {
//						writer.write("<![CDATA[");
//						writer.write(text);
//						writer.write("]]>");
//					} else {
//						writer.write(text);
//					}
//				}
//			};
//		}
//	});
//}
