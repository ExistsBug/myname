<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成总界面
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
    <title>大额数据包生成</title>
</head>
<frameset name="fraMain" framespacing="0" frameborder="no" rows="0,0,0,0,*" cols="*" border="1">
    <!-- 保存客户端变量的区域 -->
    <frame name="VD" src="../common/cvar/CVarData.html">
    <!-- 实现服务器交户的区域 -->
    <frame name="EX" src="../common/cvar/CExec.jsp">
    <!-- 提交客户端查询的区域 -->
    <frame name="fraSubmit" src="about:blank" scrolling="no" noresize>
    <!-- 顶部显示标题栏的区域 -->
    <frame name="fraTitle" src="about:blank" scrolling="no" noresize>
    <!-- 显示菜单和交互的区域 -->
    <frameset name="fraSet" framespacing="0" frameborder="no" rows="*" cols="0%,*,0%" border="1">
        <!-- 显示菜单的区域 -->
        <frame name="fraMenu" src="about:blank" scrolling="yes" noresize>
        <!-- 实现交互的区域 -->
        <frame id="fraInterface" name="fraInterface" scrolling="auto" src="RlargeTradeFileToPackageInput.jsp?PackageNo=<%=request.getParameter("PackageNo")%>&dataType=<%=request.getParameter("dataType")%>&reportType=<%=request.getParameter("reportType")%>&makeDate=<%=request.getParameter("makeDate")%>">
        <!-- 下一步操作区域 -->
        <frame name="fraNext" src="about:blank" scrolling="auto">
    </frameset>
</frameset>
<noframes>
    <body bgcolor="#FFFFFF">
        <br><br><br><br><br>
        <center>
            <font size="2">对不起，您的浏览器不支持框架网页。</font>
            <br><br>
            <font size="2">请使用 IE 5.0 或其以上浏览本系统。</font>
        </center>
    </body>
</noframes>
</html>
