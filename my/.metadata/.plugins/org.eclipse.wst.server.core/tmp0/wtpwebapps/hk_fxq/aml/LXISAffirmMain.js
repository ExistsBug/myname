/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : � <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ��������ű�
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var sFeatures = "toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no";
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

/*============================================================================*/

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
						                + " and t.calcode='ISX0"+fm.RuleReason.value+"') ";
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
                 +        "a.CTID, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "a.Operator, "
                 + " (case (select 1 from lxcalresult t where t.dealno=a.dealno) when 1 then (select m.remark from lxcalmode m where m.crcd=a.stcr and m.no='0' and m.validity='1' and m.calcode in (select t.calcode from lxcalresult t where t.dealno = a.dealno)) else '����¼������' end) , "
                 +        "a.DataState,"
                 +        "(select codename from ldcode where code=a.DataState and codetype='amldatastate'), "
                 +        "(select b.Missionprop1 from LWMission b where a.DealNo = b.Missionprop3 and rownum = 1) Missionprop1 "
                 +    "from LXISTradeMain a  "
                 +    "where 1 = 1  "
                // +		"and exists (select 1 "
                // + 		"from  LWMission c "
                // + 		"where a.DealNo = c.Missionprop3 "
                // +		"and c.Missionprop1 >= '" + edom + "' "
                 //+    " and c.activityid='0000009201' ) "
                 +     "and DataState in ('S00','S01','S04','S06','S09') "
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

//    WaitForBeFileGrid.delCheckFalseLine();
    var len = WaitForBeFileGrid.mulLineCount;
    var no=1;
    for(var i=0;i<len;i++){
        if(WaitForBeFileGrid.getSelNo(i)){
            no=0;
            break;}
        }
    if(no==1){
    alert("δѡ�н���");
    return false;
    }

   return true;
}
/**
 * ���������¼
 */
function onClickRadioBoxGrid()
{
        var checkFlag = 0;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
        {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
       if (checkFlag) 
       {
         var  dealState = WaitForBeFileGrid.getRowColData(checkFlag - 1, 11);
         //alert(dealState);
         if(dealState != null && dealState == 'S09'){//�����ͣ��������ͣ�
        	 document.getElementsByName("affirm")[0].disabled =  false;
        	 document.getElementsByName("keep")[0].disabled =  true;
         }else if(dealState == 'S06'){ //������
        	 document.getElementsByName("affirm")[0].disabled =  true;
        	 document.getElementsByName("keep")[0].disabled =  true;
         }else if(dealState == 'S00'){//��ȷ��
        	 document.getElementsByName("affirm")[0].disabled =  false;
        	 document.getElementsByName("keep")[0].disabled =  false;
         }
         else if(dealState == 'S01'){//��ȷ��
        	 document.getElementsByName("affirm")[0].disabled =  true;
        	 document.getElementsByName("keep")[0].disabled =  true;
         }
         else if(dealState == 'S04'){//�Ѳ���
        	 document.getElementsByName("affirm")[0].disabled =  false;
        	 document.getElementsByName("keep")[0].disabled =  false;
         }
         
       }
       else {
            alert("����ѡ����Ҫ�鿴�Ľ�����Ϣ��");
       }
}
function GoToDetailInput(oper)
{

    if (oper == "update"){
                var checkFlag1 = 0;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag1 = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
        if(checkFlag1){
      var sOpenWinURL = "LXISTradeManualToMain.jsp";
      var sParameters = "DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
            +"&CSNM=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 4)
            +"&Date=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7)
            +"&DataState=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 11)
            +"&Oper=ViewAndUpdate";
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴������Ϣ", "left");

//            window.open("./LXISTradeManualToDetail.jsp?DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
//            +"&DataState="+WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6)+"&oper=query");
                }else {
            alert("����ѡ��һ����Ҫ�鿴������Ϣ��");
        }

    }
}
//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo){
    //initTasksGrid();
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
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag1 = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
        if(checkFlag1){
                dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1);
              datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 11);
                }else {
            alert("����ѡ��һ��������Ϣ��");
        }
   
  if(str=="keep")
  {
  	window.open("./LXISAffirmCancelMain.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str,"",sFeatures);
  }else if(str=="affirm")
  {
  	window.open("./LXISAffirmReportMain.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str,"",sFeatures);
  }
  else{
	  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	  fm.action="./LXISAffirmMainSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
	  fm.submit();
  }

}
function afterQuery(str){
    queryWaitForBeFileGrid();
}