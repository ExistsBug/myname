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
    	<!-- �������ýű� -->
         <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
        <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
        <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
         <SCRIPT src="../common/javascript/Common.js"></SCRIPT>
         <SCRIPT src="LAComTellerInput.js"></SCRIPT>
         <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
         <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
         <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
	      <!-- ����������ʽ -->
         <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
         <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
         <!-- ˽�����ýű� -->
          <SCRIPT src="LXKnowledgeFieldInput.js"></SCRIPT>
         <%@include file="LXKnowledgeFieldInit.jsp"%>
       </head>
        <body onload="initForm();initElementtype();"> <!-- encType="multipart/form-data" -->
              <form action="./LXKnowledgeFieldSave.jsp"  method=post name=fm target="fraSubmit" ENCTYPE="multipart/form-data">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>֪ʶ԰��¼�����</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
    <!--  
	<TD class="title" />��������</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true elementtype=nacessary></TD> 	
   	-->
   	<!--  
   	<TD class="title" />�������</TD>
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true elementtype=nacessary></TD> 
      -->
 
      	<TD class="title" />��������</TD>
   	<TD class= input><Input class=codeno name="ManageCom" verify="��������|notnull"><input class=codename name="ManageComName" readonly=true elementtype=nacessary></TD> 
 
    <TD class="title" />����</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="����ؼ���|notnull&len<=120"  elementtype=nacessary/></TD>
   </TR>	
   	<TR>
		<!--  
     <TD class="title" />����״̬</TD>
	<TD  class= "input"><Input class=codeno name="State" 
						onDblClick="return showCodeList('datastate',[this,StateName],[0,1]);" 
						onKeyUp="return showCodeListKey('datastate',[this,StateName],[0,1]);"><input class=codename name="StateName" readonly=true elementtype=nacessary></TD> 	
	-->
	</TR>
	<tr>
	 <Div id="divUpload" style="display: ''">
	   <table class="common">
		 <TR class="common">
		 <TD class="title" style="width: 17%">�����ϴ�</TD>
		 <TD class=common><Input class=common3 style="width: 39%" type="file"name="FileName" id="FileName" elementtype=nacessary></TD>
		 </TR>

	  </table>
	 </div>
	
     <tr><br/></tr>
		<tr >
			<td class=button >
			</td>
			<td class=button align=right>	  
				<INPUT class=cssButton name="addbutton" VALUE="��  ��"  TYPE=button onclick="return addClick();">
			</td>
			<td class=button width="10%" align=right>
				<INPUT class=cssButton name="updatebutton" VALUE="��  ��"  TYPE=button onclick="return updateClick();">
			</td>			
			<td class=button width="10%" align=right>
			
			</td>		
			<td class=button width="10%" align=right>
				<INPUT class=cssButton name="resetbutton" VALUE="��  ��"  TYPE=button onclick="return resetForm();">
			</td>
		</tr>
</table>            
 </Div>
         <input type=hidden  name="Idx" value="">
	      <input type=hidden name=hideOperate value="">
<!--  <input type=hidden  name=hideOperate value=""> -->
           <br/>
           <table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divQuery3);">
					</td>
					<td class=titleImg>
						��ѯ����
					</td>
				</tr>
			</table>
		<Div id="divQuery3" style="display: ''">
           <table class=common border=0>
					<TR>
	                 <TD class="title" />����ؼ���</TD>			
	                 <TD class="input"/><input name="KeyWord2" id="KeyWord2" class="common"  verify="����ؼ���|len<=120"  ></TD>
	                 
	                  <TD class="title" />����״̬</TD>
	                  <TD  class= "input"><Input class=codeno name="State" 
						onDblClick="return showCode(this,StateName);" 
						onKeyUp="return showCodeKey(this,StateName);"><input class=codename name="StateName" readonly=true ></TD> 	
	                 </TR>

				   <TR>
	              <TD  class= title> ͳ������    </TD>
                      <TD  class= input>
                     <Input class= 'coolDatePicker' verify="ͳ������|DATE" name=KDate format='short' > </TD>
                     <TD class="title" /> ͳ��ֹ��</TD>
                      <TD  class= input><Input class= 'coolDatePicker' verify="ͳ��ֹ��|DATE" name=EDate format='short' ></TD>
	                </TR>
	                <!--  
	                
	                 -->

			</table>
			</Div>
			 <INPUT class=cssButton name="querybutton" VALUE="��  ѯ"  TYPE=button onclick="return easyQuery();">
     <br/>
     <br/>
      <table>
	     <tr class=common><td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,div2);"> <input
		  type=hidden name=Operate value=''></td>
		  <td class=titleImg>��ѯ���</td>
	    </tr>
      </table>
    <Div id="divLXKnowledgeGrid style=" display:''" />
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
		<INPUT class=cssButton VALUE=" ɾ  �� " name="deletebutton" TYPE=button onclick="deleteClick()" />
		
		<INPUT class=cssButton VALUE=" �� ��" name="uploadbutton" TYPE=button onclick="uploadClick()" />
		<!--  
		<INPUT class=cssButton VALUE="���ظ��� " name="informbutton" TYPE=button onclick="downloadFile()" /> 
		--> 
		<!-- 
		<INPUT class=cssButton VALUE="ɾ������ " name="deleteloadbutton" TYPE=button onclick="deleteloadFile()" /> 
		 -->
		<INPUT class=cssButton VALUE=" ��  ��" name="publebutton" TYPE=button onclick="publeClick()" />
	    <br/>

	     <div id="divReason" style="display:'none'"> 
		<table>
         	<tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForReasonGrid)"></td>
                <td class="titleImg">����������</td>
         	</tr>
        </table>
        
         <div id="divWaitForReasonGrid" style="display:''">    
		 <table class="common">
                <tr class="common">
                    <td><span id="spanWaitForReasonGrid"></span></td>
                </tr>
            </table>
        
         <div id="divTurnPageWaitForReasonGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageWaitForReasonGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForReasonGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForReasonGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageWaitForReasonGrid.lastPage()">
          </div>
        </div>
      </div>
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
