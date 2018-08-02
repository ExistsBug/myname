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

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPage1 = new turnPageClass(); 
var turnPage2 = new turnPageClass(); 
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageAlreadyInFileGrid = new turnPageClass();    //全局变量, 已选上报报文查询结果翻页
var packagePath;

/*============================================================================*/

/**
 * 提交后操作, 服务器数据返回后执行的操作
 */
function afterSubmit(DealFlag, MsgContent,packagePath,rPackageNo)
{
		checkCanDownloadFileMsg();
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            queryAlreadyInFileGrid();
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            queryAlreadyInFileGrid();
            if(rPackageNo!="")
					    {
					    	fm.PackageNo.value=rPackageNo;
					      checkCanDownloadFileMsg();
					      queryAlreadyInFileGrid();
					    }
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            queryAlreadyInFileGrid();
            if(rPackageNo!="")
					    {
					    	fm.PackageNo.value=rPackageNo;
					      checkCanDownloadFileMsg();
					      queryAlreadyInFileGrid();
					    }
            break;
    }
    //本文件的特殊处理
    if (DealFlag == "succ" || DealFlag == "success")
    {
        var sOperation;
        try
        {
            sOperation = document.getElementsByName("Operation")[0].value;
        }
        catch (ex) {}
        if (sOperation != null && (sOperation.trim() == "AddToInFileMsg" || sOperation.trim() == "DeleteInFileMsg"))
        {
            try
            {
                queryWaitForBeFileGrid();
                queryAlreadyInFileGrid();
            }
            catch (ex) {}
        }
        else if (sOperation.trim() == "MakeAllInFileMsg")
        {
            try
            {
                checkCanDownloadFileMsg();
                top.opener.queryFileMsgGrid();
            }
            catch (ex) {}
        }
    }
    
     
    

    
}

/*============================================================================*/

/**
 * 检查当前报文文件是否可以下载
 */
function checkCanDownloadFileMsg()
{
    var QuerySQL, arrResult;
    QuerySQL = "select packagePath,packageName "
             +   "from LXReportDataPacket a "
             +  "where 1 = 1 "
             +     getWherePart("a.PackageNo", "PackageNo")
             +    "and a.DealState = '02'";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("警告：查询当前报文文件下载状态出现异常！ ");
        return;
    }
    if (arrResult != null)
    {
        try
        {
            document.getElementsByName("btnDownloadFileMsg")[0].disabled = false;
            document.getElementsByName("makeAction")[0].disabled = true;
            var strQueryResult = easyQueryVer3(QuerySQL, 1, 0, 1);
            var arrDataSet = decodeEasyQueryResult(strQueryResult);
            packagePath="send/"+arrDataSet[0][1];
            
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnDownloadFileMsg")[0].disabled = true;
            document.getElementsByName("makeAction")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * 查询可选上报报文信息
 */
function queryWaitForBeFileGrid()
{
	if(fm.dataType.value=="02")
	{
		alert("重发数据包不允许添加新文件");
		return false;
	}

    if(!verifyForm('fm'))
	{
		return false;
	}
	
	var strSQL = "";
	strSQL+="select FileNo,ReportType,DataType,FileName,PackageNo,OrderNo,DealState,MakeDate from LXReportDataFile where 1=1 and reporttype='01' and dealstate='01' and packageno is null ";
	strSQL+=getWherePart('FileNo','fileNo1');
	if(fm.dataType.value=="01")
	{
		strSQL+=" and datatype='01' ";
	}
	else
		{
			strSQL+=" and datatype in ('02','03','04') ";
		}
	strSQL+=getWherePart('MakeDate','makeDate1','>=');
	strSQL+=getWherePart('MakeDate','makeDate2','<=');
	strSQL+=" order by makedate desc,maketime desc,fileno,reporttype,datatype";
	turnPage1.queryModal(strSQL,WaitForBeFileGrid,0,1);

    //判断是否查询成功
    if (!turnPage1.strQueryResult) {
    alert("没有满足条件的信息！");
    return false;
  }
    if (!turnPage1.queryModal) {
          alert("no data");
          WaitForBeFileGrid.clearData();
      return false;
    }
}

/*============================================================================*/

/**
 * 查询已选上报报文信息
 */
function queryAlreadyInFileGrid()
{
	
          if(!verifyForm('fm'))
	{
		return false;
	} 
	
	var strSQL = "";
	strSQL+="select FileNo,ReportType,DataType,FileName,PackageNo,OrderNo,DealState,MakeDate from LXReportDataFile where 1=1";
	strSQL+=getWherePart('FileNo','fileNo2');
	strSQL+=getWherePart('PackageNo','PackageNo');
	strSQL+=getWherePart('MakeDate','makeDate3','>=');
	strSQL+=getWherePart('MakeDate','makeDate4','<=');
	strSQL+=" order by makedate desc,maketime desc,fileno,reporttype,datatype";
	turnPage2.queryModal(strSQL,AlreadyInFileGrid,0,1);

    //判断是否查询成功
//    if (!turnPage2.strQueryResult) {
//    alert("没有满足条件的信息！");
//    return false;
//  }
//    if (!turnPage2.queryModal) {
//          alert("no data");
//          AlreadyInFileGrid.clearData();
//      return false;
//    }
}

/*============================================================================*/

/**
 * 添加可选上报报文到已上报报文
 */
function addToInFileMsg()
{
	if(fm.dataType.value=="02")
	{
		alert("重发数据包不允许添加新文件");
		return false;
	} 
    var nCheckCount = 0;
    try
    {
        nCheckCount = WaitForBeFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("请先查询并选择您要添加的交易！ ");
        return;
    }
    else
    {
        var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            fm.type.value = "AddToInFileMsg";
        }
        catch (ex) {}
        document.forms(0).action = "RlargeTradeToPackageSave.jsp";
        document.forms(0).submit();
    }
    WaitForBeFileGrid.clearData();
    queryAlreadyInFileGrid();
}

/*============================================================================*/

/**
 * 删除已选上报报文到已上报报文
 */
function deleteInFileMsg()
{
	if(fm.dataType.value=="02")
	{
		alert("重发数据包不允许撤销文件");
		return false;
	} 
    var nCheckCount = 0;
    try
    {
        nCheckCount = AlreadyInFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("请先查询并选择您要撤销的交易！ ");
        return;
    }
    else
    {
        var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            fm.type.value = "DeleteInFileMsg";
        }
        catch (ex) {}
        document.forms(0).action = "RlargeTradeToPackageSave.jsp";
        document.forms(0).submit();
    }
    AlreadyInFileGrid.clearData();
}

/*============================================================================*/

/**
 * 生成上报报文信息
 */
function makeAllInFileMsg()
{
    var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
    try
    {
        fm.type.value = "MakeAllInFileMsg";
    }
    catch (ex) {}
    document.forms(0).action = "RlargeTradeToPackageSave.jsp";
    document.forms(0).submit();
}

/*============================================================================*/

/**
 * 下载生成的上报报文信息
 */
function downAllInFileMsg()
{
    try
    {
        document.getElementsByName("Operation")[0].value = "DownAllInFileMsg";
    }
    catch (ex) {}
    document.forms(0).action = packagePath;
    document.forms(0).submit();
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
        top.opener.childReturn();
    }
    catch (ex) {}
}

function applyANewFileMsg()
{
	var nPackageNo=fm.PackageNo.value;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px"); 
 	fm.action="RlargeTradeToPackageSave.jsp?type=applyPackageNo&nPackageNo="+fm.PackageNo.value;
  fm.submit();
}

/*============================================================================*/


//<!-- JavaScript Document END -->
