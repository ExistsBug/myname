//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageCustmoerGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageHCustmoerGrid = new turnPageClass();
var turnPageLCustmoerGrid = new turnPageClass();
/*============================================================================*/

/**
 * 提交后操作, 服务器数据返回后执行的操作
 */
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

function easyQueryData()
{
		if(fm.AppntNo.value==""&&fm.Level.value==""&&fm.StatiCode.value==""&&fm.StartDate.value==""&&fm.EndDate.value=="")
		{
			alert("数据量非常大,请输入查询条件!");
			return false;
		}
		if(fm.StartDate.value==""&&fm.EndDate.value=="")
		{
			if(!confirm("数据量可能非常大,不输入时间段?"))
			{
				return false;
			}
		}

    var QuerySQL = "select (select Name from LDCom where ComCode=Managecom),AppntNo, "
                 +        "AppntName, "
                 +        "(select CodeName from LDCode where CodeType='hazardlevel' and Code=AppntLevel), "
                 +        "ContNo, "
                 +        "Score, "
                 +        "PreFee, "          
                 +        "RiskName "
                 +    "from LXCustomerLevel a "
                 +    "where 1 = 1 "
                 +     getWherePart("a.AppntNo", "AppntNo")
                 +     getWherePart("a.AppntLevel", "Level")
                 +     getWherePart("a.ManageCom", "StatiCode","like")
                 +     getWherePart("a.SignDate", "StartDate",">=")
                 +     getWherePart("a.SignDate", "EndDate","<=")
                 +    " order by AppntNo,ContNo"
    try
    {
        turnPageCustmoerGrid.queryModal(QuerySQL, CustmoerGrid,1,1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}











/*============================================================================*/

/**
 * 查询可选上报报文信息
 */
function queryCustmoerGrid(temp)
{
		var ob = {};
		if('fee'==temp)
		{
		    ob.busicode = 'prefee';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('isreport'==temp)
		{
		    ob.busicode = 'rpttype';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('busi'==temp)
		{
		    ob.busicode = 'businesstype';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('risk'==temp)
		{
		    ob.busicode = 'risk';
		    ob.businame = '业务类型';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LMRisk';
		    ob.code     = 'RiskCode';
		    ob.cname    = 'RiskName';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('managecom'==temp)
		{
		    ob.busicode = 'managecom';
		    ob.businame = '投保地域';
		    ob.weight   = '0.07';
		    ob.table    = 'htlis.LDCom';
		    ob.code     = 'ComCode';
		    ob.cname    = 'Name';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('paymode'==temp)
		{
		    ob.busicode = 'paymode';
		    ob.businame = '缴费方式';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'payintv';
		}
    var QuerySQL = "select ParameterType, "
                 +        "ParemeterName, "
                 +        "ParameterCode, "
                 +        "ParameterSName, "
                 +        "HazardScore, "
                 +        "(select CodeName from LDCode where CodeType='hazard' and Code=HazardScore), "          
                 +        "HazardWeight "
                 +    "from HazardInfo a "
                 +    "where 1 = 1 "
                 +     "and ParameterType = '"+ob.busicode+"' and HazardScore=0";

    
    try
    {
        turnPageCustmoerGrid.queryModal(QuerySQL, CustmoerGrid,0,1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}
function queryHCustmoerGrid(temp)
{

		var ob = {};
		if('fee'==temp)
		{
		    ob.busicode = 'prefee';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('isreport'==temp)
		{
		    ob.busicode = 'rpttype';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('busi'==temp)
		{
		    ob.busicode = 'businesstype';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('risk'==temp)
		{
		    ob.busicode = 'risk';
		    ob.businame = '业务类型';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LMRisk';
		    ob.code     = 'RiskCode';
		    ob.cname    = 'RiskName';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('managecom'==temp)
		{
		    ob.busicode = 'managecom';
		    ob.businame = '投保地域';
		    ob.weight   = '0.07';
		    ob.table    = 'htlis.LDCom';
		    ob.code     = 'ComCode';
		    ob.cname    = 'Name';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('paymode'==temp)
		{
		    ob.busicode = 'paymode';
		    ob.businame = '缴费方式';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'payintv';
		}
    var QuerySQL = "select ParameterType, "
                 +        "ParemeterName, "
                 +        "ParameterCode, "
                 +        "ParameterSName, "
                 +        "HazardScore, "
                 +        "(select CodeName from LDCode where CodeType='hazard' and Code=HazardScore), "          
                 +        "HazardWeight "
                 +    "from HazardInfo a "
                 +    "where 1 = 1 "
                 +     "and ParameterType = '"+ob.busicode+"' and HazardScore=2";

    
    try
    {
        turnPageHCustmoerGrid.queryModal(QuerySQL, HCustmoerGrid,0,1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}
function queryLCustmoerGrid(temp)
{

		var ob = {};
		if('fee'==temp)
		{
		    ob.busicode = 'prefee';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('isreport'==temp)
		{
		    ob.busicode = 'rpttype';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('busi'==temp)
		{
		    ob.busicode = 'businesstype';
		    ob.businame = '客户行业';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('risk'==temp)
		{
		    ob.busicode = 'risk';
		    ob.businame = '业务类型';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LMRisk';
		    ob.code     = 'RiskCode';
		    ob.cname    = 'RiskName';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('managecom'==temp)
		{
		    ob.busicode = 'managecom';
		    ob.businame = '投保地域';
		    ob.weight   = '0.07';
		    ob.table    = 'htlis.LDCom';
		    ob.code     = 'ComCode';
		    ob.cname    = 'Name';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('paymode'==temp)
		{
		    ob.busicode = 'paymode';
		    ob.businame = '缴费方式';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'payintv';
		}
    var QuerySQL = "select ParameterType, "
                 +        "ParemeterName, "
                 +        "ParameterCode, "
                 +        "ParameterSName, "
                 +        "HazardScore, "
                 +        "(select CodeName from LDCode where CodeType='hazard' and Code=HazardScore), "          
                 +        "HazardWeight "
                 +    "from HazardInfo a "
                 +    "where 1 = 1 "
                 +     "and ParameterType = '"+ob.busicode+"' and HazardScore=1";

    
    try
    {
        turnPageLCustmoerGrid.queryModal(QuerySQL, LCustmoerGrid,0,1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}
function syncdata()
{
    var MsgContent = "正在同步数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
		fm.action = "LXCustomerEvaluateParameterSave.jsp?oper=sync";
		fm.submit();
}
function updatedata(temp)
{
		
    var MsgContent = "正在操作数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");

		fm.action = "LXCustomerEvaluateParameterSave.jsp?oper="+temp;

		fm.submit();
}
function calData()
{

    var MsgContent = "正在操作数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");

		fm.action = "LXCustomerEvaluateParameterSave.jsp?oper=cal";

		fm.submit();
}
function MakeExcel()
{
    var QuerySQL = "select (select Name from LDCom where ComCode=Managecom),AppntNo, "
                 +        "AppntName, "
                 +        "(select CodeName from LDCode where CodeType='hazardlevel' and Code=AppntLevel), "
                 +        "ContNo, "
                 +        "Score, "
                 +        "PreFee, "          
                 +        "RiskName "
                 +    "from LXCustomerLevel a "
                 +    "where 1 = 1 "
                 +     getWherePart("a.AppntNo", "AppntNo")
                 +     getWherePart("a.AppntLevel", "Level")
                 +     getWherePart("a.ManageCom", "StatiCode","like")
                 +     getWherePart("a.SignDate", "StartDate",">=")
                 +     getWherePart("a.SignDate", "EndDate","<=")
                 +    " order by AppntNo,ContNo"
	 var COL = "序号,管理机构,客户号,客户名称,风险等级,保单号,保单风险得分,保单金额,主险";
	 var SQLCHECK = "select Count(AppntNo) "
                 +    "from LXCustomerLevel a "
                 +    "where 1 = 1 "
                 +     getWherePart("a.AppntNo", "AppntNo")
                 +     getWherePart("a.AppntLevel", "Level")
                 +     getWherePart("a.ManageCom", "StatiCode","like")
                 +     getWherePart("a.SignDate", "StartDate",">=")
                 +     getWherePart("a.SignDate", "EndDate","<=")
                 +    " order by AppntNo,ContNo" 
   var rowNum = CustmoerGrid.mulLineCount;
   if(rowNum>0) 
   {
      fm.action = "./LXCustomerEvaluateParameterSave.jsp?oper=Export&SQL="+QuerySQL+"&COL="+COL+"&SQLCHECK="+SQLCHECK;
      //alert(fm.action);
      fm.submit();
   }
   else 
   {
      alert('没有数据，请先查询');
   }
}