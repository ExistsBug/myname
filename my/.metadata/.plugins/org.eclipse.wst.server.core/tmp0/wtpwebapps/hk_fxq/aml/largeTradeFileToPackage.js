/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ʢ <Zhangls@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ��������ű�
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
function afterSubmit(DealFlag, MsgContent,packagePath)
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
            sOperation = document.getElementsByName("type")[0].value;
        }
        catch (ex) {}
        if (sOperation != null && (sOperation.trim() == "AddToInFileMsg" || sOperation.trim() == "DeleteInFileMsg"))
        {
            try
            {
                queryWaitForBeFileGrid();
                queryAlreadyInFileGrid();
            }
            catch (ex) {alert("�ύ���ݷ��ز�ѯ�����쳣��");}
        }
        else if (sOperation.trim() == "MakeAllInFileMsg")
        {
            try
            {
                checkCanDownloadFileMsg();
                top.opener.queryFileMsgGrid();
            }
            catch (ex) {alert("�ύ���ݷ��ز�ѯ�����쳣��");}
        }
    }



}

/*============================================================================*/

/**
 * ��鵱ǰ�����ļ��Ƿ��������
 */
function checkCanDownloadFileMsg()
{
    var QuerySQL, arrResult;
    QuerySQL = "select packagePath,packageName "
             +   "from LXReportDataPacket a "
             +  "where 1 = 1 "
             +     getWherePart("a.PackageNo", "PackageNo")
             +    "and a.DealState = '02'";
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
            document.getElementsByName("btnDownloadFileMsg")[0].disabled = false;
            document.getElementsByName("makeAction")[0].disabled = true;
            document.getElementsByName("AddFile")[0].disabled = true;
            document.getElementsByName("DeleteFile")[0].disabled = true;
            var strQueryResult = easyQueryVer3(QuerySQL, 1, 0, 1);
            var arrDataSet = decodeEasyQueryResult(strQueryResult);
            packagePath="send/"+arrDataSet[0][1];

        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnDownloadFileMsg")[0].disabled = true;
            document.getElementsByName("makeAction")[0].disabled = false;
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
    var strSQL = "";
    strSQL+="select FileNo,ReportType,DataType,FileName,PackageNo,OrderNo,DealState,MakeDate from LXReportDataFile where 1=1 and reporttype='01' and dealstate in ('01', '04', '05') and packageno is null ";
    strSQL+=getWherePart('FileNo','fileNo1');
    if(fm.dataType.value=="01")
    {
        strSQL+=" and datatype='01' ";
    }
    else
        {
        	<!--add by jinsh ��ϴǮ�ӿ����� ��������������˸���-->
           strSQL+=" and datatype in ('02','03','04','05','06') ";
        }
    strSQL+=getWherePart('MakeDate','makeDate1','>=');
    strSQL+=getWherePart('MakeDate','makeDate2','<=');
    strSQL+=" order by makedate desc,maketime desc,fileno,reporttype,datatype";
    turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
    turnPageWaitForBeFileGrid.queryModal(strSQL, WaitForBeFileGrid, 0, 1);
}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryAlreadyInFileGrid()
{
    var strSQL = "";
    strSQL+="select FileNo,ReportType,DataType,FileName,PackageNo,OrderNo,DealState,MakeDate from LXReportDataFile where 1=1";
    strSQL+=getWherePart('FileNo','fileNo2');
    strSQL+=getWherePart('PackageNo','PackageNo');
    strSQL+=getWherePart('MakeDate','makeDate3','>=');
    strSQL+=getWherePart('MakeDate','makeDate4','<=');
    strSQL+=" order by makedate desc,maketime desc,fileno,reporttype,datatype";
    turnPageAlreadyInFileGrid.pageDivname = "divTurnPageAlreadyInFileGrid";
    turnPageAlreadyInFileGrid.queryModal(strSQL, AlreadyInFileGrid, 0, 1);
}

/*============================================================================*/

/**
 * ��ӿ�ѡ�ϱ����ĵ����ϱ�����
 */
function addToInFileMsg()
{
    if(fm.dataType.value=="02")
    {
        alert("�ط����ݰ�������������ļ�");
        return false;
    }
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
            fm.type.value = "AddToInFileMsg";
        }
        catch (ex) {}
        document.forms(0).action = "largeTradeToPackageSave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * ɾ����ѡ�ϱ����ĵ����ϱ�����
 */
function deleteInFileMsg()
{
    if(fm.dataType.value=="02")
    {
        alert("�ط����ݰ����������ļ�");
        return false;
    }
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
        document.forms(0).action = "largeTradeToPackageSave.jsp";
        document.forms(0).submit();
    }
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
    document.forms(0).action = "largeTradeToPackageSave.jsp";
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
    document.forms(0).action = packagePath;
    document.forms(0).submit();
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


//<!-- JavaScript Document END -->
