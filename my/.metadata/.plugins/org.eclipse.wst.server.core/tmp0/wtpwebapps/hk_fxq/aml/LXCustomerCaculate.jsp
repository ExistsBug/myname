<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>

<html>
<head>
    <title>���ײ�ѯ</title>
    <!-- ����������ʽ -->
    <link href="../common/css/Project.css" type="text/css" rel="stylesheet">
    <link href="../common/css/mulLine.css" type="text/css" rel="stylesheet">
    <!-- �������ýű� -->
    <script language="JavaScript" src="../common/Calendar/Calendar.js"></script>
    <script language="JavaScript" src="../common/javascript/Common.js"></script>
    <script language="JavaScript" src="../common/cvar/CCodeOperate.js"></script>
    <script language="JavaScript" src="../common/javascript/MulLine.js"></script>
    <script language="JavaScript" src="../common/javascript/EasyQuery.js"></script>
    <script language="JavaScript" src="../common/easyQueryVer3/EasyQueryVer3.js"></script>
    <script language="JavaScript" src="../common/easyQueryVer3/EasyQueryCache.js"></script>
    <script language="JavaScript" src="../common/javascript/VerifyInput.js"></script>
    <!-- ˽�����ýű� -->
    <script language="JavaScript" src="LXCustomerCaculate.js"></script>
    <%@ include file="LXCustomerCaculateInit.jsp" %>
</head>
<body topmargin="0" onload="" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustmoerGrid);">
    		</td>
    		 <td class= titleImg>
        		���ռ���
       		 </td>
    	</tr>
    </table> 
    <div id="divCustmoerGrid" style="display:''">
      <table  class= common>
        <TR  class = common>      
          <TD class="title" />��ʼ����</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" ></TD>
          <TD class="title" />��������</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" ></TD>
        </TR>
      </table> 
      <br><br>
				<input type="button" class="cssButton" name='cal' value="���ռ���" onclick="return calData();">
				<br>
	</div>
    </form>
</body>
</html>
