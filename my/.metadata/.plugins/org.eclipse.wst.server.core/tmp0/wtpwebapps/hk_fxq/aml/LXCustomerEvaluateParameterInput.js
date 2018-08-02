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