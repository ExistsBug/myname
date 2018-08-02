<html>
<%@page contentType="text/html;charset=GBK" %>
<!--用户校验类-->
<%@page import = "com.sinosoft.utility.*"%>
<%@page import = "com.sinosoft.lis.schema.*"%>
<%@page import = "com.sinosoft.lis.vschema.*"%>
<%@page import = "com.sinosoft.lis.*"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<!--中科软反洗钱系统大额导入-->
<%
  GlobalInput tG = new GlobalInput();
  tG = (GlobalInput)session.getValue("GI");

%>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="gb2312" />	
  <SCRIPT src="../common/javascript/Common.js"></SCRIPT>
  <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
  <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
  <SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
  <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
  <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
  <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
  <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
  <SCRIPT src="LXIHTradeMainDiskImport.js"></SCRIPT>
</head>

<body  onload="" >
<form action="" method=post name=fm target="fraSubmit">
  <table>
  <TR>
    <TD><IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= ""></TD>
    <TD class= titleImg>大额交易导入</TD>
  </TR>
  </table>   
  </form>
<form action="./LXIHTradeMainDiskSave.jsp" method=post name="fmload" target="fraSubmit" ENCTYPE="multipart/form-data">
  <!--hr>
  <table>
  <TR>
    <TD></TD>
    <TD class= titleImg>导入操作</TD>
  </TR>
  </table-->
  <table class=common>
      <TD class=common >文件地址:</TD>
      <TD class=common >
        <Input type="file"  class= common3 style="width:39%"  name=FileName size=20 value="";>
        <input name=ImportPath type= hidden>
        <input name=DealType type=hidden value="">
        <input class=common name=BatchNo type=hidden>
        <input name=just type=hidden value="">
        <INPUT class=cssButton VALUE="导  入" TYPE=button name="PrintIn" onclick="getin();">
      </TD>
     <input type=hidden name=ImportFile>
  </table>
      <br>
      <TR class= common>
          <a href="import/AmlIHImportExample.xls">下载大额交易导入模板:</a>
		  </TR>
</form>
</body>
</html>
