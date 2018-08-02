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

    String tDealNo  = request.getParameter("DealNo") ;
    
   	String tCSNM = request.getParameter("CSNM");
   	System.out.println(tCSNM);
	  String tRiskCode = request.getParameter("RiskCode");
	  if(tCSNM == null || tCSNM.equals(""))
	  {
	  tCSNM="";
	  }
	  System.out.println(tCSNM);
	  if(tRiskCode==null||tRiskCode.equals("")){
	  tRiskCode="";}
	  
	   	String Oper = "";
	Oper = request.getParameter("oper");
	if (Oper==null||Oper=="" || "undefined".equals(Oper))
  		Oper = "query";
	else 
  		Oper = new String(request.getParameter("oper"));
%>                            

<script language="JavaScript">
var tDealNo = '<%=tDealNo%>' ;
var tCSNM = '<%=tCSNM%>' ;
var tRiskCode = '<%=tRiskCode%>' ;
var oper = '<%=Oper%>' ;
function initForm()
{
  try
  { 
  	initInpBox(tDealNo,tCSNM,tRiskCode);

    initIntBox(tDealNo,tCSNM,tRiskCode);
  }
  catch(re)
  {
    alert("在LXISTradeContMain.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//查询合同信息
function initInpBox(tDealNo,tCSNM,tRiskCode){
	try{
		if (tDealNo != null && tDealNo != "" && tRiskCode != null && tRiskCode != "" && tCSNM != null && tCSNM != ""){		
			
			var strSQL = "(select DealNo, CSNM, ISTP, (select b.codename from ldcode b where ISTP = b.code and b.codetype='amlrisktype'), "
				+ " ISNM, RiskCode, "
				+ " ISPS, ISOG, ISAT, "
				+ " ISFE, ISPT, (select b.codename from ldcode b where ISPT = b.code and b.codetype='amlpayintv'), CTES "
				+ " from LXISTradeCont a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"')";
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//判断是否查询成功
			if (!strQueryResult) {
			//	alert("合同不存在！");
				return false;
			}
			else{
				//查询成功则拆分字符串，返回二维数组
								
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				
				fm.all("DealNo").value = arrSelected[0][0];
				fm.all("CSNM").value = arrSelected[0][1];
				fm.all("ISTP").value = arrSelected[0][2];
				fm.all("ISTPName").value = arrSelected[0][3];
				fm.all("ISNM").value = arrSelected[0][4];
				fm.all("RiskCode").value =  arrSelected[0][5];
				fm.all("ISPS").value = arrSelected[0][6];
//				fm.all("ITNM").value = arrSelected[0][7];
				fm.all("ISOG").value = arrSelected[0][7];
				fm.all("ISAT").value = arrSelected[0][8];
				fm.all("ISFE").value = arrSelected[0][9];
				fm.all("ISPT").value = arrSelected[0][10];
				fm.all("ISPTName").value = arrSelected[0][11];
				fm.all("CTES").value = arrSelected[0][12];
				return true;
			}
		}
		else{
			
				fm.all("DealNo").value = tDealNo;
				fm.all("CSNM").value = "";
				fm.all("ISTP").value = "";
				fm.all("ISTPName").value = "";
				fm.all("ISNM").value = "";
				fm.all("RiskCode").value =  "";
				fm.all("ISPS").value = "";
//				fm.all("ITNM").value = "";
				fm.all("ISOG").value = "";
				fm.all("ISAT").value = "";
				fm.all("ISFE").value = "";
				fm.all("ISPT").value = "";
				fm.all("ISPTName").value = "";
				fm.all("CTES").value = "";
			
				return true;
		}
	}catch(ex){
		alert(ex);
	}
}

//初始化被保人信息
function initIntBox(tDealNo,tCSNM,tRiskCode){
	initTasksGrid();
	var strSQL = "select a.DealNo, a.CSNM, a.ISNM, a.RiskCode, a.InsuredNo, a.ISTN, (select codename from ldcode b where codetype = 'amlidtype' and b.code = a.IITP),a.ISID,a.RLTP from LXISTradeInsured a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"'";
	turnPage3.queryModal(strSQL, TasksGrid);	
}


// 被保人信息
function initTasksGrid()
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
		iArray[1][0]="交易编号";    		  //列名
		iArray[1][1]="110px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[2]=new Array();
		iArray[2][0]="保险合同号";    		  //列名
		iArray[2][1]="60px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[3]=new Array();
		iArray[3][0]="保险名称";    		  //列名
		iArray[3][1]="60px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的

		iArray[4]=new Array();
		iArray[4][0]="保险编码";   		  //列名
		iArray[4][1]="60px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[5]=new Array();
		iArray[5][0]="被保险人编码";	   		//列名
		iArray[5][1]="0px";			//列宽
		iArray[5][2]=100;			//列最大值
		iArray[5][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		     

		iArray[6]=new Array();
		iArray[6][0]="被保险人姓名";	   		//列名
		iArray[6][1]="60px";			//列宽
		iArray[6][2]=100;			//列最大值
		iArray[6][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		iArray[7]=new Array();
		iArray[7][0]="被保险人身份证件类型";	   		//列名
		iArray[7][1]="120px";			//列宽
		iArray[7][2]=100;			//列最大值
		iArray[7][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[8]=new Array();
		iArray[8][0]="被保险人身份证件号码";	   		//列名
		iArray[8][1]="100px";			//列宽
		iArray[8][2]=100;			//列最大值
		iArray[8][3]=0;  			//是否允许输入,1表示允许，0表示不允许
		
		iArray[9]=new Array();
		iArray[9][0]="投保人与被保险人的关系";	   		//列名
		iArray[9][1]="100px";			//列宽
		iArray[9][2]=100;			//列最大值
		iArray[9][3]=0;  			//是否允许输入,1表示允许，0表示不允许

		TasksGrid = new MulLineEnter( "fm" , "TasksGrid" ); 
		//这些属性必须在loadMulLine前
	    TasksGrid.displayTitle = 1;
		TasksGrid.locked = 1;	    
	    TasksGrid.hiddenPlus = 1;
	    TasksGrid.hiddenSubtraction = 1;     
		TasksGrid.canSel = 1;
	    TasksGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>