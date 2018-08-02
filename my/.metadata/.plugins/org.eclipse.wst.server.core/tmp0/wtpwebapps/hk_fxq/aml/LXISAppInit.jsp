<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
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
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                   
            }
            catch (ex)
            {
                alert("在 LXISAppInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
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
                alert("在 LXISAppInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
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
                iArray[1][2] = 200;
                iArray[1][3] = 0;
                iArray[1][7] = "checkBoxNext";

                iArray[2] = new Array();
                iArray[2][0] = "可疑特征";
                iArray[2][1] = "60px";
                iArray[2][2] = 200;
                iArray[2][3] = 2;
				iArray[2][4]="amlshadinessstamp";                
                iArray[2][7] = "checkBoxNext";
                iArray[2][9]="可疑特征|Code:amlshadinessstamp"; 

                iArray[3] = new Array();
                iArray[3][0] = "可疑程度";
                iArray[3][1] = "60px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
				iArray[3][4]="amlshadiness";                 
//                iArray[3][21] = 2;
                iArray[3][7] = "checkBoxNext";
                iArray[2][9]="可疑程度|Code:amlshadiness";                 

                iArray[4] = new Array();
                iArray[4][0] = "客户号";
                iArray[4][1] = "120px";
                iArray[4][2] = 200;
                iArray[4][3] = 0;
                iArray[4][7] = "checkBoxNext";

                iArray[5] = new Array();
                iArray[5][0] = "客户名";
                iArray[5][1] = "60px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][7] = "checkBoxNext";

                iArray[6] = new Array();
                iArray[6][0] = "数据状态";
                iArray[6][1] = "60px";
                iArray[6][2] = 200;
                iArray[6][3] = 2;
				iArray[6][4]="amldatastate";                    
                iArray[6][7] = "checkBoxNext";
                iArray[6][9]="数据状态|Code:amldatastate";                 

                iArray[7] = new Array();
                iArray[7][0] = "证件号码";
                iArray[7][1] = "0px";
                iArray[7][2] = 150;
                iArray[7][3] = 0;
                iArray[7][7] = "checkBoxNext";

                iArray[8] = new Array();
                iArray[8][0] = "交易日期";
                iArray[8][1] = "80px";
                iArray[8][2] = 100;
                iArray[8][3] = 0;
//                iArray[8][21] = 3;
                iArray[8][7] = "checkBoxNext";

                iArray[9] = new Array();
                iArray[9][0] = "交易时间";
                iArray[9][1] = "60px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;
//               iArray[9][21] = 3;
                iArray[9][7] = "checkBoxNext";

                iArray[10] = new Array();
                iArray[10][0] = "操作员";
                iArray[10][1] = "60px";
                iArray[10][2] = 100;
                iArray[10][3] = 0;
                iArray[10][7] = "checkBoxNext";
                
                iArray[11] = new Array();
                iArray[11][0] = "操作员";
                iArray[11][1] = "0px";
                iArray[11][2] = 100;
                iArray[11][3] = 0;
                iArray[11][7] = "checkBoxNext";
            }
            catch (ex)
            {
                alert("在 LXISAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
                WaitForBeFileGrid.mulLineCount = 0;
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
                alert("在 LXISAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

