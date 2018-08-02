<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 ******************************************************************************/
%>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
    		String tradeDataState="";
    		String tReportType=request.getParameter("reportType");
            String mFDRC = "";
				String tDataType=request.getParameter("dataType");
				String sEndDate = PubFun.getCurrentDate();
				String addedDate = PubFun.getCurrentDate();
				System.out.println(request.getParameter("dataType"));
				System.out.println(request.getParameter("reportType"));
				System.out.println(request.getParameter("FileNo"));
				String sStartDate="";
					if(tDataType.equals("03")||tDataType.equals("01"))
				{
					sEndDate = sEndDate;
					addedDate = PubFun.calDate(sEndDate, -8, "D", null);
				}
			else
				{
					sEndDate =sEndDate;
				}
        if(tDataType.equals("01"))//大额正常报文
				{
					tradeDataState="('S01')";
				}
        if(tDataType.equals("02"))//大额纠错报文
        {
        	tradeDataState="('C01')";
        }
        if(tDataType.equals("03"))//大额补报报文
        {
        	tradeDataState="('S01','A01')";
        }
        if(tDataType.equals("04"))//大额删除报文
        {
        	tradeDataState="('D01')";
        }
        // add by jinsh
        if(tDataType.equals("05"))//大额补正报文
        {
        	tradeDataState="('I01')";
            mFDRC = "FDRC";
        }
        if(tDataType.equals("06"))//大额重发报文
        {
        	tradeDataState="('R01')";
        }
    %>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->



    <script language="JavaScript">

        var WaitForBeFileGrid, AlreadyInFileGrid;

        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
                initAlreadyInFileGrid();
                checkCanDownloadFileMsg();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                
            }
            catch (ex)
            {
                alert("在 DubitNormalMsgMakeDealInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 输入框的初始化
         */
        function initInputBox()
        {
            try
            {
                /*document.getElementsByName("FileNo")[0].value = "<%=request.getParameter("FileNo")%>";*/

                document.getElementsByName("HTDT1")[0].value = "<%=sStartDate%>";
                document.getElementsByName("HTDT3")[0].value = "<%=sStartDate%>";
                document.getElementsByName("HTDT2")[0].value = "<%=sEndDate%>";
                document.getElementsByName("HTDT4")[0].value = "<%=sEndDate%>";
                document.getElementsByName("FDRC")[0].value = "<%=mFDRC%>";
            }
            catch (ex)
            {
                alert("在 DubitNormalMsgMakeDealInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
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
                var i=0;
				        iArray[i]=new Array();
				        iArray[i][0]="序号";         //列名
				        iArray[i][1]="30px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="交易编号";         //列名
				        iArray[i][1]="120px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="客户号";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="客户名称";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //列名


				        iArray[i]=new Array();
				        iArray[i][0]="客户证件号码";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="大额交易发生日期";         //列名
				        iArray[i][1]="80px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //列名


				        iArray[i]=new Array();
				        iArray[i][0]="交易状态";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //列名
            }
            catch (ex)
            {
                alert("在 DubitNormalMsgMakeDealInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
                WaitForBeFileGrid.mulLineCount = 3;
                WaitForBeFileGrid.displayTitle = 1;
                WaitForBeFileGrid.locked = 1;
                WaitForBeFileGrid.hiddenPlus = 1;
                WaitForBeFileGrid.hiddenSubtraction = 1;
                WaitForBeFileGrid.canChk = 1;
                WaitForBeFileGrid.canSel = 0;
                WaitForBeFileGrid.chkBoxEventFuncName = "";
                WaitForBeFileGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                WaitForBeFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 DubitNormalMsgMakeDealInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 已选报文队列 MultiLine 的初始化
         */
        function initAlreadyInFileGrid()
        {
            var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

            try
            {
                var i=0;
				        iArray[i]=new Array();
				        iArray[i][0]="序号";         //列名
				        iArray[i][1]="30px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="交易编号";         //列名
				        iArray[i][1]="120px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="客户号";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="客户名称";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名


				        iArray[i]=new Array();
				        iArray[i][0]="客户证件号码";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名

				        iArray[i]=new Array();
				        iArray[i][0]="大额交易发生日期";         //列名
				        iArray[i][1]="80px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名


				        iArray[i]=new Array();
				        iArray[i][0]="交易状态";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
            }
            catch (ex)
            {
                alert("在 DubitNormalMsgMakeDealInit.jsp --> initAlreadyInFileGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                AlreadyInFileGrid = new MulLineEnter("fm", "AlreadyInFileGrid");
                AlreadyInFileGrid.mulLineCount = 3;
                AlreadyInFileGrid.displayTitle = 1;
                AlreadyInFileGrid.locked = 1;
                AlreadyInFileGrid.hiddenPlus = 1;
                AlreadyInFileGrid.hiddenSubtraction = 1;
                AlreadyInFileGrid.canChk = 1;
                AlreadyInFileGrid.canSel = 0;
                AlreadyInFileGrid.chkBoxEventFuncName = "";
                AlreadyInFileGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                AlreadyInFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 DubitNormalMsgMakeDealInit.jsp --> initAlreadyInFileGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

