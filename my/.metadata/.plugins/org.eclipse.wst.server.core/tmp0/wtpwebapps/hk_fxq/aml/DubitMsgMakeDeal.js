/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ��������ű�
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageAlreadyInFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

/*============================================================================*/

/**
 * �ύ�����, ���������ݷ��غ�ִ�еĲ���
 */
function afterSubmit(DealFlag, MsgContent, OtherInfo)
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
            try
            {
                queryWaitForBeFileGrid();
                queryAlreadyInFileGrid();
            }
            catch (ex) {}
        }
        else if (sOperation.trim() == "MakeAllInFileMsg")
        {
            try
            {
                if (OtherInfo != null && OtherInfo.trim() != "")
                {
                    document.getElementsByName("CorrectFileNo")[0].value = OtherInfo;
                }
                showCorrectFileInfo();
                //checkDownloadState();
                //queryAlreadyInFileGrid();
                queryWaitForBeFileGrid();
                top.opener.queryFileMsgGrid();
            }
            catch (ex) {}
        }
    }
    fm.btnMakeAllFileMsg.disabled=false;
}

/*============================================================================*/

/**
 * ��鵱ǰ�����ļ��Ƿ��������
 */
function checkDownloadState()
{
    var sDataType, sCorrectFileNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sCorrectFileNo = document.getElementsByName("CorrectFileNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL, arrResult;
    QuerySQL = "select 'X' "
             +   "from LXReportDataFile a "
             +  "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "02" && sCorrectFileNo != null && sCorrectFileNo.trim() != "")
    {
        QuerySQL += "and a.FileNo = '" + sCorrectFileNo + "' "
    }
    else
    {
        QuerySQL += getWherePart("a.FileNo", "FileNo")
    }
    QuerySQL +=   "and a.DealState = '01' "
             +    "and a.FileName is not null";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ǰ�����ļ�����״̬�����쳣�� ");
        return;
    }
    if (arrResult != null)
    {
        try
        {
            document.getElementsByName("btnAddToInFileMsg")[0].disabled = true;
            document.getElementsByName("btnDeleteInFileMsg")[0].disabled = true;
            document.getElementsByName("btnMakeAllFileMsg")[0].disabled = true;
            document.getElementsByName("btnDownloadFileMsg")[0].disabled = false;
            if (sDataType != null && sDataType.trim() == "02")
            {
                document.all("divCorrectFileTitle").style.display = "block";
                document.all("divCorrectFileInput").style.display = "block";
            }
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnAddToInFileMsg")[0].disabled = false;
            document.getElementsByName("btnDeleteInFileMsg")[0].disabled = false;
            document.getElementsByName("btnMakeAllFileMsg")[0].disabled = false;
            document.getElementsByName("btnMakeAllFileMsg")[0].disabled = false;
            document.getElementsByName("btnDownloadFileMsg")[0].disabled = true;
            if (sDataType != null && sDataType.trim() == "02")
            {
                document.all("divCorrectFileTitle").style.display = "none";
                document.all("divCorrectFileInput").style.display = "none";
            }
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * ��ͬ�������ͷֱ���
 */
function checkDataTypeState()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}

    if (sDataType != null && sDataType.trim() == "02")
    {
        try
        {
            document.all("divNotCorrectLayer").style.display = "block";
            document.getElementsByName("btnDeleteInFileMsg")[0].disabled = true;
            queryAlreadyInFileGrid();
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.all("divNotCorrectLayer").style.display = "block";
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.DealNo, "
                 +        "a.STCR, "
                 +        "a.SDGR, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.CITP, "
                 +        "a.CTID, "
                 +        "a.DealDate, "   //cgh  ������ʱ�䡱���������͡�����Ա�����ɡ����׽�����������Ϊ�����������ֹ�˾��ơ���
                 +        "(select sum(CRAT) from LXISTradeDetail where DealNo=a.DealNo ), "
                 +        "a.SSDS, "
                 +        "(select c.name from ldcom c where c.comcode=a.ManageCom)  "
                 +    "from LXISTradeMain a "
                 +   " where 1 = 1 and a.DataState not in ('D04', 'C04', 'A04', 'R04', 'I04', "
                 + " 'D03', 'C03', 'A03', 'R03', 'I03') ";//�������޸�״̬������ȷ��ִ�Ĳ�����ʾ
                 //+      getWherePart("a.ManageCom", "ManageCom","like");
    if (sDataType != null && sDataType.trim() == "01")
    {
        QuerySQL +=    "and a.DataState = 'S01' "
                 +      getWherePart("a.DealDate", "StartDate1", ">=")
                 +      getWherePart("a.DealDate", "EndDate1", "<=")
                 + " and not exists (select 'X' from LXReportDetail b where b.DealNo = a.DealNo) ";
    }
    else if (sDataType.trim() == "02")
    {
        QuerySQL = " select a.DealNo,a.STCR,a.SDGR,a.CSNM,a.CTNM,a.CITP,a.CTID,a.DealDate,a.DealTime, "
                 + " (case when a.FileName is not null then '��' else '��' end),a.Operator from LXISTradeMain a "
                 + " where a.datastate = 'C01' and exists (select 'X' from lxreportdetail b "
                 + " where reporttype = '02' and b.dealno = a.dealno and exists (select 'X' from lxreportdatafile c "
                 + " where b.fileno = c.fileno and c.dealstate in ( '03','06'))) "  //��ϴǮ�����޸� modify by huangchong
                 + " and not exists (select 'X' from LXReportDetail b where b.DealNo = a.DealNo "
                 + " and exists (select 'X' from LXReportDataFile where FileNo = b.FileNo "
                 + " and ReportType = '02' and DealState in ('00', '01', '02') and DataType = '02')) ";
    }
    else if (sDataType.trim() == "03")
    {
        QuerySQL += " and a.DataState = 'S01' "
                 + " and not exists (select 'X' from LXReportDetail b where b.DealNo = a.DealNo) "
                 +  getWherePart("a.DealDate", "StartDate1", "<");
    }
    else if (sDataType.trim() == "04")
    {
       QuerySQL += " and exists (select 'X' from lxreportdetail b where a.dealno = b.dealno "
                 + " and exists (select 'X' from LXReportDatafile c where c.fileno = b.fileno "
                 + " and c.reporttype = '02' and c.datatype in ('01','03') and c.dealstate in ('04','05'))) "
                 + " and not exists (select 'X' from LXReportDetail b where b.DealNo = a.DealNo "
                 + " and exists (select 'X' from LXReportDataFile where FileNo = b.FileNo "
                 + " and ReportType = '02' and DealState in ('00', '01', '02', '06') and DataType = '04')) ";
    }
        QuerySQL +=     getWherePart("a.DealNo", "DealNo1")
                 +      getWherePart("a.CSNM", "CustomerNo1")
                 +      getWherePart("a.CTNM", "CustomerName1")
                 +      getWherePart("a.CTID", "IDNo1");
//                 +     " and not exists (select 'X' from LXReportDetail b where b.DealNo = a.DealNo "
//                 +     " and exists (select 'X' from LXReportDataFile where FileNo = b.FileNo "
//                 +     " and ReportType = '02' and DealState in ('00', '01', '02', '06') and DataType = '" + sDataType.trim() + "')) ";
                 //+   "order by a.DealDate asc, a.DealTime asc";  //cgh �������������򣬼�����ڵ�������

    //alert(QuerySQL);
    if(sDataType.trim() == "01")
    {
    	QuerySQL= QuerySQL + "order by a.DealDate asc, a.DealTime asc";
    }
    if(sDataType.trim() == "03"||sDataType.trim() == "04")
    {
    	QuerySQL= QuerySQL + "order by a.DealDate desc, a.DealTime desc";
    }
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

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryAlreadyInFileGrid()
{
    var sDataType, sCorrectFileNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sCorrectFileNo = document.getElementsByName("CorrectFileNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.DealNo, "
                 +        "a.STCR, "
                 +        "a.SDGR, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.CITP, "
                 +        "a.CTID, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "(case when a.FileName is not null then '��' else '��' end), "
                 +        "a.Operator "
                 +    "from LXISTradeMain a "
                 +   "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "01")
    {
        QuerySQL +=    "and a.DataState = 'S01' ";    //����
    }
    else if (sDataType.trim() == "02")
    {
        //QuerySQL +=    "and a.DataState = 'C01' ";    //����
    }
    else if (sDataType.trim() == "03")
    {
        QuerySQL +=    "and a.DataState in ('A01', 'S01') ";    //����
    }
        QuerySQL +=     getWherePart("a.DealNo", "DealNo2")
                 +      getWherePart("a.DealNo", "DealNo2")
                 +      getWherePart("a.CSNM", "CustomerNo2")
                 +      getWherePart("a.CTNM", "CustomerName2")
                 +      getWherePart("a.CTID", "IDNo2")
                 +      getWherePart("a.DealDate", "StartDate2", ">=")
                 +      getWherePart("a.DealDate", "EndDate2", "<=")
                 +     "and exists "
                 +         "(select 'X' "
                 +            "from LXReportDetail "
                 +           "where 1 = 1 "
                 +             "and DealNo = a.DealNo ";
    if (sCorrectFileNo != null && sCorrectFileNo.trim() != "")
    {
        QuerySQL +=     getWherePart("FileNo", "CorrectFileNo");
    }
    else
    {
        QuerySQL +=     getWherePart("FileNo", "FileNo");
    }
        QuerySQL +=        ") "
                 +   "order by a.DealDate desc, a.DealTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageAlreadyInFileGrid.pageDivName = "divTurnPageAlreadyInFileGrid";
        turnPageAlreadyInFileGrid.queryModal(QuerySQL, AlreadyInFileGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}


function checkBoxNext(parm1)
{
		
	var dealno="";
	var datastate="S01";
	var CSNM="";	
	var tDate="";
	var Oper="ViewAndUpdate";
	dealno=fm.all( parm1 ).all('WaitForBeFileGrid1').value;
	CSNM  =fm.all( parm1 ).all('WaitForBeFileGrid4').value;
	tDate =fm.all( parm1 ).all('WaitForBeFileGrid8').value;
		
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
		
  var tSQL = " select datastate from lxistrademain where dealno='"+dealno+"' ";
  var arr  = easyExecSql(tSQL);
  if(arr!=null&&arr!="")
  {
  	datastate=arr[0][0];
  }


   var sOpenWinURL = "./LXISTradeManualToMain.jsp";
   var sParameters = "DealNo=" + dealno;
   sParameters+="&DataState="+datastate;
   sParameters+="&CSNM="+CSNM;
   sParameters+="&Date="+tDate;
   sParameters+="&Oper=ViewAndUpdate";
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
}


/*============================================================================*/

/**
 * ��ӿ�ѡ�ϱ����ĵ����ϱ�����
 */
function addToInFileMsg()
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
    else
    {
        var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "AddToInFileMsg";
        }
        catch (ex) {}
        document.forms(0).action = "DubitMsgMakeDealSave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * ɾ����ѡ�ϱ����ĵ���ѡ�ϱ�����
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
            document.getElementsByName("Operation")[0].value = "DeleteInFileMsg";
        }
        catch (ex) {}
        document.forms(0).action = "DubitMsgMakeDealSave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * �����ϱ�������Ϣ
 */
function makeAllInFileMsg()
{
	  fm.btnMakeAllFileMsg.disabled=true;
    var nCheckCount = 0;
    try
    {
        nCheckCount = WaitForBeFileGrid.getChkCount();
    }
    catch (ex) {}
    if (nCheckCount == null || nCheckCount <= 0)
    {
        alert("���Ȳ�ѯ��ѡ����Ҫ��ӵĽ��ף� ");
        fm.btnMakeAllFileMsg.disabled=false;
        return;
    }
    
    for(var i=0;i<WaitForBeFileGrid.mulLineCount;i++)
    {
	    if(WaitForBeFileGrid.getChkNo(i))
	    {
		    var tDealNo=WaitForBeFileGrid.getRowColData(i,1);
			  //�����������֤����
		    if(!CheckCardNoIS(tDealNo))
		    {
		    	fm.btnMakeAllFileMsg.disabled=false;
		    	return false;
		    }
		  }
	  }

    var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
    try
    {
        document.getElementsByName("Operation")[0].value = "MakeAllInFileMsg";
    }
    catch (ex) {}
    document.forms(0).action = "DubitMsgMakeDealSave.jsp";
    document.forms(0).submit();
    
}

/*============================================================================*/

/**
 * �������ɵ��ϱ�������Ϣ
 */
function downAllInFileMsg()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}

    var QuerySQL, arrResult;
    QuerySQL = "select FileName "
             +   "from LXReportDataFile a "
             +  "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL += getWherePart("a.FileNo", "CorrectFileNo")
    }
    else
    {
        QuerySQL += getWherePart("a.FileNo", "FileNo")
    }
    QuerySQL +=   "and a.DealState = '01'";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ǰ�����ļ�����״̬�����쳣�� ");
        return;
    }
    if (arrResult == null || trim(arrResult[0]) == "")
    {
        alert("��ѯ��ȡ��ǰ�����ļ����ص�ַʧ�ܣ� ");
        return;
    }
    else
    {
        var sXMLFileName = arrResult[0];
        window.open("send/" + sXMLFileName);
    }
}


/*============================================================================*/

/**
 * ��ѡ�ϱ����׷����ϱ�  by cgh
 */
 function delToInFileMsg()
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
    else
    {
        var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "keep";
        }
        catch (ex) {}
        document.forms(0).action = "LXISAffirmKeepSave.jsp";
        document.forms(0).submit();
    }
}


/*============================================================================*/

/**
 * ����Ǿ����İ�, ��ʾ�µĲ�
 */
function showCorrectFileInfo()
{
    try
    {
        document.all("divCorrectFileTitle").style.display = "block";
        document.all("divCorrectFileInput").style.display = "block";
    }
    catch (ex) {}
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


function keepDeal()
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
    document.getElementsByName("Operation")[0].value = "MakeAllInFileMsg";
	  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	  fm.action="./LXISAffirmKeepSave.jsp?oper=keep";
	  fm.submit();
}


//<!-- JavaScript Document END -->
