<!-- 调用 JSP Init 初始化页面 : 开始 -->

<script language="JavaScript">
        
        var LXCancelreportGrid;
        
         /**
         * 总函数，初始化页面
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initLXCancelreportGrid();                    
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
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%=tGI.ManageCom%>;
                showOneCodeName("stati","ManageCom","ManageComName"); 
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
            }
        }
        
                /**
         * 可选报文队列 MultiLine 的初始化
         */
        function initLXCancelreportGrid()
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
                iArray[1][1] = "100px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "交易类型";
                iArray[2][1] = "40px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;
                
                iArray[3] = new Array();
                iArray[3][0] = "可疑程度";
                iArray[3][1] = "40px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;
                
                iArray[4] = new Array();
                iArray[4][0] = "客户号";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
       	
                iArray[5] = new Array();
                iArray[5][0] = "客户名称/姓名";
                iArray[5][1] = "60px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;	

                iArray[6] = new Array();
                iArray[6][0] = "交易发生日期";
                iArray[6][1] = "60px";
                iArray[6][2] = 200;
                iArray[6][3] = 0;

                iArray[7] = new Array();
                iArray[7][0] = "审批不通过原因";
                iArray[7][1] = "140px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;

                iArray[8] = new Array();
                iArray[8][0] = "操作人员";
                iArray[8][1] = "40px";
                iArray[8][2] = 100;
                iArray[8][3] = 0; 
                        
                iArray[9] = new Array();
                iArray[9][0] = "操作日期";
                iArray[9][1] = "60px";
                iArray[9][2] = 200;
                iArray[9][3] = 0;
                
                iArray[10] = new Array();
                iArray[10][0] = "操作时间";
                iArray[10][1] = "60px";
                iArray[10][2] = 200;
                iArray[10][3] = 0;
                
                iArray[11] = new Array();
                iArray[11][0] = "机构代码";
                iArray[11][1] = "40px";
                iArray[11][2] = 150;
                iArray[11][3] = 0;

                iArray[12] = new Array();
                iArray[12][0] = "机构名称";
                iArray[12][1] = "80px";
                iArray[12][2] = 150;
                iArray[12][3] = 0;
            }
            catch (ex)
            {
                alert("在 LXIHAppInit.jsp --> initLXCancelreportGrid 函数中发生异常: 初始化数组错误！");
            }

            try
            {
                LXCancelreportGrid = new MulLineEnter("fm", "LXCancelreportGrid");
                LXCancelreportGrid.mulLineCount = 0;
                LXCancelreportGrid.displayTitle = 1;
                LXCancelreportGrid.locked = 1;
                LXCancelreportGrid.hiddenPlus = 1;
                LXCancelreportGrid.hiddenSubtraction = 1;
                LXCancelreportGrid.canChk = 0;
                LXCancelreportGrid.canSel = 0;
                LXCancelreportGrid.chkBoxEventFuncName = "";
                LXCancelreportGrid.selBoxEventFuncName = "";
                //上面属性必须在 MulLineEnter loadMulLine 之前
                LXCancelreportGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("在 LXCancelreportInit.jsp --> initLXCancelreportGrid 函数中发生异常: 初始化界面错误！");
            }
        }


    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->
        
        
         