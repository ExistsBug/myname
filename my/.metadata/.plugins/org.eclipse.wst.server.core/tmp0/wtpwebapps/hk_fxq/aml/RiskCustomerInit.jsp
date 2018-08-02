<%@page contentType="text/html;charset=GBK" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文申请初始化
 ******************************************************************************/
%>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
    %>

    <script language="JavaScript">

        var StatGrid;

        /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initStatGrid();
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
        function initStatGrid()
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
                iArray[1][0] = "客户号";
                iArray[1][1] = "100px";
                iArray[1][2] = 100;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "客户名";
                iArray[2][1] = "60px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "风险级别";
                iArray[3][1] = "60px";
                iArray[3][2] = 100;
                iArray[3][3]=2;
                iArray[3][4]="amlriskgrade";
                
                iArray[4] = new Array();
                iArray[4][0] = "风险描述";
                iArray[4][1] = "150px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                
                iArray[5] = new Array();
                iArray[5][0] = "采取措施";
                iArray[5][1] = "150px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;

                iArray[6] = new Array();
                iArray[6][0] = "提取日期";
                iArray[6][1] = "60px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;


            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initStatGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                StatGrid = new MulLineEnter("fm", "StatGrid");
                StatGrid.mulLineCount = 0;
                StatGrid.displayTitle = 1;
                StatGrid.locked = 1;
                StatGrid.hiddenPlus = 1;
                StatGrid.hiddenSubtraction = 1;
                StatGrid.canChk = 0;
                StatGrid.canSel = 1;
                StatGrid.chkBoxEventFuncName = "";
//                StatGrid.selBoxEventFuncName = "ShowCustomerDetail";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                StatGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initStatGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

