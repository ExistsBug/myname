/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
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
function afterSubmit(DealFlag, MsgContent)
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
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            queryAlreadyInFileGrid();
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
        		// add by jinsh 这里直接调用生成文件的
            //try
            //{
            //    queryWaitForBeFileGrid();
            //    queryAlreadyInFileGrid();
            //}
            //catch (ex) {}
        }
        else if (sOperation.trim() == "MakeAllInFileMsg")
        {
            //try
            //{
            //    checkCanDownloadFileMsg();
            //    top.opener.queryFileMsgGrid();
            //}
            //catch (ex) {}
        }
    }
    fm.makefile.disabled=false;
}

/*============================================================================*/

/**
 * 检查当前报文文件是否可以下载
 */
function checkCanDownloadFileMsg()
{
    //var QuerySQL, arrResult;
    //QuerySQL = "select filepath,filename "
    //         +   "from LXReportDataFile a "
    //         +  "where 1 = 1 "
    //         +     getWherePart("a.FileNo", "FileNo")
    //         +    "and a.DealState = '01'";
    ////alert(QuerySQL);
    //try
    //{
    //    arrResult = easyExecSql(QuerySQL, 1, 0);
    //}
    //catch (ex)
    //{
    //    alert("警告：查询当前报文文件下载状态出现异常！ ");
    //    return;
    //}
    //if (arrResult != null)
    //{
    //    try
    //    {
    //        document.getElementsByName("btnDownloadFileMsg")[0].disabled = false;
    //        document.getElementsByName("makeAction")[0].disabled = true;
    //        
    //        var strQueryResult = easyQueryVer3(QuerySQL, 1, 0, 1);
    //        var arrDataSet = decodeEasyQueryResult(strQueryResult);
    //        packagePath="send/"+arrDataSet[0][1];
    //    }
    //    catch (ex) {}
    //}
    //else
    //{
    //    try
    //    {
    //        document.getElementsByName("btnDownloadFileMsg")[0].disabled = true;
    //        document.getElementsByName("makeAction")[0].disabled = false;
    //    }
    //    catch (ex) {}
    //}
}

/*============================================================================*/

/**
 * 查询可选上报报文信息
 */
function queryWaitForBeFileGrid()
{
    if(!verifyForm('fm'))
	{
		return false;
	} 
	var strSQL = "";
	var tradeDataState=fm.tradeDataState.value;

	strSQL+="select DealNo,CSNM,CTNM,CTID,HTDT,DataState from LXIHTradeMain where 1=1 ";
	strSQL+="and not exists (select 'X' from LXReportDetail where LXIHTradeMain.dealno=LXReportDetail.dealno and exists (select 'X' from LXReportDataFile where 1 = 1 and FileNo = LXReportDetail.FileNo and ReportType = '01' and DealState in ('00', '01', '02', '06'))) and datastate in "+tradeDataState;
	strSQL+=getWherePart('CSNM','CSNM1');
	strSQL+=getWherePart('CTNM','CTNM1');
	strSQL+=getWherePart('CTID','CTID1');
	strSQL+=getWherePart('ManageCom','ManageCom','like');
	if(fm.dataType.value=="01")
	{
		//strSQL+="and not exists (select 'X' from LXReportDetail where LXIHTradeMain.dealno=LXReportDetail.dealno and exists (select 'X' from LXReportDataFile where 1 = 1 and FileNo = LXReportDetail.FileNo and ReportType = '01' and DealState in ('00', '01', '02', '06'))) and datastate in "+tradeDataState;
		strSQL+=getWherePart('HTDT','addedDate','>');
	}
	if(fm.dataType.value=="03")
	{
		strSQL+=getWherePart('HTDT','addedDate','<=');
	}
	strSQL+=getWherePart('HTDT','HTDT1','>=');
	strSQL+=getWherePart('HTDT','HTDT2','<=');
	strSQL+=getWherePart('DealNo','DealNo1');
	if(fm.dataType.value=="01")
	{
		strSQL+="order by DealDate asc,DealTime asc";
	}
	if(fm.dataType.value=="03")
	{
		strSQL+="order by DealDate desc,DealTime desc";
	}	
	if(fm.dataType.value!="03"&&fm.dataType.value!="01")
	{
		strSQL+=" order by DealNo";
	}	
//	strSQL+=" order by DealNo";
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
  //      if(!verifyForm('fm'))
	//{
	//	return false;
	//} 
	//var strSQL = "";
	//strSQL+="select DealNo,CSNM,CTNM,CTID,HTDT,DataState from LXIHTradeMain where 1=1 ";
	//strSQL+="and exists (select 'X' from LXReportDetail where LXReportDetail.dealno=LXIHTradeMain.dealno and LXReportDetail.fileno='"+fm.FileNo.value+"')";
	//strSQL+=getWherePart('CSNM','CSNM2');
	//strSQL+=getWherePart('CTNM','CTNM2');
	//strSQL+=getWherePart('CTID','CTID2');
	//strSQL+=getWherePart('HTDT','HTDT3','>=');
	//strSQL+=getWherePart('HTDT','HTDT4','<=');
	//strSQL+=getWherePart('DealNo','DealNo2');
	//strSQL+=" order by DealNo";
	//turnPage2.queryModal(strSQL,AlreadyInFileGrid,0,1);

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
	  fm.makefile.disabled=true;
    var nCheckCount = 0;
    try
    {
        nCheckCount = WaitForBeFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("请先查询并选择您要添加的交易！ ");
        fm.makefile.disabled=false;
        return;
    }
    //删除原因是，郭总说他改不了，只能等错误回执返回来时导入后让分公司改
//    for(var i=0;i<WaitForBeFileGrid.mulLineCount;i++)
//    {
//	    if(WaitForBeFileGrid.getChkNo(i))
//	    {
//		    var tDealNo=WaitForBeFileGrid.getRowColData(i,1);
//			  //可疑增加身份证检验
//		    if(!CheckCardNoIH(tDealNo))
//		    {
//		    	return false;
//		    }
//		  }
//	  }
	  
    var MsgContent = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
    try
    {
        fm.type.value = "AddToInFileMsg";
    }
    catch (ex) {}
    document.forms(0).action = "JlargeTradeToXmlSave.jsp";
    document.forms(0).submit();

    WaitForBeFileGrid.clearData();
    queryAlreadyInFileGrid();
}

/*============================================================================*/

/**
 * 删除已选上报报文到已上报报文
 */
function deleteInFileMsg()
{
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
        document.forms(0).action = "largeTradeToXmlSave.jsp";
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
    document.forms(0).action = "largeTradeToXmlSave.jsp";
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
    window.open(packagePath);

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

/*============================================================================*/
/**
 *LXBigTransManualMain.jsp?CSNM=10861&Date=&DataState= &DealNo=00000000000000000483
 *用户进行查看和修改处理
 *参数1 CSNM：参数2 Date  参数3 DealNo 参数4 DataState 
 **/
//function GoToViewAndUpdate(str)
//{
//    var nCheckCount = 0;
//    try
//    {
//        nCheckCount = WaitForBeFileGrid.getChkCount();
//    }
//    catch (ex) {}
//    if (nCheckCount == null || nCheckCount <= 0)
//    {
//        alert("请选择您要查看的交易！ ");
//        return;
//    }
//    
//	  var i;
//	  var isOneMore=false;
//	  var obj=document.all['WaitForBeFileGridChk'];
//	  if(typeof(obj.length)!='undefined')
//	  {
//	      for(i=0;i<obj.length;i++)
//	      {
//	        isOneMore=obj[i].checked;
//	        if(isOneMore)
//	        {
//	          break;
//	        }
//	      }
//	  }
//
//     if (isOneMore) 
//     {
//         var  DealNo     = WaitForBeFileGrid.getRowColData(i, 1);
//         var  CSNM       = WaitForBeFileGrid.getRowColData(i, 2);
//         var  DataState  = WaitForBeFileGrid.getRowColData(i, 6);
//         if(DealNo.length==0)
//         {
//		       	alert("请先查询!");
//		       	retrun;
//         }
//         
//         var strUrl = "./LXBigTransManualToMain.jsp";
//         var strPara="?"+"Oper="+str+"&CSNM="+CSNM+"&DataState="+DataState+"&DealNo="+DealNo;
//                    
//        OpenWindowNew(strUrl + strPara, "大额交易", "left");
//     }
//     else
//     {
//        alert("请您选中一条大额交易信息！");
//     }
//}

function checkBoxNext(parm1)
{		
		var dealno="";
		var datastate="S00";
		var CSNM="";	
		var tDate="";
		var Oper="ViewAndUpdate";
		dealno=fm.all( parm1 ).all('WaitForBeFileGrid1').value;
		CSNM  =fm.all( parm1 ).all('WaitForBeFileGrid2').value;
		tDate =fm.all( parm1 ).all('WaitForBeFileGrid5').value;
		if(dealno==null||dealno=="")
		{
			alert("请先查询再进行查看修改！");
			return false;
		}
		if(CSNM==null||CSNM=="")
		{
			alert("请先查询再查看修改！");
			return false;
		}
	  var sOpenWinURL = "./LXBigTransManualToMain.jsp";
	  var sParameters = "DealNo=" + dealno;
	  sParameters+="&DataState="+datastate;
	  sParameters+="&CSNM="+CSNM;
	  sParameters+="&Oper=ViewAndUpdate";
	  OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");
}

//<!-- JavaScript Document END -->
