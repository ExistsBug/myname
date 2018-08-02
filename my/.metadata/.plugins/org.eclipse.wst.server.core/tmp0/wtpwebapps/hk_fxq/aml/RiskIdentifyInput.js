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
	if (!beforeSubmit())     
		return false;
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
    initInpBox();
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
	
  } 
   GoToQuery();

}

function afterSubmit1( FlagStr, content, SelSql)
{ 
  if(showInfo != null && showInfo !=undefined)
  	showInfo.close();
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    initInpBox();
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
	
  } 
        fm.all("code").value = "";
				fm.all("codename").value = "";
				fm.all("codealias").value = "";
				fm.all("codealiasD").value = "";
        GoToQuery();

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
function GoToReturn(){
	try
	{ 
		top.opener.initIntBox(tDealNo,tCSNM,tRiskCode);
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}


function GoToQuery(){
	var strSQL = "select a.code,a.codename,a.codealias ,b.codealias from ldcode a ,ldcode b where a.codetype ='amlriskgrade' and b.codetype = 'amlriskgradedetail' and a.code=b.code "
	               +      getWherePart("a.code", "code")
                 +      getWherePart("a.codename", "codename")
//                 +      getWherePart("a.codealias", "codealias");
                 +      " order by a.code desc"
	turnPage3.queryModal(strSQL, FileMsgGrid);	
}


function GoToDetail(){
		var checkFlag = 0;
		for (var i=0; i<FileMsgGrid.mulLineCount; i++) {
	    	if (FileMsgGrid.getSelNo(i)) { 
	      		checkFlag = FileMsgGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			var code = FileMsgGrid.getRowColData(checkFlag - 1, 1);
			var sOpenWinURL = "RiskIndentifyDetailMain.jsp";
      var sParameters = "code=" + code;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "风险规则处理", "left");
//			window.open("./RiskIndentifyDetailMain.jsp?code=" + code);
			
		}
		else {
	    	alert("请选择一条风险级别信息！"); 	    	
		}
}

function gotomodify(oper){
	if (!beforeSubmit())     
		return false;
	var i = 0;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");  
	fm.action="./RiskIndentifySave.jsp?oper="+oper; 
	fm.submit(); //提交
}

function modifydetail(){
var checkFlag = 0;
	for (var i=0; i<FileMsgGrid.mulLineCount; i++) {
    	if (FileMsgGrid.getSelNo(i)) { 
      		checkFlag = FileMsgGrid.getSelNo();
      		break;
		}
	}
    if (checkFlag) {
    	  var tCode=FileMsgGrid.getRowColData(checkFlag - 1, 1);
    	  var tCodeName=FileMsgGrid.getRowColData(checkFlag - 1, 2);
    	  var tCodeAlias=FileMsgGrid.getRowColData(checkFlag - 1, 3);
    	  var tCodeAliasD=FileMsgGrid.getRowColData(checkFlag - 1, 4);
    	  fm.all("code").value = tCode;
    	  fm.all("hideCode").value = tCode;
				fm.all("codename").value = tCodeName;
				fm.all("codealias").value = tCodeAlias;
				fm.all("codealiasD").value = tCodeAliasD;
}else{
	      fm.all("code").value = "";
				fm.all("codename").value = "";
				fm.all("codealias").value = "";
				fm.all("codealiasD").value = "";
	
	
	}
}
function cleartext(){
	      fm.all("code").value = "";
				fm.all("codename").value = "";
				fm.all("codealias").value = "";
				fm.all("codealiasD").value = "";
}
