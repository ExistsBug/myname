//               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var mOperate="";
var turnPage = new turnPageClass();

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
	if(!beforeSubmit()) return false;
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
  	//zhangyf modify 如果失败则不跳转
  	return false;
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  } 
  //返回父页面
  top.close();
	try{
		var cDealNo = fm.all("DealNo").value;
		top.opener.afterQuery( cDealNo );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
  top.opener.focus();

  
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
	initForm();
} 

 
//提交前的校验、计算  
function beforeSubmit()
{
	 if( verifyInput2() == false ) return false; 
	 	/**
  *zhangyf add  2008年11月3日16:39:46
 */
	
	//大额数据校验 begin
	
	var CRCD = fm.all("CRCD").value.trim();   //交易特征码
	var CRTP = fm.all("CRTP").value.trim();   //币种
	var CRAT = fm.all("CRAT").value.trim();   //交易金额
	var RMB="";
	var DOLLAR="";
	var cnt="";   //中间值 由DOLLAR/RATE*(1+0.05）得来
	var Info="您所提供的金额数目小于规定的金额，可以不用举报";
	
//	if(CRTP=="CNY"){
//	if(CRCD=="0901"){
//     if(CRAT<200000){
//     alert(Info);
//     return false;
//     }
//     }else if(CRCD=="0902"){
//     if(CRAT<2000000){
//     alert(Info);
//     return false;
//     }
//     }else if(CRCD=="0903"){
//     if(CRAT<500000){
//     alert(Info);
//     return false;
//     }
//     }
//	}else if(CRTP=="@E"||CRTP=="@I"||CRTP=="@N"){
//		alert("填入的金额要大于所要求的金额");
//		}
//		else{
//	var strSQL = "select  trim(OtherSign) from ldcode "
//		+ "  where 1 = 1 and codetype = 'amlcurrencytype' " 
//		+ " and code = '" + CRTP + "'" ;
//	var strQueryResult  =  easyQueryVer3(strSQL, 1, 0, 1);
//	var arrSelected = decodeEasyQueryResult(strQueryResult); 
//	 RATE = arrSelected[0][0];  
//	if (RATE.trim()=="0"||RATE.trim()=="") {
//	   // alert("此利率为空，请您填入的金额满足所要求的金额"); 
//	   return true;
//	}else{							
//	 var  tRATE=RATE*(1.05); 
//	 if(CRCD=="0901"||CRCD=="0904"){
//	  DOLLAR=10000;
//	 cnt=DOLLAR/tRATE;  
//	 if(CRAT<cnt){
//	 alert(Info);
//	 return false;
//	 }
//	 }else if(CRCD=="0902"){
//	  DOLLAR=200000;
//	 cnt=DOLLAR/tRATE; 
//	 if(CRAT<cnt){
//	 alert(Info);
//	 return false;
//	 }
//	 }if(CRCD=="0903"){
//	  DOLLAR=100000;
//	 cnt=DOLLAR/tRATE; //alert(cnt);
//	 if(CRAT<cnt){
//	 alert(Info);
//	 return false;
//	 }
//	 }
//	 }
//	 }
	 //end
	
  //添加操作
	var TSTP = fm.all("TSTP").value;  
	var TRCD = fm.all("TRCD").value;  	
	var TSTM = fm.all("TSTM").value;  	
	if (!verifyInput2())          
	return false;
	if (TSTP.substr(2,2) == "00" ){
		if (TRCD == null || TRCD == ""){
			alert("现金交易请填上交易发生地!");
			fm.all("TRCD").focus;
			return false;
		}
	}
	//判断是否是YYYYMMDDHH24MISS
		var patrn=/^((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))(20|21|22|23|[0-1]?\d)[0-5]?\d[0-5]?\d$/;	
	if(!patrn.exec(TSTM)){
		alert("请填入YYYYMMDDHH24MISS的日期格式！" );
		document.getElementById("TSTM").value = "";
		document.getElementById("TSTM").focus();
		return false;
	}
	var htdt = "select htdt from lxihtrademain where dealno = '"+fm.all("DealNo").value+"' ";
	var strQueryResult  = easyQueryVer3(htdt, 1, 0, 1);	    
	if (!strQueryResult) {
		return false;
	}
	else{							
	var arrSelected = decodeEasyQueryResult(strQueryResult);
	htdt = arrSelected[0][0];
	htdt = replace(htdt,"-","");
	if(TSTM.substring(0, 8)!= htdt){
	    alert("交易明细的发生时间必须与交易主体的发生时间相同");
	    return false;	
	 }
	}
	
	//身份证校验
	var TBIT = document.getElementById("TBIT").value;
	if (TBIT == "11"){
		var TBID = document.getElementById("TBID").value;
		if (!checkIdCard(TBID)) {
			document.getElementById("TBID").value= "";
			document.getElementById("TBID").focus() ;
			return false;
		}
	}	
		//代办人身份证类型的verify
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlidtype' and code not like '2%25'"
		+ " and code = '" + TBIT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//判断是否查询成功
	if (!strQueryResult) {
		alert("代办人身份证件类型不存在！");
		document.getElementById("TBIT").value = "";
		document.getElementById("TBIT").focus();		
		return false;
	}
	
	var TCIT = document.getElementById("TCIT").value;
	if (TCIT == "11"){
		var TCID = document.getElementById("TCID").value;
		if (!checkIdCard(TCID)) {
			document.getElementById("TCID").value= "";
			document.getElementById("TCID").focus() ;
			return false;
		}
	}	
	if (TCIT == "21"){
		var TCID = document.getElementById("TCID").value;
		if (TCID.length!=9) {
			alert("交易对手组织机构代码对应9位");
			document.getElementById("TCID").value= "";
			document.getElementById("TCID").focus() ;
			return false;
		}
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
	
	//交易去向编码校验
	var TDRC = document.getElementById("TDRC").value;
	strSQL = "select code1, name1 from ("
		+ " (select case when trim(code) in ('@N', '@I', '@E') then trim(code) else trim(code)||'000000' end as code1,  trim(codename) as name1 " 
		+ " from ldcode  where codetype = 'amlcountry' and code <> 'CHN') "
		+ " union all " 
		+ " (select 'CHN'||trim(code) ,trim(codename) "
		+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
		+ " and code1 = '" + TDRC + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//判断是否查询成功
	if (!strQueryResult) {
		alert("交易去向编码不合法，请重新选择！");
		document.getElementById("TDRC").value = "";
		document.getElementById("TDRC").focus();		
		return false;
	}		
	//代办人国籍的verify
  var TBNT = document.getElementById("TBNT").value;
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlcountry' "
		+ " and code = '" + TBNT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//判断是否查询成功
	if (!strQueryResult) {
		alert("代办人国籍不存在！");
		document.getElementById("TBNT").value = "";
		document.getElementById("TBNT").focus();		
		return false;
	}
	//交易发生地校验 add by huangchong
	if (TSTP.substring(0,4)=="0000")
	{
		if(TRCD == "@E" || TRCD == "@N" || TRCD == "@I")
		{
			alert("现金交易必须填写交易发生地");
			return false;
		}
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


function showArea(str){
	var strUrl = "./LXShowAreaInputMain.jsp";	
	var strPara = "?otype=" + str;	
	OpenWindowNew(strUrl + strPara, "大额地区查询", "left");
}

function showAreaEx(str){
	var TSTP = fm.all("TSTP").value;
//	alert(TSTP.substr(2,2));
	if (TSTP.substr(2,2) == "00" )
		showArea(str);
	else {
		showArea(str);
	}
}

function clearTRCD(){
	fm.all("TRCD").value = "";
}


function afterQueryArea(arrQueryResult, strType){
	var arrResult = new Array();
	if( arrQueryResult != null )
	{
		arrResult = arrQueryResult;
		if (strType == 'TRCD'){
			var TRCD = arrResult[0][0];
			fm.all( 'TRCD' ).value = TRCD;
			var FIRC = arrResult[0][0].substr(3);
			if (FIRC == "000000" ){
				fm.all( 'FIRC' ).value = "@N";
			} else if (TRCD == "@N" || TRCD == "@E" || TRCD == "@I"){
				fm.all( 'FIRC' ).value = TRCD;	
			}
			else{
				fm.all( 'FIRC' ).value = FIRC;			
			}
		}else if (strType == 'TDRC'){
			fm.all( 'TDRC' ).value = arrResult[0][0];
		}
	}
}	
function GoToReturn(){
	try
	{
		var arrReturn = fm.all("DealNo").value;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}