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
    <script language="JavaScript" src="LXCustomerEvaluateLevel.js"></script>
    <%@ include file="LXCustomerEvaluateLevelInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
    	
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustmoerGrid);">
    		</td>
    		 <td class= titleImg>
        		�ͻ�������Ϣ��ѯ
       		 </td>
    	</tr>
    </table> 
    <div id="divCustmoerGrid" style="display:''">
      <table  class= common>
      	<TR  class = common>  
	      	<TD  class=title>�������</TD>
					<TD  class= input><Input class=codeno value=<%=tGI.ManageCom%> name="StatiCode" readonly onDblClick="return showCodeList('station46',[this,StatiCodeName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true></TD> 
	        <td  class = "title">���յȼ�</td>
	        <td  class = "input"/><Input name="Level" id="Level" class="codeno" ondblclick="showCodeList('hazardlevel',[this,LevelName],[0,1]);" onkeyup="showCodeListKey('hazardlevel',[this,LevelName],[0,1]);"/><Input class=codename name=LevelName readOnly ></TD>
			  </TR>
        <TR  class = common>      
          <TD class="title" />�б���ʼ����</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" ></TD>
          <TD class="title" />�б���������</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" ></TD>
     
        </TR>
        <TR  class = common>           
          <td  class = "title">�ͻ���</td>
          <td  class = "input"><input type="text" class="common" name="AppntNo"></td>
          <td  class = "title"></td>
          <td  class = "input"></td>
        </TR>
      </table> 
      
      
				<input type="button" class="cssButton" name='sync' value="��ѯ" onclick="return easyQueryData();">
				<input type="button" class="cssButton" name='cal' value="����"  onclick="return MakeExcel();">

        
            <table class="common">
                <tr class="common">
                    <td><span id="spanCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>


    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
