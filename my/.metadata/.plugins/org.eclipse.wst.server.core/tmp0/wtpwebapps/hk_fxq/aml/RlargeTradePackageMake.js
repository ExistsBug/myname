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
//        		if(fm.dataType.value!="02")
//       		{
        			dealTheNewApply();
//        		}
//            else
//            	{
//								MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
//            		showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
//            	}
        }
        catch (ex) {}
    }
}

/*============================================================================*/



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
	if(!verifyForm('fm'))
	{
		return false;
	} 
    var QuerySQL = "select a.PackageNo, "
                 +        "a.reporttype, "
                 +        "a.datatype, "
                 +        "a.makedate, "
                 +        "a.Operator, "
                 +        "a.dealstate "
                 +    "from LXReportDataPacket a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '01' "
                 +      getWherePart("a.PackageNo", "PackageNo")
                 //+      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=");
                 if(fm.dataType.value=="02")
                 {
                 		QuerySQL +=" and ((a.datatype in ('01','02') and a.DealState in ('04','05'))  ) ";
                	}
                	else
                		{
                			QuerySQL +=getWherePart("a.dataType", "dataType");
                			QuerySQL +=" and a.DealState = '01' "
                		}     
        QuerySQL +="order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPage.queryModal(QuerySQL, FileMsgGrid,0,1);
    }
    catch (ex)
    {
        alert("警告：查询已申请数据包出现异常！ ");
    }
//        //判断是否查询成功
//    if (!turnPage.strQueryResult) {
//    alert("没有满足条件的信息！");
//    return false;
//  }
//    if (!turnPage.queryModal) {
//          alert("no data");
//          FileMsgGrid.clearData();
//      return false;
//    }
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
//    	if(fm.dataType.value=="02")
//	{
//		if(FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,3)=="02"&&FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,6)=="02")
//		{
//			
//		}
//		else
//		{
//			alert("只有处理完毕的重发数据包才能进入处理菜单,如果要生成重发数据包请点击申请按钮");
//			return false;
//		}
//	}
        var sPackageNo;
        var sMakeDate;
        try
        {
            sPackageNo = FileMsgGrid.getRowColData(nSelNo, 1);
            sMakeDate = FileMsgGrid.getRowColData(nSelNo, 4);
        }
        catch (ex) {}
        if (sPackageNo == null || sPackageNo.trim() == "")
        {
            alert("请先选择一个有效的包编号！ ");
            return;
        }
        else
        {
            var sOpenWinURL = "RlargeTradeFileToPackageMain.jsp";
            var sParameters = "PackageNo=" + sPackageNo;
            sParameters+="&dataType="+fm.dataType.value;
            sParameters+="&reportType="+fm.reportType.value;
            sParameters+="&makeDate="+sMakeDate;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "已申请包处理", "left");
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
	if(fm.dataType.value=="02")
	{
		if(FileMsgGrid.getSelNo()==0)
		{
			alert("请先选择需要重报的数据包");
			return false;
		}
		if(FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,3)=="02"&&FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,6)=="02")
		{
			alert("该数据包为重发数据包，请直接点击处理按钮进入处理菜单");
			return false;
		}
	}
	var nPackageNo=FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,1);
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px"); 
 	fm.action="RlargeTradeToPackageSave.jsp?type=applyPackageNo&nPackageNo="+nPackageNo;
  fm.submit();
}
function childReturn()
{
	queryFileMsgGrid();
}

//<!-- JavaScript Document END -->
