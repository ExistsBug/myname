//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageTasksGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页

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
     queryWaitForBeFileGrid();
     TasksGrid. clearData("TasksGrid");

}

/*============================================================================*/

/**
 * 查询可选上报报文信息
 */
function queryWaitForBeFileGrid()
{
    var QuerySQL = "select a.DEALNo, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.CTNT, " 
                 +        "a.DataState,"
                 +        "(select codename from ldcode where codetype='amldatastate' and code=a.DataState), "
                 +        "(select codename from ldcode where codetype='amlidtype' and code=a.CITP), "
                 +        "a.CTID, "
                 +        "a.HTDT, "
                 +        "a.MakeDate, "
                // +        "a.DealDate, "
                // +        "a.DealTime, "
                 +        "a.Operator, "
                 +        "a.MANAGECOM, "
                 +        "(select name from ldcom where comcode=a.MANAGECOM) "
                 +    "from LXIHTradeMain a "
                 +    "where 1 = 1 "
//                 +     "and managecom like '" + comcode + "%25' "
       if( fm.ManageCom.value == null || fm.ManageCom.value == "" )
       {
       QuerySQL= QuerySQL +"and managecom like '" + comcode + "%25' ";      
       }
       QuerySQL= QuerySQL + "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno"                
                 +      getWherePart("b.CRCD", "CRCD")
                 +     " ) "
       QuerySQL= QuerySQL + "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno"
                 +      getWherePart("b.DataSource", "DataSource") 
                 +     " ) "
                 +      getWherePart("a.CSNM", "CSNM")
                 +      getWherePart("a.CTNM", "CTNM")
                 +      getWherePart("a.DataState", "DataState")
                 +      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.HTDT", "StartDate", ">=")
                 +      getWherePart("a.HTDT", "EndDate", "<=")
                 +   "order by a.htdt desc ,a.csnm desc ";;
    
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
        TasksGrid. clearData("TasksGrid");
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}

function queryTasksGrid()
{  
		var checkFlag = 0;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
    if (checkFlag) { 
   var	dealno = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1); 	
       var QuerySQL = "select DEALNo, "
                 +        "CRCD, "
                 +        "(select codename from ldcode where codetype='amlbigstamp' and code=CRCD), "
                 +        "TSDT, "
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "          
                 +        "TSTM, "
                 +        "(select codename from ldcode where codetype='amloutpaytype' and code=TSDR) "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    dealno
                 +   "' ";

    try
    {
        turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
        turnPageTasksGrid.queryModal(QuerySQL, TasksGrid);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
 
  }
		else {
	    	alert("请先选择一条大额交易明细信息！"); 
		}	
}
/*============================================================================*/


//<!-- JavaScript Document END -->
//提交前的校验、计算
function beforeSubmit()
{

//    WaitForBeFileGrid.delCheckFalseLine();
    var len = WaitForBeFileGrid.mulLineCount;
    var no=1;
    for(var i=0;i<len;i++){
    	if(WaitForBeFileGrid.getSelNo(i)){
    		no=0;
    		break;}
    	}
    if(no==1){
    alert("未选中交易");
    return false;
    }
    
   return true;
}


function GoToDetailInput(oper)
{ var cDealNo;
	var dealno;
	var CustomerNo;
	var cDate;
	
	if (oper == "update"){
				var checkFlag1 = 0;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag1 = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
		if(checkFlag1){
				dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1); 	
				CustomerNo=WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 2); 	
				cDate=WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7); 
				}else {
	    	alert("请先选择一条大额交易信息！"); 
	    	return false;
		}
		var checkFlag = 0;
		for (var i=0; i<TasksGrid.mulLineCount; i++) {
	    	if (TasksGrid.getSelNo(i)) { 
	      		checkFlag = TasksGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
			var cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //特征代码
			var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 4); //明细代码

		}
		else {
	    	alert("请先选择一条大额交易明细信息！"); 
	    	return false;
		}
		if(cDealNo==dealno){
	    var sOpenWinURL = "LXIHAffirmMainToDetail.jsp";
      var sParameters = "Oper=" + oper 
	     		+ "&CustomerNo=" + CustomerNo + "&Date=" + cDate + "&DealNo=" + cDealNo
	     		+ "&CRCD=" + cCRCD + "&TSDT=" + cTSDT;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "查看大额明细信息", "left"); 
//					window.open("./LXIHAffirmMainToDetail.jsp?Oper=" + oper 
//	     		+ "&CustomerNo=" + CustomerNo + "&Date=" + cDate + "&DealNo=" + cDealNo
//	     		+ "&CRCD=" + cCRCD + "&TSDT=" + cTSDT);
	     		}else {
	    	alert("主表交易编号与明细表不一致，请重新选择！"); 
	    	return false;
		}
	} 
}
//初始化大额交易明细信息
function afterQuery(tDealNo){
	//initTasksGrid();
   var QuerySQL = "select DEALNo, "
                 +        "CRCD, "
                 +        "(select codename from ldcode where codetype='amlbigstamp' and code=CRCD), "
                 +        "TSDT, "
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "          
                 +        "TSTM, "
                 +        "(select codename from ldcode where codetype='amloutpaytype' and code=TSDR) "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    tDealNo
                 +   "' ";
    
  turnPageTasksGrid = new turnPageClass();
  turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
	turnPageTasksGrid.queryModal(QuerySQL, TasksGrid);	
}

function SubmitWaitForBeFileGrid(str)
{
	 if(!beforeSubmit())
  {
      return false;
  }
  				var checkFlag1 = 0;
  				var dealno;
  				var datastate;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag1 = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
		if(checkFlag1){
				dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1); 	
			  datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 8); 	
				}else {
	    	alert("请先选择一条大额交易信息！"); 
		}
   var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");

  fm.action="./LXIHAffirmMainSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();
	
}

//导出Excel
function GoToExcel()
{
   var StartDate = fm.all('StartDate').value;
   var EndDate = fm.all('EndDate').value;
   if(StartDate != "" && StartDate != null && EndDate != "" && EndDate != null) {
       if(StartDate > EndDate) {
          alert("您好，起始日期不能大于结束日期！");
          return;
       }
   }
   var rowNum = WaitForBeFileGrid.mulLineCount;
   if(rowNum>0) {
      fm.action = "./CreateComQueryExcelSave.jsp?flag=2";
      fm.submit();
   }else {
      alert('没有数据，请先查询');
   }
   
}
