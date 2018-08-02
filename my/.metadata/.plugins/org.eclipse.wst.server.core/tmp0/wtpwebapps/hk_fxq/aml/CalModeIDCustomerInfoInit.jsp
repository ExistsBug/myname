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
		iArray[1][0]="机构代码";    		  //列名
		iArray[1][1]="80px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="机构名称";    		  //列名
		iArray[2][1]="260px";			//列宽
		iArray[2][2]=300;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="交易日期";    		  //列名
		iArray[3][1]="80px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="销售渠道";   		  //列名
		iArray[4][1]="80px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="保险计划名称";	   		//列名
		iArray[5][1]="230px";			//列宽
		iArray[5][2]=300;			//列最大值
		iArray[5][3]=2;  			//是否允许输入,1表示允许，0表示不允许
		//iArray[5][4] = "amllxcalflag";     

		iArray[6]=new Array();
		iArray[6][0]="保险合同号";	   		//列名
		iArray[6][1]="120px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="投保人";	   		//列名
		iArray[7][1]="60px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[8]=new Array();
		iArray[8][0]="被保险人";	   		//列名
		iArray[8][1]="60px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许
        
        iArray[9]=new Array();
		iArray[9][0]="受益人";	   		//列名
		iArray[9][1]="60px";			//列宽
		iArray[9][2]=100;			//列最大值
		iArray[9][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[10]=new Array();
		iArray[10][0]="交易金额";	   		//列名
		iArray[10][1]="80px";			//列宽
		iArray[10][2]=100;			//列最大值
		iArray[10][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[11]=new Array();
		iArray[11][0]="交易方式";	   		//列名
		iArray[11][1]="120px";			//列宽
		iArray[11][2]=200;			//列最大值
		iArray[11][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[12]=new Array();
		iArray[12][0]="收支方向";	   		//列名
		iArray[12][1]="60px";			//列宽
		iArray[12][2]=100;			//列最大值
		iArray[12][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[13]=new Array();
		iArray[13][0]="识别类型";	   		//列名
		iArray[13][1]="400px";			//列宽
		iArray[13][2]=100;			//列最大值
		iArray[13][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[14]=new Array();
		iArray[14][0]="交易特征";	   		//列名
		iArray[14][1]="100px";			//列宽
		iArray[14][2]=100;			//列最大值
		iArray[14][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
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
