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
%>                            

<script language="JavaScript">
function initForm()
{
  try
  {
    initInpBox();  
  }
  catch(re)
  {
    alert("在LXShowAreaInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//初始化可疑交易信息
function initInpBox(){
	initTradeMainGrid();
	var strSQL = " select * from "
			+ " ((select trim(code) country, trim(codename) countryname, '000000' province, '' provincename, case when trim(code) in ('@N', '@I', '@E') then trim(code) else trim(code)||'000000' end ,    trim(codename) " 
			+ " from ldcode  where codetype = 'amlcountry' and code <> 'CHN') "
			+ " union all " 
			+ " (select 'CHN', '中国', trim(code), trim(codename), 'CHN'||trim(code) ,trim(codename) "
			+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
			+ getWherePart('country','Country', 'like')
			+ getWherePart('countryname','CountryName','like')
			+ getWherePart('province','Province', 'like')
			+ getWherePart('provincename','ProvinceName', 'like');		
	turnPage.queryModal(strSQL, TradeMainGrid, 0, 1);
}


// 可疑交易主表信息
function initTradeMainGrid()
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
		iArray[1][0]="交易发生地国籍编码";    		  //列名
		iArray[1][1]="100px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="交易发生地国籍名称";    		  //列名
		iArray[2][1]="220px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="交易发生地行政地区编码";    		  //列名
		iArray[3][1]="140px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="交易发生地行政地区";   		  //列名
		iArray[4][1]="220px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="code";	   		//列名
		iArray[5][1]="0px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[6]=new Array();
		iArray[6][0]="codename";	   		//列名
		iArray[6][1]="0px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
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