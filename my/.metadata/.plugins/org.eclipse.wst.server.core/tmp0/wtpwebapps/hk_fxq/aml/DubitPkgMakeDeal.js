/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-11
 * @direction: 可疑交易报文包生成主脚本
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                              //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                        //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBePackageGrid = new turnPageClass();    //全局变量, 可选上报报文包查询结果翻页
var turnPageAlreadyInPackageGrid = new turnPageClass();    //全局变量, 已选上报报文包查询结果翻页

/*============================================================================*/

/**
 * 提交后操作, 服务器数据返回后执行的操作
 */
function afterSubmit(DealFlag, MsgContent, OtherInfo)
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
    //本包的特殊处理
    if (DealFlag == "succ" || DealFlag == "success")
    {
        var sOperation;
        try
        {
            sOperation = document.getElementsByName("Operation")[0].value;
        }
        catch (ex) {}
        if (sOperation != null && (sOperation.trim() == "AddToInPackageFile" || sOperation.trim() == "DeleteInPackageFile"))
        {
            try
            {
                queryWaitForBePackageGrid();
                queryAlreadyInPackageGrid();
            }
            catch (ex) {}
        }
        else if (sOperation.trim() == "MakeAllInPackageFile")
        {
            try
            {
                if (OtherInfo != null && OtherInfo.trim() != "")
                {
                    document.getElementsByName("ResendPackageNo")[0].value = OtherInfo;
                }
                showResendPackageInfo();
                checkDownloadState();
                queryAlreadyInPackageGrid();
                top.opener.queryFilePkgGrid();
            }
            catch (ex) {}
        }
    }
}

/*============================================================================*/

/**
 * 检查当前报文包是否可以下载
 */
function checkDownloadState()
{
    var sDataType, sResendPackageNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sResendPackageNo = document.getElementsByName("ResendPackageNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL, arrResult;
    QuerySQL = "select 'X' "
             +   "from LXReportDataPacket a "
             +  "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "02" && sResendPackageNo != null && sResendPackageNo.trim() != "")
    {
        QuerySQL += "and a.PackageNo = '" + sResendPackageNo + "' "
    }
    else
    {
        QuerySQL += getWherePart("a.PackageNo", "PackageNo")
    }
    QuerySQL +=   "and a.DealState = '02' "
             +    "and a.PackageName is not null";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("警告：查询当前报文包下载状态出现异常！ ");
        return;
    }
    if (arrResult != null)
    {
        try
        {
            document.getElementsByName("btnAddToInPackageFile")[0].disabled = true;
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = true;
            document.getElementsByName("btnMakePackageFile")[0].disabled = true;
            document.getElementsByName("btnDownloadFilePkg")[0].disabled = false;
            if (sDataType != null && sDataType.trim() == "02")
            {
                document.all("divResendPackageTitle").style.display = "block";
                document.all("divResendPackageInput").style.display = "block";
            }
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnAddToInPackageFile")[0].disabled = false;
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = false;
            document.getElementsByName("btnMakePackageFile")[0].disabled = false;
            document.getElementsByName("btnMakePackageFile")[0].disabled = false;
            document.getElementsByName("btnDownloadFilePkg")[0].disabled = true;
            if (sDataType != null && sDataType.trim() == "02")
            {
                document.all("divResendPackageTitle").style.display = "none";
                document.all("divResendPackageInput").style.display = "none";
            }
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * 不同报文包类型分别处理
 */
function checkDataTypeState()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}

    if (sDataType != null && sDataType.trim() == "02")
    {
        try
        {
            document.all("divNotResendLayer").style.display = "none";
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = true;
            queryAlreadyInPackageGrid();
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.all("divNotResendLayer").style.display = "block";
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * 查询可选上报报文信息
 */
function queryWaitForBePackageGrid()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    var QuerySQL = "select a.FileNo, "
                 +        "a.FileName, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "(case when a.AttaName is not null then '有' else '无' end), "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1  "
                // +      getWherePart("a.ManageCom", "ManageCom", "like");
    if (sDataType != null && sDataType.trim() == "01")
    {
        QuerySQL +=    "and a.DataType = '01' and a.dealstate not in ('04','05') ";    //正常
    }
    else if (sDataType.trim() == "02")
    {
        QuerySQL +=    "and 1 = 2 ";    //重发(不显示可选报文)
    }
    else if (sDataType.trim() == "03")
    {
    		<!--add by jinsh 反洗钱接口升级 下面的查询条件进行了变更-->
        QuerySQL +=    " and a.DataType in ('02', '03','04','05') ";    //特殊and not exists (select 'X' from LXReportDetail z where z.DealNo is not null and z.FileNo=a.FileNo and a.DataType = '02')
    }
        QuerySQL +=    " and a.ReportType = '02' "
//                 +     "and ((a.PackageNo is null and a.DealState = '01') or "
//                 +          "(a.PackageNo is not null and a.DealState in ('01','04', '05'))) "
                 + "    and ((a.packageno is null) "
                 + " or (a.packageno is not null and exists (select 'X' from lxreportdatapacket p "
                 + " where p.packageno = a.packageno and p.packagename is null and a.packageno!='"+fm.PackageNo.value+"'))) " 
                 +     "and not (a.DealState in ('04', '05') and a.DataType = '03') and a.filename is not null "
                 +      getWherePart("a.FileNo", "FileNo1")
                 +      getWherePart("a.MakeDate", "StartDate1", ">=")
                 +      getWherePart("a.MakeDate", "EndDate1", "<=")
                 +   "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageWaitForBePackageGrid.pageDivName = "divTurnPageWaitForBePackageGrid";
        turnPageWaitForBePackageGrid.queryModal(QuerySQL, WaitForBePackageGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}

/*============================================================================*/

/**
 * 查询已选上报报文信息
 */
function queryAlreadyInPackageGrid()
{
    var sResendPackageNo;
    try
    {
        sResendPackageNo = document.getElementsByName("ResendPackageNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.FileNo, "
                 +        "a.FileName, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "(case when a.AttaName is not null then '有' else '无' end), "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '02' ";
    if (sResendPackageNo != null && sResendPackageNo.trim() != "")
    {
        QuerySQL +=     getWherePart("a.PackageNo", "ResendPackageNo");
    }
    else
    {
        QuerySQL +=     getWherePart("a.PackageNo", "PackageNo");
    }
        QuerySQL +=     getWherePart("a.FileNo", "FileNo2")
                 +      getWherePart("a.MakeDate", "StartDate2", ">=")
                 +      getWherePart("a.MakeDate", "EndDate2", "<=");
        if (fm.DataType.value == "02")
        {//modify by huangchong  
        	QuerySQL += " and a.DealState = '04'";
        	//end 
        }                 
        QuerySQL +=   " order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageAlreadyInPackageGrid.pageDivName = "divTurnPageAlreadyInPackageGrid";
        turnPageAlreadyInPackageGrid.queryModal(QuerySQL, AlreadyInPackageGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询已选上报报文信息出现异常！ ");
    }
}

/*============================================================================*/

/**
 * 添加可选上报报文到已上报报文
 */
function addToInPackageFile()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        alert("可疑重发报文包不允许添加新报文！ ");
        return;
    }
    else
    {
        var nCheckCount = 0;
        try
        {
            nCheckCount = WaitForBePackageGrid.getChkCount();
        }
        catch (ex) {}
        if (nCheckCount == null || nCheckCount <= 0)
        {
            alert("请先查询并选择您要添加的报文！ ");
            return;
        }
        else
        {
            var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
            var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
            showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            try
            {
                document.getElementsByName("Operation")[0].value = "AddToInPackageFile";
            }
            catch (ex) {}
            document.forms(0).action = "DubitPkgMakeDealSave.jsp";
            document.forms(0).submit();
        }
    }
}

/*============================================================================*/

/**
 * 撤销已选上报报文到已上报报文
 */
function deleteInPackageFile()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        //重发报文包不允许撤销
        alert("可疑重发报文包不允许撤销原报文！ ");
        return;
    }
    else
    {
        var nCheckCount = 0;
        try
        {
            nCheckCount = AlreadyInPackageGrid.getChkCount();
        }
        catch (ex) {}
        if (nCheckCount == null || nCheckCount <= 0)
        {
            alert("请先查询并选择您要撤销的报文！ ");
            return;
        }
        else
        {
            var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
            var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
            showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            try
            {
                document.getElementsByName("Operation")[0].value = "DeleteInPackageFile";
            }
            catch (ex) {}
            document.forms(0).action = "DubitPkgMakeDealSave.jsp";
            document.forms(0).submit();
        }
    }
}

/*============================================================================*/

/**
 * 生成上报报文信息
 */
function makeAllInPackageFile()
{
    var QuerySQL, arrResult;
    QuerySQL = "select count(*) "
             +   "from LXReportDataFile a "
             +  "where 1 = 1 "
             +     getWherePart("a.PackageNo", "PackageNo")
             +    "and a.ReportType = '02'";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("警告：查询上报明细数据表表出现异常！ ");
        return;
    }
    if (arrResult == null || arrResult[0] == "0")
    {
        alert("请先添加您要生成报文包的报文！ ");
        return;
    }
    else
    {
        var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "MakeAllInPackageFile";
        }
        catch (ex) {}
        document.forms(0).action = "DubitPkgMakeDealSave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * 下载生成的上报报文信息
 */
function downAllInPackageFile()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}

    var QuerySQL, arrResult;
    QuerySQL = "select PackageName "
             +   "from LXReportDataPacket a "
             +  "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL += getWherePart("a.PackageNo", "ResendPackageNo")
    }
    else
    {
        QuerySQL += getWherePart("a.PackageNo", "PackageNo")
    }
    QuerySQL +=   "and a.DealState = '02'";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("警告：查询当前报文包下载状态出现异常！ ");
        return;
    }
    if (arrResult == null || trim(arrResult[0]) == "")
    {
        alert("查询获取当前报文包下载地址失败！ ");
        return;
    }
    else
    {
        var sZIPFileName = arrResult[0];
        window.open("send/" + sZIPFileName);
    }
}

/*============================================================================*/

/**
 * 如果是重发数据包, 显示新的层
 */
function showResendPackageInfo()
{
    try
    {
        document.all("divResendPackageTitle").style.display = "block";
        document.all("divResendPackageInput").style.display = "block";
    }
    catch (ex) {}
}

/*============================================================================*/

/**
 * 返回主界面
 */
function returnParent()
{
    try
    {
        top.close();
        top.opener.focus();
    }
    catch (ex) {}
}

/*============================================================================*/


//<!-- JavaScript Document END -->
