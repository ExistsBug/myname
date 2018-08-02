 //               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var mOperate="";
var turnPage = new turnPageClass();
var turnPage1 = new turnPageClass();
var turnPage2 = new turnPageClass();
var turnPage3 = new turnPageClass();
var turnPageStockGrid = new turnPageClass();
window.onfocus=myonfocus;
//使得从该窗口弹出的窗口能够聚焦
function myonfocus()
{
	if(showInfo!=null)
	{
	  try
	  {
	    showInfo.focus();  
	  }
	  catch(ex)
	  {
	    showInfo=null;
	  }
	}
}

//提交，保存按钮对应操作
function submitForm()
{
	if (mOperate == null || mOperate == ""){
		alert("控制信息丢失，不可进行操作");
		return false;
	}
	fm.hideOperate.value = mOperate;
	var i = 0;
	var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit(); //提交

}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content, SelSql)
{
  if(showInfo != null && showInfo !=undefined)
  	showInfo.close();
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  } 
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
	initForm();
} 

//提交前的校验、计算  
function beforeSubmit()
{
  	if (!verifyInput2())          
		return false;
   	var stock = "";
   	var sHITP="";
   	var sHDID="";
   	var sHDNM = "";
   	var sHDVC="";
   	var sHEIF="";
   	var total = 0;
	for (var i=0; i<StockGrid.mulLineCount; i++) 
	{
		stock=StockGrid.getRowColData(i, 5);
		sHITP=StockGrid.getRowColData(i, 2);
		sHDID=StockGrid.getRowColData(i, 3);
		sHDNM=StockGrid.getRowColData(i, 1);
		sHDVC=StockGrid.getRowColData(i, 4);
		sHEIF=StockGrid.getRowColData(i, 6);
	  var CTTP = document.getElementById("CTTP").value;//投保人类型
		//个人
		if(CTTP=="07")
	  {
	  	var sCRNM = document.getElementById("CRNM").value;
	  	var sCRIT = document.getElementById("CRIT").value;
	  	var sCRID = document.getElementById("CRID").value;
	  	if(sCRNM != "@N"||sCRIT != "@N"||sCRID != "@N")
	  	{
				alert("个人客户代表人信息请填写@N!");
				return false;
	  	}
		  if(sHITP == "" || sHITP == null || sHITP == "@I"){
			alert("第"+(i+1)+"行股东证件类型未填写！且个人客户只能填写@N");
			return false;
			}
			if( sHDID == "" || sHDID == null || sHDID == "@I"){
			alert("第"+(i+1)+"行股东证件号未填写！且个人客户只能填写@N");
			return false;
			} 
			if(sHDNM == "" || sHDNM == null || sHDNM == "@I"){
			alert("第"+(i+1)+"行股东姓名未填写！且个人客户只能填写@N");
			return false;
			}
			if(sHDVC == "" || sHDVC == null  || sHDVC == "@I"){
			alert("第"+(i+1)+"行股东职业未填写！且个人客户只能填写@N");
			return false;
			}
			if( sHEIF == "" || sHEIF == null || sHEIF == "@I"){
			alert("第"+(i+1)+"行股东其他信息未填写！且个人客户只能填写@N");
			return false;
			}
	  }
		if(CTTP!="07")
	  {
	  	var sCRNM = document.getElementById("CRNM").value;
	  	var sCRIT = document.getElementById("CRIT").value;
	  	var sCRID = document.getElementById("CRID").value;
	  	if(sCRNM == "@N"||sCRIT == "@N"||sCRID == "@N")
	  	{
				alert("非个人客户代表人信息请不要填写@N!");
				return false;
	  	}
		  if(sHITP == "" || sHITP == null){
			alert("第"+(i+1)+"行股东证件类型未填写！");
			return false;
			}
			if( sHDID == "" || sHDID == null){
			alert("第"+(i+1)+"行股东证件号未填写！");
			return false;
			} 
			if(sHDNM == "" || sHDNM == null){
			alert("第"+(i+1)+"行股东姓名未填写！");
			return false;
			}
			if(sHDVC == "" || sHDVC == null ){
			alert("第"+(i+1)+"行股东职业未填写！");
			return false;
			}
			if( sHEIF == "" || sHEIF == null){
			alert("第"+(i+1)+"行股东其他信息未填写！");
			return false;
			}
	  }

			//股东职业校验
		var strSQL = "select code "
		               + " from ldcode  where codetype = 'amloccupationtype' "
		               + " and code = '" + sHDVC + "' " ;
	   var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
   	//判断是否查询成功
   	if (!strQueryResult) {
	  	alert("第"+(i+1)+"行股东职业类型不存在！");	
	  	return false;
	  }	
		//股东身份证件校验
			var strSQL = "select code "
		               + " from ldcode  where codetype = 'amlidtype' "
		               + " and code = '" + sHITP + "' " ;
	   var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
   	//判断是否查询成功
   	if (!strQueryResult) {
	  	alert("第"+(i+1)+"行股东身份证件类型不存在！");	
	  	return false;
	  }						
		if (sHITP == "11"){
			if (!checkIdCard(sHDID)) {
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}
	  //----------------------------------------------<cgh
		if (sHITP == "14"){
			if (sHDID.length<=5||sHDID.indexOf(".") != -1) {
				alert("外国公民护照证件号码必须大于5位，且不能有“.”");
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}
		if (sHITP == "21"){
			if (sHDID.length!=9||sHDID=="@N") {
				alert("股东组织机构代码对应9位,证件号不能为@N");//cgh 身份校验需求
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}
		if (sHITP == "19")
		{
			var myDate = new Date();
			if (sHDID.substring(0,3)!="户口本"||sHDID.substr(3)=="********"||BASEisNotDate(sHDID.substr(3))||(myDate.getFullYear()-parseInt(sHDID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(sHDID.substring(3,7),10))<0) //
			{
				alert("只允许小于18岁的人选择“户口本＋出生年月日”代替证件号码");
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}	
		//-------------------------------------------------->	
		//持股比例校验
	var RegChkExp = /^(\+?)(\-?)(\d+)(\.\d{1})?$/;
		if (stock == "" || stock == null ){
        	alert("股东持股比例不可为空");
			return false;        	
		}
//        else if (stock != "" ) {
//        	if (!RegChkExp.test(stock)){
//        		alert("输入格式不符合最多只有一位小数的要求");
//				return false;        	
//			}
//        	if (parseFloat(stock)<=0||parseFloat(stock)>=100)
//        	{	
//        		alert("股东持股比例必须为0到100之间的数");
//				return false;
//			}
//        }	
//        total = total + parseFloat(stock);
	}
//	if (total >=100){
//		alert("股东持股比例之和不得大于或等于100");
//		return false;	      	
//	}
	//--------------------------cgh----2008.11.04-------<身份校验
	//身份证件校验
	var CITP = document.getElementById("CITP").value;
	if (CITP == "11"){
		var CTID = document.getElementById("CTID").value;
		if (!checkIdCard(CTID)) {
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}
	if (CITP == "21"){
		var CTID = document.getElementById("CTID").value;
		if (CTID.length!=9||CTID=="@N") {
			alert("客户组织机构代码对应9位,证件号不能为@N");
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}
		if (CITP == "19")
		{
			var CTID = document.getElementById("CTID").value;
			var myDate = new Date();
			if (CTID.substring(0,3)!="户口本"||CTID.substr(3)=="********"||BASEisNotDate(CTID.substr(3))||(myDate.getFullYear()-parseInt(CTID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(CTID.substring(3,7),10))<0) //
			{
				alert("只允许小于18岁的人选择“户口本＋出生年月日”代替证件号码");
				document.getElementById("CTID").value= "";
			  document.getElementById("CTID").focus() ;
				return false;
			}
		}
		if (CITP == "14"){
			var CTID = document.getElementById("CTID").value;
			if (CTID.length<=5||CTID.indexOf(".") != -1) {
				alert("外国公民护照证件号码必须大于5位，且不能有“.”");
				document.getElementById("CTID").value= "";
			  document.getElementById("CTID").focus() ;
				return false;
			}
		}
		
	
	//身份证件校验
	var CRIT = document.getElementById("CRIT").value;		
	if (CRIT == "11"){	
		var CRID = document.getElementById("CRID").value;	
		if (!checkIdCard(CRID)) {
			document.getElementById("CRID").value= "";
			document.getElementById("CRID").focus() ;
			return false;
		}	
	}
	if (CRIT == "21"){
		var CRID = document.getElementById("CRID").value;
		if (CRID.length!=9||CTID=="@N") {
			alert("代表人组织机构代码对应9位,证件号不能为@N");
			document.getElementById("CRID").value= "";
			document.getElementById("CRID").focus() ;
			return false;
		}
	}	
	if (CRIT == "19")
		{
			var CRID = document.getElementById("CRID").value;
			var myDate = new Date();
			//alert(myDate.getFullYear()+":"+parseInt(CRID.substring(3,7),10));
			if (CRID.substring(0,3)!="户口本"||CRID.substr(3)=="********"||BASEisNotDate(CRID.substr(3))||(myDate.getFullYear()-parseInt(CRID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(CRID.substring(3,7),10))<0) //
			{
				alert("只允许小于18岁的人选择“户口本＋出生年月日”代替证件号码");
				document.getElementById("CRID").value= "";
			  document.getElementById("CRID").focus() ;
				return false;
			}
		}
	if (CRIT == "14"){
		var CRID = document.getElementById("CRID").value;
		if (CRID.length<=5 || CRID.indexOf(".") != -1) {
			alert("外国公民护照证件号码必须大于5位，且不能有“.”");
			document.getElementById("CRID").value= "";
			document.getElementById("CRID").focus() ;
			return false;
		}
	}
	//--------------------------cgh----2008.11.04------->
	//合同号不可为汉字
	var CSNM = document.getElementById("CSNM").value ;
	if(!chkNotZh(CSNM)){
		alert("客户号码中不可以有汉字！");
		fm.CSNM.focus();
		return false;
	} 
	
	//交易发生地编码校验
	var TRCD = document.getElementById("TRCD").value;
	var strSQL = "select code1, name1 from ("
		+ " (select case when trim(code) in ('@N', '@I', '@E') then trim(code) else trim(code)||'000000' end as code1,  trim(codename) as name1 " 
		+ " from ldcode  where codetype = 'amlcountry' and code <> 'CHN') "
		+ " union all " 
		+ " (select 'CHN'||trim(code) ,trim(codename) "
		+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
		+ " and code1 = '" + TRCD + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//判断是否查询成功
	if (!strQueryResult) {
		alert("交易发生地编码不合法，请重新选择！");
		document.getElementById("TRCD").value = "";
		document.getElementById("TRCD").focus();		
		return false;
	}
	
		   
  var CTTP = document.getElementById("CTTP").value;//投保人类型
  var CITP = document.getElementById("CITP").value;//客户身份证件类型
  var CTID = document.getElementById("CTID").value;//客户身份证件号码
	if(CTTP!="07")
  {//非个人
  	if(CITP=="@N"||CITP=="@E"||CITP=="@I")
  	{
  		document.getElementById("CITP").value="";
  		alert("团体客户证件类型不能用@N，@I，@E代替！");
  		return false;
  	}
  	if(CTID=="@N"||CTID=="@E"||CTID=="@I")
  	{
  		document.getElementById("CTID").value="";
  		alert("团体客户证件号码不能用@N，@I，@E代替！");
  		return false;
  	}
  }
	
	//判断客户详细地址和电话号码是否为@N
	//因为之前有过赋值，从ebao系统系统里面提出来的数据有一些地址和电话是为空的，这样就插不到系统表里面来，所以赋过值的就设置为@N
	//同时如果为@N，数据在下下一步走，录入的时候，业务员就有可能不清楚直接就将数据提交，从而导致数据录入的错误
	var CCTL = document.getElementById("CCTL").value;//客户联系电话
	var CTAR = document.getElementById("CTAR").value;//客户详细地址
	if(CCTL=="@N")
	{
		alert("客户联系电话不可用@N代替,请检查");
		return false;
	}
	if(CTAR=="@N")
	{
		alert("客户详细地址不可用@N代替,请检查");
		return false;
	}
	
	return true;
}
         


//显示frmSubmit框架，用来调试
function showSubmitFrame(cDebug)
{
  if(cDebug=="1")
  {
			parent.fraMain.rows = "0,0,50,82,*";
  }
 	else {
  		parent.fraMain.rows = "0,0,0,82,*";
 	}
}

//显示div，第一个参数为一个div的引用，第二个参数为是否显示，如果为"true"则显示，否则不显示
function showDiv(cDiv,cShow)
{
  if (cShow=="true")
  {
    cDiv.style.display="";
  }
  else
  {
    cDiv.style.display="none";  
  }
}


//申请添加可疑交易明细
function GoToDetailInput(oper)
{
	var strUrl = "./LXISTradeManualModifyToDetail.jsp";
	var strPara = "";
	if ( oper != "insert"){
		var checkFlag = 0;
		for (var i=0; i<DetailGrid.mulLineCount; i++) {
	    	if (DetailGrid.getSelNo(i)) { 
	      		checkFlag = DetailGrid.getSelNo();
	      		break;
			}
		}	
		if (checkFlag ) {
			var cDealNo = DetailGrid.getRowColData(checkFlag - 1, 1);
			var cListNo = DetailGrid.getRowColData(checkFlag - 1, 2); //特征代码
			strPara = "?" + "DealNo=" + cDealNo + "&ListNo=" + cListNo + "&oper=" + oper;
			OpenWindowNew(strUrl + strPara, "可疑明细交易", "left"); 			
		}
		else {
	    	alert("请先选择一条可疑交易明细信息！"); 
		}
	}else{
		strPara = "?" + "DealNo=" + fm.all("DealNo").value + "&ListNo=" + "" + "&oper=" + oper;
		OpenWindowNew(strUrl + strPara, "可疑明细交易", "left"); 			
	}
}

function afterQuery(str){
	initDetailBox(str);
}

//更新主表信息
function GoToInputMain(){
	mOperate = "Save";
	if (!beforeSubmit()) return false;	
	submitForm();
}

//申请添加可疑保单明细
function GoToContInput(oper){
	if ( oper != "insert"){
		var checkFlag = 0;
		for (var i=0; i<ContGrid.mulLineCount; i++) {
	    	if (ContGrid.getSelNo(i)) { 
	      		checkFlag = ContGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag ) {
			var CSNM = ContGrid.getRowColData(checkFlag - 1, 1);
			var RiskCode = ContGrid.getRowColData(checkFlag - 1, 4); 
//			window.open("./LXISTradeContToMain.jsp?DealNo=" 
//				+ fm.all("DealNo").value + "&CSNM=" + CSNM 
//				+ "&RiskCode=" + RiskCode + "&oper=" + oper );
			var sOpenWinURL = "LXISTradeContToMain.jsp";
      var sParameters = "DealNo=" 
				+ fm.all("DealNo").value + "&CSNM=" + CSNM 
				+ "&RiskCode=" + RiskCode + "&oper=" + oper;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "修改合同信息", "left");
		}
		else {
	    	alert("请先选择一条可疑交易保单信息！"); 
		}
	}else{
//			window.open("./LXISTradeContToMain.jsp?DealNo=" 
//				+ fm.all("DealNo").value + "&CSNM=" + "&RiskCode=&oper=" + oper );
			var sOpenWinURL = "LXISTradeContToMain.jsp";
      var sParameters = "DealNo=" 
				+ fm.all("DealNo").value + "&CSNM=" + "&RiskCode=&oper=" + oper;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "新增合同信息", "left");
	}	
}

function showArea(){
	var strUrl = "./LXShowAreaInputMain.jsp";
	OpenWindowNew(strUrl, "可疑交易主表地区信息", "left"); 			
}

function afterQueryArea(arrQueryResult){
	var arrResult = new Array();

	if( arrQueryResult != null )
	{
		arrResult = arrQueryResult;
		fm.all( 'TRCD' ).value = arrResult[0][0];
		fm.all('TRCDName').value = arrResult[0][1];
	}
}	

function GoToReturn(){
	try
	{
		var arrReturn = fm.all("DealNo").value ;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}

//判断不为日期返回TRUE       cgh
function BASEisNotDate(theNum)
{
y   =   parseInt(theNum.substring(0,4),10); 
m   =   parseInt(theNum.substring(4,6),10)-1; 
d   =   parseInt(theNum.substr(6),10); 

dt   =   new   Date(y,m,d); 
if(dt.getFullYear()!=y   ||   dt.getMonth()!=m   ||   dt.getDate()!=d)  
  return true; 
else   
	return false; 

}