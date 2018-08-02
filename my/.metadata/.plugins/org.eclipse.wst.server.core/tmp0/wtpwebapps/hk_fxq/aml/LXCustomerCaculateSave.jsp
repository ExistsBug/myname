<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="java.io.*"%>
<%
//程序名称：MakeDataToExcelSave.jsp
//程序功能：生成excel表的数据处理
//创建日期：2010-05-28 15:47:00
//创建人  ：Lips
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%
	// 输出参数
	CErrors tError = null;
	String FlagStr = "";
	String Content = ""; 
	String eFileName = "";
  
	//输入参数
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
%>
