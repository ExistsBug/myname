
<html>
<%@page contentType="text/html;charset=GBK" %>
<!--�û�У����-->
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
    <TD class= titleImg>��ִ��Ϣ����</TD>
  </TR>
  </table>
    <!--TR class= common>
      <TD class= title> ��ִ���� <font size=1 color='#ff0000'><b>*</b></font></TD>
      <TD align=left>

      <input type="radio" value="SUCC" name="flag" onclick="callrgtstate(this);" > ��ȷ��ִ�ļ����� </input>
      <input type="radio" value="NMFL" name="flag" onclick="callrgtstate(this);" > �ļ��������ִ�ļ����� </input>
      <input type="radio" value="CTFL" name="flag" onclick="callrgtstate(this);" > ���ݴ����ִ�ļ����� </input>
      </span>
    </TR>
  <hr-->
  </form>
<form action="./LXFDSCDiskSave.jsp" method=post name="fmload" target="fraSubmit" ENCTYPE="multipart/form-data">
  <!--hr>
  <table>
  <TR>
    <TD></TD>
    <TD class= titleImg>�������</TD>
  </TR>
  </table-->
  <table class=common>
      <TD class=common >�ļ���ַ:</TD>
      <TD class=common >
        <Input type="file"   class= common3 style="width:39%" name=FileName size=20 value="";>
        <input name=ImportPath type= hidden>
        <input name=DealType type=hidden value="">
        <input class=common name=BatchNo type=hidden>
        <input name=just type=hidden value="">
        <INPUT class=cssButton VALUE="��  ��" TYPE=button name="PrintIn" onclick="getin();">

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
