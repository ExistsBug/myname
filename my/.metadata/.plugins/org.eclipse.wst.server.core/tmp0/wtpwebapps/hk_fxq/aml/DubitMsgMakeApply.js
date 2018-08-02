/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主脚本
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                     //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();               //全局变量, 查询结果翻页, 必须有
var turnPageFileMsgGrid = new turnPageClass();    //全局变量, 已申请报文查询结果翻页

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
    //本文件的特殊处理
    if (DealFlag == "succ" || DealFlag == "success")
    {
        try
        {
            dealTheNewApply();
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * 不同报文类型分别处理
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
            document.getElementsByName("btnApplyANewMsg")[0].disabled = true;
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnApplyANewMsg")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * 申请一个新的报文文件
 */
function applyANewFileMsg()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        alert("可疑纠错报文不允许直接申请！ ");
        return;
    }
    else
    {
        var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "ApplyFileNo";
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
        queryFileMsgGrid();
        if (FileMsgGrid.mulLineCount > 0)
        {
            FileMsgGrid.selOneRow(1);
            dealTheFileMsg();
        }
    }
    catch (ex) {}
}

/*============================================================================*/

/**
 * 查询已申请上报报文信息
 */
function queryFileMsgGrid()
{
    var sDataType, sDealNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sDealNo = document.getElementsByName("DealNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.FileNo, "
                 +        "a.DataType, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '02' ";
    if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL +=    "and a.DealState in ('03', '04', '05') "
                 +     "and (a.DataType in ('01', '02') or (a.DataType = '03' and a.DealState = '03')) "
                 +     "and exists "
                 +         "(select 'X' "
                 +            "from LXISTradeMain "
                 +           "where 1 = 1 "
                 +             "and DataState = 'C01' "
                 +             "and DealNo in "
                 +                 "(select DealNo "
                 +                    "from LXReportDetail "
                 +                   "where 1 = 1 "
                 +                     "and FileNo = a.FileNo)) ";
    }
    else
    {
        QuerySQL +=    "and a.DealState = '00' "
                 +      getWherePart("a.DataType", "DataType")
    }
        QuerySQL +=     getWherePart("a.FileNo", "FileNo")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=");
    if (sDealNo != null && sDealNo.trim() != "")
    {
        QuerySQL +=    "and a.FileNo in "
                 +         "(select FileNo "
                 +            "from LXReportDetail "
                 +           "where 1 = 1 "
                 +             "and DealNo = '" + sDealNo + "') ";
    }
    if(fm.DataType.value!=null&&fm.DataType.value!="02")
    {
    	  QuerySQL += " and a.makedate='"+fm.CurrentDate.value+"' "
    	}
        QuerySQL += "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageFileMsgGrid.pageDivName = "divTurnPageFileMsgGrid";
        turnPageFileMsgGrid.queryModal(QuerySQL, FileMsgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询已申请上报报文文件出现异常！ ");
    }
}

/*============================================================================*/

/**
 * 处理已申请上报报文信息
 */
function dealTheFileMsg()
{
    var nSelNo;
    try
    {
        nSelNo = FileMsgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    {
        alert("请先查询并选择您要处理的文件！ ");
        return;
    }
    else
    {
        var sDataType, sFileNo;
        try
        {
            sDataType = document.getElementsByName("DataType")[0].value;
            sFileNo = FileMsgGrid.getRowColData(nSelNo, 1);
        }
        catch (ex) {}
        if (sFileNo == null || sFileNo.trim() == "")
        {
            alert("请先选择一个有效的文件编号！ ");
            return;
        }
        else
        {
            var sOpenWinURL = "DubitMsgMakeDealMain.jsp";
            var sParameters = "DataType=" + sDataType + "&FileNo=" + sFileNo;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "上报报文文件处理", "left");
        }
    }
}

/*============================================================================*/


//<!-- JavaScript Document END -->
