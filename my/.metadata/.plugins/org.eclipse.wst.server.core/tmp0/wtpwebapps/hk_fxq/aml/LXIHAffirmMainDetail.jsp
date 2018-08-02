<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//程序名称：
//程序功能：
//创建日期：2002-08-21 09:25:18
//创建人 ：HX
//更新记录： 更新人  更新日期   更新原因/内容
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
  String operator = tGI.Operator;   //记录操作员
  String manageCom = tGI.ManageCom; //记录管理机构
  String comcode = tGI.ComCode;     //记录登陆机构
  String tCustomerNo = new String(request.getParameter("CustomerNo"));
  String tDealNo = new String(request.getParameter("DealNo"));
  String tDate = new String(request.getParameter("Date"));
  String tOper = new String(request.getParameter("Oper"));
  String tCRCD = new String(request.getParameter("CRCD"));
  String tTSDT = new String(request.getParameter("TSDT"));
  //System.out.println("============================" + tCRCD);
%>
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
<SCRIPT src="LXBigTransManualDetail.js"></SCRIPT>
</head>

<body onload="initElementtype();">
<form action="./LXBigTransManualDetailSave.jsp" method=post name=fm target="fraSubmit" >
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<jsp:include page="BigTransDetailPage.jsp"/>

        <input type="hidden" name="hideOperate" id="hideOperate" value="" />
        <input type="hidden" name="cDate" id="cDate" value="<%=tDate%>" />
        <input type="hidden" name="DealNo" id="DealNo" value="<%=tDealNo%>" />
        <input type="hidden" name="CustomerNo" id="CustomerNo" value="<%=tCustomerNo%>" />
        <input type="hidden" name="Oper" id="Oper" value="<%=tOper%>" />
        <input type="hidden" name="CRCD1" id="CRCD1" value="<%=tCRCD%>" />
        <input type="hidden" name="TSDT1" id="TSDT1" value="<%=tTSDT%>" />
        <INPUT class=cssButton VALUE=" 添加大额交易 " name="subbutton" type="hidden" onclick="return submitForm();" />
        <INPUT class=cssButton VALUE=" 返回 " name="return" TYPE=button onclick="return GoToReturn();" />
<script>
    var tOper = fm.all("Oper").value;
    var tCRCD = fm.all("CRCD1").value;
    var tTSDT = fm.all("TSDT1").value;
    //alert(tCRCD);
    var element = document.getElementsByName("subbutton")[0];

    if (tOper == "insert"){
        element.value = " 添加大额交易 ";
        fm.all("hideOperate").value = "INSERT||DETAIL";
    } else{
        if (tOper == "update"){
            element.value = " 保存大额交易 ";
            fm.all("hideOperate").value = "UPDATE||DETAIL";
        } else if (tOper == "delete"){
            element.value = " 删除大额交易 ";
            fm.all("hideOperate").value = "DELETE||DETAIL";
        }
        //查询结果
        var strSQL = "select * from LXIHTradeDetail where DealNo = '" + fm.all("DealNo").value
            + "' and CRCD = '" + tCRCD + "' and TSDT = '" + tTSDT + "' ";
        var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
        var arr = decodeEasyQueryResult(strQueryResult);
    //  alert(arr);
        fm.all("DealNo").value=arr[0][0];
        fm.all("CRCD").value=arr[0][1];
        fm.all("TSDT").value=arr[0][2];
        fm.all("FINN").value=arr[0][3];
        fm.all("FIRC").value=arr[0][4];
        fm.all("RLTP").value=arr[0][5];
        fm.all("FICT").value=arr[0][6];
        fm.all("FINC").value=arr[0][7];
        fm.all("CATP").value=arr[0][8];
        fm.all("CTAC").value=arr[0][9];
        fm.all("TBNM").value=arr[0][10];
        fm.all("TBIT").value=arr[0][11];
        fm.all("TBID").value=arr[0][12];
        fm.all("TBNT").value=arr[0][13];
        fm.all("TSTM").value=arr[0][14];
        fm.all("TICD").value=arr[0][15];
        fm.all("TSTP").value=arr[0][16];
        fm.all("TSCT").value=arr[0][17];
        fm.all("TSDR").value=arr[0][18];
        fm.all("TDRC").value=arr[0][19];
        fm.all("TRCD").value=arr[0][20];
        fm.all("CRPP").value=arr[0][21];
        fm.all("CRTP").value=arr[0][22];
        fm.all("CRAT").value=arr[0][23];
        fm.all("CFIN").value=arr[0][24];
        fm.all("CFCT").value=arr[0][25];
        fm.all("CFIC").value=arr[0][26];
        fm.all("TCNM").value=arr[0][27];
        fm.all("TCIT").value=arr[0][28];
        fm.all("TCID").value=arr[0][29];
        fm.all("TCAT").value=arr[0][30];
        fm.all("TCAC").value=arr[0][31];
        fm.all("DATASOURCE").value=arr[0][32];
    }


</script>

    <br />

</form>
<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>