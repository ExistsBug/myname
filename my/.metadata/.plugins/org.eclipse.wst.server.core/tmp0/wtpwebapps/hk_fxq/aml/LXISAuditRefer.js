//<!-- JavaScript Document BGN -->

/*============================================================================*/
var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
/*============================================================================*/

/**
 * �ύ�����, ���������ݷ��غ�ִ�еĲ���
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
 * ��ѯ��ѡ�ϱ�������Ϣ
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
		{//����Լ
			tStr_TSTP = " and a.dealno in  (select t.dealno from lxcalresult t where t.calcode in ('ISX01004','ISX01006','ISX04006','ISX04007','ISX08002')) ";
		}
		else if(fm.TSTP.value=="02")
		{//�˱�
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode ='ISX01005') ";
		}
		else if(fm.TSTP.value=="04")
		{//��ȫ
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode in ('ISX04001','ISX04002','ISX04003','ISX04004','ISX04005')) ";
		}
		else if(fm.TSTP.value=="05")
		{//����
			tStr_TSTP = " and a.dealno in (select t.dealno from lxcalresult t where t.calcode='ISX05002') ";
		}
		else if(fm.TSTP.value=="08")
		{//����
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
                 + " (case (select 1 from lxcalresult t where t.dealno=a.dealno) when 1 then (select m.remark from lxcalmode m where m.crcd=a.stcr and m.no='0' and m.validity='1' and m.calcode in (select t.calcode from lxcalresult t where t.dealno = a.dealno)) else '����¼������' end) , "
                 +        "(select b.Missionprop1 from LWMission b where a.DealNo = b.Missionprop3 and rownum = 1) Missionprop1, "
                 +        "case (select b.Missionprop12 from LWMission b where   a.DealNo = b.Missionprop3 and rownum = 1) when '09' then '�����ϱ�' else  '�ϱ�' end,  "
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
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}

//<!-- JavaScript Document END -->
//�ύǰ��У�顢����
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
        alert("���Ȳ�ѯ��ѡ����Ҫ��ӵĽ��ף� ");
        return;
    }		
    treason = fm.all("reason").value;
    if(!treason)
    {
    	alert("����������ϱ�ԭ��");
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
		    		alert(tDealNo+"����û�б�������Ϣ���벹������ϱ���");
			      return false; 
		    }
		    
		    var tSQL_InsNoAll = " select t.csnm from lxistradecont t where t.csnm not in "
		                      + " (select d.csnm from lxistradeinsured d where d.dealno=t.dealno) and t.dealno='"+tDealNo+"' ";
		    var tInsNoAll = easyExecSql(tSQL_InsNoAll);
		    if(tInsNoAll!=null)
		    {
		    		alert("��"+tDealNo+"�����£�"+tInsNoAll[0][0]+"��ͬ��û�б�������Ϣ���벹������ϱ���");
			      return false; 
		    }
		    
		    //--------------------------------------------<�ۼƵĽ��׽�� С��5000Ԫʱ����ʾ���ۼƽ��׽����ͣ��Ƿ�һ���ϱ�������ѡ������ʾ
		    var tSQL="select sum(CRAT) from LXISTradeDetail where 1=1 and DealNo='"+tDealNo+"'";
		    var tMoney=easyExecSql(tSQL);
		    if(tMoney<5000)
		    var flag = window.confirm("���ף�"+tDealNo+"���ۼƽ��׽����ͣ��Ƿ�һ���ϱ���"); 
		    if(flag==false) 
		    { 
		    alert("������ѡ��ȷ�ϣ�");
		    //WaitForBeFileGrid.checkBoxAllNot();
		    return false; 
		    }
		    
		    //---------------------------------------------->
		    //----------------------------------------------<�ڿ�����˽׶����Ӷ�֤���ŵ�У�飬�����Ϲ���Ĳ������ύ����һ����
		    var tInsuredNo=WaitForBeFileGrid.getRowColData(i,4);
		    //-------------------�ͻ���������֤����Ϣ
			    tSQL="select CITP,CTID,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var strQueryResult  = easyQueryVer3(tSQL, 1, 0, 1);
					//�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult) 
					{
						alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeMain");
						return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected = decodeEasyQueryResult(strQueryResult);
						if(!idnocheck(arrSelected[0][0],arrSelected[0][1],"�ͻ�",tDealNo))
			      {
			      	return false;
			      }
			      if(!idnocheck(arrSelected[0][2],arrSelected[0][3],"������",tDealNo))
			      {
			      	return false;
			      }
				  }
				  
				  //����֤�����ͺ�֤����û��У�飬������Ϊ@N��@I�������
			    var tS="select CTTP,CITP,CTID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var tGrpIDType = easyExecSql(tS);
          if(tGrpIDType!=null)
          {
					  var CTTP = tGrpIDType[0][0];//Ͷ��������
					  var CITP = tGrpIDType[0][1];//�ͻ����֤������
					  var CTID = tGrpIDType[0][2];//�ͻ����֤������
						if(CTTP!="07")
					  {//�Ǹ���
					  	if(CITP=="@N"||CITP=="@E"||CITP=="@I")
					  	{
					  		alert("����"+tDealNo+"������ͻ�֤�����Ͳ�����@N��@I��@E���棡");
					  		return false;
					  	}
					  	if(CTID=="@N"||CTID=="@E"||CTID=="@I")
					  	{
					  		alert("����"+tDealNo+"������ͻ�֤�����벻����@N��@I��@E���棡");
					  		return false;
					  	}
					  }          		
          } 
				  
			  //--------------------�ɶ�֤����Ϣ
			  tSQL="select  HITP, HDID from LXISTradeCusPartner where DealNo = '" + tDealNo + "' " ;
			  var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult1) 
					{
						//alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeCusPartner");
						//return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"�ɶ�",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
		    //---------------------������
		    tSQL="select  IITP,ISID from LXISTradeInsured where DealNo = '" + tDealNo + "' " ;
		    var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult1) 
					{
						alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeInsured");
						return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"������",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
	      //---------------------������
	      tSQL="select BITP,BNID from LXISTradeBnf where DealNo = '" + tDealNo + "'";
	      var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult1) 
					{
						//alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeBnf");
						//return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"������",tDealNo))
					      {
					      	return false;
					      }
			      }  
				  }
				  //�����������֤����
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
//	    alert("δѡ�н���");
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
        alert("���Ȳ�ѯ��ѡ����Ҫ��ӵĽ��ף� ");
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
		    		alert(tDealNo+"����û�б�������Ϣ���벹������ϱ���");
			      return false; 
		    }
		    
		    var tSQL_InsNoAll = " select t.csnm from lxistradecont t where t.csnm not in "
		                      + " (select d.csnm from lxistradeinsured d where d.dealno=t.dealno) and t.dealno='"+tDealNo+"' ";
		    var tInsNoAll = easyExecSql(tSQL_InsNoAll);
		    if(tInsNoAll!=null)
		    {
		    		alert("��"+tDealNo+"�����£�"+tInsNoAll[0][0]+"��ͬ��û�б�������Ϣ���벹������ϱ���");
			      return false; 
		    }
		    
		    //--------------------------------------------<�ۼƵĽ��׽�� С��5000Ԫʱ����ʾ���ۼƽ��׽����ͣ��Ƿ�һ���ϱ�������ѡ������ʾ
		    var tSQL="select sum(CRAT) from LXISTradeDetail where 1=1 and DealNo='"+tDealNo+"'";
		    var tMoney=easyExecSql(tSQL);
		    if(tMoney<5000)
		    var flag = window.confirm("���ף�"+tDealNo+"���ۼƽ��׽����ͣ��Ƿ�һ���ϱ���"); 
		    if(flag==false) 
		    { 
		    alert("������ѡ��ȷ�ϣ�");
		    //WaitForBeFileGrid.checkBoxAllNot();
		    return false; 
		    }
		    
		    //---------------------------------------------->
		    //----------------------------------------------<�ڿ�����˽׶����Ӷ�֤���ŵ�У�飬�����Ϲ���Ĳ������ύ����һ����
		    var tInsuredNo=WaitForBeFileGrid.getRowColData(i,4);
		    //-------------------�ͻ���������֤����Ϣ
			    tSQL="select CITP,CTID,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var strQueryResult  = easyQueryVer3(tSQL, 1, 0, 1);
					//�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult) 
					{
						alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeMain");
						return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected = decodeEasyQueryResult(strQueryResult);
						if(!idnocheck(arrSelected[0][0],arrSelected[0][1],"�ͻ�",tDealNo))
			      {
			      	return false;
			      }
			      if(!idnocheck(arrSelected[0][2],arrSelected[0][3],"������",tDealNo))
			      {
			      	return false;
			      }
				  }
				  
				  //����֤�����ͺ�֤����û��У�飬������Ϊ@N��@I�������
			    var tS="select CTTP,CITP,CTID from LXISTradeMain where dealno='"+tDealNo+"'";
			    var tGrpIDType = easyExecSql(tS);
          if(tGrpIDType!=null)
          {
					  var CTTP = tGrpIDType[0][0];//Ͷ��������
					  var CITP = tGrpIDType[0][1];//�ͻ����֤������
					  var CTID = tGrpIDType[0][2];//�ͻ����֤������
						if(CTTP!="07")
					  {//�Ǹ���
					  	if(CITP=="@N"||CITP=="@E"||CITP=="@I")
					  	{
					  		alert("����"+tDealNo+"������ͻ�֤�����Ͳ�����@N��@I��@E���棡");
					  		return false;
					  	}
					  	if(CTID=="@N"||CTID=="@E"||CTID=="@I")
					  	{
					  		alert("����"+tDealNo+"������ͻ�֤�����벻����@N��@I��@E���棡");
					  		return false;
					  	}
					  }          		
          } 
				  
			  //--------------------�ɶ�֤����Ϣ
			  tSQL="select  HITP, HDID from LXISTradeCusPartner where DealNo = '" + tDealNo + "' " ;
			  var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult1) 
					{
						//alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeCusPartner");
						//return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"�ɶ�",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
		    //---------------------������
		    tSQL="select  IITP,ISID from LXISTradeInsured where DealNo = '" + tDealNo + "' " ;
		    var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult1) 
					{
						alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeInsured");
						return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"������",tDealNo))
					      {
					      	return false;
					      }
			      }
			      
				  }
	      //---------------------������
	      tSQL="select BITP,BNID from LXISTradeBnf where DealNo = '" + tDealNo + "'";
	      var strQueryResult1  = easyQueryVer3(tSQL, 1, 0, 1);
		    //�ж��Ƿ��ѯ�ɹ�
					if (!strQueryResult1) 
					{
						//alert("��ѯ֤����Ϣʧ�ܣ���LXISTradeBnf");
						//return ;
					}
					else
					{
						//��ѯ�ɹ������ַ��������ض�ά����
						var arrSelected1 = decodeEasyQueryResult(strQueryResult1);
						for(var j=0;j<arrSelected1.length;j++)
						{
								if(!idnocheck(arrSelected1[j][0],arrSelected1[j][1],"������",tDealNo))
					      {
					      	return false;
					      }
			      }  
				  }
				  //�����������֤����
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
//	    alert("δѡ�н���");
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
//            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴������Ϣ", "left");
//        }
//        else 
//        {
//            alert("����ѡ��һ����Ҫ�鿴������Ϣ��");
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
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
}

//��ʼ��������ϸ��Ϣ
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
	if("affirm"==str)//����ͨ��,�ϱ�
	{
	  for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
	  {
	      if (WaitForBeFileGrid.getChkNo(i)) 
	      {
	      	var stationflag = WaitForBeFileGrid.getRowColData(parseInt(i),15);
	      	if("09"==stationflag)
	      	{
	      		alert("ͬ���ϱ�ʱ����ѡ���¼�Ҫ�����ϱ�������!");
	      		return false;
	      	}
	      }
	  }
		if(!beforeSubmit1())
		{
			return false;
		}
	}

	if("keep"==str)//ͬ������ϱ�
	{
	  for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
	  {
	      if (WaitForBeFileGrid.getChkNo(i)) 
	      {
	      	var stationflag = WaitForBeFileGrid.getRowColData(parseInt(i),15);
	      	if("Z21"==stationflag)
	      	{
	      		alert("�����ϱ�ʱ����ѡ���¼�Ҫ�ϱ�������!");
	      		return false;
	      	}
	      }
	  }
	  if(!beforeSubmit())
		{
		    return false;
		}
	}
	if("back"==str)//���
	{
    var treason = fm.all("reason").value;
    if(!treason)
    {
    	alert("������������ͨ��ԭ��");
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
//      alert("����ѡ��һ��������Ϣ��");
//  }
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./LXISAuditReferSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();
}
function afterQuery(str)
{
    queryWaitForBeFileGrid();
}

//�жϲ�Ϊ���ڷ���TRUE       cgh
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
//֤��У��  cgh
function idnocheck(tidtype,tidno,tKind,tDealno)
{
		//alert(tidtype+"="+tidno+"="+tKind+"="+tDealno);
//		if (tidtype == "11")
//		{
//			if (!checkIdCard(tidno)) 
//			{
//				alert("���׺ţ�"+tDealno+"��"+tKind+":���֤��ӦΪ15λ��18λ�涨��ʽ�����޸�");
//				return false;
//			}
//		}
		if (tidtype == "21")
		{
			if (tidno.length!=9||tidno=="@N") 
			{
				alert("���׺ţ�"+tDealno+"��"+tKind+":�ͻ���֯���������Ӧ9λ,֤���Ų���Ϊ@N�����޸�");
				return false;
			}
		}
		if (tidtype == "19")
		{
			var myDate = new Date();
			if (tidno.substring(0,3)!="���ڱ�"||tidno.substr(3)=="********"||BASEisNotDate(tidno.substr(3))||(myDate.getFullYear()-parseInt(tidno.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(tidno.substring(3,7),10))<0) //
			{
				alert("���׺ţ�"+tDealno+"��"+tKind+":ֻ����С��18�����ѡ�񡰻��ڱ������������ա�����֤�����룬���޸�");
				return false;
			}
		}
		if (tidtype == "14")
		{
			if (tidno.length<=5||tidno.indexOf(".") != -1) 
			{
				alert("���׺ţ�"+tDealno+"��"+tKind+"�����������֤������������5λ���Ҳ����С�.�������޸�");
				return false;
			}
		}
		return true;
}