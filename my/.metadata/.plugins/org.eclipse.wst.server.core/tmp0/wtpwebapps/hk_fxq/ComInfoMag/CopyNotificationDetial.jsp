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
   String IDX1= request.getParameter("IDX");
  String tInfoStyle2 = request.getParameter("infoStyle");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
   var tIDX="<%=IDX1%>"; 
  var tInfoStyle="<%=tInfoStyle2%>";
</script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>֪ͨ��ϸ��Ϣ</title>
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
		<%@ include file="LXPolicRulmageDetialInit.jsp" %>
			<SCRIPT src="LXPolicRulmageDetial.js"></SCRIPT>
	</head>
	<body onload="initForm(); initElementtype();">
		<form action="./NotificationSave.jsp" name="fm" method="post" target="fraSubmit">
			<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery2);">
					</td>
					<td class=titleImg>
						֪ͨ��ϸ��Ϣ
					</td>
				</tr>
			</table>
		<Div id="divQuery2" style="display: ''">
				<table class=common border=0>
					<TR>
						<TD class=title>
							������λ
						</TD>
						<TD  class= "input">
						<Input class=codeno name="MangeCom" readonly 
							" 
							
						"><input class=codename name="MangeComName" readonly=true>
						</TD>
						<TD class="title" />
							�ĺ�
						</TD>
						<TD class="input"/>
                    		<input name="RefNum" id="RefNum" class="common"  />
                		</TD>
					</TR>
					<TR>
						<TD class="title" />
							��������
						</TD>
						<TD class="input"/>
                    		<input name="PubObj" id="PubObj" class="common"  />
                		</TD>
                		<TD class="title" />
							��������
						</TD>
						<TD class="input" />
							 <input name="TitleName" id="TitleName" class="common"  />
						</TD>
					</TR>
					<TR>
                		<TD class="title" />
							��������
						</TD>
						<TD class="input" colspan=8 >
							<textarea style="width: 83%;height:50" name="PubCont" id="PubCont"
								class="common" verify="��������|len<=200"
								 /></textarea>
						</TD>
					</TR>
				</table>
				 </div>   
			</div>
			<INPUT class=cssButton VALUE="��  �� " name="return" TYPE=button
				onclick="GoToReturn()" />
				<INPUT class=cssButton VALUE=" ���ظ��� " name="DownLoad" TYPE=button
				onclick="GoToDownLoad(this.name)" />
			<br/>
		</form>
		<span id="spanCode" style="display: none; position: absolute;"></span>
	</body>
</html>
