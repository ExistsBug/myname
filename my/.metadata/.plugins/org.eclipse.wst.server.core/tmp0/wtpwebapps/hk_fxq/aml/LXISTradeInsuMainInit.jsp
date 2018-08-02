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
	  String tRiskCode = request.getParameter("RiskCode");
	  String tInsuredNo = request.getParameter("InsuredNo");
	  if(tInsuredNo==null||tInsuredNo.equals("")){
	  tInsuredNo="";
	  }
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
var tInsuredNo = '<%=tInsuredNo%>' ;	
var oper = '<%=Oper%>' ;

function initForm()
{
  try
  { 
  	initInpBox();

    initIntBox();
  }
  catch(re)
  {
    alert("在LXISTradeInsuMain.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

//查询合同信息
function initInpBox(){
	try{
		if(oper == 'update' ||oper =='delete' || oper =='query' ){
		if (tDealNo != null && tDealNo != "" && tRiskCode != null && tRiskCode != "" && tCSNM != null && tCSNM != "" &&tInsuredNo != null && tInsuredNo != ""){		
		  var strSQL = "(select DealNo, CSNM, ISNM, RiskCode, "
				+ " InsuredNo, ISTN, "
				+ " IITP, (select b.codename from ldcode b where IITP = b.code and b.codetype='amlidtype'), ISID, RLTP,(select b.codename from ldcode b where RLTP = b.code and b.codetype='relation') "
				+ " from LXISTradeInsured a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"' and a.InsuredNo ='" + tInsuredNo +"')";
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//判断是否查询成功
			if (!strQueryResult) {
				alert("被保人不存在！");
				return false;
			}
			else{
				//查询成功则拆分字符串，返回二维数组								
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("DealNo").value = arrSelected[0][0];
				fm.all("CSNM").value = arrSelected[0][1];
				fm.all("ISNM").value = arrSelected[0][2];
				fm.all("RiskCode").value = arrSelected[0][3];
				fm.all("InsuredNo").value = arrSelected[0][4];
				fm.all("ISTN").value =  arrSelected[0][5];
				fm.all("IITP").value = arrSelected[0][6];
				fm.all("IITPName").value = arrSelected[0][7];
				fm.all("ISID").value = arrSelected[0][8];
				fm.all("RLTP").value = arrSelected[0][9];
				fm.all("RLTPName").value = arrSelected[0][10];
				return true;
		}
	}
}else{
	
	      var strSQL = "(select DealNo, CSNM, ISNM, RiskCode "
				+ " from LXISTradeCont a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"')";
		  	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//判断是否查询成功
			if (!strQueryResult) {
				alert("该合同不存在！请检查是否修改了合同信息未保存");
				top.close();
				return false;
			}
		  	var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("DealNo").value = arrSelected[0][0];
				fm.all("CSNM").value = arrSelected[0][1];
				fm.all("ISNM").value = arrSelected[0][2];
				fm.all("RiskCode").value = arrSelected[0][3];
				fm.all("InsuredNo").value = "";
				fm.all("ISTN").value = "";
				fm.all("IITP").value = "";
				fm.all("IITPName").value = "";
				fm.all("ISID").value = "";
				fm.all("RLTP").value = "";
				fm.all("RLTPName").value = "";
			
				return true;
		}
	}
		catch(ex){
		alert(ex);
	}
}

//初始化受益人信息
function initIntBox(){
	initTasksGrid();
 if(oper == 'update' ||oper =='delete' || oper =='query'){
 	if (tInsuredNo != null && tInsuredNo != "")
   {	
   	var strSQL = "select BnfNo,BNNM,BITP,BNID from LXISTradeBnf where DealNo = '" + tDealNo + "' and CSNM ='" + tCSNM +"' and RiskCode ='" + tRiskCode +"' and InsuredNo ='" + tInsuredNo +"'";
 	  turnPage3.queryModal(strSQL, TasksGrid);	
   }
  }
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
		iArray[1][0]="受益人代号";    		  //列名
		iArray[1][1]="60px";			//列宽
		iArray[1][2]=100;			//列最大值
		iArray[1][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
    iArray[1][9]="受益人代号|notnull&len<=4"
 
		iArray[2]=new Array();
		iArray[2][0]="受益人名称";    		  //列名
		iArray[2][1]="60px";			//列宽
		iArray[2][2]=100;			//列最大值
		iArray[2][3]=1; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
    iArray[2][9]="受益人名称|notnull&len<=64"

		iArray[3]=new Array();
		iArray[3][0]="受益人身份证件类型";    		  //列名
		iArray[3][1]="60px";			//列宽
		iArray[3][2]=100;			//列最大值
		iArray[3][3]=2; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的
    iArray[3][4]="amlidtype";
    iArray[3][9]="受益人身份证件类型|notnull&len=2&Code:amlidtype"
    
		iArray[4]=new Array();
		iArray[4][0]="受益人身份证件号码";   		  //列名
		iArray[4][1]="60px";			//列宽
		iArray[4][2]=100;			//列最大值
		iArray[4][3]=1;  			//是否允许输入,1表示允许，0表示不允许
    iArray[4][9]="受益人身份证件号码|notnull&len<=20"



		TasksGrid = new MulLineEnter( "fm" , "TasksGrid" ); 
		//这些属性必须在loadMulLine前
	    TasksGrid.displayTitle = 1;
	    TasksGrid.mulLineCount = 0;
	    TasksGrid.loadMulLine(iArray);

	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>