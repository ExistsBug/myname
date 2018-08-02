
<html>
<%@page contentType="text/html;charset=GBK" %>
<!--用户校验类-->
<%@page import = "com.sinosoft.utility.*"%>
<%@page import = "com.sinosoft.lis.schema.*"%>
<%@page import = "com.sinosoft.lis.vschema.*"%>
<%@page import = "com.sinosoft.lis.*"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
  GlobalInput tG = new GlobalInput();
  tG = (GlobalInput)session.getValue("GI");

%>
<head>
  <SCRIPT src="../common/javascript/Common.js"></SCRIPT>
  <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
  <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
  <SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
  <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
  <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
  <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
  <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
  <SCRIPT src="LXFDSCImport.js"></SCRIPT>
<script language="javascript" >

</script>
</head>

<body  onload="" >

<form action="" method=post name=fm target="fraSubmit">
  <table>
  <TR>
    <TD><IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= ""></TD>
    <TD class= titleImg>回执信息导入</TD>
  </TR>
  </table>
    <!--TR class= common>
      <TD class= title> 回执类型 <font size=1 color='#ff0000'><b>*</b></font></TD>
      <TD align=left>

      <input type="radio" value="SUCC" name="flag" onclick="callrgtstate(this);" > 正确回执文件导入 </input>
      <input type="radio" value="NMFL" name="flag" onclick="callrgtstate(this);" > 文件名错误回执文件导入 </input>
      <input type="radio" value="CTFL" name="flag" onclick="callrgtstate(this);" > 内容错误回执文件导入 </input>
      </span>
    </TR>
  <hr-->
  </form>
<form action="./LXFDSCDiskSave.jsp" method=post name="fmload" target="fraSubmit" ENCTYPE="multipart/form-data">
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
        <Input type="file"   class= common3 style="width:39%" name=FileName size=20 value="";>
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
          <TD class=title> </TD>
		  </TR>

</form>



</body>
</html>
