<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//�������ƣ�LABranchGroupInput.jsp
//�����ܣ�

//�������ڣ�

//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%//��ӵ�����ƣ���½����
	GlobalInput tGI=new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>

     <head>
     <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>֪ʶ԰�ط�����ѯ</title>
		<!-- �������ýű� -->
     		<!-- �������ýű� -->
		<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
		<SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
		<SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
		<SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
		<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
		<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
		<!-- ����������ʽ -->
		<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
		<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
         <!-- ˽�����ýű� -->
          <SCRIPT src="LXKnowledgeFieldQueryInput.js"></SCRIPT>
         <%@include file="LXKnowledgeFieldQueryInit.jsp"%>
       </head>
        <body onload="initForm();initElementtype();"> 
              <form action="./LXKnowledgeFieldSave.jsp"  method=post name=fm target="fraSubmit">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>֪ʶ԰�ط�����ѯ</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
    <!-- 
	<TD class="title" />��������</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true ></TD> 	
   	 -->
   	<TD class="title" />�������</TD>
    
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true ></TD> 
    <TD class="title" />����ؼ���</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="����ؼ���|notnull&len<=120"  /></TD> 
   </TR>	
   	<TR>
	   <TD  class= title> ͳ������    </TD>
          <TD  class= input>
            <Input class= 'coolDatePicker' verify="��������|DATE" name=FDate format='short' > </TD>
        <TD class="title" /> ͳ��ֹ��</TD>
          <TD  class= input><Input class= 'coolDatePicker' verify="����ֹ��|DATE" name=EDate format='short' ></TD>
	</TR>
</table> 

         <INPUT class=cssButton name="querybutton" VALUE="��  ѯ"  TYPE=button onclick="return easyQuery();">
         <INPUT class=cssButton name="querybutton" VALUE="��  ��"  TYPE=button onclick="return resetForm();">
 </Div>
         <input type=hidden    name="Idx" value="">
	      <input type=hidden  name=hideOperate value="">

<!--      <table>-->
<!--	     <tr class=common><td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,div2);"> <input-->
<!--		  type=hidden name=Operate value=''></td>-->
<!--		  <td class=titleImg>��ѯ���</td>-->
<!--	    </tr>-->
<!--      </table>-->
    <Div id="divLXKnowledgeGrid style=" display: ''" />
    	<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery2);">
					</td>
					<td class=titleImg>
						��ѯ���
					</td>
				</tr>
				</table>
        <table class=common>
					<tr class=common>
						<td>
							<span id="spanLXKnowledgeGrid"></span>
						</td>
					</tr>
      </table>
        <div id="divTurnPageLXKnowledgeGrid" style="display: 'none'"align="center">
		<INPUT CLASS=cssButton VALUE="��  ҳ" TYPE=button onclick="turnPageInfo.firstPage();" />
		<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPageInfo.previousPage();" />
		<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPageInfo.nextPage();" />
		<INPUT CLASS=cssButton VALUE="β  ҳ" TYPE=button onclick="turnPageInfo.lastPage();" />
	    </Div>
  </Div>
		 <br/>
	    <br/>
		<INPUT class=cssButton name="querybutton" VALUE="��ѯ���ر�����Ϣ "  TYPE=button onclick="QueryDataReport();">
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
