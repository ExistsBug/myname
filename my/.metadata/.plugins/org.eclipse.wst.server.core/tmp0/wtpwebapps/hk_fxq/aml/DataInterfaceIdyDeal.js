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
function submitForm(oper)
{	
	if (!beforeSubmit(oper))     
		return false;
	var i = 0;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");  
	fm.action="./DataInterfaceIdyDealSave.jsp?oper="+oper; 
	fm.submit(); //提交

}
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
     initInpBox();
     initIntBox();
//        fm.all("CalCodeC").value = "";
		fm.all("NoC").value = "";
		fm.all("hideCalCodeC").value = "";
		fm.all("hideNoC").value = "";
		fm.all("CalFactorC").value = "";
		fm.all("TypeC").value = "";
		fm.all("TypeCName").value = "";
		fm.all("ReMarkC").value = "";
		fm.all("ParameterC").value = "";
		fm.all("TableNameC").value = "";
		fm.all("URIC").value = "";
		fm.all("ValidityC").value = "";
		fm.all("ValidityCName").value = "";
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
     top.close();
     top.opener.focus();
     top.opener.queryFileMsgGrid();
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
	initForm();
} 

 
//提交前的校验、计算  
function beforeSubmit(oper)
{
  if(oper == "main" || oper == "deletemain")  	{
  	if(fm.all("CalCode").value==""||fm.all("CalFactor").value==""||fm.all("Validity").value==""||fm.all("ReMark").value==""||fm.all("AppId").value==""||fm.all("CRCD").value==""||fm.all("URI").value==""||fm.all("TableName").value==""||fm.all("Type").value==""||fm.all("Parameter").value==""){
  		alert("请检查主算法的所有非空字段填写完全！");
  		return false  ;		
  	}
  if(fm.all("Validity").value!=1 && fm.all("Validity").value!=0 )	{
  	  alert("有效性只能为1或0！");
  		return false  ;
  	}
  	
 } 	
 if(oper == "addson" || oper == "updateson")  	{
  	if(fm.all("CalFactorC").value==""||fm.all("ValidityC").value==""||fm.all("ReMarkC").value==""||fm.all("URIC").value==""||fm.all("TypeC").value==""){
  		alert("请检查子算法的所有非空字段填写完全！");
  		return false;	
  	}
  	if( fm.all("NoC").value=="0"){
  		alert("子算法的序号不可以为0！");
  		return false;	  		
  	}
}
if( oper == "deleteson" ){
  	var checkFlag = 0;
	   for (var i=0; i<TasksGrid.mulLineCount; i++) {
    	if (TasksGrid.getSelNo(i)) { 
      		checkFlag = TasksGrid.getSelNo();
      		break;
		}
	 }
    if (!checkFlag) { 
    	alert("请选择一条算法！");
  		return false  ;	  
    	}
}
if( oper == "deletemain" ){
  	var strSQL = "select CalCode ,URI ,tablename ,Validity, ReMark ,type,no from LXCalMode  where  NO <> '0' and Appid ='" + fm.all("AppId").value + "' and CalCode ='" + fm.all("CalCode").value + "' order by NO";		
		var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
		    
			//判断是否查询成功
			if (strQueryResult) {
				alert("请先删除子算法！");
				return false;
			}
}
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
		top.opener.queryFileMsgGrid();
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}

function queryTasksGrid()
{  
	var checkFlag = 0;
	for (var i=0; i<TasksGrid.mulLineCount; i++) {
    	if (TasksGrid.getSelNo(i)) { 
      		checkFlag = TasksGrid.getSelNo();
      		break;
		}
	}
	if (checkFlag) {
		var tCalCode=TasksGrid.getRowColData(checkFlag - 1, 1);
    	var tType=TasksGrid.getRowColData(checkFlag - 1, 6);
    	var tNO=TasksGrid.getRowColData(checkFlag - 1, 7);
		var strSQL = "select "
				+ "NO, "
				+ "CalFactor, " 
				+ "Validity, "
				+ "decode(Validity, '1', '有效', '0', '无效'), "
				+ "ReMark, "
				+ "URI, "
				+ "tablename, "
				+ "parameter, "
				+ "type, "
				+ "decode(type, 'S', 'SQL', 'C', 'CLASS') "
				+ "from LXCalMode "
				+ "where Type = '" + tType + "' "
				+ "and NO = '" + tNO + "' "
				+ "and appid ='" + fm.all("AppId").value+ "' "
				+ "and CalCode = '" + tCalCode+ "' ";
		    var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
		    
			//判断是否查询成功
			if (!strQueryResult) {
				alert("查询失败！");
				return false;
			}
		  	var arrSelected = decodeEasyQueryResult(strQueryResult);
		  	var i = 0;
//			fm.all("CalCodeC").value = arrSelected[0][i];
//			fm.all("hideCalCodeC").value = arrSelected[0][i++];			
			fm.all("NoC").value = arrSelected[0][i];
			fm.all("hideNoC").value = arrSelected[0][i++];
			fm.all("CalFactorC").value = arrSelected[0][i++];
			fm.all("ValidityC").value = arrSelected[0][i++];   
			fm.all("ValidityCName").value = arrSelected[0][i++];   				
			fm.all("ReMarkC").value = arrSelected[0][i++];   
			fm.all("URIC").value = arrSelected[0][i++];   
			fm.all("tablenameC").value = arrSelected[0][i++];     
			fm.all("parameterC").value = arrSelected[0][i++];  
			fm.all("typeC").value = arrSelected[0][i++];   
			fm.all("typeCName").value = arrSelected[0][i++];			    
  }
		else {
	    	alert("请先选择一条子算法！"); 
		}	
}
