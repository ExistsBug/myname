/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPage1 = new turnPageClass(); 
var turnPage2 = new turnPageClass(); 
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageAlreadyInFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var packagePath;

/*============================================================================*/

/**
 * �ύ�����, ���������ݷ��غ�ִ�еĲ���
 */
function afterSubmit(DealFlag, MsgContent)
{
	checkCanDownloadFileMsg();
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            queryAlreadyInFileGrid();
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            queryAlreadyInFileGrid();
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            queryAlreadyInFileGrid();
            break;
    }
    //���ļ������⴦��
    if (DealFlag == "succ" || DealFlag == "success")
    {
        var sOperation;
        try
        {
            sOperation = document.getElementsByName("Operation")[0].value;
        }
        catch (ex) {}
        if (sOperation != null && (sOperation.trim() == "AddToInFileMsg" || sOperation.trim() == "DeleteInFileMsg"))
        {
        		// add by jinsh ����ֱ�ӵ��������ļ���
            //try
            //{
            //    queryWaitForBeFileGrid();
            //    queryAlreadyInFileGrid();
            //}
            //catch (ex) {}
        }
        else if (sOperation.trim() == "MakeAllInFileMsg")
        {
            //try
            //{
            //    checkCanDownloadFileMsg();
            //    top.opener.queryFileMsgGrid();
            //}
            //catch (ex) {}
        }
    }
    fm.makefile.disabled=false;
}

/*============================================================================*/

/**
 * ��鵱ǰ�����ļ��Ƿ��������
 */
function checkCanDownloadFileMsg()
{
    //var QuerySQL, arrResult;
    //QuerySQL = "select filepath,filename "
    //         +   "from LXReportDataFile a "
    //         +  "where 1 = 1 "
    //         +     getWherePart("a.FileNo", "FileNo")
    //         +    "and a.DealState = '01'";
    ////alert(QuerySQL);
    //try
    //{
    //    arrResult = easyExecSql(QuerySQL, 1, 0);
    //}
    //catch (ex)
    //{
    //    alert("���棺��ѯ��ǰ�����ļ�����״̬�����쳣�� ");
    //    return;
    //}
    //if (arrResult != null)
    //{
    //    try
    //    {
    //        document.getElementsByName("btnDownloadFileMsg")[0].disabled = false;
    //        document.getElementsByName("makeAction")[0].disabled = true;
    //        
    //        var strQueryResult = easyQueryVer3(QuerySQL, 1, 0, 1);
    //        var arrDataSet = decodeEasyQueryResult(strQueryResult);
    //        packagePath="send/"+arrDataSet[0][1];
    //    }
    //    catch (ex) {}
    //}
    //else
    //{
    //    try
    //    {
    //        document.getElementsByName("btnDownloadFileMsg")[0].disabled = true;
    //        document.getElementsByName("makeAction")[0].disabled = false;
    //    }
    //    catch (ex) {}
    //}
}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid()
{
    if(!verifyForm('fm'))
	{
		return false;
	} 
	var strSQL = "";
	var tradeDataState=fm.tradeDataState.value;

	strSQL+="select DealNo,CSNM,CTNM,CTID,HTDT,DataState from LXIHTradeMain where 1=1 ";
	strSQL+="and not exists (select 'X' from LXReportDetail where LXIHTradeMain.dealno=LXReportDetail.dealno and exists (select 'X' from LXReportDataFile where 1 = 1 and FileNo = LXReportDetail.FileNo and ReportType = '01' and DealState in ('00', '01', '02', '06'))) and datastate in "+tradeDataState;
	strSQL+=getWherePart('CSNM','CSNM1');
	strSQL+=getWherePart('CTNM','CTNM1');
	strSQL+=getWherePart('CTID','CTID1');
	strSQL+=getWherePart('ManageCom','ManageCom','like');
	if(fm.dataType.value=="01")
	{
		//strSQL+="and not exists (select 'X' from LXReportDetail where LXIHTradeMain.dealno=LXReportDetail.dealno and exists (select 'X' from LXReportDataFile where 1 = 1 and FileNo = LXReportDetail.FileNo and ReportType = '01' and DealState in ('00', '01', '02', '06'))) and datastate in "+tradeDataState;
		strSQL+=getWherePart('HTDT','addedDate','>');
	}
	if(fm.dataType.value=="03")
	{
		strSQL+=getWherePart('HTDT','addedDate','<=');
	}
	strSQL+=getWherePart('HTDT','HTDT1','>=');
	strSQL+=getWherePart('HTDT','HTDT2','<=');
	strSQL+=getWherePart('DealNo','DealNo1');
	if(fm.dataType.value=="01")
	{
		strSQL+="order by DealDate asc,DealTime asc";
	}
	if(fm.dataType.value=="03")
	{
		strSQL+="order by DealDate desc,DealTime desc";
	}	
	if(fm.dataType.value!="03"&&fm.dataType.value!="01")
	{
		strSQL+=" order by DealNo";
	}	
//	strSQL+=" order by DealNo";
	turnPage1.queryModal(strSQL,WaitForBeFileGrid,0,1);

    //�ж��Ƿ��ѯ�ɹ�
    if (!turnPage1.strQueryResult) {
    alert("û��������������Ϣ��");
    return false;
  }
    if (!turnPage1.queryModal) {
          alert("no data");
          WaitForBeFileGrid.clearData();
      return false;
    }
}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryAlreadyInFileGrid()
{
  //      if(!verifyForm('fm'))
	//{
	//	return false;
	//} 
	//var strSQL = "";
	//strSQL+="select DealNo,CSNM,CTNM,CTID,HTDT,DataState from LXIHTradeMain where 1=1 ";
	//strSQL+="and exists (select 'X' from LXReportDetail where LXReportDetail.dealno=LXIHTradeMain.dealno and LXReportDetail.fileno='"+fm.FileNo.value+"')";
	//strSQL+=getWherePart('CSNM','CSNM2');
	//strSQL+=getWherePart('CTNM','CTNM2');
	//strSQL+=getWherePart('CTID','CTID2');
	//strSQL+=getWherePart('HTDT','HTDT3','>=');
	//strSQL+=getWherePart('HTDT','HTDT4','<=');
	//strSQL+=getWherePart('DealNo','DealNo2');
	//strSQL+=" order by DealNo";
	//turnPage2.queryModal(strSQL,AlreadyInFileGrid,0,1);

    //�ж��Ƿ��ѯ�ɹ�
//    if (!turnPage2.strQueryResult) {
//    alert("û��������������Ϣ��");
//    return false;
//  }
//    if (!turnPage2.queryModal) {
//          alert("no data");
//          AlreadyInFileGrid.clearData();
//      return false;
//    }
}

/*============================================================================*/

/**
 * ��ӿ�ѡ�ϱ����ĵ����ϱ�����
 */
function addToInFileMsg()
{
	  fm.makefile.disabled=true;
    var nCheckCount = 0;
    try
    {
        nCheckCount = WaitForBeFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("���Ȳ�ѯ��ѡ����Ҫ��ӵĽ��ף� ");
        fm.makefile.disabled=false;
        return;
    }
    //ɾ��ԭ���ǣ�����˵���Ĳ��ˣ�ֻ�ܵȴ����ִ������ʱ������÷ֹ�˾��
//    for(var i=0;i<WaitForBeFileGrid.mulLineCount;i++)
//    {
//	    if(WaitForBeFileGrid.getChkNo(i))
//	    {
//		    var tDealNo=WaitForBeFileGrid.getRowColData(i,1);
//			  //�����������֤����
//		    if(!CheckCardNoIH(tDealNo))
//		    {
//		    	return false;
//		    }
//		  }
//	  }
	  
    var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
    try
    {
        fm.type.value = "AddToInFileMsg";
    }
    catch (ex) {}
    document.forms(0).action = "JlargeTradeToXmlSave.jsp";
    document.forms(0).submit();

    WaitForBeFileGrid.clearData();
    queryAlreadyInFileGrid();
}

/*============================================================================*/

/**
 * ɾ����ѡ�ϱ����ĵ����ϱ�����
 */
function deleteInFileMsg()
{
    var nCheckCount = 0;
    try
    {
        nCheckCount = AlreadyInFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("���Ȳ�ѯ��ѡ����Ҫ�����Ľ��ף� ");
        return;
    }
    else
    {
        var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            fm.type.value = "DeleteInFileMsg";
        }
        catch (ex) {}
        document.forms(0).action = "largeTradeToXmlSave.jsp";
        document.forms(0).submit();
    }
    AlreadyInFileGrid.clearData();
}

/*============================================================================*/

/**
 * �����ϱ�������Ϣ
 */
function makeAllInFileMsg()
{
    var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
    try
    {
        fm.type.value = "MakeAllInFileMsg";
    }
    catch (ex) {}
    document.forms(0).action = "largeTradeToXmlSave.jsp";
    document.forms(0).submit();
}

/*============================================================================*/

/**
 * �������ɵ��ϱ�������Ϣ
 */
function downAllInFileMsg()
{
    try
    {
        document.getElementsByName("Operation")[0].value = "DownAllInFileMsg";
    }
    catch (ex) {}
    window.open(packagePath);

}

/*============================================================================*/

/**
 * ����������
 */
function returnParent()
{
    try
    {
        top.close();
        top.opener.focus();
    }
    catch (ex) {}
}

/*============================================================================*/

/*============================================================================*/
/**
 *LXBigTransManualMain.jsp?CSNM=10861&Date=&DataState= &DealNo=00000000000000000483
 *�û����в鿴���޸Ĵ���
 *����1 CSNM������2 Date  ����3 DealNo ����4 DataState 
 **/
//function GoToViewAndUpdate(str)
//{
//    var nCheckCount = 0;
//    try
//    {
//        nCheckCount = WaitForBeFileGrid.getChkCount();
//    }
//    catch (ex) {}
//    if (nCheckCount == null || nCheckCount <= 0)
//    {
//        alert("��ѡ����Ҫ�鿴�Ľ��ף� ");
//        return;
//    }
//    
//	  var i;
//	  var isOneMore=false;
//	  var obj=document.all['WaitForBeFileGridChk'];
//	  if(typeof(obj.length)!='undefined')
//	  {
//	      for(i=0;i<obj.length;i++)
//	      {
//	        isOneMore=obj[i].checked;
//	        if(isOneMore)
//	        {
//	          break;
//	        }
//	      }
//	  }
//
//     if (isOneMore) 
//     {
//         var  DealNo     = WaitForBeFileGrid.getRowColData(i, 1);
//         var  CSNM       = WaitForBeFileGrid.getRowColData(i, 2);
//         var  DataState  = WaitForBeFileGrid.getRowColData(i, 6);
//         if(DealNo.length==0)
//         {
//		       	alert("���Ȳ�ѯ!");
//		       	retrun;
//         }
//         
//         var strUrl = "./LXBigTransManualToMain.jsp";
//         var strPara="?"+"Oper="+str+"&CSNM="+CSNM+"&DataState="+DataState+"&DealNo="+DealNo;
//                    
//        OpenWindowNew(strUrl + strPara, "����", "left");
//     }
//     else
//     {
//        alert("����ѡ��һ��������Ϣ��");
//     }
//}

function checkBoxNext(parm1)
{		
		var dealno="";
		var datastate="S00";
		var CSNM="";	
		var tDate="";
		var Oper="ViewAndUpdate";
		dealno=fm.all( parm1 ).all('WaitForBeFileGrid1').value;
		CSNM  =fm.all( parm1 ).all('WaitForBeFileGrid2').value;
		tDate =fm.all( parm1 ).all('WaitForBeFileGrid5').value;
		if(dealno==null||dealno=="")
		{
			alert("���Ȳ�ѯ�ٽ��в鿴�޸ģ�");
			return false;
		}
		if(CSNM==null||CSNM=="")
		{
			alert("���Ȳ�ѯ�ٲ鿴�޸ģ�");
			return false;
		}
	  var sOpenWinURL = "./LXBigTransManualToMain.jsp";
	  var sParameters = "DealNo=" + dealno;
	  sParameters+="&DataState="+datastate;
	  sParameters+="&CSNM="+CSNM;
	  sParameters+="&Oper=ViewAndUpdate";
	  OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
}

//<!-- JavaScript Document END -->
