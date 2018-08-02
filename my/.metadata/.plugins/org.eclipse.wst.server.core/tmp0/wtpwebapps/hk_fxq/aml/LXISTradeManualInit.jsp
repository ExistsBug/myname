<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：LXISTradeManualInit.jsp
//程序功能：
//创建日期：2005-05-26 15:39:06
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>


<script language="JavaScript">

function initForm()
{
  try
  {
    fm.all("CSNM").value = "";
    fm.all("CTNM").value = "";
    fm.all("Date").value = "";
    initCustomGrid();
    fm.all('StatiCode').value     = "";
    fm.all('StatiCodeName').value = "";
    fm.all('StatiCode').value = <%= tGI.ManageCom %>;
    showOneCodeName("stati","StatiCode","StatiCodeName");
  }
  catch(re)
  {
    alert("在LXISTradeManualInput.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

// 客户信息
function initCustomGrid()
{
    var iArray = new Array();
    try
    {
    	var i = 0;
        iArray[i]=new Array();
        iArray[i][0]="序号";
        iArray[i][1]="30px";
        iArray[i][2]=30;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="客户号";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="客户姓名";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="交易编号";
        iArray[i][1]="150px";
        iArray[i][2]=100;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="可疑交易特征";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i][3]=2;
        iArray[i][4]="amlshadinessstamp";
		iArray[i++][9]="可疑交易特征|Code:amlshadinessstamp"; 

        iArray[i]=new Array();
        iArray[i][0]="可疑程度";
        iArray[i][1]="80px";
        iArray[i][2]=150;
        iArray[i][3]=2;
        iArray[i][4]="amlshadiness";
		iArray[i++][9]="可疑交易特征|Code:amlshadiness"; 
		
        iArray[i]=new Array();
        iArray[i][0]="交易生成日期";
        iArray[i][1]="80px";
        iArray[i][2]=150;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="来自";
        iArray[i][1]="40px";
        iArray[i][2]=150;
        iArray[i++][3]=0;

        CustomGrid = new MulLineEnter("fm", "CustomGrid");
        //这些属性必须在loadMulLine前
        CustomGrid.mulLineCount = 3;
        CustomGrid.displayTitle = 1;
        CustomGrid.locked = 1;
        CustomGrid.hiddenPlus = 1;
        CustomGrid.hiddenSubtraction = 1;
        CustomGrid.canSel = 1;
        CustomGrid.canChk =0; //复选框
        CustomGrid.loadMulLine(iArray);
    }
    catch(ex)
    {
      alert(ex);
    }
}
</script>