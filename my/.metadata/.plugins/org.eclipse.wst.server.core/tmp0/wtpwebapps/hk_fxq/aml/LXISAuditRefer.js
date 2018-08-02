//<!-- JavaScript Document BGN -->

/*============================================================================*/
var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
/*============================================================================*/

/**
 * 提交后操作, 服务器数据返回后执行的操作
 */
function afterSubmit(DealFlag, MsgContent)
{
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
     queryWaitForBeFileGrid(fm.UserCode.value);
}

/**
 * 查询可选上报报文信息
 */
function queryWaitForBeFileGrid(usercode)
{
//		var tStr_RuleReason = "";
//		if(fm.RuleReason.value != null&&fm.RuleReason.value != "")
//		{
//			if(fm.RuleReason.value=="ISX0x00x")
//			{
//				tStr_RuleReason = " and not exists (select 'X' from lxcalresult t where t.dealno=a.dealno ) ";
//			}
//			else
//			{
//				tStr_RuleReason = " and exists (select 'X' from lxcalresult t where t.dealno=a.dealno  "
//						                + " and t.calcode='"+fm.RuleReason.value+"') ";
//			}	
//		}	

	var tStr_TSTP = "";
	if(fm.TSTP.value != null&&fm.TSTP.value != "")
	{
		if(fm.TSTP.value=="01")
		{//新契约
			tStr_TSTP = " and a.dealno in  (select t.dealno from lxcalresult t where t.calcode in ('ISX01004','ISX01006','ISX04006','ISX04007','ISX08002')) ";
		}
		else if(fm.TSTP.value=="02")
		{//核保
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode ='ISX01005') ";
		}
		else if(fm.TSTP.value=="04")
		{//保全
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode in ('ISX04001','ISX04002','ISX04003','ISX04004','ISX04005')) ";
		}
		else if(fm.TSTP.value=="05")
		{//理赔
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode='ISX05002') ";
		}
		else if(fm.TSTP.value=="08")
		{//财务
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode in ('ISX08001','ISX08003','ISX08004','ISX08005','ISX08006')) ";
		}
		else
		{
			tStr_TSTP = " and 1!=1  ";
		}	
	}

    //alert(usercode);
    var StrSql="SELECT PopEdom FROM LXUser where UserCode='"+usercode+"'";
    var edom=easyExecSql(StrSql);
    var QuerySQL = "select a.DEALNo, "
                 +        "a.STCR, "
                 +        "a.SDGR, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.DataState,"
                 +        "(select codename from ldcode where code=a.DataState and codetype='amldatastate'), "
                 +        "a.CTID, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "a.Operator, "
                 + " (case (select 1 from lxcalresult t where t.dealno=a.dealno) when 1 then (select m.remark from lxcalmode m where m.crcd=a.stcr and m.no='0' and m.validity='1' and m.calcode in (select t.calcode from lxcalresult t where t.dealno = a.dealno)) else '可疑录入数据' end) , "
                 +        "(select b.Missionprop1 from LWMission b where a.DealNo = b.Missionprop3 and rownum = 1) Missionprop1, "
                 +        "case (select b.Missionprop12 from LWMission b where   a.DealNo = b.Missionprop3 and rownum = 1) when '09' then '放弃上报' else  '上报' end,  "
                 +        "(select b.Missionprop12 from LWMission b where   a.DealNo = b.Missionprop3 and rownum = 1)"
                 +    "from LXISTradeMain a  "
                 +    "where 1 = 1  "
                 +		"and exists (select 1 "
                 + 		"from  LWMission c "
                 + 		"where a.DealNo = c.Missionprop3 "
                 +		"and c.Missionprop1 >= '" + edom + "' "
                 +  " and c.activityid='0000009201' ) "
                 +     "and DataState ='S00' "
                // +     "and managecom like '" + comcode + "%25' "
                 + tStr_TSTP
                 + " and exists (select 'X' from lxistradedetail d where d.dealno=a.dealno) "
                 //+      getWherePart("TSTP", "TSTP") + " ) "
                 +      getWherePart("DealNo", "DealNo")
                 +      getWherePart("STCR", "amlshadinessstamp")
                 +      getWherePart("CSNM", "CustomerNo")
                 +      getWherePart("CTNM", "CustomerName")
                 +      getWherePart("CTID", "IDNo")
                 +      getWherePart("DealDate", "StartDate", ">=")
                 +      getWherePart("DealDate", "EndDate", "<=")
                 +      getWherePart("ManageCom", "StatiCode", "like")
                 +   "order by a.DealDate desc,Missionprop1 Desc";
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}

//<!-- JavaScript Document END -->
//提交前的校验、计算
function beforeSubmit()
{
    var nCheckCount = 0;
    try
    {
        nCheckCount = WaitForBeFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("请先查询并选择您要添加的交易！ ");
        return;
    }		
    treason = fm.all("reason").value;
    if(!treason)
    {
    	alert("请输入放弃上报原因！");
    	return false;
    }
	
	//---------------------cgh--2008.11.8--------<
	  for(var i=0;i<WaitForBeFileGrid.mulLineCount;i++)
    {
	    if(WaitForBeFileGrid.getChkNo(i))
	    {
		    var tDealNo=WaitForBeFileGrid.getRowColData(i,1);
		    
		    var tSQL_Ins = " select count(*) from lxistradeinsured where dealno='"+tDealNo+"' ";
		    var tInsCount = easyExecSql(tSQL_Ins);
		    if(tInsCount[0][0]<=0)
		    {
		    		alert(tDealNo+"交易没有被保人信息，请补充后再上报！");
			      return false; 
		    }
		    
		    var tSQL_InsNoAll = " select t.csnm from lxistradecont t where t.csnm not in "
		                      + " (select d.csnm from lxistradeinsured d where d.dealno=t.dealno) and t.dealno='"+tDealNo+"' ";
		    var tInsNoAll = easyExecSql(tSQL_InsNoAll);
		    if(tInsNoAll!=null)
		    {
		    		alert("在"+tDealNo+"交易下，"+tInsNoAll[0][0]+"合同中没有被保人信息，请补充后再上报！");
			      return false; 
		    }
		    
		    //--------------------------------------------<累计的交易金额 小于5000元时，提示“累计交易金额过低，是否一定上报？”的选择性提示
		    var tSQL="select sum(CRAT) from LXISTradeDetail where 1=1 and DealNo='"+tDealNo+"'";
		    var tMoney=easyExecSql(tSQL);
		    if(tMoney<5000)
		    var flag = window.confirm("交易："+tDealNo+"，累计交易金额过低，是否一定上报？"); 
		    if(flag==false) 
		    { 
		    alert("请重新选择确认！");
		    //WaitForBeFileGrid.checkBoxAllNot();
		    return false; 
		    }
		    
		    //---------------------------------------------->
		    //----------------------------------------------<在可疑审核阶段增加对证件号的校验，不符合规则的不允许提交到下一环节
		    var tInsuredNo=WaitForBeFileGrid.getRowColData(i,4);
		    //-------------------客户，代表人证件信息
			    tSQL="select CITP,CTID,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var strQueryResult  = easyQueryVer3(tSQL, 1, 0, 1);
					//判断是否查询成功
					if (!strQueryResult) 
					{
						alert("查询证件信息失败！：LXISTradeMain");
						return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected = decodeEasyQueryResult(strQueryResult);
						if(!idnocheck(arrSelected[0][0],arrSelected[0][1],"客户",tDealNo))
			      {
			      	return false;
			      }
			      if(!idnocheck(arrSelected[0][2],arrSelected[0][3],"代表人",tDealNo))
			      {
			      	return false;
			      }
				  }
				  
				  //团体证件类型和证件号没有校验，不允许为@N，@I等替代符
			    var tS="select CTTP,CITP,CTID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var tGrpIDType = easyExecSql(tS);
          if(tGrpIDType!=null)
          {
					  var CTTP = tGrpIDType[0][0];//投保人类型
					  var CITP = tGrpIDType[0][1];//客户身份证件类型
					  var CTID = tGrpIDType[0][2];//客户身份证件号码
						if(CTTP!="07")
					  {//非个人
					  	if(CITP=="@N"||CITP=="@E"||CITP=="@I")
					  	{
					  		alert("交易"+tDealNo+"中团体客户证件类型不能用@N，@I，@E代替！");
					  		return false;
					  	}
					  	if(CTID=="@N"||CTID=="@E"||CTID=="@I")
					  	{
					  		alert("交易"+tDealNo+"中团体客户证件号码不能用@N，@I，@E代替！");
					  		return false;
					  	}
					  }          		
          } 
				  
			  //--------------------股东证件信息
			  tSQL="select  HITP, HDID from LXISTradeCusPartner where DealNo = '" + tDealNo + "' " ;
			  var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //判断是否查询成功
					if (!strQueryResult1) 
					{
						//alert("查询证件信息失败！：LXISTradeCusPartner");
						//return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"股东",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
		    //---------------------被保人
		    tSQL="select  IITP,ISID from LXISTradeInsured where DealNo = '" + tDealNo + "' " ;
		    var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //判断是否查询成功
					if (!strQueryResult1) 
					{
						alert("查询证件信息失败！：LXISTradeInsured");
						return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"被保人",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
	      //---------------------受益人
	      tSQL="select BITP,BNID from LXISTradeBnf where DealNo = '" + tDealNo + "'";
	      var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //判断是否查询成功
					if (!strQueryResult1) 
					{
						//alert("查询证件信息失败！：LXISTradeBnf");
						//return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"受益人",tDealNo))
					      {
					      	return false;
					      }
			      }  
				  }
				  //可疑增加身份证检验
			    if(!CheckCardNoIS(tDealNo))
			    {
			    	return false;
			    }			   
		    //---------------------------------------------->
	    }
    }
 //--------------------------------------------->
//    var len = WaitForBeFileGrid.mulLineCount;
//    var no=1;
//    for(var i=0;i<len;i++)
//    {
//        if(WaitForBeFileGrid.getSelNo(i))
//        {
//            no=0;
//            break;}
//        }
//    if(no==1)
//    {
//	    alert("未选中交易");
//	    return false;
//    }
   return true;
}


function beforeSubmit1()
{
    var nCheckCount = 0;
    try
    {
        nCheckCount = WaitForBeFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("请先查询并选择您要添加的交易！ ");
        return;
    }		
	
	
	//---------------------cgh--2008.11.8--------<
	  for(var i=0;i<WaitForBeFileGrid.mulLineCount;i++)
    {
	    if(WaitForBeFileGrid.getChkNo(i))
	    {
		    var tDealNo=WaitForBeFileGrid.getRowColData(i,1);
		    
		    var tSQL_Ins = " select count(*) from lxistradeinsured where dealno='"+tDealNo+"' ";
		    var tInsCount = easyExecSql(tSQL_Ins);
		    if(tInsCount[0][0]<=0)
		    {
		    		alert(tDealNo+"交易没有被保人信息，请补充后再上报！");
			      return false; 
		    }
		    
		    var tSQL_InsNoAll = " select t.csnm from lxistradecont t where t.csnm not in "
		                      + " (select d.csnm from lxistradeinsured d where d.dealno=t.dealno) and t.dealno='"+tDealNo+"' ";
		    var tInsNoAll = easyExecSql(tSQL_InsNoAll);
		    if(tInsNoAll!=null)
		    {
		    		alert("在"+tDealNo+"交易下，"+tInsNoAll[0][0]+"合同中没有被保人信息，请补充后再上报！");
			      return false; 
		    }
		    
		    //--------------------------------------------<累计的交易金额 小于5000元时，提示“累计交易金额过低，是否一定上报？”的选择性提示
		    var tSQL="select sum(CRAT) from LXISTradeDetail where 1=1 and DealNo='"+tDealNo+"'";
		    var tMoney=easyExecSql(tSQL);
		    if(tMoney<5000)
		    var flag = window.confirm("交易："+tDealNo+"，累计交易金额过低，是否一定上报？"); 
		    if(flag==false) 
		    { 
		    alert("请重新选择确认！");
		    //WaitForBeFileGrid.checkBoxAllNot();
		    return false; 
		    }
		    
		    //---------------------------------------------->
		    //----------------------------------------------<在可疑审核阶段增加对证件号的校验，不符合规则的不允许提交到下一环节
		    var tInsuredNo=WaitForBeFileGrid.getRowColData(i,4);
		    //-------------------客户，代表人证件信息
			    tSQL="select CITP,CTID,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var strQueryResult  = easyQueryVer3(tSQL, 1, 0, 1);
					//判断是否查询成功
					if (!strQueryResult) 
					{
						alert("查询证件信息失败！：LXISTradeMain");
						return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected = decodeEasyQueryResult(strQueryResult);
						if(!idnocheck(arrSelected[0][0],arrSelected[0][1],"客户",tDealNo))
			      {
			      	return false;
			      }
			      if(!idnocheck(arrSelected[0][2],arrSelected[0][3],"代表人",tDealNo))
			      {
			      	return false;
			      }
				  }
				  
				  //团体证件类型和证件号没有校验，不允许为@N，@I等替代符
			    var tS="select CTTP,CITP,CTID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var tGrpIDType = easyExecSql(tS);
          if(tGrpIDType!=null)
          {
					  var CTTP = tGrpIDType[0][0];//投保人类型
					  var CITP = tGrpIDType[0][1];//客户身份证件类型
					  var CTID = tGrpIDType[0][2];//客户身份证件号码
						if(CTTP!="07")
					  {//非个人
					  	if(CITP=="@N"||CITP=="@E"||CITP=="@I")
					  	{
					  		alert("交易"+tDealNo+"中团体客户证件类型不能用@N，@I，@E代替！");
					  		return false;
					  	}
					  	if(CTID=="@N"||CTID=="@E"||CTID=="@I")
					  	{
					  		alert("交易"+tDealNo+"中团体客户证件号码不能用@N，@I，@E代替！");
					  		return false;
					  	}
					  }          		
          } 
				  
			  //--------------------股东证件信息
			  tSQL="select  HITP, HDID from LXISTradeCusPartner where DealNo = '" + tDealNo + "' " ;
			  var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //判断是否查询成功
					if (!strQueryResult1) 
					{
						//alert("查询证件信息失败！：LXISTradeCusPartner");
						//return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"股东",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
		    //---------------------被保人
		    tSQL="select  IITP,ISID from LXISTradeInsured where DealNo = '" + tDealNo + "' " ;
		    var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //判断是否查询成功
					if (!strQueryResult1) 
					{
						alert("查询证件信息失败！：LXISTradeInsured");
						return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"被保人",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
	      //---------------------受益人
	      tSQL="select BITP,BNID from LXISTradeBnf where DealNo = '" + tDealNo + "'";
	      var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //判断是否查询成功
					if (!strQueryResult1) 
					{
						//alert("查询证件信息失败！：LXISTradeBnf");
						//return ;
					}
					else
					{
						//查询成功则拆分字符串，返回二维数组
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"受益人",tDealNo))
					      {
					      	return false;
					      }
			      }  
				  }
				  //可疑增加身份证检验
			    if(!CheckCardNoIS(tDealNo))
			    {
			    	return false;
			    }			   
		    //---------------------------------------------->
	    }
    }
 //--------------------------------------------->
//    var len = WaitForBeFileGrid.mulLineCount;
//    var no=1;
//    for(var i=0;i<len;i++)
//    {
//        if(WaitForBeFileGrid.getSelNo(i))
//        {
//            no=0;
//            break;}
//        }
//    if(no==1)
//    {
//	    alert("未选中交易");
//	    return false;
//    }
   return true;
}

//function GoToDetailInput(oper)
//{
//
//    if (oper == "update")
//    {
//        var checkFlag1 = 0;
//        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
//        {
//            if (WaitForBeFileGrid.getSelNo(i)) 
//            {
//                checkFlag1 = WaitForBeFileGrid.getSelNo();
//                break;
//            }
//        }
//        if(checkFlag1)
//        {
//			      var sOpenWinURL = "LXISTradeManualToMain.jsp";
//			      var sParameters = "DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
//            +"&CSNM=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 4)
//            +"&Date=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7)
//            +"&DataState=S00&Oper=ViewAndUpdate";
//            OpenWindowNew(sOpenWinURL + "?" + sParameters, "查看可疑信息", "left");
//        }
//        else 
//        {
//            alert("请先选择一条您要查看交易信息！");
//        }
//    }
//}

function checkBoxNext(parm1)
{
		
	var dealno="";
	var datastate="S00";
	var CSNM="";	
	var tDate="";
	var Oper="ViewAndUpdate";
	dealno=fm.all( parm1 ).all('WaitForBeFileGrid1').value;
	CSNM  =fm.all( parm1 ).all('WaitForBeFileGrid4').value;
	tDate =fm.all( parm1 ).all('WaitForBeFileGrid9').value;

   var sOpenWinURL = "./LXISTradeManualToMain.jsp";
   var sParameters = "DealNo=" + dealno;
   sParameters+="&DataState="+datastate;
   sParameters+="&CSNM="+CSNM;
   sParameters+="&Date="+tDate;
   sParameters+="&Oper=ViewAndUpdate";
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");
}

//初始化大额交易明细信息
function afterQuery(tDealNo)
{
    var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
    turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid,0,1);
}
function checkdataall(oper)
{
	if("passreport"==oper)
	{

	}

}
function SubmitWaitForBeFileGrid(str)
{
	if("affirm"==str)//审批通过,上报
	{
	  for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
	  {
	      if (WaitForBeFileGrid.getChkNo(i)) 
	      {
	      	var stationflag = WaitForBeFileGrid.getRowColData(parseInt(i),15);
	      	if("09"==stationflag)
	      	{
	      		alert("同意上报时不能选中下级要放弃上报的数据!");
	      		return false;
	      	}
	      }
	  }
		if(!beforeSubmit1())
		{
			return false;
		}
	}

	if("keep"==str)//同意放弃上报
	{
	  for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
	  {
	      if (WaitForBeFileGrid.getChkNo(i)) 
	      {
	      	var stationflag = WaitForBeFileGrid.getRowColData(parseInt(i),15);
	      	if("Z21"==stationflag)
	      	{
	      		alert("放弃上报时不能选中下级要上报的数据!");
	      		return false;
	      	}
	      }
	  }
	  if(!beforeSubmit())
		{
		    return false;
		}
	}
	if("back"==str)//打回
	{
    var treason = fm.all("reason").value;
    if(!treason)
    {
    	alert("请输入审批不通过原因！");
    	return false;
    }
	}
	//return;
	//if(str=="keep")
	//{
	//     if(!beforeSubmit())
	//	  {
	//	      return false;
	//	  }
	//     
	//}
	//else
	//	if(!beforeSubmit1()){return false;}

  var checkFlag1 = 0;
  var dealno;
  var datastate="S00";
//  for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
//  {
//      if (WaitForBeFileGrid.getSelNo(i)) 
//      {
//          checkFlag1 = WaitForBeFileGrid.getSelNo();
//          break;
//      }
//  }
//  if(checkFlag1)
//  {
//			dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1);
//			datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6);
//  }
//  else 
//  {
//      alert("请先选择一条大额交易信息！");
//  }
  var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./LXISAuditReferSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();
}
function afterQuery(str)
{
    queryWaitForBeFileGrid();
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
//证件校验  cgh
function idnocheck(tidtype,tidno,tKind,tDealno)
{
		//alert(tidtype+"="+tidno+"="+tKind+"="+tDealno);
//		if (tidtype == "11")
//		{
//			if (!checkIdCard(tidno)) 
//			{
//				alert("交易号："+tDealno+"里"+tKind+":身份证号应为15位或18位规定格式，请修改");
//				return false;
//			}
//		}
		if (tidtype == "21")
		{
			if (tidno.length!=9||tidno=="@N") 
			{
				alert("交易号："+tDealno+"里"+tKind+":客户组织机构代码对应9位,证件号不能为@N，请修改");
				return false;
			}
		}
		if (tidtype == "19")
		{
			var myDate = new Date();
			if (tidno.substring(0,3)!="户口本"||tidno.substr(3)=="********"||BASEisNotDate(tidno.substr(3))||(myDate.getFullYear()-parseInt(tidno.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(tidno.substring(3,7),10))<0) //
			{
				alert("交易号："+tDealno+"里"+tKind+":只允许小于18岁的人选择“户口本＋出生年月日”代替证件号码，请修改");
				return false;
			}
		}
		if (tidtype == "14")
		{
			if (tidno.length<=5||tidno.indexOf(".") != -1) 
			{
				alert("交易号："+tDealno+"里"+tKind+"：外国公民护照证件号码必须大于5位，且不能有“.”，请修改");
				return false;
			}
		}
		return true;
}