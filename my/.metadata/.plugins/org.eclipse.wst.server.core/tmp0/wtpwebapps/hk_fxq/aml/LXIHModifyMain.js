
var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageTasksGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageErrorGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ


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
     ErrorGrid. clearData("ErrorGrid");

}
function afterSubmit1(DealFlag, MsgContent)
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

}
/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid()
{
//	if(fm.MngCom.value==null||fm.MngCom.value=="")
//	{
//		alert("��ѡ����������");
//		return;
//	}
	
    var QuerySQL = "select DEALNo, "
                 +        "CSNM, "
                 +        "CTNM, "
                 +        "CITP, "
                 +        "CTID, "
                 +        "CTNT, "          
                 +        "HTDT, "
                 +        "DataState, "
                 +        "DealDate, "
                 +        "DealTime, "
                 +        "Operator, "
                 +        "DataState, "
                 + "(select codename from ldcode where codetype = 'amlidtype' and code = LXIHTradeMain.CITP), "
                 + "(select codename from ldcode where codetype = 'amlcountry' and code = LXIHTradeMain.CTNT), "
                 + "(select name from ldcom where comcode = LXIHTradeMain.managecom), "
                 + "(select case w.missionprop2 when '0' then '�ֹ�˾�Ѵ���' else '�ֹ�˾δ����' end from lwmission w where w.missionprop3=DEALNo) "
                 +    "from LXIHTradeMain  "
                 +    "where 1 = 1 "
                 //add by jinsh ��ϴǮ�ӿ�����,����������������˸���
                 +     "and DataState in('D04','C04','A04','R04','I04') "
                 //+     "and managecom like '" + comcode + "%25' "
                 +      getWherePart("DealNo", "DealNo")
                 +      getWherePart("CSNM", "CustomerNo")
                 +      getWherePart("CTNM", "CustomerName")
                 +      getWherePart("CTID", "IDNo")
                 +      getWherePart("DealDate", "StartDate", ">=")
                 +      getWherePart("DealDate", "EndDate", "<=")
                 + getWherePart("Managecom", "MngCom", "like");
                 
								 if(fm.MngCom.value.length>2)
								 {
								 	 QuerySQL = QuerySQL + " and dealno in (select w.missionprop3 from lwmission w where w.missionprop2='1' ) ";
								 }                 
								 if(fm.MngCom.value.length==2)
								 {
								 	 QuerySQL = QuerySQL + " and dealno in (select w.missionprop3 from lwmission w where (w.missionprop2 is null or w.missionprop2='0')) ";
								 }
								  QuerySQL +=  "order by DealDate desc, DealNo desc";
                 
                 
	            try
               {
                 turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
                 turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
                 TasksGrid. clearData("TasksGrid");
                 ErrorGrid. clearData("ErrorGrid");
                 fm.all("DealNo1").value = ""; 	
		             fm.all("CSNM").value = ""; 
		             fm.all("CTNM").value = ""; 
		             fm.all("CITP").value = ""; 
		             fm.all("CITPName").value = ""; 
		             fm.all("CTID").value = ""; 	
		             fm.all("CTNT").value =  ""; 
		             fm.all("CTNTName").value =  ""; 
		             fm.all("HTDT").value = ""; 
		             fm.all("DataState").value = ""; 
		             fm.all("DealDate").value = ""; 
		             fm.all("DealTime").value = ""; 
		             fm.all("Operator").value = ""; 
              }
              catch (ex)
              {
                  alert("���棺��ѯ������Ϣ�����쳣�� ");
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
                 +        "TSDT, "
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
	        turnPageTasksGrid.queryModal(QuerySQL, TasksGrid,0,1);
	    }
    	catch (ex)
	    {
	        alert("���棺��ѯ������Ϣ�����쳣�� ");
	    }
	                        
        var ErrorSQL="select a.backfileno, "
	        	+ "a.backinfono, "
	        	+ "a.dealno, "
	        	+ "a.state, "
	        	+ "b.errlocation, "
	        	+ "b.errcause "
	        	+ "from lxreporttotrade a, LXReceiptDetail b "
	        	+ "where 1=1 and b.backfileno=a.backfileno and b.backinfono=a.backinfono "
	        	+ "and a.state='00' and a.dealno='"
        		+ dealno + "' ";

        try
	    {
	        turnPageErrorGrid.pageDivName = "divTurnPageErrorGrid";
	        turnPageErrorGrid.queryModal(ErrorSQL, ErrorGrid);
	    }
	    catch (ex)
	    {
	        alert("���棺��ѯ��ִ��Ϣ�����쳣�� ");
	    }
      var QuerySQL1 = "select DEALNo, "
                 +        "CSNM, "
                 +        "CTNM, "
                 +        "CITP, "
                 +        "CTID, "
                 +        "CTNT, "          
                 +        "HTDT, "
                 +        "DataState, "
                 +        "DealDate, "
                 +        "DealTime, "
                 +        "Operator "
                 +    "from LXIHTradeMain  "
                 +    "where 1 = 1 and dealno = '"
                 +     dealno
                 +    "' ";
        var strQueryResult  = easyQueryVer3(QuerySQL1, 1, 0, 1);
		   	//�ж��Ƿ��ѯ�ɹ�
		  	if (!strQueryResult) {
				   alert("�����˲����ڣ�");
				   return false;
			  }
			  else{
				//��ѯ�ɹ������ַ��������ض�ά����								
				    var arrSelected = decodeEasyQueryResult(strQueryResult);
				    fm.all("DealNo1").value = arrSelected[0][0];
				    fm.all("CSNM").value = arrSelected[0][1];
				    fm.all("CTNM").value = arrSelected[0][2];
				    fm.all("CITP").value = arrSelected[0][3];
				    fm.all("CTID").value = arrSelected[0][4];
				    fm.all("CTNT").value =  arrSelected[0][5];
				    fm.all("HTDT").value = arrSelected[0][6];
				    fm.all("DataState").value = arrSelected[0][7];
				    fm.all("DealDate").value = arrSelected[0][8];
				    fm.all("DealTime").value = arrSelected[0][9];
				    fm.all("Operator").value = arrSelected[0][10];
       }
	     if(fm.all("DataState").value=="C04" || fm.all("DataState").value=="D04"){
			     var element = document.getElementsByName("UPDATE")[0];
			         element.disabled = true;
			     var element = document.getElementsByName("insert")[0];
			         element.disabled = true;
			     var element = document.getElementsByName("delete")[0];
			         element.disabled = true;
			     var element = document.getElementsByName("CSNM")[0];
			         element.readOnly = true;
	     }else{
	     	   var element = document.getElementsByName("UPDATE")[0];
		           element.disabled = false;	
		       var element = document.getElementsByName("insert")[0];
			         element.disabled = false;
			     var element = document.getElementsByName("delete")[0];
			         element.disabled = false;
			     var element = document.getElementsByName("CSNM")[0];
			         element.readOnly = false;
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
	var cDealNo, dealno, CustomerNo, cDate, cDealNo, cCRCD, cTSDT ;
	if (oper == "update" || oper == "delete" ){
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
			cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
			cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //��������
			cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //��ϸ����

		}
		else {
	    	alert("����ѡ��һ��������ϸ��Ϣ��"); 
	    	return false;
		}
		if(cDealNo==dealno){
			var sOpenWinURL = "LXBigTransManualToDetail.jsp";
      		var sParameters = "Oper=" + oper 
	     			+ "&CustomerNo=" + CustomerNo 
	     			+ "&Date=" + cDate 
	     			+ "&DealNo=" + cDealNo
	     			+ "&CRCD=" + cCRCD 
	     			+ "&TSDT=" + cTSDT;
      		OpenWindowNew(sOpenWinURL + "?" + sParameters, "�޸Ĵ����Ϣ", "left"); 
		}else {
	    	alert("�����ױ������ϸ��һ�£�������ѡ��"); 
	    	return false;
		}
	}
	if (oper == "insert"){
		var checkFlag = 0;
		for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
	    	if (WaitForBeFileGrid.getSelNo(i)) { 
	      		checkFlag = WaitForBeFileGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			cDealno = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1); 	
			CustomerNo=WaitForBeFileGrid.getRowColData(checkFlag - 1, 2); 	
			cDate=WaitForBeFileGrid.getRowColData(checkFlag - 1, 7); 
			var sOpenWinURL = "LXBigTransManualToDetail.jsp";
			var sParameters = "Oper=" + oper 
		     		+ "&CustomerNo=" + CustomerNo  
		     		+ "&Date=" + cDate 
		     		+ "&DealNo=" + cDealno
		     		+ "&CRCD=" + "" + "&TSDT=" + "" ;
        	OpenWindowNew(sOpenWinURL + "?" + sParameters, "���������Ϣ", "left"); 
		}else {
	    	alert("����ѡ��һ��������Ϣ��"); 
	    	return false;
		} 
	}
}

//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo)
{
	var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
	turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid);	
}

function SubmitWaitForBeFileGrid()
{
	if(!beforeSubmit())return false;
	var checkFlag1 = 0;
	var dealno, datastate;
	for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
		if (WaitForBeFileGrid.getSelNo(i)) { 
			checkFlag1 = WaitForBeFileGrid.getSelNo();
			break;
		}
	}
	if(checkFlag1){
		dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1); 	
		datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 12); 	
	}else {
		alert("����ѡ��һ��������Ϣ��"); 
		return false;
	}
	
		if(trim(fm.MngCom.value).length>2)
		{
			  datastate = "Submit";
		   	var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
		  	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
		  	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
		  	fm.action="./LXIHModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
		  	fm.submit();
		}
		else
		{
		   	var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
		  	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
		  	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
		  	fm.action="./LXIHModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
		  	fm.submit();
		}
}
	
function submitMain(oper)
{
	if (!verifyInput2())          
	    return;
	if(!chkNotZh(fm.CSNM.value)){
		alert("�ͻ����в������к��֣�");
		fm.CSNM.focus();
		return false;
		}
				//���֤У��
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
		if (CTID.length!=9) {
			alert("�ͻ���֯���������Ӧ9λ");
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}
	//������verify
  	var CTNT = document.getElementById("CTNT").value;
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlcountry' "
		+ " and code = '" + CTNT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//�ж��Ƿ��ѯ�ɹ�
	if (!strQueryResult) {
		alert("�����˹��������ڣ�");
		document.getElementById("CTNT").value = "";
		document.getElementById("CTNT").focus();		
		return false;
	}	
	var i = 0;
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px"); 
	fm.action="./LXIHTradeSave.jsp?operate="+oper;  
	fm.submit(); //�ύ

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
  	fm.action="./LXIHModifyMainSave.jsp?dealno="+dealno+"&datastate="+datastate;
  	fm.submit();
}

function initSendOut()
{
		if(trim(fm.MngCom.value).length>2)
		{
			fm.SendOut.disabled=true;
		}
}