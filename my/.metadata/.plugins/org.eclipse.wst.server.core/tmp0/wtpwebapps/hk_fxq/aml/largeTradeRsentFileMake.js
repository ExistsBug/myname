/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 张立盛 <Zhangls@sinosoft.com.cn>
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
 * 申请成功之后马上弹出界面处理该任务
 */
function dealTheNewApply()
{
    queryFileMsgGrid();
    FileMsgGrid.selOneRow(1);
    dealTheFileMsg();
}

/*============================================================================*/

/**
 * 查询已申请上报报文信息
 */
function queryFileMsgGrid()
{
    var QuerySQL = "select a.FileNo, "
                 +        "a.reporttype, "
                 +        "a.datatype, "
                 +        "a.makedate, "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '01' "
                 +     "and a.DealState = '00' "
                 +      getWherePart("a.FileNo", "FileNo")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=")
                 +      getWherePart("a.dataType", "dataType")
                 +   "order by a.MakeDate desc, a.MakeTime desc";
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
        var sFileNo;
        try
        {
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
            var sOpenWinURL = "largeTradeReSentFileToXmlInput.jsp";
            var sParameters = "FileNo=" + sFileNo;
            sParameters+="&dataType="+fm.dataType.value;
            sParameters+="&reportType="+fm.reportType.value;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "已申请正常上报报文文件处理", "left");
        }
    }
}

/*============================================================================*/

function applyANewFileMsg()
{
    if(!verifyForm('fm'))
    {
        return false;
    }
    var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    fm.submit();
}

//<!-- JavaScript Document END -->
