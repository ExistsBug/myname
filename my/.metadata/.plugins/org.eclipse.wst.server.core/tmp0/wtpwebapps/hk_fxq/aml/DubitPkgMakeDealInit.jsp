<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文包生成初始化
 ******************************************************************************/
%>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
        String sStartDate = PubFun.calDate(sEndDate, -10, "D", null);
    %>

    <script language="JavaScript">

        var WaitForBePackageGrid, AlreadyInPackageGrid;

        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBePackageGrid();
                initAlreadyInPackageGrid();
                checkDataTypeState();
            }
            catch (ex)
            {
                alert("在 DubitPkgMakeDealInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
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
                document.getElementsByName("PackageNo")[0].value = "<%=request.getParameter("PackageNo")%>";
//                document.getElementsByName("StartDate1")[0].value = "<%=sStartDate%>";
                document.getElementsByName("EndDate1")[0].value = "<%=sEndDate%>";
                showOneCodeName("AmlPackageDataType", "DataType", "DataTypeName");
            }
            catch (ex)
            {
                alert("在 DubitPkgMakeDealInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 可选报文队列 MultiLine 的初始化
         */
        function initWaitForBePackageGrid()
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
                iArray[1][1] = "115px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "报文名称";
                iArray[2][1] = "275px";
                iArray[2][2] = 300;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "处理状态";
                iArray[3][1] = "55px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlfiledealstate";

                iArray[4] = new Array();
                iArray[4][0] = "入机日期";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "入机时间";
                iArray[5][1] = "55px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][21] = 3;

                iArray[6] = new Array();
                iArray[6][0] = "附件";
                iArray[6][1] = "50px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
                iArray[6][21] = 2;

                iArray[7] = new Array();
                iArray[7][0] = "操作员";
                iArray[7][1] = "55px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;
            }
            catch (ex)
            {
                alert("在 DubitPkgMakeDealInit.jsp --> initWaitForBePackageGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                WaitForBePackageGrid = new MulLineEnter("fm", "WaitForBePackageGrid");
                WaitForBePackageGrid.mulLineCount = 3;
                WaitForBePackageGrid.displayTitle = 1;
                WaitForBePackageGrid.locked = 1;
                WaitForBePackageGrid.hiddenPlus = 1;
                WaitForBePackageGrid.hiddenSubtraction = 1;
                WaitForBePackageGrid.canChk = 1;
                WaitForBePackageGrid.canSel = 0;
                WaitForBePackageGrid.chkBoxEventFuncName = "";
                WaitForBePackageGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                WaitForBePackageGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 DubitPkgMakeDealInit.jsp --> initWaitForBePackageGrid 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 已选报文队列 MultiLine 的初始化
         */
        function initAlreadyInPackageGrid()
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
                iArray[1][1] = "115px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "报文名称";
                iArray[2][1] = "275px";
                iArray[2][2] = 300;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "处理状态";
                iArray[3][1] = "55px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlfiledealstate";

                iArray[4] = new Array();
                iArray[4][0] = "入机日期";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "入机时间";
                iArray[5][1] = "55px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][21] = 3;

                iArray[6] = new Array();
                iArray[6][0] = "附件";
                iArray[6][1] = "50px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
                iArray[6][21] = 2;

                iArray[7] = new Array();
                iArray[7][0] = "操作员";
                iArray[7][1] = "55px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;
            }
            catch (ex)
            {
                alert("在 DubitPkgMakeDealInit.jsp --> initAlreadyInPackageGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                AlreadyInPackageGrid = new MulLineEnter("fm", "AlreadyInPackageGrid");
                AlreadyInPackageGrid.mulLineCount = 3;
                AlreadyInPackageGrid.displayTitle = 1;
                AlreadyInPackageGrid.locked = 1;
                AlreadyInPackageGrid.hiddenPlus = 1;
                AlreadyInPackageGrid.hiddenSubtraction = 1;
                AlreadyInPackageGrid.canChk = 1;
                AlreadyInPackageGrid.canSel = 0;
                AlreadyInPackageGrid.chkBoxEventFuncName = "";
                AlreadyInPackageGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                AlreadyInPackageGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 DubitPkgMakeDealInit.jsp --> initAlreadyInPackageGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

