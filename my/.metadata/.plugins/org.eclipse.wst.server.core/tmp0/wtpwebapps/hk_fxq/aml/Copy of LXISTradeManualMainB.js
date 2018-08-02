 //               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var saveClick=false;
var arrDataSet;
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
	if (!beforeSubmit()) return false; 
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
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  } 
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
} 

 
//提交前的校验、计算  
function beforeSubmit()
{
  //添加操作
   if(!verifyInput()) return false;
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


//上传文件
function GoToUpload(){
	var upfm = document.getElementById("upfm");
	var importFile = document.getElementById("FileName").value;
	//判断是否选中可疑交易
	var checkFlag = 0;
	var DealNo = ""; //交易号
	var CSNM = ""; //客户号
	for (var i=0; i<TradeMainGrid.mulLineCount; i++) {
    	if (TradeMainGrid.getSelNo(i)) { 
      		checkFlag = TradeMainGrid.getSelNo();
      		break;
		}
	}
	if (checkFlag) {
		DealNo = TradeMainGrid.getRowColData(checkFlag - 1, 1);
		CSNM = TradeMainGrid.getRowColData(checkFlag - 1, 4);
	}
	else {
    	alert("请先选择一条可疑交易信息！"); 
    	return ;
	}
	//判断是否是ZIP
	if( importFile== "" || importFile == null){
		alert("请先选择上传的ZIP文件！");
	  	return ;
	}
	var patrn=/\.[z,Z][i,I][p,P]$/;
	if(!patrn.exec(importFile)){
		alert("请上传ZIP文件！" );
		document.getElementById("FileName").value = "";
		document.getElementById("FileName").focus();
		return ;
	}
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	upfm.action = "./LXISTradeManulUpload.jsp?DealNo=" + DealNo + "&CSNM=" + CSNM +"&ImportFile=" + importFile ;
	upfm.submit(); //提交
}

//申请可疑操作
function GoToInputTrade(oper)
{
	var DataState = "";
	var cDate = fm.all("Date").value;

	if (oper == "update" || oper == "delete" || oper == "query" || oper == "finish"){
		var checkFlag = 0;
		var DealNo = ""; //交易号
		var CSNM = ""; //客户号
		for (var i=0; i<TradeMainGrid.mulLineCount; i++) {
	    	if (TradeMainGrid.getSelNo(i)) { 
	      		checkFlag = TradeMainGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			DealNo = TradeMainGrid.getRowColData(checkFlag - 1, 1);
			CSNM = TradeMainGrid.getRowColData(checkFlag - 1, 4);
			DataState = TradeMainGrid.getRowColData(checkFlag - 1, 11);
			if (oper == "delete"){
				if (confirm("删除不可恢复,您确定要删除该条可疑交易信息吗")){
					fm.all("hideDealNo").value = DealNo;
					fm.all("hideOperate").value = "DELETE";
					fm.submit();
				}
				else{
					return;
				}
			}else if (oper == "finish"){
					//1
					var tsql = "select COUNT(MissionID) from LWMission where MissionProp3='"+DealNo+"'";
					var numWork = parseInt(easyExecSql(tsql));
					if(numWork>0)
					{
						alert("此信息可以已经录入完毕,或已经产生任务节点!");
						top.close();
						return false;
					}
					var StrSQLCusPartner="select COUNT(*) FROM LXISTradeCusPartner where dealno='"+DealNo+"'";
					var countCusPartner=easyExecSql(StrSQLCusPartner);
					if(parseInt(countCusPartner)<=0)
					{
							alert("可疑交易客户股东信息没有录入,请录入!");
							return false;
					}
					//2
					var StrSQLCont="select COUNT(*) FROM LXISTradeCont where dealno='"+DealNo+"'";
					var countCont=easyExecSql(StrSQLCont);
					if(parseInt(countCont)<=0)
					{
							alert("可疑交易合同信息没有录入,请录入!");
							return false;
					}
					//3
					var StrSQLDetail="select COUNT(*) FROM LXISTradeDetail where dealno='"+DealNo+"'";
					var countDetail=easyExecSql(StrSQLDetail);
					if(parseInt(countDetail)<=0)
					{
							alert("可疑交易明细信息没有录入,请录入!");
							return false;
					}
					//4
					var StrSQLInsured="select COUNT(*) FROM LXISTradeInsured where dealno='"+DealNo+"'";
					var countInsured=easyExecSql(StrSQLInsured);
					if(parseInt(countInsured)<=0)
					{
							alert("可疑交易合同险种被保险人信息没有录入,请录入!");
							return false;
					}
					//5
					var StrSQLBnf="select COUNT(*) FROM LXISTradeBnf where dealno='"+DealNo+"'";
					var countBnf=easyExecSql(StrSQLBnf);
					if(parseInt(countBnf)<=0)
					{
							alert("可疑交易合同受益人信息没有录入,请录入!");
							return false;
					}
					fm.all("hideDealNo").value = DealNo;
					fm.all("hideOperate").value = "FINISH";
					fm.submit();
			}
			else{
				var strUrl = "./LXISTradeManualToDetail.jsp";
				strPara = "?" + "DealNo=" + DealNo + "&DataState=" + DataState + "&oper=" + oper ;
				OpenWindowNew(strUrl + strPara, "可疑交易主表", "left"); 					
		    }
		}
		else {
	    	alert("请先选择一条可疑交易信息！"); 
	    	return ;
		}
	} 
	if (oper == "insert"){
		DataState = "";
		var strUrl = "./LXISTradeManualToDetail.jsp";
		strPara = "?" + "DealNo=" + DealNo + "&DataState=" + DataState + "&oper=" + oper ;
		OpenWindowNew(strUrl + strPara, "可疑交易主表", "left");
	}
}

function afterQuery(cDealNo){
	initInpBox(cDealNo);
}

function GoToReturn(){
//	try
//	{
//		top.opener.afterQuery( );
//	}
//	catch(ex)
//	{
//		alert( "没有发现父窗口的afterQuery接口。" + ex );
//	}
	top.close();
}
function DelAccessories(oper)
{ 
	var DataState = "";
	if (oper == "delaccessories"){
		var checkFlag = 0;
		var DealNo = ""; //交易号
		var CSNM = ""; //客户号
		for (var i=0; i<TradeMainGrid.mulLineCount; i++) {
	    	if (TradeMainGrid.getSelNo(i)) { 
	      		checkFlag = TradeMainGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			DealNo = TradeMainGrid.getRowColData(checkFlag - 1, 1);
			var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
      var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
      showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
      fm.action="./DelAccessoriesSave.jsp?dealno="+DealNo;
      fm.submit();
		}
		else {
	    	alert("请先选择要删除附件的可疑交易信息！"); 
	    	return;
		}
	} 
}