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
  }
  catch(ex)
  {
    alert("IRDataInterfaceInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
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
    alert("IRDataInterfaceInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }
}




function initForm()
{
  try
  {
    initInpBox();
    initTasksGrid();
  }
  catch(re)
  {
    alert("IRDataInterfaceInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
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
    alert("IRDataInterfaceInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
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
		iArray[0][2]=200;			//列最大值
		iArray[0][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[1]=new Array();
		iArray[1][0]="客户号";    		  //列名
		iArray[1][1]="100px";			//列宽
		iArray[1][2]=200;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="客户名";    		  //列名
		iArray[2][1]="100px";			//列宽
		iArray[2][2]=200;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="集体合同号";    		  //列名
		iArray[3][1]="150px";			//列宽
		iArray[3][2]=200;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="合同号";   		  //列名
		iArray[4][1]="120px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

        iArray[5]=new Array();
		iArray[5][0]="客户类型";   		  //列名
		iArray[5][1]="80px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许
        

		iArray[6]=new Array();
		iArray[6][0]="风险得分";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="风险等级";	   		//列名
		iArray[7][1]="80px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[8]=new Array();
		iArray[8][0]="机构";	   		//列名
		iArray[8][1]="60px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[9]=new Array();
		iArray[9][0]="操作员";	   		//列名
		iArray[9][1]="80px";			//列宽
		iArray[9][2]=100;			//列最大值
		iArray[9][3]=0;  			//是否允许输入,1表示允许，0表示不允许
        
        iArray[10]=new Array();
		iArray[10][0]="交易发生日期";	   		//列名
		iArray[10][1]="80px";			//列宽
		iArray[10][2]=100;			//列最大值
		iArray[10][3]=0;  			//是否允许输入,1表示允许，0表示不允许
        
        iArray[11]=new Array();
		iArray[11][0]="提取日期";	   		//列名
		iArray[11][1]="80px";			//列宽
		iArray[11][2]=100;			//列最大值
		iArray[11][3]=0;  			//是否允许输入,1表示允许，0表示不允许
 

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
