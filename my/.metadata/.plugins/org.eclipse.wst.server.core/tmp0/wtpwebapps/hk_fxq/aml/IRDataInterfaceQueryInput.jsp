<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//�������ƣ�IHDataInterface.jsp
//�����ܣ�
//�������ڣ�2007-11-15
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%
    String CurDate = PubFun.getCurrentDate();
    System.out.println(CurDate);
%>
<head>
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
<SCRIPT src="IRDataInterface.js"></SCRIPT>
<%@include file="IRDataInterfaceQueryInit.jsp"%>
</head>
<body  onload="initForm();initElementtype();" >
  <form action="" method=post name=fm target="fraSubmit">
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divAgent11);">
    		</td>
    		 <td class= titleImg>
        		��ȡ��Ϣ��ѯ
       		 </td>
    	</tr>
    </table>
    <Div  id= "divAgent11" style= "display: ''">
      <table  class= common>
        <TR  class = common>           
           <TD  class = title>
             ���׷�������
          </TD>
          <TD  class= input>
            <Input class= "coolDatePicker" dateFormat="short" name="StartDate1" verify="���׷�������|DATE" >
          </TD>

           <TD  class= title>
             ���׷���ֹ��
          </TD>
          <TD  class= input>
            <Input class= "coolDatePicker" dateFormat="short" name="EndDate1" verify="���׷���ֹ��|DATE" >
          </TD>
        </TR>
      </table>
      <BR>
      <TD class=button>
          <input type =button class=cssbutton value="��    ѯ" onclick="QueryGrid();">
          <INPUT VALUE="��  ��" TYPE=button onclick="resetform1();" class="cssButton">
     </TD>
    </Div>
    </br>
     <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divAgent11);">
    		</td>
    		 <td class= titleImg>
        		��ѯ���
       		 </td>
    	</tr>
    </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divTasksGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanTasksGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageTasksGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <br>
        </div>
        <br>
    </form>
    
  <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>