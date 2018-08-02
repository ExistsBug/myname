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

var showInfo;                                     //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();               //全局变量, 查询结果翻页, 必须有
var turnPageFilePkgGrid = new turnPageClass();    //全局变量, 已申请报文查询结果翻页

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
            //showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
    //本包的特殊处理
    if (DealFlag == "succ" || DealFlag == "success")
    {
        dealTheNewApply();
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
            document.getElementsByName("btnApplyANewPkg")[0].disabled = true;
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnApplyANewPkg")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * 申请一个新的报文包
 */
function applyANewFilePkg()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        alert("可疑重发报文包不允许直接申请！ ");
        return;
    }
    else
    {
        var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "ApplyPackageNo";
        }
        catch (ex) {}
        document.forms(0).action = "DubitMsgPkgApplySave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * 申请成功之后马上弹出界面处理该任务
 */
function dealTheNewApply()
{
    try
    {
        queryFilePkgGrid();
        if (FilePkgGrid.mulLineCount > 0)
        {
            FilePkgGrid.selOneRow(1);
            dealTheFilePkg();
        }
    }
    catch (ex) {}
}

/*============================================================================*/

/**
 * 查询已申请上报报文包信息
 */
function queryFilePkgGrid()
{
    var sDataType, sFileNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sFileNo = document.getElementsByName("FileNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.PackageNo, "
                 +        "a.DataType, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "a.Operator "
                 +    "from LXReportDataPacket a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '02' ";
                 //+      getWherePart("a.ManageCom", "ManageCom", "like");
    if (sDataType != null && sDataType.trim() == "01")
    {
        QuerySQL +=    "and a.DataType = '01' "
                 +     "and a.DealState = '01' ";
    }
    else if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL +=    "and a.DataType in ('01', '02') "
                 +     "and a.DealState in ('04', '05') ";
    }
    else if (sDataType != null && sDataType.trim() == "03")
    {
        QuerySQL +=    "and a.DataType = '03' "
                 +     "and a.DealState = '01' ";
    }
        QuerySQL +=     getWherePart("a.PackageNo", "PackageNo")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=");
    if (sFileNo != null && sFileNo.trim() != "")
    {
        QuerySQL +=    "and a.PackageNo in "
                 +         "(select PackageNo "
                 +            "from LXReportDataFile "
                 +           "where 1 = 1 "
                 +             "and FileNo = '" + sFileNo + "') ";
    }
        QuerySQL +=  "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageFilePkgGrid.pageDivName = "divTurnPageFilePkgGrid";
        turnPageFilePkgGrid.queryModal(QuerySQL, FilePkgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询已申请上报报文包出现异常！ ");
    }
}

/*============================================================================*/

/**
 * 处理已申请上报报文信息
 */
function dealTheFilePkg()
{
    var nSelNo;
    try
    {
        nSelNo = FilePkgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    {
        alert("请先查询并选择您要处理的报文包！ ");
        return;
    }
    else
    {
        var sDataType, sPackageNo;
        try
        {
            sDataType = document.getElementsByName("DataType")[0].value;
            sPackageNo = FilePkgGrid.getRowColData(nSelNo, 1);
        }
        catch (ex) {}
        if (sPackageNo == null || sPackageNo.trim() == "")
        {
            alert("请先选择一个有效的报文包编号！ ");
            return;
        }
        else
        {
            var sOpenWinURL = "DubitPkgMakeDealMain.jsp";
            var sParameters = "DataType=" + sDataType + "&PackageNo=" + sPackageNo;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "上报报文包处理", "left");
        }
    }
}

/*============================================================================*/


//<!-- JavaScript Document END -->
