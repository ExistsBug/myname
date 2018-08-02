//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageErrorGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

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
     ErrorGrid. clearData("ErrorGrid");

}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid()
{
	if(fm.MngCom.value==null||fm.MngCom.value=="")
	{
		alert("��ѡ����������");
		return;
	}
	
    var QuerySQL = "select a.DEALNo, "
                 +        "a.STCR, "
                 +        "a.SDGR, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.DataState, "
                 +        "a.CTID, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "a.Operator, "
                 +        "a.DataState, "
                 + "(select name from ldcom where comcode = a.Managecom), "
                 + "(select case w.missionprop2 when '0' then '�ֹ�˾�Ѵ���' else '�ֹ�˾δ����' end from lwmission w where w.missionprop3=a.DEALNo) "
                 +    "from LXISTradeMain a "
                 +    "where 1 = 1 "
                 +     "and DataState in('D04','C04','A04','R04','I04') "
                 //+     "and managecom like '" + comcode + "%25' "
                 +      getWherePart("a.DealNo", "DealNo")
                 +      getWherePart("a.CSNM", "CustomerNo")
                 +      getWherePart("a.CTNM", "CustomerName")
                 +      getWherePart("a.CTID", "IDNo")
                 +      getWherePart("a.DealDate", "StartDate", ">=")
                 +      getWherePart("a.DealDate", "EndDate", "<=")
                 + getWherePart("Managecom", "MngCom", "like");
   if(fm.MngCom.value.length>2)
   {
   	 //QuerySQL = QuerySQL + " and a.dealno in (select w.missionprop3 from lwmission w where w.missionprop2='1' ) ";
   }                 
   if(fm.MngCom.value.length==2)
   {
   	 //QuerySQL = QuerySQL + " and a.dealno in (select w.missionprop3 from lwmission w where (w.missionprop2 is null or w.missionprop2='0')) ";
   }
    QuerySQL +=   "order by a.DealDate desc, a.DealNo desc";
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
        ErrorGrid. clearData("ErrorGrid");
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ���ɽ�����Ϣ�����쳣�� ");
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
            +"&Date=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 8)
            +"&DataState="+WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 11)+"&Oper=ViewAndUpdate" ;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "�����޸���Ϣ", "left");
//      window.open(sOpenWinURL + "?" + sParameters);
				}else {
	    	alert("����ѡ��һ�����ɽ�����Ϣ��"); 
		}

	} 
}
//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo){
	//initTasksGrid();
	var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
	turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid,0,1);	
}

function SubmitWaitForBeFileGrid()
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
	    	alert("����ѡ��һ�����ɽ�����Ϣ��"); 
		}
 			datastate = "Submit";
		  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
		  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
		  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
		  fm.action="./LXISModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
		  fm.submit();	
//�˴������зֹ�˾���̴���
		  //	if(trim(fm.MngCom.value).length==0)
//	{
//		  datastate = "Submit";
//		  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
//		  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
//		  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
//		  fm.action="./LXISModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
//		  fm.submit();		
//	}	
//	else
//	{
//		  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
//		  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
//		  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
//		  fm.action="./LXISModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
//		  fm.submit();		
//	}	
	
}
function queryTasksGrid()
{  
		var checkFlag = 0;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
    if (checkFlag) { 
   var	dealno = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1); 	
                          
        var ErrorSQL="select a.backfileno,"
        +"a.backinfono,"
        +"a.dealno,"
        +"a.state,"
        +"b.errlocation,"
        +"b.errcause"
        +" from lxreporttotrade a , LXReceiptDetail b where 1=1 and  b.backfileno=a.backfileno  and b.backinfono=a.backinfono "
        +"and a.state='00' and a.dealno='"
        +    dealno
        +   "' ";

        try
    {
        turnPageErrorGrid.pageDivName = "divTurnPageErrorGrid";
        turnPageErrorGrid.queryModal(ErrorSQL, ErrorGrid);
    }
    catch (ex)
    {
        alert("���棺��ѯ������Ϣ�����쳣�� ");
    }
    
  }
		else {
	    	alert("����ѡ��һ�����ɽ�����ϸ��Ϣ��"); 
		}	
}
function afterQuery(str){
	queryWaitForBeFileGrid();
}


function SendOutFNC()
{
		if(trim(fm.MngCom.value).length>2)
		{
			fm.SendOut.value.disabled=true;
			}
		var dealno;
		var datastate;
	  var i = WaitForBeFileGrid.getSelNo();
		if(i!='0')
		{
				dealno = WaitForBeFileGrid.getRowColData(i-1, 1);
				datastate="SendOut";
		}
		else 
		{
	    	alert("����ѡ��һ�����ɽ�����Ϣ��"); 
	    	return false;
		}
		
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./LXISModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
  fm.submit();
}

function initSendOut()
{
		if(trim(fm.MngCom.value).length>2)
		{
			fm.SendOut.disabled=true;
		}
}