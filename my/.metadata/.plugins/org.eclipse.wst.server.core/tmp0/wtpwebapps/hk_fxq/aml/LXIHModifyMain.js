
var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageTasksGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageErrorGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页


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
     ErrorGrid. clearData("ErrorGrid");

}
function afterSubmit1(DealFlag, MsgContent)
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
function queryWaitForBeFileGrid()
{
//	if(fm.MngCom.value==null||fm.MngCom.value=="")
//	{
//		alert("请选择管理机构！");
//		return;
//	}
	
    var QuerySQL = "select DEALNo, "
                 +        "CSNM, "
                 +        "CTNM, "
                 +        "CITP, "
                 +        "CTID, "
                 +        "CTNT, "          
                 +        "HTDT, "
                 +        "DataState, "
                 +        "DealDate, "
                 +        "DealTime, "
                 +        "Operator, "
                 +        "DataState, "
                 + "(select codename from ldcode where codetype = 'amlidtype' and code = LXIHTradeMain.CITP), "
                 + "(select codename from ldcode where codetype = 'amlcountry' and code = LXIHTradeMain.CTNT), "
                 + "(select name from ldcom where comcode = LXIHTradeMain.managecom), "
                 + "(select case w.missionprop2 when '0' then '分公司已处理' else '分公司未处理' end from lwmission w where w.missionprop3=DEALNo) "
                 +    "from LXIHTradeMain  "
                 +    "where 1 = 1 "
                 //add by jinsh 反洗钱接口升级,下面这个条件进行了更改
                 +     "and DataState in('D04','C04','A04','R04','I04') "
                 //+     "and managecom like '" + comcode + "%25' "
                 +      getWherePart("DealNo", "DealNo")
                 +      getWherePart("CSNM", "CustomerNo")
                 +      getWherePart("CTNM", "CustomerName")
                 +      getWherePart("CTID", "IDNo")
                 +      getWherePart("DealDate", "StartDate", ">=")
                 +      getWherePart("DealDate", "EndDate", "<=")
                 + getWherePart("Managecom", "MngCom", "like");
                 
								 if(fm.MngCom.value.length>2)
								 {
								 	 QuerySQL = QuerySQL + " and dealno in (select w.missionprop3 from lwmission w where w.missionprop2='1' ) ";
								 }                 
								 if(fm.MngCom.value.length==2)
								 {
								 	 QuerySQL = QuerySQL + " and dealno in (select w.missionprop3 from lwmission w where (w.missionprop2 is null or w.missionprop2='0')) ";
								 }
								  QuerySQL +=  "order by DealDate desc, DealNo desc";
                 
                 
	            try
               {
                 turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
                 turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
                 TasksGrid. clearData("TasksGrid");
                 ErrorGrid. clearData("ErrorGrid");
                 fm.all("DealNo1").value = ""; 	
		             fm.all("CSNM").value = ""; 
		             fm.all("CTNM").value = ""; 
		             fm.all("CITP").value = ""; 
		             fm.all("CITPName").value = ""; 
		             fm.all("CTID").value = ""; 	
		             fm.all("CTNT").value =  ""; 
		             fm.all("CTNTName").value =  ""; 
		             fm.all("HTDT").value = ""; 
		             fm.all("DataState").value = ""; 
		             fm.all("DealDate").value = ""; 
		             fm.all("DealTime").value = ""; 
		             fm.all("Operator").value = ""; 
              }
              catch (ex)
              {
                  alert("警告：查询大额交易信息出现异常！ ");
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
                 +        "TSDT, "
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "          
                 +        "TSTM "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    dealno
                 +   "' ";
 	    try
	    {
	        turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
	        turnPageTasksGrid.queryModal(QuerySQL, TasksGrid,0,1);
	    }
    	catch (ex)
	    {
	        alert("警告：查询大额交易信息出现异常！ ");
	    }
	                        
        var ErrorSQL="select a.backfileno, "
	        	+ "a.backinfono, "
	        	+ "a.dealno, "
	        	+ "a.state, "
	        	+ "b.errlocation, "
	        	+ "b.errcause "
	        	+ "from lxreporttotrade a, LXReceiptDetail b "
	        	+ "where 1=1 and b.backfileno=a.backfileno and b.backinfono=a.backinfono "
	        	+ "and a.state='00' and a.dealno='"
        		+ dealno + "' ";

        try
	    {
	        turnPageErrorGrid.pageDivName = "divTurnPageErrorGrid";
	        turnPageErrorGrid.queryModal(ErrorSQL, ErrorGrid);
	    }
	    catch (ex)
	    {
	        alert("警告：查询回执信息出现异常！ ");
	    }
      var QuerySQL1 = "select DEALNo, "
                 +        "CSNM, "
                 +        "CTNM, "
                 +        "CITP, "
                 +        "CTID, "
                 +        "CTNT, "          
                 +        "HTDT, "
                 +        "DataState, "
                 +        "DealDate, "
                 +        "DealTime, "
                 +        "Operator "
                 +    "from LXIHTradeMain  "
                 +    "where 1 = 1 and dealno = '"
                 +     dealno
                 +    "' ";
        var strQueryResult  = easyQueryVer3(QuerySQL1, 1, 0, 1);
		   	//判断是否查询成功
		  	if (!strQueryResult) {
				   alert("被保人不存在！");
				   return false;
			  }
			  else{
				//查询成功则拆分字符串，返回二维数组								
				    var arrSelected = decodeEasyQueryResult(strQueryResult);
				    fm.all("DealNo1").value = arrSelected[0][0];
				    fm.all("CSNM").value = arrSelected[0][1];
				    fm.all("CTNM").value = arrSelected[0][2];
				    fm.all("CITP").value = arrSelected[0][3];
				    fm.all("CTID").value = arrSelected[0][4];
				    fm.all("CTNT").value =  arrSelected[0][5];
				    fm.all("HTDT").value = arrSelected[0][6];
				    fm.all("DataState").value = arrSelected[0][7];
				    fm.all("DealDate").value = arrSelected[0][8];
				    fm.all("DealTime").value = arrSelected[0][9];
				    fm.all("Operator").value = arrSelected[0][10];
       }
	     if(fm.all("DataState").value=="C04" || fm.all("DataState").value=="D04"){
			     var element = document.getElementsByName("UPDATE")[0];
			         element.disabled = true;
			     var element = document.getElementsByName("insert")[0];
			         element.disabled = true;
			     var element = document.getElementsByName("delete")[0];
			         element.disabled = true;
			     var element = document.getElementsByName("CSNM")[0];
			         element.readOnly = true;
	     }else{
	     	   var element = document.getElementsByName("UPDATE")[0];
		           element.disabled = false;	
		       var element = document.getElementsByName("insert")[0];
			         element.disabled = false;
			     var element = document.getElementsByName("delete")[0];
			         element.disabled = false;
			     var element = document.getElementsByName("CSNM")[0];
			         element.readOnly = false;
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
{ 
	var cDealNo, dealno, CustomerNo, cDate, cDealNo, cCRCD, cTSDT ;
	if (oper == "update" || oper == "delete" ){
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
			cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
			cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //特征代码
			cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //明细代码

		}
		else {
	    	alert("请先选择一条大额交易明细信息！"); 
	    	return false;
		}
		if(cDealNo==dealno){
			var sOpenWinURL = "LXBigTransManualToDetail.jsp";
      		var sParameters = "Oper=" + oper 
	     			+ "&CustomerNo=" + CustomerNo 
	     			+ "&Date=" + cDate 
	     			+ "&DealNo=" + cDealNo
	     			+ "&CRCD=" + cCRCD 
	     			+ "&TSDT=" + cTSDT;
      		OpenWindowNew(sOpenWinURL + "?" + sParameters, "修改大额信息", "left"); 
		}else {
	    	alert("主表交易编号与明细表不一致，请重新选择！"); 
	    	return false;
		}
	}
	if (oper == "insert"){
		var checkFlag = 0;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			cDealno = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1); 	
			CustomerNo=WaitForBeFileGrid.getRowColData(checkFlag - 1, 2); 	
			cDate=WaitForBeFileGrid.getRowColData(checkFlag - 1, 7); 
			var sOpenWinURL = "LXBigTransManualToDetail.jsp";
			var sParameters = "Oper=" + oper 
		     		+ "&CustomerNo=" + CustomerNo  
		     		+ "&Date=" + cDate 
		     		+ "&DealNo=" + cDealno
		     		+ "&CRCD=" + "" + "&TSDT=" + "" ;
        	OpenWindowNew(sOpenWinURL + "?" + sParameters, "新增大额信息", "left"); 
		}else {
	    	alert("请先选择一条大额交易信息！"); 
	    	return false;
		} 
	}
}

//初始化大额交易明细信息
function afterQuery(tDealNo)
{
	var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
	turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid);	
}

function SubmitWaitForBeFileGrid()
{
	if(!beforeSubmit())return false;
	var checkFlag1 = 0;
	var dealno, datastate;
	for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
		if (WaitForBeFileGrid.getSelNo(i)) { 
			checkFlag1 = WaitForBeFileGrid.getSelNo();
			break;
		}
	}
	if(checkFlag1){
		dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1); 	
		datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 12); 	
	}else {
		alert("请先选择一条大额交易信息！"); 
		return false;
	}
	
		if(trim(fm.MngCom.value).length>2)
		{
			  datastate = "Submit";
		   	var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
		  	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
		  	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
		  	fm.action="./LXIHModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
		  	fm.submit();
		}
		else
		{
		   	var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
		  	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
		  	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
		  	fm.action="./LXIHModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
		  	fm.submit();
		}
}
	
function submitMain(oper)
{
	if (!verifyInput2())          
	    return;
	if(!chkNotZh(fm.CSNM.value)){
		alert("客户号中不可以有汉字！");
		fm.CSNM.focus();
		return false;
		}
				//身份证校验
	var CITP = document.getElementById("CITP").value;
	if (CITP == "11"){
		var CTID = document.getElementById("CTID").value;
		if (!checkIdCard(CTID)) {
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}	
	if (CITP == "21"){
		var CTID = document.getElementById("CTID").value;
		if (CTID.length!=9) {
			alert("客户组织机构代码对应9位");
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}
	//国籍的verify
  	var CTNT = document.getElementById("CTNT").value;
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlcountry' "
		+ " and code = '" + CTNT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//判断是否查询成功
	if (!strQueryResult) {
		alert("代办人国籍不存在！");
		document.getElementById("CTNT").value = "";
		document.getElementById("CTNT").focus();		
		return false;
	}	
	var i = 0;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px"); 
	fm.action="./LXIHTradeSave.jsp?operate="+oper;  
	fm.submit(); //提交

}

function SendOutFNC()
{
		if(trim(fm.MngCom.value).length>2)
		{
			fm.SendOut.value.disabled=true;
			}
		var dealno;
		var datastate;
	  var i = WaitForBeFileGrid.getSelNo();
		if(i!='0')
		{
				dealno = WaitForBeFileGrid.getRowColData(i-1, 1);
				datastate="SendOut";
		}
		else 
		{
	    	alert("请先选择一条可疑交易信息！"); 
	    	return false;
		}
		
   	var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  	fm.action="./LXIHModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
  	fm.submit();
}

function initSendOut()
{
		if(trim(fm.MngCom.value).length>2)
		{
			fm.SendOut.disabled=true;
		}
}