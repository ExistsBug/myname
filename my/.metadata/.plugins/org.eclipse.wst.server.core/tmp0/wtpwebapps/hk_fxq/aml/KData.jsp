<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.lis.pubfun.GlobalInput"%>
<% 
//�������ƣ�DData.jsp
//�����ܣ��������ȷ�� 
//�������ڣ�2007-07-02 11:10:36
//������  ��zhu
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<html>
<%
  //�����¸���	
	String tContNo = "";
	
  GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput)session.getValue("GI");
%>
<script>	
	var contNo = "<%=tContNo%>";          //���˵��Ĳ�ѯ����.
	var operator = "<%=tGI.Operator%>";   //��¼����Ա
	var manageCom = "<%=tGI.ManageCom%>"; //��¼��½����
	var comcode = "<%=tGI.ComCode%>";//��¼��½����
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
  <SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
  <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
  <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
   <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
  <SCRIPT src="KData.js"></SCRIPT>
  <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
  <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
  <%@include file="KDataInit.jsp"%>
  <title>�������ȷ��</title>
</head>
<body  onload="initForm();" >
  <form action="./KDataChk.jsp" method=post name=fm target="fraSubmit">
    <!-- ����������Ϣ -->
    <table class= common border=0 width=100%>
    	<tr>
		<td class= titleImg align= center>�������ѯ������</td>
	</tr>
    </table>
    <table  class= common align=center>
      	<TR  class= common>
          <TD  class= title>
            �ͻ���  
          </TD>
          <TD  class= input>
            <Input class=common name=CSNM >
          </TD>
          <TD  class= title>  
            ͳ������
          </TD>
          <TD  class= input>
          
            <Input class="coolDatePicker" name="StaDate" dateFormat="short">
          </TD>
         
        </TR>
        
        
    </table>
          <INPUT VALUE="��  ѯ" class = cssButton TYPE=button onclick="easyQueryClickSelf();"> 
    
  	<Div  id= "divLCPol1" style= "display: ''" align=center>
      	<table  class= common>
       		<tr  class= common>  
      	  		<td text-align: left colSpan=1>
  					<span id="spanPolGrid" >
  					</span> 
  			  	</td> 
  			</tr>
    	</table>
      <INPUT VALUE="��  ҳ"  class =  cssButton TYPE=button onclick="getFirstPage();"> 
      <INPUT VALUE="��һҳ" class = cssButton TYPE=button onclick="getPreviousPage();"> 					
      <INPUT VALUE="��һҳ" class = cssButton TYPE=button onclick="getNextPage();"> 
      <INPUT VALUE="β  ҳ"  class =  cssButton TYPE=button onclick="getLastPage();"> 					
  	</div>
  	<p>
      <INPUT VALUE="��������ȷ��" class = cssButton TYPE=button onclick="chk()"> 
     
  	</p>
  </form>
  <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>
