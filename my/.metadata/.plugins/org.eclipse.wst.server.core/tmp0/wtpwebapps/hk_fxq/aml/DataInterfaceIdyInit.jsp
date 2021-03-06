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
 * @direction: 可疑交易报文文件生成初始化
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
            }
            catch (ex)
            {
                alert("在 DataInterfaceIdyInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 输入框的初始化
         */
        function initInputBox()
        {
            try
            {

            }
            catch (ex)
            {
                alert("在 DataInterfaceIdyInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
            }
        }

        /**
         * 已申请报文队列 MultiLine 的初始化
         */
        function initFileMsgGrid()
        {
            var iArray = new Array();                           //总数组, 返回给 MultiLine 表格
			var i = 0;
            try
            {
                iArray[i] = new Array();
                iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
                iArray[i][1] = "30px";                          //列宽
                iArray[i][2] = 30;                              //列最大值
                iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。
                
                iArray[i] = new Array();
                iArray[i][0] = "标示号";
                iArray[i][1] = "60px";
                iArray[i][2] = 300;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "算法编码";
                iArray[i][1] = "60px";
                iArray[i][2] = 300;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "特征代码";
                iArray[i][1] = "60px";
                iArray[i][2] = 150;
                iArray[i][3] = 0;
                iArray[i++][21] = 3;

                iArray[i] = new Array();
                iArray[i][0] = "有效性";
                iArray[i][1] = "60px";
                iArray[i][2] = 150;
                iArray[i][3] = 0;
                iArray[i++][21] = 3;

                iArray[i] = new Array();
                iArray[i][0] = "描述";
                iArray[i][1] = "320px";
                iArray[i][2] = 150;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "类型";
                iArray[i][1] = "30px";
                iArray[i][2] = 150;
                iArray[i++][3] = 0;
            }
            catch (ex)
            {
                alert("在 DubitMsgMakeApplyInit.jsp --> initFileMsgGrid 函数中发生异常: 初始化数组错误！");
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
                alert("在 DubitMsgMakeApplyInit.jsp --> initFileMsgGrid 函数中发生异常: 初始化界面错误！");
            }
        }

    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

