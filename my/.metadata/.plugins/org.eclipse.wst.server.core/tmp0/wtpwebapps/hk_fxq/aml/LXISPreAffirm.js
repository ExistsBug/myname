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
		var tStr_RuleReason = "";
		if(fm.RuleReason.value != null&&fm.RuleReason.value != "")
		{
			if(fm.RuleReason.value=="ISX0x00x")
			{
				tStr_RuleReason = " and not exists (select 'X' from lxcalresult t where t.dealno=a.dealno ) ";
			}
			else
			{
				tStr_RuleReason = " and exists (select 'X' from lxcalresult t where t.dealno=a.dealno  "
						                + " and t.calcode='"+fm.RuleReason.value+"') ";
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
                 +        "(select b.Missionprop1 from LWMission b where a.DealNo = b.Missionprop3 and rownum = 1) Missionprop1 "
                 +    "from LXISTradeMain a  "
                 +    "where 1 = 1  "
                 +		"and exists (select 1 "
                 + 		"from  LWMission c "
                 + 		"where a.DealNo = c.Missionprop3 "
                 +		"and c.Missionprop1 >= '" + edom + "' "
                 +  " and c.activityid='0000009213' ) "
                 +     "and DataState ='S00' "
                 //+     "and managecom like '" + comcode + "%25' "
                 + tStr_RuleReason
                 + " and exists (select 'X' from lxistradedetail d where d.dealno=a.dealno "
                 +      getWherePart("TSTP", "TSTP") + " ) "
                 +      getWherePart("DealNo", "DealNo")
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
    var len = WaitForBeFileGrid.mulLineCount;
    var no=1;
    for(var i=0;i<len;i++)
    {
        if(WaitForBeFileGrid.getSelNo(i))
        {
            no=0;
            break;}
        }
    if(no==1)
    {
	    alert("δѡ�н���");
	    return false;
    }
   return true;
}

function GoToDetailInput(oper)
{

    if (oper == "update")
    {
        var checkFlag1 = 0;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
        {
            if (WaitForBeFileGrid.getSelNo(i)) 
            {
                checkFlag1 = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
        if(checkFlag1)
        {
			      var sOpenWinURL = "LXISTradeManualToMain.jsp";
			      var sParameters = "DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
            +"&CSNM=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 4)
            +"&Date=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7)
            +"&DataState=S00&Oper=ViewAndUpdate";
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴������Ϣ", "left");
        }
        else 
        {
            alert("����ѡ��һ����Ҫ�鿴������Ϣ��");
        }
    }
}
//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo)
{
    var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
    turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid,0,1);
}

function SubmitWaitForBeFileGrid(str)
{
  if(!beforeSubmit())
  {
      return false;
  }
  var checkFlag1 = 0;
  var dealno;
  var datastate;
  for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
  {
      if (WaitForBeFileGrid.getSelNo(i)) 
      {
          checkFlag1 = WaitForBeFileGrid.getSelNo();
          break;
      }
  }
  if(checkFlag1)
  {
			dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1);
			datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6);
  }
  else 
  {
      alert("����ѡ��һ��������Ϣ��");
  }
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./LXISPreAffirmSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();
}
function afterQuery(str)
{
    queryWaitForBeFileGrid();
}