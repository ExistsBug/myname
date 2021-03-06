
<script language="JavaScript">

function initForm()
{
    try
    {
        initCustmoerGrid();  
        initHCustmoerGrid();  
        initLCustmoerGrid();               
    }
    catch (ex)
    {
        alert("在 LXIHAppInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
    }
}

function initCustmoerGrid()
{
    var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

    try
    {
    		var i = 0;
        iArray[i] = new Array();
        iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
        iArray[i][1] = "30px";                          //列宽
        iArray[i][2] = 30;                              //列最大值
        iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。
        
        iArray[i] = new Array();
        iArray[i][0] = "要素类型Code";
        iArray[i][1] = "0px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素类型";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素内容Code";
        iArray[i][1] = "0px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素内容";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "风险数值";         		//列名
        iArray[i][1] = "80px";            		//列宽
        iArray[i][2] = 60;            			//列最大值
        iArray[i][3] = 2;              			//是否允许输入,1表示允许，0表示不允许
        iArray[i][4] = "hazard";
        iArray[i][5] = "5|6";
        iArray[i++][6] = "0|1";

        iArray[i] = new Array();
        iArray[i][0] = "风险级别";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "权重";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
    

        CustmoerGrid = new MulLineEnter("fm", "CustmoerGrid");
        CustmoerGrid.mulLineCount = 0;
        CustmoerGrid.displayTitle = 1;
        CustmoerGrid.locked = 1;
        CustmoerGrid.hiddenPlus = 1;
        CustmoerGrid.hiddenSubtraction = 1;
        CustmoerGrid.canChk = 0;
        CustmoerGrid.canSel = 1;
        CustmoerGrid.chkBoxEventFuncName = "";
        CustmoerGrid.selBoxEventFuncName = "";
        CustmoerGrid.loadMulLine(iArray);
    }
    catch (ex)
    {
        alert("在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
    }
}

function initHCustmoerGrid()
{
    var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

    try
    {
    		var i = 0;
        iArray[i] = new Array();
        iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
        iArray[i][1] = "30px";                          //列宽
        iArray[i][2] = 30;                              //列最大值
        iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。
        
        iArray[i] = new Array();
        iArray[i][0] = "要素类型Code";
        iArray[i][1] = "0px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素类型";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素内容Code";
        iArray[i][1] = "0px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素内容";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "风险数值";         		//列名
        iArray[i][1] = "80px";            		//列宽
        iArray[i][2] = 60;            			//列最大值
        iArray[i][3] = 2;              			//是否允许输入,1表示允许，0表示不允许
        iArray[i][4] = "hazard";
        iArray[i][5] = "5|6";
        iArray[i++][6] = "0|1";

        iArray[i] = new Array();
        iArray[i][0] = "风险级别";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "权重";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
    

        HCustmoerGrid = new MulLineEnter("fm", "HCustmoerGrid");
        HCustmoerGrid.mulLineCount = 0;
        HCustmoerGrid.displayTitle = 1;
        HCustmoerGrid.locked = 1;
        HCustmoerGrid.hiddenPlus = 1;
        HCustmoerGrid.hiddenSubtraction = 1;
        HCustmoerGrid.canChk = 0;
        HCustmoerGrid.canSel = 1;
        HCustmoerGrid.chkBoxEventFuncName = "";
        HCustmoerGrid.selBoxEventFuncName = "";
        HCustmoerGrid.loadMulLine(iArray);
    }
    catch (ex)
    {
        alert("在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
    }
}

function initLCustmoerGrid()
{
    var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

    try
    {
    		var i = 0;
        iArray[i] = new Array();
        iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
        iArray[i][1] = "30px";                          //列宽
        iArray[i][2] = 30;                              //列最大值
        iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。
        
        iArray[i] = new Array();
        iArray[i][0] = "要素类型Code";
        iArray[i][1] = "0px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素类型";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素内容Code";
        iArray[i][1] = "0px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;
        
        iArray[i] = new Array();
        iArray[i][0] = "要素内容";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "风险数值";         		//列名
        iArray[i][1] = "80px";            		//列宽
        iArray[i][2] = 60;            			//列最大值
        iArray[i][3] = 2;              			//是否允许输入,1表示允许，0表示不允许
        iArray[i][4] = "hazard";
        iArray[i][5] = "5|6";
        iArray[i++][6] = "0|1";

        iArray[i] = new Array();
        iArray[i][0] = "风险级别";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "权重";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
    

        LCustmoerGrid = new MulLineEnter("fm", "LCustmoerGrid");
        LCustmoerGrid.mulLineCount = 0;
        LCustmoerGrid.displayTitle = 1;
        LCustmoerGrid.locked = 1;
        LCustmoerGrid.hiddenPlus = 1;
        LCustmoerGrid.hiddenSubtraction = 1;
        LCustmoerGrid.canChk = 0;
        LCustmoerGrid.canSel = 1;
        LCustmoerGrid.chkBoxEventFuncName = "";
        LCustmoerGrid.selBoxEventFuncName = "";
        LCustmoerGrid.loadMulLine(iArray);
    }
    catch (ex)
    {
        alert("在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
    }
}
    </script>

    <!-- 调用 JSP Init 初始化页面 : 结束 -->

