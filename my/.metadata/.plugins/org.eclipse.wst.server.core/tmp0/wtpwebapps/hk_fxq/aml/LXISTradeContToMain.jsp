<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�LAAgentQuery.html
//�����ܣ�
//�������ڣ�2002-08-16 15:31:09
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--Root="../../" -->
<html>
<head>
<title>Sinosoft </title>
<script language="javascript">
	var intPageWidth=screen.availWidth;
	var intPageHeight=screen.availHeight;
	window.resizeTo(intPageWidth,intPageHeight);
	window.focus();
</script>
</head>
<!--<frameset rows="0,0,0,65,*" frameborder="no" border="1" framespacing="0" cols="*"> -->
<frameset name="fraMain" rows="0,0,0,0,*" frameborder="no" border="1" framespacing="0" cols="*">
<!--������״̬����-->
	<!--����ͻ��˱��������򣬸����������-->
	<frame name="VD" src="../common/cvar/CVarData.html">
	
	<!--����ͻ��˱�����WebServerʵ�ֽ��������򣬸����������-->
	<frame name="EX" src="../common/cvar/CExec.jsp">
	
	<frame name="fraSubmit"  scrolling="yes" noresize src="about:blank" >
	<frame name="fraTitle"  scrolling="no" noresize src="" >
	<frameset name="fraSet" cols="0%,*,0%" frameborder="no" border="1" framespacing="0" rows="*">
		<!--�˵�����-->
		<frame name="fraMenu" scrolling="yes" noresize src="">
		<!--��������-->
		<frame id="fraInterface" name="fraInterface" scrolling="auto" src="./LXISTradeContMain.jsp?oper=<%=request.getParameter("oper")%>&DealNo=<%=request.getParameter("DealNo")%>&CSNM=<%=request.getParameter("CSNM")%>&RiskCode=<%=request.getParameter("RiskCode")%>&ISNM=<%=request.getParameter("ISNM")%>" >;		
    <!--��һ��ҳ������-->
    <frame id="fraNext" name="fraNext" scrolling="auto" src="about:blank">
	</frameset>
</frameset>
<noframes>
	<body bgcolor="#ffffff">
	</body>
</noframes>
</html>