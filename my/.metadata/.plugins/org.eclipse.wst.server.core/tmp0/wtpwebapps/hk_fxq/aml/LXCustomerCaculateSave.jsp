<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="java.io.*"%>
<%
//�������ƣ�MakeDataToExcelSave.jsp
//�����ܣ�����excel������ݴ���
//�������ڣ�2010-05-28 15:47:00
//������  ��Lips
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = ""; 
	String eFileName = "";
  
	//�������
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
%>
