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
%>


<html>
<head>
    <title>���ɽ��ױ����ļ�����</title>
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
        <frame id="fraInterface" name="fraInterface" scrolling="auto" src="DubitMsgMakeDealInput.jsp?DataType=<%=request.getParameter("DataType")%>&FileNo=<%=request.getParameter("FileNo")%>">
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
