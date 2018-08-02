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
		if (!beforeSubmit())     
			return false;
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
    initInpBox();
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    top.close();

    top.opener.focus();
  try{
  	
		top.opener.afterQuery( tDealNo,tCSNM,tRiskCode );
		
	}
	catch(ex)
	{
		alert( "没有发现父窗口的initIntBox接口。" + ex );
	}
	
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
	//if(!verifyInput()) return false;
	//if(!verifyInput2()) return false;
	
	if(!TasksGrid.checkValue("TasksGrid")) {
		return false;
	}   

	//身份证校验
	var IITP = document.getElementById("IITP").value;
	if (IITP == "11"){
		var ISID = document.getElementById("ISID").value;
		if (!checkIdCard(ISID)) {
			document.getElementById("ISID").value= "";
			document.getElementById("ISID").focus() ;
			return false;
		}
	} 
	
	
	//------------------------------------<cgh
		if (IITP == "19")
		{
			var ISID = document.getElementById("ISID").value;
			var myDate = new Date();
			if (ISID.substring(0,3)!="户口本"||ISID.substr(3)=="********"||BASEisNotDate(ISID.substr(3))||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))<0) //
			{
				alert("只允许小于18岁的人选择“户口本＋出生年月日”代替证件号码");
				document.getElementById("ISID").value= "";
			  document.getElementById("ISID").focus() ;
				return false;
			}
		}
		if (IITP == "14"){
			var ISID = document.getElementById("ISID").value;
			if (ISID.length<=5||ISID.indexOf(".") != -1) {
				alert("外国公民护照证件号码必须大于5位，且不能有“.”");
				document.getElementById("ISID").value= "";
			  document.getElementById("ISID").focus() ;
				return false;
			}
		}
		
		if (IITP == "21"){
		var ISID = document.getElementById("ISID").value;
		if (ISID.length!=9||ISID=="@N") {
			alert("被保人组织机构代码对应9位,证件号不能为@N");
			document.getElementById("ISID").value= "";
			document.getElementById("ISID").focus() ;
			return false;
		}
	} 
	var RLTP = document.getElementById("RLTP").value;
	if(RLTP==null||RLTP=="")
	{
		alert("投保人与被保险人的关系不能为空！");
		return false;
	}
	
	// 受益人
	for(var i=0;i<TasksGrid.mulLineCount;i++) 
	{
		var sBnfNo = TasksGrid.getRowColData(i, 1);
		var sBNNM = TasksGrid.getRowColData(i, 2);
		var IITP = TasksGrid.getRowColData(i, 3);
		var ISID = TasksGrid.getRowColData(i, 4);	
		if(sBnfNo=="@N"||sBNNM=="@N"||IITP=="@N"||ISID=="@N")
		{
			alert("受益人的信息如果没有建议填写@I");
			return false;
		}
		//if(ISID=="@N"||ISID=="@I")
		//{
		//	alert("受益人证件号码不能为@N或@I");
		//	TasksGrid.setRowColData(i, 4, "", TasksGrid);
		//	return false;
		//}		
		if (IITP == "11"){
			if (!checkIdCard(ISID)) {
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
		if (IITP == "19") 
		{
			var myDate = new Date();
			if (ISID.substring(0,3)!="户口本"||ISID.substr(3)=="********"||BASEisNotDate(ISID.substr(3))||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))<0) //
			{
				alert("只允许小于18岁的人选择“户口本＋出生年月日”代替证件号码");
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
		if (IITP == "14"){
			if (ISID.length<=5||ISID.indexOf(".") != -1) {
				alert("外国公民护照证件号码必须大于5位，且不能有“.”");
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
		if (IITP == "21"){
			if (ISID.length!=9||ISID=="@N") {
				alert("受益人组织机构代码对应9位,证件号不能为@N");
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
	}
	//----------------------------------->
//   return false;
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
//判断不为日期返回TRUE       cgh
function BASEisNotDate(theNum)
{
y   =   parseInt(theNum.substring(0,4),10); 
m   =   parseInt(theNum.substring(4,6),10)-1; 
d   =   parseInt(theNum.substr(6),10); 

dt   =   new   Date(y,m,d); 
if(dt.getFullYear()!=y   ||   dt.getMonth()!=m   ||   dt.getDate()!=d)  
  return true; 
else   
	return false; 

}