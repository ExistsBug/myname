//<!-- JavaScript Document BGN -->

/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageTasksGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

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
     queryWaitForBeFileGrid();
     TasksGrid.clearData();
}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid(usercode)
{
        var StrSql="SELECT PopEdom FROM LXUser where UserCode='"+usercode+"'";
        var edom=easyExecSql(StrSql);
        var QuerySQL = "select a.DEALNo, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.CITP, "
                 +        "a.CTID, "
                 +        "a.CTNT, "
                 +        "a.HTDT, "
                 +        "a.DataState, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "a.Operator, "
                 +        "a.datastate, "
                 +        "(select b.Missionprop1 from LWMission b where a.DealNo = b.Missionprop3 and rownum = 1) Missionprop1 "
                 +    "from LXIHTradeMain a "
                 +    "where 1 = 1 "
                 +		"and exists (select 1 "
                 + 		"from  LWMission c "
                 + 		"where a.DealNo = c.Missionprop3 "
                 +		"and c.Missionprop1 >= '" + edom + "' "
                 +    " and activityid='0000009102' ) "
                 +     "and a.DataState ='S00' "
                 +     "and managecom like '" + comcode + "%25' "
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
        TasksGrid.clearData();
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}

function queryTasksGrid()
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
         var  dealno = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1);
         var QuerySQL = "select DEALNo, "
                 +        "CRCD, "
                 +        "TSDT, "
                 +        "CRCD,"
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "
                 +        "TSTM "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    dealno
                 +   "' ";

        try
        {
            turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
            turnPageTasksGrid.queryModal(QuerySQL, TasksGrid, 0, 1);
        }
        catch (ex)
        {
            alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
        }
     }
     else {
            alert("����ѡ����Ҫ�鿴�Ľ�����Ϣ��");
          }
}
/*============================================================================*/
/**
 *LXBigTransManualMain.jsp?CSNM=10861&Date=&DataState= &DealNo=00000000000000000483
 *�û����в鿴���޸Ĵ���
 *����1 CSNM������2 Date  ����3 DealNo ����4 DataState 
 **/
function GoToViewAndUpdate(str)
{
     var checkFlag = 0;
     for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
     {
         if (WaitForBeFileGrid.getSelNo(i)) 
         {
            checkFlag = WaitForBeFileGrid.getSelNo();
            break;
         }
     }
     if (checkFlag) 
     {
         var  DealNo     = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1);
         var  CSNM       = WaitForBeFileGrid.getRowColData(checkFlag - 1, 2);
         var  DataState  = WaitForBeFileGrid.getRowColData(checkFlag - 1, 8);
         var strUrl = "./LXBigTransManualToMain.jsp";
         var strPara="?"+"Oper="+str+"&CSNM="+CSNM+"&DataState="+DataState+"&DealNo="+DealNo;
                    
        OpenWindowNew(strUrl + strPara, "����", "left");
     }
     else
     {
        alert("����ѡ��һ��������Ϣ��");
     }
}
//<!-- JavaScript Document END -->
//�ύǰ��У�顢����
function beforeSubmit()
{
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

function GoToDetailInput(oper)
{  
	  var cDealNo;
    var dealno;
    var CustomerNo;
    var cDate;

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
            dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1);
            CustomerNo=WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 2);
            cDate=WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7);
        }
        else 
        {
            alert("����ѡ����Ҫ�鿴�Ľ�����Ϣ��");
            return false;
        }
        var checkFlag = 0;
        for (var i=0; i<TasksGrid.mulLineCount; i++) {
            if (TasksGrid.getSelNo(i)) {
                checkFlag = TasksGrid.getSelNo();
                break;
            }
        }
        if (checkFlag) {
            var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
            var cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //��������
            var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //��ϸ����

        }
        else {
            alert("����ѡ����Ҫ�鿴�Ľ�����Ϣ��");
            return false;
        }
        if(cDealNo==dealno){
        var sOpenWinURL = "LXIHAffirmMainToDetail.jsp";
        var sParameters = "Oper=" + oper
                + "&CustomerNo=" + CustomerNo + "&Date=" + cDate + "&DealNo=" + cDealNo
                + "&CRCD=" + cCRCD + "&TSDT=" + cTSDT;
        OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴�����ϸ��ͬ��Ϣ", "left");
        }else {
            alert("�����ױ������ϸ��һ�£�������ѡ��");
            return false;
        }
    }
}
//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo)
{
    var strSQL = "select DealNo, CRCD, TSDT, CRCD, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
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
    if(checkFlag1)
    {
        dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1);
        datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 12);
    }
    else 
    {
        alert("����ѡ����Ҫ�鿴�Ľ�����Ϣ��");
    }        
  
   var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
   var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
   showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");

  fm.action="./LXIHPreAffirmSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();
}