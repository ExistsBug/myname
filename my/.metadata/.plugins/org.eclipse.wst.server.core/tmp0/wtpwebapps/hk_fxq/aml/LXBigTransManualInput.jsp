<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//�������ƣ�
//�����ܣ�
//�������ڣ�2002-08-21 09:25:18
//������ ��HX
//���¼�¼�� ������  ��������   ����ԭ��/����
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<SCRIPT src="../common/javascript/Common.js" >
</SCRIPT><SCRIPT src="../common/javascript/MulLine.js">
</SCRIPT><SCRIPT src="../common/Calendar/Calendar.js">
</SCRIPT><SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
<SCRIPT src="../common/javascript/VerifyInput.js" ></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<SCRIPT src="LXBigTransManualInput.js"></SCRIPT>
<%@include file="LXBigTransManualInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
<form name="fm" method="post" target="fraSubmit" >
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divQuery);">
            </td>
            <td class= titleImg>
                �ͻ���ѯ
            </td>
        </tr>
    </table>
    <Div id= "divQuery" style= "display: '' ">
        <table class=common border=0>
            <TR class=common>
                <TD class="title" /> �ͻ�����</TD>
                <TD class="input"/>
                    <input name="CSNM" id="CSNM" class="common" />
                </TD>
                <TD class="title" /> �ͻ���</TD>
                <TD class="input"/>
                    <input name="CTNM" id="CTNM" class="common"/>
                </TD>
                <TD class="title" /> ͳ������</TD>
                <TD class="input"/>
                    <Input class='coolDatePicker' name="Date" id="Date" />
                </TD>
            </TR>
            <tr class="common">
								<TD  class=title>�������</TD>
								<TD  class= input><Input class=codeno name="StatiCode" readonly onDblClick="return showCodeList('station46',[this,StatiCodeName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true></TD> 	
                <td class="title"></td>
                <td class="input"></td>
                <td class="title"></td>
                <td class="input"></td>
            </tr>
        </table>
        <INPUT class=cssButton VALUE=" �� ѯ " name="query" TYPE=button onclick="easyQuery()" />
    </div>
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
            </td>
            <td class= titleImg>
                �ͻ���Ϣ
            </td>
        </tr>
    </table>
        <Div  id= "divCustom" style= "display: '' "/>
            <table  class= common>
                <tr  class= common>
                    <td><span id="spanCustomGrid"></span></td>
                </tr>
            </table>
            <div id="divTurnPageCustom" style="display:'none'" align="center" >
                <INPUT CLASS=cssButton VALUE="��  ҳ" TYPE=button onclick="turnPage.firstPage();" />
                <INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage.previousPage();" />
                <INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage.nextPage();" />
                <INPUT CLASS=cssButton VALUE="β  ҳ" TYPE=button onclick="turnPage.lastPage();" />
            </div>
            <br>
            <INPUT class=cssButton VALUE=" �� �� " name="query" TYPE=button onclick="GoToInput()" />
			<INPUT class=cssButton VALUE=" ɾ �� " name="delete" TYPE=button onclick="GoToDelInput()" />
        </Div>
        <input type="hidden" id="cDealNo" name="cDealNo" value="" />
</form>
<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>