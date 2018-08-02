<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
//程序名称：OrphanPolOutInit.jsp
//程序功能：
//创建日期：2005-05-26 15:39:06
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

<script language="JavaScript">
function initForm()
{
  try
  { 
    initFileMsgGrid();
  }
  catch(re)
  {
    alert("在LXISTradeContMain.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

function initFileMsgGrid()
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
		iArray[1][0]="级别编码";    		  //列名
		iArray[1][1]="60px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="级别名称";    		  //列名
		iArray[2][1]="60px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="级别描述";    		  //列名
		iArray[3][1]="100px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		
		iArray[4]=new Array();
		iArray[4][0]="采取措施";    		  //列名
		iArray[4][1]="100px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		     

		  FileMsgGrid = new MulLineEnter( "fm" , "FileMsgGrid" ); 
		//这些属性必须在loadMulLine前
	    FileMsgGrid.displayTitle = 1;
		  FileMsgGrid.locked = 1;	    
	    FileMsgGrid.hiddenPlus = 1;
	    FileMsgGrid.hiddenSubtraction = 1;     
		  FileMsgGrid.canSel = 1;
			FileMsgGrid.selBoxEventFuncName ="modifydetail" ;     //点击RadioBox时响应的JS函数
	    FileMsgGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>