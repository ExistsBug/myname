<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：OrphanPolOutInit.jsp
//程序功能：
//创建日期：2005-05-26 15:39:06
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<script language="JavaScript">
function initForm()
{
  try
  { 
  	initInpBox();
  }
  catch(re)
  {
    alert("在SysVarMainInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//查询合同信息
function initInpBox(){
	
	      var strSQL = "select sysvarvalue from ldsysvar where sysvar in ('amlRINM','amlRICD','amlFIRC','amlFICT','amlFICD','amlCPNM','amlCTTL','amlFIAR','amlFCEI') order by sysvar";
		  	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//判断是否查询成功
			if (!strQueryResult) {
				alert("查询失败！");
				return false;
			}
		  	var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("CPNM").value = arrSelected[0][0];
				fm.all("CTTL").value = arrSelected[1][0];
				fm.all("FCEI").value = arrSelected[2][0];
				fm.all("FIAR").value = arrSelected[3][0];
				fm.all("FICD").value = arrSelected[4][0];
				fm.all("FICT").value = arrSelected[5][0];
				fm.all("FIRC").value = arrSelected[6][0];
				fm.all("RICD").value = arrSelected[7][0];
				fm.all("RINM").value = arrSelected[8][0];
			
				return true;
		}
		function afterSubmit(DealFlag, MsgContent)
{   
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
}
</script>