/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-26
 * @direction: 交易报文包下载生成主脚本
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
function afterSubmit(DealFlag, MsgContent, OtherMessage)
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
 * 查询已申请上报报文包信息
 */
function queryFilePkgGrid()
{
    var QuerySQL = "select a.PackageNo, "
                 +        "a.PackageName, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "a.Operator, "
                 +        "a.DealState "
                 +    "from LXReportDataPacket a "
                 +   "where 1 = 1 "
                 +     "and a.DealState > '01' "
                 +     "and a.PackageName is not null "
                 +      getWherePart("a.PackageNo", "PackageNo")
                 //+      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.ReportType", "ReportType")
                 +      getWherePart("a.DataType", "DataType")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=")
                 +   "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageFilePkgGrid.pageDivName = "divTurnPageFilePkgGrid";
        turnPageFilePkgGrid.queryModal(QuerySQL, FilePkgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询已打包报文包出现异常！ ");
    }
}

/*============================================================================*/

/**
 * 处理已申请上报报文信息
 */
function downloadPackage()
{
    var nSelNo;
    try
    {
        nSelNo = FilePkgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    {
        alert("请先查询并选择您要下载的报文包！ ");
        return;
    }
    else
    {
        var sPackageNo, sPackageName;
        try
        {
            sPackageNo = FilePkgGrid.getRowColData(nSelNo, 1);
            sPackageName = FilePkgGrid.getRowColData(nSelNo, 2);
        }
        catch (ex) {}
        if (sPackageNo == null || sPackageNo.trim() == "")
        {
            alert("请先选择一个有效的报文包编号！ ");
            return;
        }
        else
        {
            window.open("send/" + sPackageName);
        }
    }
}

/*============================================================================*/


//<!-- JavaScript Document END -->
