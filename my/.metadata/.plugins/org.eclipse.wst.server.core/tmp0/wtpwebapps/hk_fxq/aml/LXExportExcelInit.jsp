
<%@page import="com.sinosoft.lis.pubfun.PubFun"%>
<%
    //获得当前日期
	String sEndDate = PubFun.getCurrentDate();
%>
<script language="JavaScript">
var WaitForBeFileGrid;
/**
 * 总函数，用于初始化页面，在input页面的body中加载
 */
function initForm(){
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
        alert("在 LXExportExcelInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
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
        alert("在 LXExportExcelInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
    }
}
/**
 * 可选报文队列 MultiLine 的初始化
 */
function initWaitForBeFileGrid()
{
    var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

    try
    {   var i=0;
        iArray[i] = new Array();
        iArray[i][0] = "序号";                          //列名(顺序号, 无意义)
        iArray[i][1] = "30px";                          //列宽
        iArray[i][2] = 30;                              //列最大值
        iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。

        iArray[i] = new Array();
        iArray[i][0] = "交易编号";
        iArray[i][1] = "130px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "客户号";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "客户名称/姓名";
        iArray[i][1] = "100px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "国籍";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i][3] = 2;
		        iArray[i][4]="ccountry";                 
        iArray[i++][9]="国籍|Code:ccountry";  

        iArray[i] = new Array();
        iArray[i][0] = "数据状态代码";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 3;

        iArray[i] = new Array();
        iArray[i][0] = "数据状态";
        iArray[i][1] = "80px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
		        //iArray[8][4]="amldatastate";                 
        //iArray[8][9]="数据状态|Code:amldatastate"; 
        
        iArray[i] = new Array();
        iArray[i][0] = "证件类型";
        iArray[i][1] = "100px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
		        //iArray[4][4]="amlidtype";                 
        //iArray[4][9]="证件类型|Code:amlidtype";     
        
        iArray[i] = new Array();
        iArray[i][0] = "证件号码";
        iArray[i][1] = "120px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;

        iArray[i] = new Array();
        iArray[i][0] = "交易发生日期";
        iArray[i][1] = "80px";
        iArray[i][2] = 150;
        iArray[i++][3] = 0;
                                       
        //iArray[i] = new Array();
        //iArray[i][0] = "生成日期";
        //iArray[i][1] = "0px";
        //iArray[i][2] = 100;
        //iArray[i++][3] = 0;
        //
        //iArray[i] = new Array();
        //iArray[i][0] = "生成时间";
        //iArray[i][1] = "0px";
        //iArray[i][2] = 100;
        //iArray[i++][3] = 0;
        
        iArray[i] = new Array();
        iArray[i][0] = "操作人员";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
        
        iArray[i] = new Array();
        iArray[i][0] = "机构代码";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
        
        iArray[i] = new Array();
        iArray[i][0] = "机构名称";
        iArray[i][1] = "60px";
        iArray[i][2] = 100;
        iArray[i++][3] = 0;
        


    }
    catch (ex)
    {
        alert("在 LXExportExcelInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化数组错误！");
    }

    try
    {
        WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
        WaitForBeFileGrid.mulLineCount = 0;
        WaitForBeFileGrid.displayTitle = 1;
        WaitForBeFileGrid.locked = 1;
        WaitForBeFileGrid.hiddenPlus = 1;
        WaitForBeFileGrid.hiddenSubtraction = 1;
        WaitForBeFileGrid.canChk = 0;
        WaitForBeFileGrid.canSel = 1;
        WaitForBeFileGrid.chkBoxEventFuncName = "";
        WaitForBeFileGrid.selBoxEventFuncName = "";
        //上面属性必须在 MulLineEnter loadMulLine 之前
        WaitForBeFileGrid.selBoxEventFuncName ="queryTasksGrid" ;     //点击RadioBox时响应的JS函数
        WaitForBeFileGrid.loadMulLine(iArray);
    }
    catch (ex)
    {
        alert("在 LXExportExcelInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
    }
}
</script>