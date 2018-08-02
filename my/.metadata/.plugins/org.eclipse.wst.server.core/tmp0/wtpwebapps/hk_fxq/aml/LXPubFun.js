/**
 * 程序名称: LXPubFun.js
 * 程序功能: 反洗钱通用检验类 
 * 创建日期：2009-03-31
 */

/*****************************************************************************************
 * 功能：日期格式转化函数
 * 描述：只允许输入YYYYMMDD和YYYY-MM-DD格式的日期，对YYYYMMDD日期可自动转化为YYYY-MM-DD格式；
 *       对非数字字符等有校验
 * 返回：YYYY-MM-DD格式的日期
 * 创建: 
******************************************************************************************/
function CheckDate(Filed)
{
	var tDate = Filed.value;
	var Year  = "";
	var Month = "";
	var Day   = "";
	//输入日期八位，YYYYMMDD格式
	if(tDate.length == 8)
	{
		if(tDate.indexOf('-') == -1)
		{		
			Year  = tDate.substring(0,4);
			Month = tDate.substring(4,6);
			Day   = tDate.substring(6,8);	
			tDate = Year+"-"+Month+"-"+Day;
		}
	    else
		{
			alert("您输入的日期有误，请重新输入！");
			return Filed.value = "";
		}
	}
	//输入日期10位，YYYY-MM-DD格式
	else if(tDate.length == 10)
	{
		if((tDate.substring(4,5) != '-')||(tDate.substring(7,8) != '-'))
		{
			alert("您输入的日期有误，请重新输入！");
			return Filed.value = "";
		}		
		Year  = tDate.substring(0,4);
		Month = tDate.substring(5,7);
		Day   = tDate.substring(8,10);	
		tDate = Year+"-"+Month+"-"+Day;	
	}
	//输入日期既不是YYYYMMDD格式，也不是YYYY-MM-DD格式
	else
	{
	    if(tDate == null||tDate == "")//输入为空，返回空值，不报错
	    {
	    	return Filed.value = "";
	    }
	    else//输入不为空，提示出错
	    {
	  	    alert("您输入的日期有误，请重新输入！");
	  	    return Filed.value = "";        	
	    }	
	}
    //校验输入日期是否为非零数字
	if((!isInteger(Year))||(!isInteger(Month))||(!isInteger(Day))||(Year == "0000")||(Month == "00")||(Day == "00"))
	{
	    alert("您输入的年月日有误，请重新输入！");
	    return Filed.value = "";
	}	    
    //对月分日期做进一步精确校验 
	if(Month>12){alert("您的输入有误，一年只有12个月，请重新输入！");return Filed.value = "";}
	if(Month=="01"&&Day>31){alert("您的输入有误，一月只有31日，请重新输入！");return Filed.value = ""; }
    if(Month=="02"&&Day>29){alert("您的输入有误，二月最多只有29日，请重新输入！");return Filed.value = "";}
    if(Month=="02"&&Day==29)//二月要判断是否为闰年
    {
    	if((Year%100==0)&&(Year%400!=0))//非闰年判断
    	{
    		alert("您的输入有误，非闰年二月只有28日，请重新输入！");return Filed.value = "";
    	}
    	if((Year%100!=0)&&(Year%4!=0))//非闰年判断
    	{
    		alert("您的输入有误，非闰年二月只有28日，请重新输入！");return Filed.value = "";
    	}
    } 
	if(Month=="03"&&Day>31){alert("您的输入有误，三月只有31日，请重新输入！");return Filed.value = "";}
	if(Month=="04"&&Day>30){alert("您的输入有误，四月只有30日，请重新输入！");return Filed.value = "";}
	if(Month=="05"&&Day>31){alert("您的输入有误，五月只有31日，请重新输入！");return Filed.value = "";}
	if(Month=="06"&&Day>30){alert("您的输入有误，六月只有30日，请重新输入！");return Filed.value = "";}
	if(Month=="07"&&Day>31){alert("您的输入有误，七月只有31日，请重新输入！");return Filed.value = "";}
	if(Month=="08"&&Day>31){alert("您的输入有误，八月只有31日，请重新输入！");return Filed.value = "";}
	if(Month=="09"&&Day>30){alert("您的输入有误，九月只有30日，请重新输入！");return Filed.value = "";}
	if(Month=="10"&&Day>31){alert("您的输入有误，十月只有31日，请重新输入！");return Filed.value = "";}
	if(Month=="11"&&Day>30){alert("您的输入有误，十一月只有30日，请重新输入！");return Filed.value = "";}
	if(Month=="12"&&Day>31){alert("您的输入有误，十二月只有31日，请重新输入！");return Filed.value = "";}
	
	Filed.value = tDate;//校验通过后，返回值
}

/*********************************************************************************************
 * 功能：对邮编的校验,要求邮编必须是6位数字
 * 描述：主要在录入“报案人邮编”时使用
 * 参数：邮编tPostCode
 * 返回：true/false
 * 创建：niuzj,2006-01-12
**********************************************************************************************/
function checkPostCode(tPostCode)
{
	  var ttPostCode = tPostCode.value;
	  if(ttPostCode == null || ttPostCode == "")
	  {
		   return true;
	  }
    else
    {
  	   if(ttPostCode.length == 6 && isInteger(ttPostCode))
  	   {
  	   	  return true;
  	   }
  	   else
  	   {
  	   	  alert("输入的邮编有误,请重新输入!");
  	   	  return false;
  	   }
    }
}

/*********************************************************************************************
 * 功能：防止同一用户同时打开两个窗口操作同一个赔案可能产生的错误。
 * 描述：用在有数据提交的操作前检验。补充说明，如只在主界面的js文件中添加检验，也是有漏洞的：
         在赔案状态改变之前用户已将分支功能的页面打开，而后在另一主界面窗口操作改变赔案状态，
         再回到先前已打开的分支界面中操作，检验失效。要解决此问题，需在分支界面的js中也加判断。
 * 参数：tClmNo赔案号（团体为分案号），tClmState1,tClmState2赔案状态（允许只使用一个）。
 * 返回：true/false
 * 创建：
**********************************************************************************************/
function KillTwoWindows(tClmNo,tClmState1,tClmState2)
{
    var tSQLF = " select clmstate from llregister where rgtno = '"+tClmNo+"'";
    var tClmState = easyExecSql(tSQLF);  
    if(tClmState==null)//赔案处于立案保存之前，报案确认未定 
    {   
			  var tSQLS   = " select rgtobj from llreport where rptno='"+tClmNo+"' ";
			  var tRgtObj = easyExecSql(tSQLS);          
			  if(tRgtObj=='1')//个险
			  {
			  	  var tSQLT1 = " select activityid from lwmission where activityid='0000005005' "
			  	             + " and missionprop1='"+tClmNo+"' ";
            var tActD1 = easyExecSql(tSQLT1);
            if(tActD1==null)//认为已报案确认，案件状态同立案
            {
            	  tClmState="20";
            }
            else//工作流存在，没有报案确认
            {
              	tClmState="10";
            } 			  	             
			  }
			  if(tRgtObj=='2')//团险
			  {
			  	  var tSQLT2 = " select activityid from lwmission where activityid='0000005205' and exists "
			  	             + " (select 'X' from llreport where missionprop1=trim(rgtobjno) and rptno='"+tClmNo+"') ";
            var tActD2 = easyExecSql(tSQLT2); 	
            if(tActD2==null)
            {
            	  tClmState="20";
            }
            else
            {
              	tClmState="10";
            }            		  	
			  }
    } 
	  if(tClmState1!=tClmState&&tClmState2!=tClmState)
	  {
	    	 alert("赔案状态已发生变化，请重新登陆后操作！");
	    	 return false;
	  }    
    return true;      
}


/*********************************************************************************************
 * 功能：可疑交易提交前的身份证检验
 * 描述：此方法依赖于Common.js中的function checkIdCard(idCard)
 * 参数：tDealNo交易号
 * 返回：true/false
 * 创建：
**********************************************************************************************/
function CheckCardNoIS(tDealNo)
{
	  var tSQL;
	  var tCardNo;
	  //lxistrademain
    tSQL = " select ctid,ctnm from lxistrademain where dealno='"+tDealNo+"' and citp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	if(!checkIdCard(tCardNo[0][0]))
    	{
    		alert("交易"+tDealNo+"中，客户 "+tCardNo[0][1]+" 身份证号错误！");
    		return false;
    	}
    } 
    //lxistradedetail
    tSQL = " select tbid,tbnm from lxistradedetail where dealno='"+tDealNo+"' and tbit='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("交易"+tDealNo+"明细中，经办人 "+tCardNo[j][1]+" 身份证号错误！");
	    		return false;
	    	}
    	}
    } 
    //lxistradeinsured
    tSQL = " select isid,istn,csnm from lxistradeinsured where dealno='"+tDealNo+"' and iitp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("交易"+tDealNo+"，合同 "+tCardNo[j][2]+" 中，保险标的"+tCardNo[j][1]+"身份证号错误！");
	    		return false;
	    	}
    	}
    } 
    //lxistradebnf
    tSQL = " select bnid,bnnm,csnm from lxistradebnf where dealno='"+tDealNo+"' and bitp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("交易"+tDealNo+"，合同 "+tCardNo[j][2]+" 中，受益人"+tCardNo[j][1]+"身份证号错误！");
	    		return false;
	    	}
    	}
    } 
    return true;
}

/*********************************************************************************************
 * 功能：大额交易提交前的身份证检验
 * 描述：此方法依赖于Common.js中的function checkIdCard(idCard)
 * 参数：tDealNo交易号
 * 返回：true/false
 * 创建：
**********************************************************************************************/
function CheckCardNoIH(tDealNo)
{
	  var tSQL;
	  var tCardNo;
	  //lxihtrademain
    tSQL = " select ctid,ctnm from lxihtrademain where dealno='"+tDealNo+"' and citp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	if(!checkIdCard(tCardNo[0][0]))
    	{
    		alert("交易"+tDealNo+"中，客户 "+tCardNo[0][1]+" 身份证号错误！");
    		return false;
    	}
    } 
    //lxihtradedetail
    tSQL = " select tbid,tbnm from lxihtradedetail where dealno='"+tDealNo+"' and tbit='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("交易"+tDealNo+"明细中，经办人 "+tCardNo[j][1]+" 身份证号错误！");
	    		return false;
	    	}
    	}
    } 
    tSQL = " select tcid,tcnm from lxihtradedetail where dealno='"+tDealNo+"' and tcit='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("交易"+tDealNo+"明细中，交易对手 "+tCardNo[j][1]+" 身份证号错误！");
	    		return false;
	    	}
    	}
    } 
    
    return true;
}

function CheckIHPersonInfo(tDealNo)
{
	  //大额主表客户信息检验
	  var tSQL1 = "select CTNM,CITP,CTID from LXIHTradeMain where dealno='"+tDealNo+"'";
	  var tResult1 = easyExecSql(tSQL1);
	  if(tResult1!=null)
	  {
		 var tCTNM1 = tResult1[0][0];
		 var tCITP1 = tResult1[0][1];
		 var tCTID1 = tResult1[0][2];
		 if(!CheckNotReplace(tCTNM1,tCITP1,tCTID1))
		 {
			 return false;
		 }
	  }
	  
	  //大额主表客户信息检验
	  var tSQL2 = "select TBNM,TBIT,TBID,TBNT,TCNM,TCIT,TCID from LXIHTradeDetail where dealno='"+tDealNo+"'";
	  var tResult2 = easyExecSql(tSQL2);
	  if(tResult2!=null)
	  {
		 var tTBNM1 = tResult2[0][0];
		 var tTBIT1 = tResult2[0][1];
		 var tTBID1 = tResult2[0][2];
		 var tTBNT1 = tResult2[0][3];
		 var tTCNM1 = tResult2[0][4];
		 var tTCIT1 = tResult2[0][5];
		 var tTCID1 = tResult2[0][6];
		 
		 if((tTBNM1=="@N"&&tTBIT1=="@N"&&tTBID1=="@N"&&tTBNT1=="@N")||(tTBNM1!="@N"&&tTBIT1!="@N"&&tTBID1!="@N"&&tTBNT1!="@N"))
		 {
			 //什么也不会发生
		 }
		 else
		 {
			 alert("姓名，身份证件/证明文件类型/号码,国籍可填写替代符号，但这四项中有一项非替代符号，则其他项不得填写替代符号");
			 return false;
		 }
		 if((tTBNM1=="@E"&&tTBIT1=="@E"&&tTBID1=="@E"&&tTBNT1=="@E")||(tTBNM1!="@E"&&tTBIT1!="@E"&&tTBID1!="@E"&&tTBNT1!="@E"))
		 {
			 //什么也不会发生
		 }
		 else
		 {
			 alert("姓名，身份证件/证明文件类型/号码,国籍可填写替代符号，但这四项中有一项非替代符号，则其他项不得填写替代符号");
			 return false;
		 }
		 if((tTBNM1=="@I"&&tTBIT1=="@I"&&tTBID1=="@I"&&tTBNT1=="@I")||(tTBNM1!="@I"&&tTBIT1!="@I"&&tTBID1!="@I"&&tTBNT1!="@I"))
		 {
			 //什么也不会发生
		 }
		 else
		 {
			 alert("姓名，身份证件/证明文件类型/号码,国籍可填写替代符号，但这四项中有一项非替代符号，则其他项不得填写替代符号");
			 return false;
		 }
		 
		 if(!CheckNotReplace(tTCNM1,tTCIT1,tTCID1))
		 {
			 return false;
		 }
	  }
	  
	  //帐号校验
	  //除填写替代符号外，账号必须大于或等于6位。
	  var tSQL3 = "select CTAC,TCAC from LXIHTradeDetail where dealno='"+tDealNo+"'";
	  var tResult3 = easyExecSql(tSQL3);
		  var tCTAC = tResult3[0][0];
		  var tTCAC = tResult3[0][1];
		  if(tCTAC!="@N"&&tCTAC!="@E"&&tCTAC!="@I")
		  {
			  if(tCTAC.length<6)
			  {
			    	alert("交易"+tDealNo+"中，除填写替代符号外，账号(银行转帐资金账号)必须大于或等于6位！");
			    	return false;
			  }
		  }
		  
		  if(tTCAC!="@N"&&tTCAC!="@E"&&tTCAC!="@I")
		  {
			  if(tTCAC.length<6)
			  {
			    	alert("交易"+tDealNo+"中，除填写替代符号外，对手交易账号(银行转帐资金账号)必须大于或等于6位！");
			    	return false;
			  }
		  }
		   
	  return true;
}

function CheckISPersonInfo(tDealNo)
{
	  var tSQL1;
	  tSQL1 = "select CTTP from LXISTradeMain where dealno='"+tDealNo+"'";
	  //var tQuery1 = easyQueryVer3(tSQL1,0,1,0);
	  var tResult1 = easyExecSql(tSQL1);
	  if(tResult1!=null)
	  {
	    var tCTTP = tResult1[0][0];
	    if(tCTTP!=null)
	    {
		    //如果客户类型CTTP为自然人，则对公元素必须均为@N。
		    if(tCTTP=="07")
		    {
		  	  var tSQL2 = "select HDNM, HITP, HDID, HDVC, HDRT, HEIF from LXISTradeCusPartner where dealno='"+tDealNo+"'";
		  	  //var tQuery2 = easyQueryVer3(tSQL2,0,1,0);
		  	  var tResult2 = easyExecSql(tSQL2);
		  	  if(tResult2!=null)
		  	  {
		  	    for(var i=0;i<tResult2.length;i++)
		  	    {
		  		   var tHDNM = tResult2[i][0];
		  		   var tHITP = tResult2[i][1];
		  		   var tHDID = tResult2[i][2];
		  		   var tHDVC = tResult2[i][3];
		  		   var tHDRT = tResult2[i][4];
		  		   var tHEIF = tResult2[i][5];
		  		   if(!(tHDNM=="@N"&&tHITP=="@N"&&tHDID=="@N"&&tHDVC=="@N"&&tHDRT=="@N"&&tHEIF=="@N"))
		  		   {
		  	    		alert("交易"+tDealNo+"中，客户类型为自然人，其对公元素必须均为@N！");
		  	    		return false;
		  		   }
		  	    }
		  	  }
		    }
		    //如果客户类型CTTP为法人，则法人相关元素不得填写替代符。
		    //如果客户类型CTTP为个体工商户或其他组织，则相关元素不得填写替代符。
		    if(tCTTP=="01"||tCTTP=="02"||tCTTP=="03"||tCTTP=="04"||tCTTP=="05"||tCTTP=="06")
		    {
		  	  var tSQL3 = "select CRNM,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
		  	  var tResult3 = easyExecSql(tSQL3);
		  	  if(tResult3!=null)
		  	  {
		  		 var tCRNM = tResult3[0][0];
		  		 var tCRIT = tResult3[0][1];
		  		 var tCRID = tResult3[0][2];
		  		 if(tCRNM=="@N"||tCRNM=="@E"||tCRNM=="@I")
		  		 {
		  	    	alert("交易"+tDealNo+"中，代表人相关元素(姓名)不得填写替代符！");
		  	    	return false;
		  		 }
		  		 if(tCRIT=="@N"||tCRIT=="@E"||tCRIT=="@I")
		  		 {
		  	    	alert("交易"+tDealNo+"中，代表人相关元素(身份证类型)不得填写替代符！");
		  	    	return false;
		  		 }
		  		 if(tCRID=="@N"||tCRID=="@E"||tCRID=="@I")
		  		 {
		  	    	alert("交易"+tDealNo+"中，代表人相关元素(身份证件号码)不得填写替代符！");
		  	    	return false;
		  		 }
		  		}
		    }
	    }
	  }
	  //除填写替代符号外，账号必须大于或等于6位。
	  var tSQL4 = "select TCAN from LXISTradeDetail where dealno='"+tDealNo+"'";
	  var tResult4 = easyExecSql(tSQL4);
	  if(tResult4!=null)
	  {
	    for(var k=0;k<tResult4.length;k++)
	    {
		    var tTCAN = tResult4[k][0];
		    if(tTCAN!="@N"&&tTCAN!="@E"&&tTCAN!="@I")
		    {
		  	  if(tTCAN.length<6)
		  	  {
		  	    	alert("交易"+tDealNo+"中，除填写替代符号外，账号(银行转帐资金账号)必须大于或等于6位！");
		  	    	return false;
		  	  }
		    }
	    }
	  }
	  
	  //当交易发生地为中国大陆地区时，前3 位填写CHN、Z01、Z02 或Z03，
	  //并且后6 位按照大陆地区行政区划代码填写区、县级粒度的代码
	  //（行政区划代码末尾两位不能为00,广东东莞市和中山市除外）。
	  var tSQL5 = "select TRCD from LXISTradeMain where dealno='"+tDealNo+"' and ((TRCD like 'CHN%') or (TRCD like 'Z01%') or (TRCD like 'Z02%') or (TRCD like 'Z03%'))";
	  var tResult5 = easyExecSql(tSQL5);
	  if(tResult5!=null)
	  {
		  var tTRCD = tResult5[0][0];
		  if(tTRCD!="CHN441900"&&tTRCD!="CHN442000")
		  {
			  var tSQL6 = "select 1 from dual where '"+tTRCD+"' like '%00'";
			  var rResult6 = easyExecSql(tSQL6);
			  if(rResult6!=null)
			  {
				  alert("行政区划代码末尾两位不能为00,广东东莞市和中山市除外");
				  return false;
			  }
		  }
	  }
	  
	  //test.代表人的四（三）项数据的检验
	  var tSQL6 = "select CRNM,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
	  var tResult6 = easyExecSql(tSQL6);
	  if(tResult6!=null)
	  {
		 var tCRNM1 = tResult6[0][0];
		 var tCRIT1 = tResult6[0][1];
		 var tCRID1 = tResult6[0][2];
		 if(!CheckNotReplace(tCRNM1,tCRIT1,tCRID1))
		 {
			 return false;
		 }
	  }	 
	  
	  //test.客户的四（三）项数据的检验
	  var tSQL7 = "select CTNM,CITP,CTID from LXISTradeMain where dealno='"+tDealNo+"'";
	  var tResult7 = easyExecSql(tSQL7);
	  if(tResult7!=null)
	  {
		 var tCTNM1 = tResult7[0][0];
		 var tCITP1 = tResult7[0][1];
		 var tCTID1 = tResult7[0][2];
		 if(!CheckNotReplace(tCTNM1,tCITP1,tCTID1))
		 {
			 return false;
		 }
	  }	 
	  
	  //test.股东信息的四（三）项数据的检验
	  var tSQL8 = "select HDNM,HITP,HDID from LXISTradeCusPartner where dealno='"+tDealNo+"'";
	  var tResult8 = easyExecSql(tSQL8);
	  if(tResult8!=null)
		{
	    for(var i=0;i<tResult8.length;i++)
	    {
			 var tHDNM1 = tResult8[i][0];
			 var tHITP1 = tResult8[i][1];
			 var tHDID1 = tResult8[i][2];
			 if(!CheckNotReplace(tHDNM1,tHITP1,tHDID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  //test.经办人的四（三）项数据的检验
	  var tSQL9 = "select TBNM,TBIT,TBID from LXISTradeDetail where dealno='"+tDealNo+"'";
	  var tResult9 = easyExecSql(tSQL9);
	  if(tResult9!=null)
		{
	    for(var i=0;i<tResult9.length;i++)
	    {
			 var tTBNM1 = tResult9[i][0];
			 var tTBIT1 = tResult9[i][1];
			 var tTBID1 = tResult9[i][2];
			 if(!CheckNotReplace(tTBNM1,tTBIT1,tTBID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  //test.被保险人的四（三）项数据的检验
	  var tSQL10 = "select ISTN,IITP,ISID from LXISTradeInsured where dealno='"+tDealNo+"'";
	  var tResult10 = easyExecSql(tSQL10);
	  if(tResult10!=null)
		{
	    for(var i=0;i<tResult10.length;i++)
	    {
			 var tISTN1 = tResult10[i][0];
			 var tIITP1 = tResult10[i][1];
			 var tISID1 = tResult10[i][2];
			 if(!CheckNotReplace(tISTN1,tIITP1,tISID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  //test.受益人的四（三）项数据的检验
	  var tSQL11 = "select BNNM,BITP,BNID from LXISTradeBnf where dealno='"+tDealNo+"'";
	  var tResult11 = easyExecSql(tSQL11);
	  if(tResult11!=null)
		{
	    for(var i=0;i<tResult11.length;i++)
	    {
			 var tBNNM1 = tResult11[0][0];
			 var tBITP1 = tResult11[0][1];
			 var tBNID1 = tResult11[0][2];
			 if(!CheckNotReplace(tBNNM1,tBITP1,tBNID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  return true;
}


//另写一个函数，用于校验姓名，身份证件/证明文件类型，身份证件/证明文件号码可填写替代符号，
//但这四项中有一项非替代符号，则其他项不得填写替代符号
//发现可疑交易录入时，没有第四项国籍的出现
  function CheckNotReplace(a,b,c)
  {
		 if((a=="@N"&&b=="@N"&&c=="@N")||(a!="@N"&&b!="@N"&&c!="@N"))
		 {
			 //什么也不会发生
			 return true;
		 }
		 else
		 {
			 alert("姓名，身份证件/证明文件类型/号码可填写替代符号，但这三项中有一项非替代符号，则其他项不得填写替代符号");
			 return false;
		 }
		 if((a=="@E"&&b=="@E"&&c=="@E")||(a!="@E"&&b!="@E"&&c!="@E"))
		 {
			 //什么也不会发生
			 return true;
		 }
		 else
		 {
			 alert("姓名，身份证件/证明文件类型/号码可填写替代符号，但这三项中有一项非替代符号，则其他项不得填写替代符号");
			 return false;
		 }
		 if((a=="@I"&&b=="@I"&&c=="@I")||(a!="@I"&&b!="@I"&&c!="@I"))
		 {
			 //什么也不会发生
			 return true;
		 }
		 else
		 {
			 alert("姓名，身份证件/证明文件类型，身份证件/证明文件号码可填写替代符号，但这三项中有一项非替代符号，则其他项不得填写替代符号");
			 return false;
		 }
  }