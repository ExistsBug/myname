<!--用户校验类-->
<%
String tCalCode = new String(request.getParameter("CalCode"));
if(tCalCode == null || tCalCode.equals("")){
   tCalCode = "";
}
String tAppId = new String(request.getParameter("AppId")) ;
if(tAppId == null || tAppId.equals("")){
   tAppId = "";
}
String tType = new String(request.getParameter("Type")) ;
if(tType == null || tType.equals("")){
   tType = "";
}
%>
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>                          

<script language="JavaScript">
var tCalCode = '<%=tCalCode%>' ;
var tAppId = '<%=tAppId%>' ;
var tType = '<%=tType%>' ;
var TasksGrid;
function initForm()
{
  try
  { 
  	initInpBox();

    initIntBox();
  }
  catch(re)
  {
    alert("在LXISTradeInsuMain.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//查询主算法信息
function initInpBox(){
	try{			
		var strSQL = "select Appid, " 
				+ "CalCode, "
				+ "CRCD, "
				+ "Validity, " 
				+ "decode(Validity, '1', '有效', '0', '无效'), "
				+ "CalFactor, "
				+ "URI, " 
				+ "tablename, "
				+ "parameter, "
				+ "ReMark, "
				+ "type, "
				+ "decode(type, 'S', 'SQL', 'C', 'CLASS') "
				+ "from lxcalmode "
				+ "where NO='0' "
				+ "and Appid ='" + tAppId + "' "
				+ "and CalCode= '" + tCalCode + "' "
				+ "and Type = '"+tType+"' ";
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);	    
			//判断是否查询成功
			if (!strQueryResult) {
				return true;
			}
			else{
				//查询成功则拆分字符串，返回二维数组								
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("AppId").value = arrSelected[0][0];
				fm.all("CalCode").value = arrSelected[0][1];
				fm.all("hideAppId").value = arrSelected[0][0];
				fm.all("hideCalCode").value = arrSelected[0][1];
				fm.all("CRCD").value = arrSelected[0][2];			
				fm.all("Validity").value = arrSelected[0][3];
				fm.all("ValidityName").value = arrSelected[0][4];				
				fm.all("CalFactor").value = arrSelected[0][5];
				fm.all("URI").value = arrSelected[0][6];
				fm.all("TableName").value = arrSelected[0][7];
				fm.all("Parameter").value = arrSelected[0][8];
				fm.all("ReMark").value = arrSelected[0][9];
				fm.all("Type").value = arrSelected[0][10];
				fm.all("TypeName").value = arrSelected[0][11];				
				return true; 		
		}				
}
		catch(ex){
		alert(ex);
	}
}

//查询子算法信息
function initIntBox(){
	initTasksGrid();
	try{
 	if (fm.all("AppId").value != null && fm.all("AppId").value != "" )
   {	
   	 var strSQL = "select CalCode ,URI ,tablename ,Validity, ReMark ,type,no from LXCalMode  where  NO <> '0' and Appid ='" + fm.all("AppId").value + "' and CalCode ='" + fm.all("CalCode").value + "' and type in ('S','C') order by NO";		
		 turnPage3.queryModal(strSQL, TasksGrid);	
   }
   }
		catch(ex){
		alert(ex);
	}
}
function initTasksGrid()
  {
      var iArray = new Array();                           //总数组, 返回给 MultiLine 表格
			var i = 0;
      try
      {
       iArray[i] = new Array();
       iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
       iArray[i][1] = "30px";                          //列宽
       iArray[i][2] = 30;                              //列最大值
       iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。
       
       iArray[i] = new Array();
       iArray[i][0] = "算法编码";
       iArray[i][1] = "60px";
       iArray[i][2] = 300;
       iArray[i++][3] = 1;             

       iArray[i] = new Array();
       iArray[i][0] = "URI";
       iArray[i][1] = "80px";
       iArray[i][2] = 300;
       iArray[i++][3] = 1;
       
       iArray[i] = new Array();
       iArray[i][0] = "表名";
       iArray[i][1] = "80px";
       iArray[i][2] = 150;
       iArray[i][3] = 1;
       iArray[i++][21] = 3;     
                       
       iArray[i] = new Array();
       iArray[i][0] = "有效性";
       iArray[i][1] = "30px";
       iArray[i][2] = 150;
       iArray[i][3] = 1;
       iArray[i++][21] = 3;

       iArray[i] = new Array();
       iArray[i][0] = "描述";
       iArray[i][1] = "260px";
       iArray[i][2] = 150;
       iArray[i++][3] = 1;
       
       iArray[i] = new Array();
       iArray[i][0] = "类型";
       iArray[i][1] = "30px";
       iArray[i][2] = 150;
       iArray[i++][3] = 1;
       
       iArray[i] = new Array();
       iArray[i][0] = "序号";
       iArray[i][1] = "30px";
       iArray[i][2] = 150;
       iArray[i++][3] = 1;
      }
     catch (ex)
     {
       alert("在 DubitMsgMakeApplyInit.jsp --> initTasksGrid 函数中发生异常: 初始化数组错误！");
     }

      try
     {
		  TasksGrid = new MulLineEnter( "fm" , "TasksGrid" ); 
		//这些属性必须在loadMulLine前
	    TasksGrid.displayTitle = 1;
	    TasksGrid.mulLineCount = 0;
	    TasksGrid.locked = 1;	    
	    TasksGrid.hiddenPlus = 1;
	    TasksGrid.hiddenSubtraction = 1;  
	    TasksGrid.canSel = 1;
	    TasksGrid.selBoxEventFuncName ="queryTasksGrid" ;     //点击RadioBox时响应的JS函数
	    TasksGrid.loadMulLine(iArray);
    }
     catch (ex)
    {
     alert("在 DubitMsgMakeApplyInit.jsp --> initTasksGrid 函数中发生异常: 初始化界面错误！");
    }
}
</script>