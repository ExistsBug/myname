<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：OrphanPolOutInit.jsp
//程序功能：
//创建日期：2005-05-26 15:39:06
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<%
    //添加页面控件的初始化。
	String tDate = new String("");
	tDate = request.getParameter("Date");
	if (tDate==null||tDate=="" || "undefined".equals(tDate))
  		tDate = "";
	else 
  		tDate = new String(request.getParameter("Date"));
	
	String tCSNM = new String("");
	tCSNM = request.getParameter("CSNM");
	if (tCSNM==null||tCSNM=="" || "undefined".equals(tCSNM))
  		tCSNM = "";
	else 
  		tCSNM = new String(request.getParameter("CSNM"));

	String tDataState = new String("");
	tDataState = request.getParameter("DataState");
	if (tDataState==null||tDataState=="" || "undefined".equals(tDataState))
  		tDataState = "";
	else 
  		tDataState = new String(request.getParameter("DataState"));
	String tDealNo = new String("");
	tDealNo = request.getParameter("DealNo");
	if (tDealNo==null||tDealNo=="" || "undefined".equals(tDealNo))
  		tDealNo = "";
	else 
  		tDealNo = new String(request.getParameter("DealNo"));
  		
	String tOper = new String("");
	tOper = request.getParameter("Oper");
	if (tOper==null||tOper=="" || "undefined".equals(tOper))
  		tOper = "";
	else 
  		tOper = new String(request.getParameter("Oper"));  		
%>                            

<script language="JavaScript">
var tCSNM = '<%=tCSNM%>' ; //客户号
var tDealDate = '<%=tDate%>' ; //统计日期
var tDataState = '<%=tDataState%>' ; //数据状态
var tDealNo = '<%=tDealNo%>' ; 
var tOper = '<%=tOper%>' ; 

function initForm()
{
	try{
    	initInpBox(tDealNo);  
	    if (tOper == "ViewAndUpdate"){
	    	document.getElementsByName("finish")[0].disabled = true;
	    	document.getElementsByName("insert")[0].disabled = true;
	    }
	    else {
	    	document.getElementsByName("finish")[0].disabled = false;
	    	document.getElementsByName("insert")[0].disabled = false;
	    }
  }
  catch(re)
  {
    alert("在LXISTradeManualInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//初始化可疑交易信息
function initInpBox(cDealNo){
	initTradeMainGrid();
	var strSQL = "select DealNo, "
		+ "STCR, "
		+ "SDGR, "
		+ "CSNM, "
		+ "CTNM, "
		+ "CITP, "
		+ "CTID, " 
		+ "TRCD, "
		+ "CTVC, "
		+ "FileName, "
		+ "DataState "
		+ "from LXISTradeMain a "
		+ "where 1=1 " 
		+ "and managecom like'" + comcode + "%' ";
	if (tDataState != null && tDataState != "" && tDataState != "undefined")
		strSQL = strSQL + "and trim(DataState) = '" + tDataState + "' ";
	else 
		strSQL = strSQL + "and trim(DataState) is null ";
	if (cDealNo != null && cDealNo != "" && cDealNo != "undefined")
		strSQL = strSQL + " and DealNo = '" + cDealNo + "' ";
	//alert(strSQL);
	turnPage.queryModal(strSQL, TradeMainGrid, 0, 1);
}


// 可疑交易主表信息
function initTradeMainGrid()
{
	var iArray = new Array();      
    try
    {
    	var i = 0;
		iArray[i]=new Array();
		iArray[i][0]="序号";   			//列名（此列为顺序号，列名无意义，而且不显示）
		iArray[i][1]="30px"; 	     		//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[i]=new Array();
		iArray[i][0]="交易编号";    		  //列名
		iArray[i][1]="150px";			//列宽
		iArray[i][2]=200;			//列最大值
		iArray[i++][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[i]=new Array();
		iArray[i][0]="可疑交易特征";    		  //列名
		iArray[i][1]="80px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i][3]=2; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		iArray[i][4]="amlshadinessstamp";                 
		iArray[i++][9]="可疑交易特征|Code:amlshadinessstamp"; 		

		iArray[i]=new Array();
		iArray[i][0]="可疑程度";    		  //列名
		iArray[i][1]="60px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i][3]=2; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		iArray[i][4]="amlshadiness";                 
		iArray[i++][9]="可疑交易特征|Code:amlshadiness"; 

		iArray[i]=new Array();
		iArray[i][0]="客户号";   		  //列名
		iArray[i][1]="100px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[i]=new Array();
		iArray[i][0]="客户名称/姓名";	   		//列名
		iArray[i][1]="80px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[i]=new Array();
		iArray[i][0]="客户身份证件类型";	   		//列名
		iArray[i][1]="100px";			//列宽
		iArray[i][2]=200;			//列最大值
		iArray[i][3]=2;  			//是否允许输入,1表示允许，0表示不允许
		iArray[i][4]="amlidtype";                 
		iArray[i++][9]="可疑交易特征|Code:amlidtype"; 
		
		iArray[i]=new Array();
		iArray[i][0]="客户证件号码";	   		//列名
		iArray[i][1]="120px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[i]=new Array();
		iArray[i][0]="交易发生地";	   		//列名
		iArray[i][1]="80px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[i]=new Array();
		iArray[i][0]="客户职业或行业";	   		//列名
		iArray[i][1]="0px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[i]=new Array();
		iArray[i][0]="附件";	   		//列名
		iArray[i][1]="180px";			//列宽
		iArray[i][2]=200;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[i]=new Array();
		iArray[i][0]="数据状态";	   		//列名
		iArray[i][1]="0px";			//列宽
		iArray[i][2]=100;			//列最大值
		iArray[i++][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		TradeMainGrid = new MulLineEnter( "fm" , "TradeMainGrid" ); 
		//这些属性必须在loadMulLine前
	    TradeMainGrid.mulLineCount = 10;   
	    TradeMainGrid.displayTitle = 1;
		TradeMainGrid.locked = 1;	    
	    TradeMainGrid.hiddenPlus = 1;
	    TradeMainGrid.hiddenSubtraction = 1;     
		TradeMainGrid.canSel = 1;	    
	    TradeMainGrid.canChk =0; //复选框
	    TradeMainGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}
</script>