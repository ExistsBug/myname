<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
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
	String tDealNo = "";
	tDealNo = request.getParameter("DealNo");
	if (tDealNo==null||tDealNo=="" || "undefined".equals(tDealNo))
  		tDealNo = PubFun1.CreateMaxNo("AMLDEALNO", 20);
	else 
  		tDealNo = new String(request.getParameter("DealNo"));

	String tDataState = "";
	tDataState = request.getParameter("DataState");
	if (tDataState==null||tDataState=="" || "undefined".equals(tDataState))
  		tDataState = "";
	else 
  		tDataState = new String(request.getParameter("DataState"));

	String toper = "";
	toper = request.getParameter("oper");
	if (toper==null||toper=="" || "undefined".equals(toper))
  		toper = "query";
	else 
  		toper = new String(request.getParameter("oper"));
  	
    String currentDate = PubFun.getCurrentDate();
    String currentTime = PubFun.getCurrentTime();  
    
    GlobalInput GI = new GlobalInput();
    GI = (GlobalInput) session.getValue("GI");
%>

<script language="JavaScript">

var tDealNo = '<%=tDealNo%>';
var tDataState = '<%=tDataState%>';
var toper = '<%=toper%>';
var tMngCom = '<%=GI.ComCode%>';

function initForm()
{
  try
  {
  	  initInpBox();
  	  initStockBox();
  	  initDetailBox(tDealNo);
  	  initContBox(tDealNo);
  	  fm.all("DealNo").value = tDealNo;
  	  fm.all("DataState").value = tDataState;
  	  if(fm.all("DealDate").value == null || fm.all("DealDate").value == ""){
  	     fm.all("DealDate").value = '<%=currentDate%>';
  	  }
  	  if(fm.all("DealTime").value == null || fm.all("DealTime").value == ""){
  	  fm.all("DealTime").value = '<%=currentTime%>';
  	  }
  }
  catch(re)
  {
    alert("在LXISTradeManualDetailInput.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//查询客户信息
function initInpBox(){
	try{
			//客户号, 客户名称, 投保人类型
			var strSQL = "select CSNM, CTNM, CTTP, "
				+ " (select codename from ldcode b where a.CTTP = b.code and b.codetype = 'amlpolicyholdertype'), "
				//客户身份证件类型, 客户证件号码, 客户联系电话
				+ " CITP, (select codename from ldcode b where a.CITP = b.code and b.codetype = 'amlidtype'), CTID, CCTL, "
				//交易发生地
				+ " TRCD, (select codename from ldcode b where substr(a.TRCD, 0, 3) = b.code and b.codetype = 'amlcountry') || "
				+ " (select codename from ldcode b where substr(a.TRCD, 4) = b.code and b.codetype = 'amlmanagecom'), "
				//客户职业或行业
				+ " CTVC, (select codename from ldcode b where a.CTVC = b.code and b.codetype = 'amloccupationtype'), "
				//, 代表人姓名, 代表人身份证类型, 代表人身份证件号码
				+ " CRNM, CRIT, (select codename from ldcode b where a.CRIT = b.code and b.codetype = 'amlidtype'), CRID, "
				//客户详细地址, 客户其他信息
				+ " CTAR, CCEI, "
				//可疑交易特征，可疑程度
				+ " STCR, SDGR, (select codename from ldcode b where a.SDGR = b.code and b.codetype = 'amlshadiness'), "
				//采取措施， 可疑行为描述
				+ " TKMS, SSDS, "
				// 填报人, 可疑交易生成日期, 可疑交易生成时间 
				+ " RPNM, DealDate, DealTime "
				+ " from LXISTradeMain a where a.DealNo = '" + tDealNo 
				+ "' and (a.DataState = '" + tDataState + "' or trim(a.DataState) is null ) "  ;
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//判断是否查询成功
			if (!strQueryResult) {
				if(fm.all("TRCD").value==null||fm.all("TRCD").value=='')
				{
				  if(tMngCom.length>=3)
				  {
				    tMngCom = tMngCom.substring(0,3);
				  }
				  var tSQL = " SELECT concat('CHN',CODE),codename FROM LDCODE  WHERE COMCODE= '"+tMngCom+"' "
				           + " and codetype = 'regcode' ";
				  var arr=easyExecSql(tSQL); 
				          
				  if(arr!=null && arr[0][0]!=null)
				  {
				    fm.all("TRCD").value=arr[0][0];
				    fm.all("TRCDName").value=arr[0][1];
				  }
				}				
				return ;
			}
			else{
				//查询成功则拆分字符串，返回二维数组
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("CSNM").value   = arrSelected[0][0];
				fm.all("CTNM").value = arrSelected[0][1];
				fm.all("CTTP").value = arrSelected[0][2];
				fm.all("CTTPName").value = arrSelected[0][3];
				
				fm.all("CITP").value = arrSelected[0][4];
				fm.all("CITPName").value = arrSelected[0][5];
				fm.all("CTID").value = arrSelected[0][6];
				fm.all("CCTL").value =  arrSelected[0][7];

				fm.all("TRCD").value = arrSelected[0][8];
				fm.all("TRCDName").value = arrSelected[0][9];
				fm.all("CTVC").value = arrSelected[0][10];
				fm.all("CTVCName").value = arrSelected[0][11];
				
				fm.all("CRNM").value = arrSelected[0][12];
				fm.all("CRIT").value = arrSelected[0][13];
				fm.all("CRITName").value = arrSelected[0][14];
				fm.all("CRID").value = arrSelected[0][15];
				
				fm.all("CTAR").value = arrSelected[0][16];
				fm.all("CCEI").value = arrSelected[0][17];
				
				//可疑信息
				fm.all("STCR").value = arrSelected[0][18];
				fm.all("SDGR").value = arrSelected[0][19];
				fm.all("SDGRName").value = arrSelected[0][20];
				fm.all("TKMS").value = arrSelected[0][21].replace(/@Enter/g,"");
				fm.all("SSDS").value = arrSelected[0][22].replace(/@Enter/g,"");
				fm.all("RPNM").value = arrSelected[0][23];
				fm.all("DealDate").value = arrSelected[0][24];
				fm.all("DealTime").value = arrSelected[0][25];				
				return true;
			}
	}catch(ex){
		alert("初始化信息出错：" + ex);
	}
}


//初始化股东信息
function initStockBox(){
	try{
	initStockGrid();
	//股东姓名, 股东证件类型, 股东证件号码, 股东职业或行业, 股东持股比例, 股东其他信息
	var strSQL = "select HDNM, HITP, HDID, HDVC, HDRT, HEIF "
		+ " from LXISTradeCusPartner where DealNo = '" + tDealNo + "' " ;
	turnPage1.queryModal(strSQL, StockGrid);
	}catch(ex){
		alert(ex);
	}
}
// 初始化客户股东信息
function initStockGrid()
{                               
	var iArray = new Array();      
    try
    {
		iArray[0]=new Array();
		iArray[0][0]="序号";   			//列名（此列为顺序号，列名无意义，而且不显示）
		iArray[0][1]="30px"; 	     		//列宽
		iArray[0][2]=100;			//列最大值
		iArray[0][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[1]=new Array();
		iArray[1][0]="股东姓名/名称";    		  //列名
		iArray[1][1]="80px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="股东证件类型";    		  //列名
		iArray[2][1]="80px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=2; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
		iArray[2][4]="amlidtype"; //
    iArray[2][9]="股东证件类型|Code:amlidtype";
    
		iArray[3]=new Array();
		iArray[3][0]="股东证件号码";    		  //列名
		iArray[3][1]="80px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="股东职业或行业";   		  //列名
		iArray[4][1]="80px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=2;  			//是否允许输入,1表示允许，0表示不允许
		iArray[4][4]="amloccupationtype";  			//是否允许输入,1表示允许，0表示不允许
    	iArray[4][9]="股东职业或行业|Code:amloccupationtype";
    
		iArray[5]=new Array();
		iArray[5][0]="股东持股比例(%)";	   		//列名
		iArray[5][1]="60px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=1;  			//是否允许输入,1表示允许，0表示不允许
		     
		iArray[6]=new Array();
		iArray[6][0]="股东其他信息";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=1;  			//是否允许输入,1表示允许，0表示不允许

		StockGrid = new MulLineEnter( "fm" , "StockGrid" ); 
		//这些属性必须在loadMulLine前
	    StockGrid.mulLineCount = 0;   
	    StockGrid.displayTitle = 1;
	    StockGrid.loadMulLine(iArray); 
	}
	catch(ex)
	{
	  alert(ex);
	}
}


//初始化可疑交易明细信息
function initDetailBox(str){
	try{
		initDetailGrid();
		var strSQL = "select DealNo, ListNo, CSNM, TICD, TSTM,(select b.codename from ldcode b where TSTP = b.code and b.codetype='amltranstype'), (select b.codename from ldcode b where CRTP = b.code and b.codetype = 'amlcurrencytype'), "
			+ " CRAT, (select b.codename from ldcode b where CRDR = b.code and b.codetype='amloutpaytype'), TBNM from LXISTradeDetail "
			+ " where DealNo = '" + str + "' " ;
		turnPage2.queryModal(strSQL, DetailGrid);
	}catch(ex){
		alert(ex);
	}
}

function initDetailGrid(){
	var iArray = new Array();      
    try
    {
		iArray[0]=new Array();
		iArray[0][0]="序号";   			//列名（此列为顺序号，列名无意义，而且不显示）
		iArray[0][1]="30px"; 	     		//列宽
		iArray[0][2]=100;			//列最大值
		iArray[0][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[1]=new Array();
		iArray[1][0]="交易编号";    		  //列名
		iArray[1][1]="120px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="明细编码";    		  //列名
		iArray[2][1]="50px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="保险合同号";    		  //列名
		iArray[3][1]="90px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="业务标示号";   		  //列名
		iArray[4][1]="0px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="交易日期";	   		//列名
		iArray[5][1]="60px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		     
		iArray[6]=new Array();
		iArray[6][0]="交易类型";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="币种";	   		//列名
		iArray[7][1]="80px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[8]=new Array();
		iArray[8][0]="交易金额";	   		//列名
		iArray[8][1]="80px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[9]=new Array();
		iArray[9][0]="资金进出方向";	   		//列名
		iArray[9][1]="80px";			//列宽
		iArray[9][2]=100;			//列最大值
		iArray[9][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[10]=new Array();
		iArray[10][0]="经办人姓名";	   		//列名
		iArray[10][1]="80px";			//列宽
		iArray[10][2]=100;			//列最大值
		iArray[10][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		DetailGrid = new MulLineEnter( "fm" , "DetailGrid" ); 
		//这些属性必须在loadMulLine前
	    DetailGrid.mulLineCount = 0;   
	    DetailGrid.displayTitle = 1;
		DetailGrid.locked = 1;	    
	    DetailGrid.hiddenPlus = 1;
	    DetailGrid.hiddenSubtraction = 1;     
		DetailGrid.canSel = 1;
	    DetailGrid.loadMulLine(iArray); 
	}
	catch(ex)
	{
	  alert(ex);
	}
}


//初始化可疑交易保单信息
function initContBox(str){
	try{
		initContGrid();
		var strSQL = "select CSNM, (select b.codename from ldcode b where ISTP = b.code and b.codetype='amlrisktype'), ISNM, RiskCode, ISPS, ITNM, ISOG, ISAT, ISFE, (select b.codename from ldcode b where ISPT = b.code and b.codetype='amlpayintv'), CTES from LXISTradeCont "
			+ " where DealNo = '" + str + "' " ;
		turnPage3.queryModal(strSQL, ContGrid);
	}catch(ex){
		alert(ex);
	}
}

function initContGrid(){
	var iArray = new Array();      
    try
    {
		iArray[0]=new Array();
		iArray[0][0]="序号";   			//列名（此列为顺序号，列名无意义，而且不显示）
		iArray[0][1]="30px"; 	     		//列宽
		iArray[0][2]=100;			//列最大值
		iArray[0][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[1]=new Array();
		iArray[1][0]="保险合同号";    		  //列名
		iArray[1][1]="80px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="保险种类";    		  //列名
		iArray[2][1]="80px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="保险名称";    		  //列名
		iArray[3][1]="80px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="保险编码";   		  //列名
		iArray[4][1]="60px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="保险期间";	   		//列名
		iArray[5][1]="80px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		     
		iArray[6]=new Array();
		iArray[6][0]="被保险人总数";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="保险标的";	   		//列名
		iArray[7][1]="60px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[8]=new Array();
		iArray[8][0]="保险金额";	   		//列名
		iArray[8][1]="60px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[9]=new Array();
		iArray[9][0]="保险费";	   		//列名
		iArray[9][1]="60px";			//列宽
		iArray[9][2]=100;			//列最大值
		iArray[9][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[10]=new Array();
		iArray[10][0]="缴费方式";	   		//列名
		iArray[10][1]="80px";			//列宽
		iArray[10][2]=100;			//列最大值
		iArray[10][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[11]=new Array();
		iArray[11][0]="保险合同其他信息";	   		//列名
		iArray[11][1]="0px";			//列宽
		iArray[11][2]=100;			//列最大值
		iArray[11][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		ContGrid = new MulLineEnter( "fm" , "ContGrid" ); 
		
		//这些属性必须在loadMulLine前
	    ContGrid.mulLineCount = 0;   
	    ContGrid.displayTitle = 1;
		ContGrid.locked = 1;	    
	    ContGrid.hiddenPlus = 1;
	    ContGrid.hiddenSubtraction = 1;     
		ContGrid.canSel = 1;
	    ContGrid.loadMulLine(iArray); 
	}
	catch(ex)
	{
	  alert(ex);
	}
}
</script>