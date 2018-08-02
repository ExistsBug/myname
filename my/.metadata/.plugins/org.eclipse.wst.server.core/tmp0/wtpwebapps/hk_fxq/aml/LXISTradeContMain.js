 //               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var mOperate="";
var turnPage = new turnPageClass();
var turnPage3 = new turnPageClass();
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
	if(fm.all("hideOperate").value != "DELETE||CUSTOM")
	{
		if(!beforeSubmit())return false;
	}
	
	var i = 0;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit(); //提交

}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content, SelSql)
{
  if(showInfo != null && showInfo !=undefined)
  	showInfo.close();
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    initInpBox(tDealNo,tCSNM,tRiskCode);
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    initIntBox(tDealNo,fm.CSNM.value,fm.RiskCode.value);
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
  if (!verifyInput2())          
	return false;
	var tCSNM=document.getElementById("CSNM").value;
	if(!chkNotZh(tCSNM)){
		alert("保险合同号中不可以有汉字！");
		fm.CSNM.focus();
		return false;
		}
			var tRiskCode=document.getElementById("RiskCode").value;
	if(!chkNotZh(tRiskCode)){
		alert("险种编码中不可以有汉字！");
		fm.RiskCode.focus();
		return false;
		}
		var tISPS=document.getElementById("ISPS").value;
	var patrn=/^((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))$/;
	if(!patrn.exec(tISPS))
	{
		alert("保险期间请输入YYYYMMDDHHYYYYMMDD形式！");
		fm.ISPS.focus();
		return false;
	}
	if(tISPS.substring(0, 8) > tISPS.substring(8, 16)){
	    alert("保险期间的结束日期不能小于开始日期");
	    return false;	
	}
	var tISAT=document.getElementById("ISAT").value;	
	var RegChkExp = /^(\d+)(\.\d+)?$/;
    if(!RegChkExp.test(tISAT)){
    	alert("保险金额只可为数字");
		  fm.ISAT.focus();
    	return false;}
  var tISFE=document.getElementById("ISFE").value;	
    if(!RegChkExp.test(tISFE)){
    	alert("保险费只可为数字");
		  fm.ISFE.focus();
    	return false;}
   return true;
}           


//显示frmSubmit框架，用来调试
function showSubmitFrame(cDebug)
{
  if(cDebug=="1")
  {
			parent.fraMain.rows = "0,0,50,82,*";
  }
 	else {
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




function afterQuery(str,str1,str2){
	initInpBox(str,str1,str2);
	initIntBox(str,str1,str2);
}



//增加客户信息
function GoToAddCus(){
	mOperate = "INSERT||CUSTOM";
	if (!beforeSubmit()) return false;
	submitForm();
	//initInpBox();
	initInbBox();
}


//更新客户信息
function GoToUpdateCus(){
	mOperate = "UPDATE||CUSTOM";
	if (!beforeSubmit()) return false;
	submitForm();
	//initInpBox();	
}

//删除客户信息
function GoToDelCus(){
	mOperate = "DELETE||CUSTOM";
	if (!beforeSubmit()) return false;
	submitForm();
	//初始化客户信息
	initInpBox();
}
//添加被保人
function GoToDetailInput(oper)
{ 
   if(oper == "update" ||oper == "delete" ||oper =="query"){
		var checkFlag = 0;
		for (var i=0; i<TasksGrid.mulLineCount; i++) {
	    	if (TasksGrid.getSelNo(i)) { 
	      		checkFlag = TasksGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
			var cCSNM = TasksGrid.getRowColData(checkFlag - 1, 2); //特征代码
			var cISNM = TasksGrid.getRowColData(checkFlag - 1, 3); //特征代码
			var cRiskCode = TasksGrid.getRowColData(checkFlag - 1, 4); 
			var	cInsuredNo = TasksGrid.getRowColData(checkFlag - 1, 5); 
			
			var sOpenWinURL = "LXISTradeInsuToMain.jsp";
      var sParameters = "oper=" + oper +"&CSNM=" + cCSNM + "&RiskCode=" + cRiskCode + "&DealNo=" + cDealNo
	     		+ "&InsuredNo=" + cInsuredNo + "&ISNM=" + cISNM ;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "查看被保人信息", "left"); 
			
//			window.open("./LXISTradeInsuToMain.jsp?oper=" + oper +"&CSNM=" + cCSNM + "&RiskCode=" + cRiskCode + "&DealNo=" + cDealNo
//	     		+ "&InsuredNo=" + cInsuredNo + "&ISNM=" + cISNM );
		}
		else {
	    	alert("请选择一条被保人信息！"); 
	    	
		}
	}
	else if(oper == "insert"){
			var sOpenWinURL = "LXISTradeInsuToMain.jsp";
      var sParameters = "oper=" + oper +"&CSNM=" + fm.all("CSNM").value + "&RiskCode=" + fm.all("RiskCode").value + "&DealNo=" + fm.all("DealNo").value;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "查看被保人信息", "left"); 
//		window.open("./LXISTradeInsuToMain.jsp?oper=" + oper +"&CSNM=" + fm.all("CSNM").value + "&RiskCode=" + fm.all("RiskCode").value + "&DealNo=" + fm.all("DealNo").value);
	}

}
function GoToReturn(){
	try
	{
		var arrReturn = tDealNo ;
		top.opener.initContBox( arrReturn );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}
