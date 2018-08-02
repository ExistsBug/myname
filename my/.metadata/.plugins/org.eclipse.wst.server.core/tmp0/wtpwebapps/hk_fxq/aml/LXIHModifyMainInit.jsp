
<!-- 调用 JSP Init 初始化页面 : 开始 -->
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage=""%>
<%@ page import="com.sinosoft.lis.pubfun.*"%>
<%
        String sEndDate = PubFun.getCurrentDate();
 %>

<script language="JavaScript">

        var WaitForBeFileGrid;

        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
                initTasksGrid();
                initErrorGrid();
                queryWaitForBeFileGrid();
                initSendOut();
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 输入框的初始化
         */
        function initInputBox()
        {
            try
            {
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
				document.getElementsByName("CTNTName")[0].value = "中国 China";
						
		    fm.MngCom.value = "<%=tGI.ComCode%>";
		    showOneCodeName('station','MngCom','MngComName');		
				
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 可选报文队列 MultiLine 的初始化
         */
        function initWaitForBeFileGrid()
        {
            var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

            try
            {
                iArray[0] = new Array();
                iArray[0][0] = "序号";                          //列名(顺序号, 无意义)
                iArray[0][1] = "30px";                          //列宽
                iArray[0][2] = 30;                              //列最大值
                iArray[0][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。

                iArray[1] = new Array();
                iArray[1][0] = "交易编号";
                iArray[1][1] = "150px";
                iArray[1][2] = 100;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "客户号";
                iArray[2][1] = "80px";
                iArray[2][2] = 200;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "客户名";
                iArray[3][1] = "100px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;

                iArray[4] = new Array();
                iArray[4][0] = "证件类型";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 2;
				iArray[4][4]="amlidtype";                 
                iArray[4][9]="证件类型|Code:amlidtype";                 

                iArray[5] = new Array();
                iArray[5][0] = "证件号码";
                iArray[5][1] = "100px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;

                iArray[6] = new Array();
                iArray[6][0] = "国籍";
                iArray[6][1] = "0px";
                iArray[6][2] = 100;
                iArray[6][3] = 2;
				iArray[6][4]="ccountry";                 
                iArray[6][9]="国籍|Code:ccountry"; 
                
                iArray[7] = new Array();
                iArray[7][0] = "发生日期";
                iArray[7][1] = "80px";
                iArray[7][2] = 150;
                iArray[7][3] = 0;

                iArray[8] = new Array();
                iArray[8][0] = "数据状态";
                iArray[8][1] = "60px";
                iArray[8][2] = 100;
                iArray[8][3] = 2;
				iArray[8][4]="amldatastate";                 
                iArray[8][9]="数据状态|Code:amldatastate";                   
                
                iArray[9] = new Array();
                iArray[9][0] = "生成日期";
                iArray[9][1] = "80px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;
                
                iArray[10] = new Array();
                iArray[10][0] = "生成时间";
                iArray[10][1] = "0px";
                iArray[10][2] = 100;
                iArray[10][3] = 3;
                
                iArray[11] = new Array();
                iArray[11][0] = "操作员";
                iArray[11][1] = "60px";
                iArray[11][2] = 100;
                iArray[11][3] = 0;
                
                iArray[12] = new Array();
                iArray[12][0] = "操作员";
                iArray[12][1] = "0px";
                iArray[12][2] = 100;
                iArray[12][3] = 3;

                iArray[13] = new Array();
                iArray[13][0] = "amlidtype";
                iArray[13][1] = "0px";
                iArray[13][2] = 100;
                iArray[13][3] = 3;
                
                iArray[14] = new Array();
                iArray[14][0] = "amldatastate";
                iArray[14][1] = "0px";
                iArray[14][2] = 100;
                iArray[14][3] = 3;                
                
                iArray[15] = new Array();
                iArray[15][0] = "管理机构";
                iArray[15][1] = "120px";
                iArray[15][2] = 100;
                iArray[15][3] = 0;  
                
                iArray[16] = new Array();
                iArray[16][0] = "修改状态";
                iArray[16][1] = "100px";
                iArray[16][2] = 100;
                iArray[16][3] = 0;                  
                
                
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
                WaitForBeFileGrid.mulLineCount = 0;
                WaitForBeFileGrid.displayTitle = 1;
                WaitForBeFileGrid.locked = 1;
                WaitForBeFileGrid.hiddenPlus = 1;
                WaitForBeFileGrid.hiddenSubtraction = 1;
                WaitForBeFileGrid.canChk = 0;
                WaitForBeFileGrid.canSel = 1;
                WaitForBeFileGrid.chkBoxEventFuncName = "";
                WaitForBeFileGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                	 WaitForBeFileGrid.selBoxEventFuncName ="queryTasksGrid" ;     //点击RadioBox时响应的JS函数
                WaitForBeFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
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
		iArray[1][1]="140px";			//列宽
		iArray[1][2]=200;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="大额交易特征代码";    		  //列名
		iArray[2][1]="100px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=2; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		iArray[2][4]="amlbigstamp";                 
        iArray[2][9]="大额交易特征代码|Code:amlbigstamp";    		

		iArray[3]=new Array();
		iArray[3][0]="大额交易明细编码";    		  //列名
		iArray[3][1]="100px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="金融机构网点名称";   		  //列名
		iArray[4][1]="120px";			//列宽
		iArray[4][2]=200;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="账户类型";	   		//列名
		iArray[5][1]="60px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=2;  			//是否允许输入,1表示允许，0表示不允许
		iArray[5][4]="amlaccount";                 
        iArray[5][9]="账户类型|Code:amlaccount"; 

		iArray[6]=new Array();
		iArray[6][0]="账号";	   		//列名
		iArray[6][1]="100px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="交易时间";	   		//列名
		iArray[7][1]="100px";			//列宽
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


        function initErrorGrid()
        {
            var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

            try
            {
                iArray[0] = new Array();
                iArray[0][0] = "序号";                          //列名(顺序号, 无意义)
                iArray[0][1] = "30px";                          //列宽
                iArray[0][2] = 30;                              //列最大值
                iArray[0][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。

                iArray[1] = new Array();
                iArray[1][0] = "回执文件编号";
                iArray[1][1] = "120px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "回执内容编号";
                iArray[2][1] = "0px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "交易编号";
                iArray[3][1] = "150px";
                iArray[3][2] = 200;
                iArray[3][3] = 0;

                iArray[4] = new Array();
                iArray[4][0] = "状态";
                iArray[4][1] = "30px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                
                iArray[5]=new Array();
		        iArray[5][0]="错误定位";	   		//列名
		        iArray[5][1]="200px";			//列宽
		        iArray[5][2]=100;			//列最大值
		        iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		                 
                
		        iArray[6]=new Array();
		        iArray[6][0]="错误原因";	   		//列名
		        iArray[6][1]="180px";			//列宽
		        iArray[6][2]=100;			//列最大值
		        iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initErrorGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                ErrorGrid = new MulLineEnter("fm", "ErrorGrid");
                ErrorGrid.mulLineCount = 0;
                ErrorGrid.displayTitle = 1;
                ErrorGrid.locked = 1;
                ErrorGrid.hiddenPlus = 1;
                ErrorGrid.hiddenSubtraction = 1;
                ErrorGrid.canChk = 0;
                ErrorGrid.canSel = 0;
                ErrorGrid.chkBoxEventFuncName = "";
                ErrorGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                ErrorGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initErrorGrid 函数中发生异常: 初始化界面错误！");
            }
        }
    </script>

<!-- 调用 JSP Init 初始化页面 : 结束 -->

