<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
//�������ƣ�LXPostInput.jsp
//�����ܣ��Ը�λ��Ϣ�Ĳ���ҳ��
//�������ڣ�2010-04-02 11:15:40
//������ ��Lips
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>���</title>
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
		<script language="JavaScript" src="LXPolicRulcheckInput.js"></script>
		<%@include file="LXPolicRulcheckInit.jsp"%>
	</head>
	<body onload="initForm(); initElementtype();">
		<form name="fm" method="post" target="fraSubmit">
			<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery2);">
					</td>
					<td class=titleImg>
						�ۺ���Ϣ���
					</td>
				</tr>
			</table>
			<Div id="divQuery2" style="display: ''">
				<table class=common border=0>
					<TR>
						<TD class="title" />
							��Ϣ����
						</TD>
						<TD  class= "input">
						<Input class=codeno name="InfoStyleCode" readonly 
							onDblClick="return showCodeList('publishtype',[this,InfoStyle],[0,1]);" 
							onKeyUp="return showCodeListKey('publishtype',[this,InfoStyle],[0,1]);
						"><input class=codename name="InfoStyle" readonly=true elementtype=nacessary></TD> 	
						<TD class="title" />
							�ϱ�����
						</TD>
						<TD  class= "input">
						<Input class=codeno name="ManageComCode" readonly 
							onDblClick="return showCodeList('station',[this,ManageCom],[0,1]);" 
							onKeyUp="return showCodeListKey('station',[this,ManageCom],[0,1]);
						"><input class=codename name="ManageCom" readonly=true ></TD> 	
						
					</TR>
					<TR>
						<TD class="title" />ͳ������</TD>
                 		<TD class="input"/>
                    		<Input class='coolDatePicker' name="StartDate" id="StartDate"   verify="��������|DATE"   />
                		</TD>
                		<TD class="title" />ͳ��ֹ��</TD>
                 		<TD class="input"/>
                    		<Input class='coolDatePicker' name="EndDate" id="EndDate"   verify="����ֹ��|DATE"   />
                		</TD>
					</TR>
					<TR>
						<TD class="title" />
							����ؼ���
						</TD>
						<TD class="input" />
							 <input name="HeadLine" id="HeadLine" class="common"  verify="����ؼ���|len<=20"  />
						</TD>
						<TD class="title" /> 
							�������
						</TD>
                        <TD  class= "input">
							<Input class=codeno name="State" readonly 
								onDblClick="return showCodeb(this,StateName);" 
								onKeyUp="return showCodeKeyb(this,StateName);
							"><input class=codename name="StateName" readonly >
						</TD>
					</TR>
				</table>
			</div>
			<br/>
			<INPUT class=cssButton VALUE=" ��  ѯ " name="query" TYPE=button
				onclick="easyQuery();" />
			<INPUT class=cssButton VALUE=" �� �� " name="delete" TYPE=button
				onclick="setEmpty(this.name)" />
			<br/>
			<br/>
			<Div id="divLXPolicRulcheckGrid style=" display: ''" />
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
							<span id="spanLXPolicRulcheckGrid"></span>
						</td>
					</tr>
				</table>
				<div id="divTurnPageLXPolicRulcheckGrid" style="display: 'none'"
					align="center">
					<INPUT CLASS=cssButton VALUE="��  ҳ" TYPE=button
						onclick="turnPageInfo.firstPage();" />
					<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button
						onclick="turnPageInfo.previousPage();" />
					<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button
						onclick="turnPageInfo.nextPage();" />
					<INPUT CLASS=cssButton VALUE="β  ҳ" TYPE=button
						onclick="turnPageInfo.lastPage();" />
				</div>
				<br/>
					<INPUT class=cssButton VALUE=" �鿴��ϸ��Ϣ " name="query" TYPE=button
				onclick="queryDetailInfo(this.name)" />
				<INPUT class=cssButton VALUE=" ���ظ��� " name="DownLoad" TYPE=button
				onclick="GoToDownLoad(this.name)" />
			 <br/><br/>
		<table>
         	<tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divreasonofcancelreport)"></td>
                <td class="titleImg">������</td>
         	</tr>
        </table>
       
		<div id="divreasonofreport" style="display:''">
		<table class="common">    	
	       <tr>
	          <td class="input" colspan=8 >
	          	<textarea style="width:97%"  name="CheckOption" id="CheckOption" class="common" elementtype=nacessary verify="������|notnull&len<=200"/></textarea>
		      </td>
	        </tr>
        </table>
        </div>
        <br/>
				<INPUT class=cssButton VALUE="���ͨ��" name="Pass" TYPE=button
				onclick="GoToCheckPass(this.name)" />
				<INPUT class=cssButton VALUE="��˲�ͨ��" name="NoPass" TYPE=button
				onclick="GoToCheckNo(this.name)" />
				<INPUT class=cssButton VALUE="�����޸�" name="ReturnModify" TYPE=button
				onclick="GoToReturnModify(this.name)" />
			</Div>
		</form>
		<span id="spanCode" style="display: none; position: absolute;"></span>
	</body>
</html>
