<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：IHDataInterfaceInit.jsp
//程序功能：
//创建日期：2007-11-08
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%
String CurrentDate = PubFun.getCurrentDate();
String CurrentTime = PubFun.getCurrentTime();
%>
<script language="JavaScript">
function initInpBox()
{
  try
  {

    fm.all('StartDate').value = '';
    fm.all('EndDate').value = '';

    initTasksGrid();


  }
  catch(ex)
  {
    alert("IHDataInterfaceInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }
}


function initInpBox1()
{
  try
  {

    fm.all('StartDate').value = '';
    fm.all('EndDate').value = '';


  }
  catch(ex)
  {
    alert("IHDataInterfaceInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }
}




function initForm()
{
  try
  {
    initInpBox();
  }
  catch(re)
  {
    alert("IHDataInterfaceInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

function initForm1()
{
  try
  {
    initInpBox1();
  }
  catch(re)
  {
    alert("IHDataInterfaceInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}
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
		iArray[1][0]="标识号";    		  //列名
		iArray[1][1]="30px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="算法编码";    		  //列名
		iArray[2][1]="60px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="客户号";    		  //列名
		iArray[3][1]="80px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="交易号";   		  //列名
		iArray[4][1]="120px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="状态";	   		//列名
		iArray[5][1]="30px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=2;  			//是否允许输入,1表示允许，0表示不允许
		iArray[5][4] = "amllxcalflag";     

		iArray[6]=new Array();
		iArray[6][0]="发生时间";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="描述";	   		//列名
		iArray[7][1]="200px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[8]=new Array();
		iArray[8][0]="失败原因";	   		//列名
		iArray[8][1]="80px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许


		TasksGrid = new MulLineEnter( "fm" , "TasksGrid" ); 
		//这些属性必须在loadMulLine前
	    TasksGrid.displayTitle = 1;
		TasksGrid.locked = 1;	    
	    TasksGrid.hiddenPlus = 1;
	    TasksGrid.hiddenSubtraction = 1;     
		TasksGrid.canSel = 1;
	
	    TasksGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>
