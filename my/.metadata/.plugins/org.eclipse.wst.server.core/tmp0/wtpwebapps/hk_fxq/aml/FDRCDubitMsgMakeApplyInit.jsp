<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 ******************************************************************************/
%>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
    %>

    <script language="JavaScript">

        var FileMsgGrid;

        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initFileMsgGrid();
                checkDataTypeState();
            }
            catch (ex)
            {
                alert("在 FDRCDubitMsgMakeApplyInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 输入框的初始化
         */
        function initInputBox()
        {
            try
            {
                document.getElementsByName("DataType")[0].value = "<%=request.getParameter("DataType")%>";
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
                showOneCodeName("AmlFileDataType", "DataType", "DataTypeName");
            }
            catch (ex)
            {
                alert("在 FDRCDubitMsgMakeApplyInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 已申请报文队列 MultiLine 的初始化
         */
        function initFileMsgGrid()
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
                iArray[1][0] = "报文编号";
                iArray[1][1] = "160px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "报文类型";
                iArray[2][1] = "80px";
                iArray[2][2] = 100;
                iArray[2][3] = 2;
                iArray[2][4] = "amlfiledatatype";

                iArray[3] = new Array();
                iArray[3][0] = "处理状态";
                iArray[3][1] = "80px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlfiledealstate";

                iArray[4] = new Array();
                iArray[4][0] = "入机日期";
                iArray[4][1] = "80px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "入机时间";
                iArray[5][1] = "80px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][21] = 3;

                iArray[6] = new Array();
                iArray[6][0] = "操作员";
                iArray[6][1] = "80px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
            }
            catch (ex)
            {
                alert("在 FDRCDubitMsgMakeApplyInit.jsp --> initFileMsgGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                FileMsgGrid = new MulLineEnter("fm", "FileMsgGrid");
                FileMsgGrid.mulLineCount = 3;
                FileMsgGrid.displayTitle = 1;
                FileMsgGrid.locked = 1;
                FileMsgGrid.hiddenPlus = 1;
                FileMsgGrid.hiddenSubtraction = 1;
                FileMsgGrid.canChk = 0;
                FileMsgGrid.canSel = 1;
                FileMsgGrid.chkBoxEventFuncName = "";
                FileMsgGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                FileMsgGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 FDRCDubitMsgMakeApplyInit.jsp --> initFileMsgGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

