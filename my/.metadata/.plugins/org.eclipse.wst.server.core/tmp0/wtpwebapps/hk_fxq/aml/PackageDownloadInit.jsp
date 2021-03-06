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
 * @date     : 2007-07-26
 * @direction: 交易报文包下载初始化
 ******************************************************************************/
%>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
    %>

    <script language="JavaScript">

        var FilePkgGrid;

        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initFilePkgGrid();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                  
            }
            catch (ex)
            {
                alert("在 PackageDownloadInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 输入框的初始化
         */
        function initInputBox()
        {
            try
            {
                document.getElementsByName("ReportType")[0].value = "<%=request.getParameter("ReportType")%>";
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
            }
            catch (ex)
            {
                alert("在 PackageDownloadInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 已申请报文队列 MultiLine 的初始化
         */
        function initFilePkgGrid()
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
                iArray[1][0] = "报文包编号";
                iArray[1][1] = "130px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "报文包名称";
                iArray[2][1] = "220px";
                iArray[2][2] = 250;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "生成日期";
                iArray[3][1] = "65px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;
                iArray[3][21] = 3;

                iArray[4] = new Array();
                iArray[4][0] = "生成时间";
                iArray[4][1] = "65px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "操作员";
                iArray[5][1] = "65px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                
                iArray[6] = new Array();
                iArray[6][0] = "状态";
                iArray[6][1] = "65px";
                iArray[6][2] = 100;
                iArray[6][3] = 2;
								iArray[6][4]="amlpackagedealstate"; //
						    iArray[6][9]="状态类型|Code:amlpackagedealstate";
            }
            catch (ex)
            {
                alert("在 PackageDownloadInit.jsp --> initFilePkgGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                FilePkgGrid = new MulLineEnter("fm", "FilePkgGrid");
                FilePkgGrid.mulLineCount = 3;
                FilePkgGrid.displayTitle = 1;
                FilePkgGrid.locked = 1;
                FilePkgGrid.hiddenPlus = 1;
                FilePkgGrid.hiddenSubtraction = 1;
                FilePkgGrid.canChk = 0;
                FilePkgGrid.canSel = 1;
                FilePkgGrid.chkBoxEventFuncName = "";
                FilePkgGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                FilePkgGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 PackageDownloadInit.jsp --> initFilePkgGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

