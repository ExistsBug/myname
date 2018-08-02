    <!-- 调用 JSP Init 初始化页面 : 开始 -->
<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
    <%@ page import="com.sinosoft.lis.pubfun.*" %>
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
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                
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
            {   var i=0;
                iArray[i] = new Array();
                iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
                iArray[i][1] = "30px";                          //列宽
                iArray[i][2] = 30;                              //列最大值
                iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。

                iArray[i] = new Array();
                iArray[i][0] = "交易编号";
                iArray[i][1] = "130px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "客户号";
                iArray[i][1] = "80px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "客户名称/姓名";
                iArray[i][1] = "100px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "国籍";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i][3] = 2;
				        iArray[i][4]="ccountry";                 
                iArray[i++][9]="国籍|Code:ccountry";  

                iArray[i] = new Array();
                iArray[i][0] = "数据状态代码";
                iArray[i][1] = "80px";
                iArray[i][2] = 100;
                iArray[i++][3] = 3;

                iArray[i] = new Array();
                iArray[i][0] = "数据状态";
                iArray[i][1] = "80px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
				        //iArray[8][4]="amldatastate";                 
                //iArray[8][9]="数据状态|Code:amldatastate"; 
                
                iArray[i] = new Array();
                iArray[i][0] = "证件类型";
                iArray[i][1] = "100px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
				        //iArray[4][4]="amlidtype";                 
                //iArray[4][9]="证件类型|Code:amlidtype";     
                
                iArray[i] = new Array();
                iArray[i][0] = "证件号码";
                iArray[i][1] = "120px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "交易发生日期";
                iArray[i][1] = "80px";
                iArray[i][2] = 150;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "交易提取日期";
                iArray[i][1] = "80px";
                iArray[i][2] = 150;
                iArray[i++][3] = 0;
                                               
                //iArray[i] = new Array();
                //iArray[i][0] = "生成日期";
                //iArray[i][1] = "0px";
                //iArray[i][2] = 100;
                //iArray[i++][3] = 0;
                //
                //iArray[i] = new Array();
                //iArray[i][0] = "生成时间";
                //iArray[i][1] = "0px";
                //iArray[i][2] = 100;
                //iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "操作人员";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "机构代码";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "机构名称";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
                


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
		iArray[2][1]="0";			//列宽
		iArray[2][2]=200;			//列最大值
		iArray[2][3]=3; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="大额交易特征";    		  //列名
		iArray[3][1]="80px";			//列宽
		iArray[3][2]=200;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		//iArray[2][4]="amlbigstamp";                 
    //   	iArray[2][9]="数据状态|Code:amlbigstamp"; 			

		iArray[4]=new Array();
		iArray[4][0]="明细编码";    		  //列名
		iArray[4][1]="0px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[5]=new Array();
		iArray[5][0]="金融机构网点名称";   		  //列名
		iArray[5][1]="150px";			//列宽
		iArray[5][2]=200;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许		

		iArray[6]=new Array();
		iArray[6][0]="账户类型";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=2;  			//是否允许输入,1表示允许，0表示不允许
		iArray[6][4]="amlaccount";                 
       	iArray[6][9]="数据状态|Code:amlaccount"; 			     

		iArray[7]=new Array();
		iArray[7][0]="账号";	   		//列名
		iArray[7][1]="120px";			//列宽
		iArray[7][2]=200;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[8]=new Array();
		iArray[8][0]="交易时间";	   		//列名
		iArray[8][1]="100px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[9]=new Array();
		iArray[9][0]="资金收付标识";	   		//列名
		iArray[9][1]="60px";			//列宽
		iArray[9][2]=0;			//列最大值
		iArray[9][3]=0;  			//是否允许输入,1表示允许，0表示不允许

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

