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
	if(fm.all("hideOperate").value != "DELETE||DETAIL")
	{
		if(!beforeSubmit()) return false;
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
    //zhangyf add 
  	return;
  	//end 
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
     top.close();
  } 
  //返回父页面
  top.close();
  window.close();
	try{
		var cDealNo = fm.all("DealNo").value;
		top.opener.afterQuery( cDealNo );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的initIntBox接口。" + ex );
	}
  top.opener.focus();

  
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
//     	if (!verifyInput2())          
//	return false;
   var TSTM = document.getElementById("TSTM").value;
	//判断是否是YYYYMMDDHH24MISS
	var patrn=/^((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))(20|21|22|23|[0-1]?\d)$/;
	if(!patrn.exec(TSTM)){
		alert("请填入YYYYMMDDHH24的日期格式！" );
		document.getElementById("TSTM").value = "";
		document.getElementById("TSTM").focus();
		return false;
	}
	//身份证校验
	var TBIT = document.getElementById("TBIT").value;
	if (TBIT == "11"){
		var TBID = document.getElementById("TBID").value;
		if (!checkIdCard(TBID)) {
			document.getElementById("TBID").value= "";
			document.getElementById("TBID").focus() ;
			return false;
		}
	}	
	var sCSTP = document.getElementById("CSTP").value;
	var sCAOI = document.getElementById("CAOI").value;
	var sTCAN = document.getElementById("TCAN").value;
	if(sCSTP=="02")
	{
		if(sCAOI=="@N"||sTCAN=="@N")
		{
			alert("当资金进出方式为转账时资金账户开户行和银行转帐资金账号不能填写替代符!");
			return false;
		}
	}
	if(sCSTP!="02")
	{
		if(sCAOI=="@N"||sTCAN=="@N")
		{
			if(sCAOI!=sTCAN)
			{
				alert("资金账户开户行和银行转帐资金账号如果有一个为替代符,建议都填@N替代符!");
				return false;
			}
		}
	}
//			//代办人身份证类型的verify
//	var strSQL = "select code "
//		+ " from ldcode  where codetype = 'amlidtype' and code not like '2%25'"
//		+ " and code = '" + TBIT + "' " ;
//	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
//	//判断是否查询成功
//	if (!strQueryResult) {
//		alert("代办人身份证件类型不存在！");
//		document.getElementById("TBIT").value = "";
//		document.getElementById("TBIT").focus();		
//		return false;
//	}		    
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
		var arrReturn = fm.all("DealNo").value ;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}


