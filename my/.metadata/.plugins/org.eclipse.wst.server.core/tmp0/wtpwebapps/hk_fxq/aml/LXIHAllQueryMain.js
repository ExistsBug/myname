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
     TasksGrid. clearData("TasksGrid");

}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid()
{
    var QuerySQL = "select a.DEALNo, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.CTNT, " 
                 +        "a.DataState,"
                 +        "(select codename from ldcode where codetype='amldatastate' and code=a.DataState), "
                 +        "(select codename from ldcode where codetype='amlidtype' and code=a.CITP), "
                 +        "a.CTID, "
                 +        "a.HTDT, "
                 +        "a.MakeDate, "
                // +        "a.DealDate, "
                // +        "a.DealTime, "
                 +        "a.Operator, "
                 +        "a.MANAGECOM, "
                 +        "(select name from ldcom where comcode=a.MANAGECOM) "
                 +    "from LXIHTradeMain a "
                 +    "where 1 = 1 "
//                 +     "and managecom like '" + comcode + "%25' "
       if( fm.ManageCom.value == null || fm.ManageCom.value == "" )
       {
       QuerySQL= QuerySQL +"and managecom like '" + comcode + "%25' ";      
       }
       QuerySQL= QuerySQL + "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno"                
                 +      getWherePart("b.CRCD", "CRCD")
                 +     " ) "
       QuerySQL= QuerySQL + "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno"
                 +      getWherePart("b.DataSource", "DataSource") 
                 +     " ) "
                 +      getWherePart("a.CSNM", "CSNM")
                 +      getWherePart("a.CTNM", "CTNM")
                 +      getWherePart("a.DataState", "DataState")
                 +      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.HTDT", "StartDate", ">=")
                 +      getWherePart("a.HTDT", "EndDate", "<=")
                 +   "order by a.htdt desc ,a.csnm desc ";;
    
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
        TasksGrid. clearData("TasksGrid");
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
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
       var QuerySQL = "select DEALNo, "
                 +        "CRCD, "
                 +        "(select codename from ldcode where codetype='amlbigstamp' and code=CRCD), "
                 +        "TSDT, "
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "          
                 +        "TSTM, "
                 +        "(select codename from ldcode where codetype='amloutpaytype' and code=TSDR) "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    dealno
                 +   "' ";

    try
    {
        turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
        turnPageTasksGrid.queryModal(QuerySQL, TasksGrid);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
 
  }
		else {
	    	alert("����ѡ��һ��������ϸ��Ϣ��"); 
		}	
}
/*============================================================================*/


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
{ var cDealNo;
	var dealno;
	var CustomerNo;
	var cDate;
	
	if (oper == "update"){
				var checkFlag1 = 0;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag1 = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
		if(checkFlag1){
				dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1); 	
				CustomerNo=WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 2); 	
				cDate=WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7); 
				}else {
	    	alert("����ѡ��һ��������Ϣ��"); 
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
			var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 4); //��ϸ����

		}
		else {
	    	alert("����ѡ��һ��������ϸ��Ϣ��"); 
	    	return false;
		}
		if(cDealNo==dealno){
	    var sOpenWinURL = "LXIHAffirmMainToDetail.jsp";
      var sParameters = "Oper=" + oper 
	     		+ "&CustomerNo=" + CustomerNo + "&Date=" + cDate + "&DealNo=" + cDealNo
	     		+ "&CRCD=" + cCRCD + "&TSDT=" + cTSDT;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴�����ϸ��Ϣ", "left"); 
//					window.open("./LXIHAffirmMainToDetail.jsp?Oper=" + oper 
//	     		+ "&CustomerNo=" + CustomerNo + "&Date=" + cDate + "&DealNo=" + cDealNo
//	     		+ "&CRCD=" + cCRCD + "&TSDT=" + cTSDT);
	     		}else {
	    	alert("�����ױ������ϸ��һ�£�������ѡ��"); 
	    	return false;
		}
	} 
}
//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo){
	//initTasksGrid();
   var QuerySQL = "select DEALNo, "
                 +        "CRCD, "
                 +        "(select codename from ldcode where codetype='amlbigstamp' and code=CRCD), "
                 +        "TSDT, "
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "          
                 +        "TSTM, "
                 +        "(select codename from ldcode where codetype='amloutpaytype' and code=TSDR) "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    tDealNo
                 +   "' ";
    
  turnPageTasksGrid = new turnPageClass();
  turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
	turnPageTasksGrid.queryModal(QuerySQL, TasksGrid);	
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
			  datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 8); 	
				}else {
	    	alert("����ѡ��һ��������Ϣ��"); 
		}
   var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");

  fm.action="./LXIHAffirmMainSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();
	
}

//����Excel
function GoToExcel()
{
   var StartDate = fm.all('StartDate').value;
   var EndDate = fm.all('EndDate').value;
   if(StartDate != "" && StartDate != null && EndDate != "" && EndDate != null) {
       if(StartDate > EndDate) {
          alert("���ã���ʼ���ڲ��ܴ��ڽ������ڣ�");
          return;
       }
   }
   var rowNum = WaitForBeFileGrid.mulLineCount;
   if(rowNum>0) {
      fm.action = "./CreateComQueryExcelSave.jsp?flag=2";
      fm.submit();
   }else {
      alert('û�����ݣ����Ȳ�ѯ');
   }
   
}
