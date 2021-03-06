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
                document.getElementsByName("PackageNo")[0].value = "<%=request.getParameter("PackageNo")%>";
                //document.getElementsByName("makeDate1")[0].value = "<%=sEndDate%>";
                document.getElementsByName("makeDate2")[0].value = "<%=sEndDate%>";
                //document.getElementsByName("makeDate3")[0].value = "<%=sEndDate%>";
                document.getElementsByName("makeDate4")[0].value = "<%=sEndDate%>";
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
				        iArray[i][0]="文件编号";         //列名
				        iArray[i][1]="120px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="报告类型";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="报文类型";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="文件名称";         //列名
				        iArray[i][1]="180px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="数据包编号";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				        
				        iArray[i]=new Array();
				        iArray[i][0]="文件序号";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				        
				
				        iArray[i]=new Array();
				        iArray[i][0]="处理状态";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				        
				        iArray[i]=new Array();
				        iArray[i][0]="生成日期";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
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
				        iArray[i][0]="文件编号";         //列名
				        iArray[i][1]="120px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="报告类型";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="报文类型";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="文件名称";         //列名
				        iArray[i][1]="180px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				
				        iArray[i]=new Array();
				        iArray[i][0]="数据包编号";         //列名
				        iArray[i][1]="100px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				        
				        iArray[i]=new Array();
				        iArray[i][0]="文件序号";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				        
				
				        iArray[i]=new Array();
				        iArray[i][0]="处理状态";         //列名
				        iArray[i][1]="60px";         //列名
				        iArray[i][2]=100;         //列名
				        iArray[i++][3]=0;         //列名
				        
				        iArray[i]=new Array();
				        iArray[i][0]="生成日期";         //列名
				        iArray[i][1]="100px";         //列名
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

