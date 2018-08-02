<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 张立盛 <Zhangls@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成初始化
 ******************************************************************************/
%>

    <!-- 调用 JSP Init 初始化页面 : 开始 -->

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
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                   
            }
            catch (ex)
            {
                alert("在 largeTradePackageMakeInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 输入框的初始化
         */
        function initInputBox()
        {
            try
            {

                document.getElementsByName("StartDate")[0].value = "<%=sEndDate%>";
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
                document.getElementsByName("dataType")[0].value = "<%=request.getParameter("DataType")%>";
                showOneCodeName("AmlPackageDataType", "dataType", "dataTypeName");

            }
            catch (ex)
            {
                alert("在 largeTradePackageMakeInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
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
                var i=0;
                        iArray[i]=new Array();
                        iArray[i][0]="序号";
                        iArray[i][1]="30px";
                        iArray[i][2]=30;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="数据包编号";
                        iArray[i][1]="160px";
                        iArray[i][2]=200;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="报告类型";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="数据类型";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="生成日期";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="操作员";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="dealstate";
                        iArray[i][1]="0px";
                        iArray[i][2]=0;
                        iArray[i++][3]=3;
            }
            catch (ex)
            {
                alert("在 largeTradePackageMakeInit.jsp --> initFileMsgGrid 函数中发生异常: 初始化数组错误！");
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
                alert("在 largeTradePackageMakeInit.jsp --> initFileMsgGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

