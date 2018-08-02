<%
//程序名称：OrphanPolOutInit.jsp
//程序功能：
//创建日期：2005-05-26 15:39:06
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<%
String tCode=request.getParameter("code") ;
%>
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>                          

<script language="JavaScript">
var mCode = '<%=tCode%>' ;
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
		if (mCode != null && mCode != ""){		
		  var strSQL = "(select CalCode,Validity, CalFactor,ReMark ,CRCD , NO , Parameter from lxcalmode  where Type='R' and NO='0' and Appid ='" + mCode + "')";
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//判断是否查询成功
			if (!strQueryResult) {
				fm.all("CalCode").value = "";
				fm.all("CRCD").value = mCode;
				fm.all("Validity").value = "1";
				fm.all("No").value = "0";
				fm.all("CalFactor").value = "";
				fm.all("ReMark").value = "";
				fm.all("Parameter").value = "CSNM,CTNM,Grade,DealDate,Operator,MakeDate,MakeTime";
				return true;
			}
			else{
				//查询成功则拆分字符串，返回二维数组								
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("CalCode").value = arrSelected[0][0];
				fm.all("hideCalCode").value = arrSelected[0][0];
				fm.all("Validity").value = arrSelected[0][1];
				fm.all("CalFactor").value = arrSelected[0][2];
				fm.all("ReMark").value = arrSelected[0][3];
				fm.all("CRCD").value = arrSelected[0][4];
				fm.all("No").value = arrSelected[0][5];
				fm.all("Parameter").value = arrSelected[0][6];
				return true;
		}
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
 	if (mCode != null && mCode != "")
   {	
   	 var strSQL = "select CalCode , NO , ReMark from LXCalMode  where Type = 'R' and NO <> '0' and Appid ='" + mCode + "' order by NO";		
		 turnPage3.queryModal(strSQL, TasksGrid);	
   }
   }
		catch(ex){
		alert(ex);
	}
}

// 被保人信息
function initTasksGrid()
{                               
	var iArray = new Array();      
    try
    {
		iArray[0]=new Array();
		iArray[0][0]="序号";   			//列名（此列为顺序号，列名无意义，而且不显示）
		iArray[0][1]="30px"; 	     		//列宽
		iArray[0][2]=100;			//列最大值
		iArray[0][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[1]=new Array();
		iArray[1][0]="子算法编号";    		  //列名
		iArray[1][1]="60px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
    iArray[1][9]="子算法编号|notnull"
 
		iArray[2]=new Array();
		iArray[2][0]="序列号";    		  //列名
		iArray[2][1]="60px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
    iArray[2][9]="序列号|notnull"

		iArray[3]=new Array();
		iArray[3][0]="描述";    		  //列名
		iArray[3][1]="300px";			//列宽
		iArray[3][2]=500;			//列最大值
		iArray[3][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
    iArray[3][9]="描述|notnull"

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
	catch(ex)
	{
	  alert(ex);
	}
}


</script>