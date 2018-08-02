//该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";                                       //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageTasksGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页

//提数操作
function submitForm()
{
  if(!verifyForm('fm')) return false;
  
  if(!beforeSubmit()) return false;
    var End = fm.EndDate.value;
	var cur = fm.CurrentDate.value;	
	if (End > cur)
	{
		alert("错误，提取止期不能大于今天");
		return false;
	}	
	
  var i = 0;
  var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");    
  fm.submit(); //提交

}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content )
{
  showInfo.close();
	 
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;  
  	//parent.fraInterface.initForm();
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  }
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
  try
  {
	  initForm();
  }
  catch(re)
  {
  	alert("在DataInterface.js-->resetForm函数中发生异常:初始化界面错误!");
  }
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

//执行提数         
function CalSave()
{
	fm.sFlag.value="cal";
  	submitForm();	
}   
function ReCalSave()
{
	fm.sFlag.value="recal";
  submitForm();	
}
function FillCalSave()
{
	fm.sFlag.value="fillcal";
  submitForm();	
}  
function DeleteCalSave()
{
	fm.sFlag.value="delete";
  submitForm();	
} 
function beforeSubmit()
{  
   if (fm.all('StartDate').value > fm.all('EndDate').value)
   {
   	alert("计算起期必须小于等于计算止期！");
        fm.all('StartDate').value = '';
        fm.all('EndDate').value = '';
   	return false;
   }else{
	   var startDate=fm.all('StartDate').value;
	   var endDate=fm.all('EndDate').value;
	   if(startDate.length>0&&endDate.length>0){   
		    var arrStartDate = startDate.split("-");   
			var arrEndDate = endDate.split("-");
			var allStartDate = new Date(arrStartDate[0],arrStartDate[1],arrStartDate[2]);   
		    var allEndDate = new Date(arrEndDate[0],arrEndDate[1],arrEndDate[2]);
			var l=(allEndDate.getTime()-allStartDate.getTime())/(3600*1000*24);
			var QuerySQL1="select sysvarvalue from ldsysvar where sysvar='timeIRFlag'";
			var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    var d=arrSelected[0][0];
			if(l>=d){
				alert("目前只能提取31天以内的数据,如果要提取更多记录请联系IT部门！");
				return false; 
			}
		}
   }
   return true;
}

function backCal()
{
  if(!verifyForm('fm1')) return false;
  	
	
  var i = 0;
  var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");    
  fm1.submit(); //提交
}
function QueryGrid(){
	var QuerySQL = "select customerno, "
                 +        "customername, "
                 +        "grpcontno, "
                 +        "contno, "
                 +        "(case when customertype='1' then '投保人' when customertype = '2' then '被保人' else '受益人' end),"
                 +        "score, "
                 +        "customerlevel, "
                 +        "managecom ,"
                 +        "operator ,dealdate,"
                 +        "makedate "
                 +    "from LXCustomerRiskResult "
                 +    "where 1 = 1  "
                 +      getWherePart("dealdate", "StartDate1", ">=")
                 +      getWherePart("dealdate", "EndDate1", "<=")
                 +   "order by makedate desc,score desc, customerno ";
    try
    {
        turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
        turnPageTasksGrid.queryModal(QuerySQL, TasksGrid,0,1);
    }
    catch (ex)
    {
        alert("警告：查询提数结果出错！ ");
    }
	}
function resetform1(){
	      fm.all('StartDate1').value = '';
        fm.all('EndDate1').value = '';
        initTasksGrid();		
	}