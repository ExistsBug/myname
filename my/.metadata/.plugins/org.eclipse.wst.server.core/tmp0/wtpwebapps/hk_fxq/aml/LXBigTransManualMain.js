 //               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var mOperate="";
var turnPage = new turnPageClass();

window.onfocus=myonfocus;
//使得从该窗口弹出的窗口能够聚焦
function myonfocus()
{
	if(showInfo!=null)
	{
	  try
	  {
	    showInfo.focus();  
	  }
	  catch(ex)
	  {
	    showInfo=null;
	  }
	}
}

//提交，保存按钮对应操作
function submitForm()
{
	if(mOperate != "DELETE|CUSTOM")
	{
		if (!beforeSubmit()) return false;
	}
	
	fm.hideOperate.value = mOperate;
	var i = 0;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit(); //提交	
}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content, Operate) {
	if(showInfo != null && showInfo !=undefined)
		showInfo.close();
	if (FlagStr == "Fail" ) {             
    	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    	showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  	} else { 
    	var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    	showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  	} 
  	if (Operate == "WorkFlow"){
  		GoParent();  		
  	}	
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
	initForm();
} 

 
//提交前的校验、计算  
function beforeSubmit()
{
	//添加操作
	if (!verifyInput2()) return false;
	if(!chkNotZh(fm.CSNM.value)){
		alert("客户号不可有汉字");
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
			alert("客户组织机构代码对应9位(最后一位校验码前的连接符可不写)");
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
   return true;
}           


//显示frmSubmit框架，用来调试
function showSubmitFrame(cDebug){
	if(cDebug=="1"){
		parent.fraMain.rows = "0,0,50,82,*";
	}else {
  		parent.fraMain.rows = "0,0,0,82,*";
 	}
}

//显示div，第一个参数为一个div的引用，第二个参数为是否显示，如果为"true"则显示，否则不显示
function showDiv(cDiv,cShow)
{
  if (cShow=="true")
  {
    cDiv.style.display="";
  }
  else
  {
    cDiv.style.display="none";  
  }
}


//申请添加大额交易明细
function GoToDetailInput(oper)
{
	var CustomerNo = fm.all("CSNM").value;
	var strUrl = "./LXBigTransManualToDetail.jsp";	
	var strPara = "";	
	if (oper == "update" || oper == "delete" ){
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
			var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //明细代码 	
			strPara = "?" + "Oper=" + oper 
	     		+ "&CustomerNo=" + CustomerNo + "&Date=" + "&DealNo=" + cDealNo
	     		+ "&CRCD=" + cCRCD + "&TSDT=" + cTSDT ;
			OpenWindowNew(strUrl + strPara, "大额明细交易", "left");			
		}
		else {
	    	alert("请先选择一条大额交易明细信息！"); 
		}
	} 
	if (oper == "insert"){
		//判断主表是否存在记录
		var strSQL = " select * from LXIHTradeMain where DealNo = '" + fm.all("DealNo1").value + "' ";
		turnPage.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	  	//判断是否查询成功
	  	if (!turnPage.strQueryResult) {
	    	alert("请先保存大额交易的主表信息！");
	    	return ;
	    }
		else{
			//查询成功则拆分字符串，返回二维数组
		  	arrSelected = decodeEasyQueryResult(turnPage.strQueryResult);
			strPara = "?" + "Oper=" + oper 
	     		+ "&CustomerNo=" + CustomerNo + "&DealNo=" + fm.all("DealNo1").value;
			OpenWindowNew(strUrl + strPara, "大额明细交易", "left");
	    }
	}
}

function GoToDelDetail()
{
	var CustomerNo = fm.all("CSNM").value;
	var checkFlag = 0;
	for (var i=0; i<TasksGrid.mulLineCount; i++) {
		if (TasksGrid.getSelNo(i)) { 
			checkFlag = TasksGrid.getSelNo();
			break;
		}
	}
	if (checkFlag) {
		mOperate = "DELETE|CUSTOM";
		var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
		var cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //特征代码
		var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //明细代码 
		fm.action = "./LXBigTransManualDetailSave.jsp?DealNo=" + cDealNo + "&CRCD=" + cCRCD + "&TSDT=" + cTSDT + "&CRCD1=" + cCRCD + "&TSDT1=" + cTSDT ;
		submitForm();
		afterQuery(cDealNo);
	}
	else {
		alert("请先选择一条大额交易明细信息！"); 
	}
}

//查询明细信息
function afterQuery(str){
	initTasksGrid();
	var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM "
		+ " from LXIHTradeDetail where DealNo = '" + str +"' ";
	turnPage.queryModal(strSQL, TasksGrid, 0, 1);	
}

//保存主表数据
function GoToMainInput(){
	var strPara = "?" + "hideOperate=Save" ;
	document.forms(0).action = "./LXBigTransManualMainSave.jsp" + strPara;	
	if (!beforeSubmit()) return false;	
	submitForm();
}

//录入完毕
function GoToWorkFlow()
{
	
	var sDealNo = document.getElementsByName("DealNo1")[0].value;
	var tsql = "select COUNT(MissionID) from LWMission where MissionProp3='"+sDealNo+"'";
	var numWork = parseInt(easyExecSql(tsql));
	if(numWork>0)
	{
		alert("此信息可以已经录入完毕,或已经产生任务节点!");
		top.close();
		return false;
	}
	var strSQL= "select COUNT(*) from lxihtradedetail where DealNo='" + sDealNo + "'";
	var count = parseInt(easyExecSql(strSQL));
	if(count <= 0){
		alert("您还没有录入大额交易的明细信息,请录入!");
		return false;
	}
	var strPara = "?" + "hideOperate=WorkFlow" ;
	document.forms(0).action = "./LXBigTransManualMainSave.jsp" + strPara;
	submitForm();
}

//返回父页面
function GoParent(){
  	top.close();
//	try{
//		top.opener.afterQuery();
//	}
//	catch(ex)
//	{
//		top.close();
//		//alert( "没有发现父窗口的afterQuery接口。" + ex );
//	}
//  	top.opener.focus();
}
