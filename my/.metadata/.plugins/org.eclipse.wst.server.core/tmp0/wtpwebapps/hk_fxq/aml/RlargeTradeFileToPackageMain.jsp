<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ������ܽ���
 ******************************************************************************/
 String rp=(String)session.getAttribute("rpackageno");
 String np=(String)session.getAttribute("npackageno");
 String nnp=request.getParameter("PackageNo");
 if(np==null||np.equals(""))
 {
 }
else
	{
		if(!np.equals(nnp))
		{
			session.removeAttribute("rpackageno");
			session.removeAttribute("npackageno");
		}
	}

%>


<html>
<head>
    <title>������ݰ�����</title>
</head>
<frameset name="fraMain" framespacing="0" frameborder="no" rows="0,0,0,0,*" cols="*" border="1">
    <!-- ����ͻ��˱��������� -->
    <frame name="VD" src="../common/cvar/CVarData.html">
    <!-- ʵ�ַ��������������� -->
    <frame name="EX" src="../common/cvar/CExec.jsp">
    <!-- �ύ�ͻ��˲�ѯ������ -->
    <frame name="fraSubmit" src="about:blank" scrolling="no" noresize>
    <!-- ������ʾ������������ -->
    <frame name="fraTitle" src="about:blank" scrolling="no" noresize>
    <!-- ��ʾ�˵��ͽ��������� -->
    <frameset name="fraSet" framespacing="0" frameborder="no" rows="*" cols="0%,*,0%" border="1">
        <!-- ��ʾ�˵������� -->
        <frame name="fraMenu" src="about:blank" scrolling="yes" noresize>
        <!-- ʵ�ֽ��������� -->
        <frame id="fraInterface" name="fraInterface" scrolling="auto" src="RlargeTradeFileToPackageInput.jsp?PackageNo=<%=request.getParameter("PackageNo")%>&dataType=<%=request.getParameter("dataType")%>&reportType=<%=request.getParameter("reportType")%>&makeDate=<%=request.getParameter("makeDate")%>">
        <!-- ��һ���������� -->
        <frame name="fraNext" src="about:blank" scrolling="auto">
    </frameset>
</frameset>
<noframes>
    <body bgcolor="#FFFFFF">
        <br><br><br><br><br>
        <center>
            <font size="2">�Բ��������������֧�ֿ����ҳ��</font>
            <br><br>
            <font size="2">��ʹ�� IE 5.0 �������������ϵͳ��</font>
        </center>
    </body>
</noframes>
</html>
