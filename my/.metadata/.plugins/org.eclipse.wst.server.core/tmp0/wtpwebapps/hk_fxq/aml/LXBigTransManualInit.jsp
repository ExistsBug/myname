<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：OrphanPolOutInit.jsp
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
    alert("在LXBigTransManualInput.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

// 客户信息
function initCustomGrid()
{
    var iArray = new Array();
    try
    {
        iArray[0]=new Array();
        iArray[0][0]="序号";
        iArray[0][1]="30px";
        iArray[0][2]=30;
        iArray[0][3]=0;

        iArray[1]=new Array();
        iArray[1][0]="客户号";
        iArray[1][1]="80px";
        iArray[1][2]=100;
        iArray[1][3]=0;

        iArray[2]=new Array();
        iArray[2][0]="客户名";
        iArray[2][1]="100px";
        iArray[2][2]=150;
        iArray[2][3]=0;

        iArray[3]=new Array();
        iArray[3][0]="证件类型";
        iArray[3][1]="80px";
        iArray[3][2]=100;
        iArray[3][3]=2;
        iArray[3][4]="amlidtype";

        iArray[4]=new Array();
        iArray[4][0]="证件号码";
        iArray[4][1]="120px";
        iArray[4][2]=150;
        iArray[4][3]=0;

        iArray[5]=new Array();
        iArray[5][0]="国籍";
        iArray[5][1]="100px";
        iArray[5][2]=100;
        iArray[5][3]=2;
        iArray[5][4]="ccountry";

        iArray[6]=new Array();
        iArray[6][0]="交易日期";
        iArray[6][1]="80px";
        iArray[6][2]=100;
        iArray[6][3]=0;
        iArray[6][21]=3;

        iArray[7]=new Array();
        iArray[7][0]="DEALNO";
        iArray[7][1]="0px";
        iArray[7][2]=0;
        iArray[7][3]=3;

        CustomGrid = new MulLineEnter( "fm" , "CustomGrid" );
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