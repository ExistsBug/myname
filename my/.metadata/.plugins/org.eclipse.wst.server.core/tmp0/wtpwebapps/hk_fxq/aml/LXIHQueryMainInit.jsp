<%
String tDealNo  = request.getParameter("DealNo") ;
String tCustomNo  = request.getParameter("CustomNo") ;
String tDate  = request.getParameter("Date") ;
System.out.println(tDealNo);
%>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>

    <script language="JavaScript">

        var WaitForBeFileGrid;
        tDealNo = '<%=tDealNo%>' ;
        tCustomNo = '<%=tCustomNo%>' ;
        tDate = '<%=tDate%>' ;
        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initTasksGrid();
                queryTasksGrid();
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
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
		iArray[1][0]="交易编号";    		  //列名
		iArray[1][1]="120px";			//列宽
		iArray[1][2]=200;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="大额交易特征代码";    		  //列名
		iArray[2][1]="80px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="大额交易明细编码";    		  //列名
		iArray[3][1]="80px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="金融机构网点名称";   		  //列名
		iArray[4][1]="80px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="账户类型";	   		//列名
		iArray[5][1]="100px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		     

		iArray[6]=new Array();
		iArray[6][0]="账号";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="交易时间";	   		//列名
		iArray[7][1]="80px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许

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

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

