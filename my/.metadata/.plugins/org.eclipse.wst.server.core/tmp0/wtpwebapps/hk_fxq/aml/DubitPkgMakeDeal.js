/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-11
 * @direction: ���ɽ��ױ��İ��������ű�
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                              //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                        //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBePackageGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����İ���ѯ�����ҳ
var turnPageAlreadyInPackageGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����İ���ѯ�����ҳ

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
    //���������⴦��
    if (DealFlag == "succ" || DealFlag == "success")
    {
        var sOperation;
        try
        {
            sOperation = document.getElementsByName("Operation")[0].value;
        }
        catch (ex) {}
        if (sOperation != null && (sOperation.trim() == "AddToInPackageFile" || sOperation.trim() == "DeleteInPackageFile"))
        {
            try
            {
                queryWaitForBePackageGrid();
                queryAlreadyInPackageGrid();
            }
            catch (ex) {}
        }
        else if (sOperation.trim() == "MakeAllInPackageFile")
        {
            try
            {
                if (OtherInfo != null && OtherInfo.trim() != "")
                {
                    document.getElementsByName("ResendPackageNo")[0].value = OtherInfo;
                }
                showResendPackageInfo();
                checkDownloadState();
                queryAlreadyInPackageGrid();
                top.opener.queryFilePkgGrid();
            }
            catch (ex) {}
        }
    }
}

/*============================================================================*/

/**
 * ��鵱ǰ���İ��Ƿ��������
 */
function checkDownloadState()
{
    var sDataType, sResendPackageNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sResendPackageNo = document.getElementsByName("ResendPackageNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL, arrResult;
    QuerySQL = "select 'X' "
             +   "from LXReportDataPacket a "
             +  "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "02" && sResendPackageNo != null && sResendPackageNo.trim() != "")
    {
        QuerySQL += "and a.PackageNo = '" + sResendPackageNo + "' "
    }
    else
    {
        QuerySQL += getWherePart("a.PackageNo", "PackageNo")
    }
    QuerySQL +=   "and a.DealState = '02' "
             +    "and a.PackageName is not null";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ǰ���İ�����״̬�����쳣�� ");
        return;
    }
    if (arrResult != null)
    {
        try
        {
            document.getElementsByName("btnAddToInPackageFile")[0].disabled = true;
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = true;
            document.getElementsByName("btnMakePackageFile")[0].disabled = true;
            document.getElementsByName("btnDownloadFilePkg")[0].disabled = false;
            if (sDataType != null && sDataType.trim() == "02")
            {
                document.all("divResendPackageTitle").style.display = "block";
                document.all("divResendPackageInput").style.display = "block";
            }
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnAddToInPackageFile")[0].disabled = false;
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = false;
            document.getElementsByName("btnMakePackageFile")[0].disabled = false;
            document.getElementsByName("btnMakePackageFile")[0].disabled = false;
            document.getElementsByName("btnDownloadFilePkg")[0].disabled = true;
            if (sDataType != null && sDataType.trim() == "02")
            {
                document.all("divResendPackageTitle").style.display = "none";
                document.all("divResendPackageInput").style.display = "none";
            }
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * ��ͬ���İ����ͷֱ���
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
            document.all("divNotResendLayer").style.display = "none";
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = true;
            queryAlreadyInPackageGrid();
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.all("divNotResendLayer").style.display = "block";
            document.getElementsByName("btnDeleteInPackageFile")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBePackageGrid()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    var QuerySQL = "select a.FileNo, "
                 +        "a.FileName, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "(case when a.AttaName is not null then '��' else '��' end), "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1  "
                // +      getWherePart("a.ManageCom", "ManageCom", "like");
    if (sDataType != null && sDataType.trim() == "01")
    {
        QuerySQL +=    "and a.DataType = '01' and a.dealstate not in ('04','05') ";    //����
    }
    else if (sDataType.trim() == "02")
    {
        QuerySQL +=    "and 1 = 2 ";    //�ط�(����ʾ��ѡ����)
    }
    else if (sDataType.trim() == "03")
    {
    		<!--add by jinsh ��ϴǮ�ӿ����� ����Ĳ�ѯ���������˱��-->
        QuerySQL +=    " and a.DataType in ('02', '03','04','05') ";    //����and not exists (select 'X' from LXReportDetail z where z.DealNo is not null and z.FileNo=a.FileNo and a.DataType = '02')
    }
        QuerySQL +=    " and a.ReportType = '02' "
//                 +     "and ((a.PackageNo is null and a.DealState = '01') or "
//                 +          "(a.PackageNo is not null and a.DealState in ('01','04', '05'))) "
                 + "    and ((a.packageno is null) "
                 + " or (a.packageno is not null and exists (select 'X' from lxreportdatapacket p "
                 + " where p.packageno = a.packageno and p.packagename is null and a.packageno!='"+fm.PackageNo.value+"'))) " 
                 +     "and not (a.DealState in ('04', '05') and a.DataType = '03') and a.filename is not null "
                 +      getWherePart("a.FileNo", "FileNo1")
                 +      getWherePart("a.MakeDate", "StartDate1", ">=")
                 +      getWherePart("a.MakeDate", "EndDate1", "<=")
                 +   "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageWaitForBePackageGrid.pageDivName = "divTurnPageWaitForBePackageGrid";
        turnPageWaitForBePackageGrid.queryModal(QuerySQL, WaitForBePackageGrid, 0, 1);
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
function queryAlreadyInPackageGrid()
{
    var sResendPackageNo;
    try
    {
        sResendPackageNo = document.getElementsByName("ResendPackageNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.FileNo, "
                 +        "a.FileName, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "(case when a.AttaName is not null then '��' else '��' end), "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '02' ";
    if (sResendPackageNo != null && sResendPackageNo.trim() != "")
    {
        QuerySQL +=     getWherePart("a.PackageNo", "ResendPackageNo");
    }
    else
    {
        QuerySQL +=     getWherePart("a.PackageNo", "PackageNo");
    }
        QuerySQL +=     getWherePart("a.FileNo", "FileNo2")
                 +      getWherePart("a.MakeDate", "StartDate2", ">=")
                 +      getWherePart("a.MakeDate", "EndDate2", "<=");
        if (fm.DataType.value == "02")
        {//modify by huangchong  
        	QuerySQL += " and a.DealState = '04'";
        	//end 
        }                 
        QuerySQL +=   " order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageAlreadyInPackageGrid.pageDivName = "divTurnPageAlreadyInPackageGrid";
        turnPageAlreadyInPackageGrid.queryModal(QuerySQL, AlreadyInPackageGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}

/*============================================================================*/

/**
 * ��ӿ�ѡ�ϱ����ĵ����ϱ�����
 */
function addToInPackageFile()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        alert("�����ط����İ�����������±��ģ� ");
        return;
    }
    else
    {
        var nCheckCount = 0;
        try
        {
            nCheckCount = WaitForBePackageGrid.getChkCount();
        }
        catch (ex) {}
        if (nCheckCount == null || nCheckCount <= 0)
        {
            alert("���Ȳ�ѯ��ѡ����Ҫ��ӵı��ģ� ");
            return;
        }
        else
        {
            var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
            var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
            showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            try
            {
                document.getElementsByName("Operation")[0].value = "AddToInPackageFile";
            }
            catch (ex) {}
            document.forms(0).action = "DubitPkgMakeDealSave.jsp";
            document.forms(0).submit();
        }
    }
}

/*============================================================================*/

/**
 * ������ѡ�ϱ����ĵ����ϱ�����
 */
function deleteInPackageFile()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        //�ط����İ���������
        alert("�����ط����İ���������ԭ���ģ� ");
        return;
    }
    else
    {
        var nCheckCount = 0;
        try
        {
            nCheckCount = AlreadyInPackageGrid.getChkCount();
        }
        catch (ex) {}
        if (nCheckCount == null || nCheckCount <= 0)
        {
            alert("���Ȳ�ѯ��ѡ����Ҫ�����ı��ģ� ");
            return;
        }
        else
        {
            var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
            var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
            showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            try
            {
                document.getElementsByName("Operation")[0].value = "DeleteInPackageFile";
            }
            catch (ex) {}
            document.forms(0).action = "DubitPkgMakeDealSave.jsp";
            document.forms(0).submit();
        }
    }
}

/*============================================================================*/

/**
 * �����ϱ�������Ϣ
 */
function makeAllInPackageFile()
{
    var QuerySQL, arrResult;
    QuerySQL = "select count(*) "
             +   "from LXReportDataFile a "
             +  "where 1 = 1 "
             +     getWherePart("a.PackageNo", "PackageNo")
             +    "and a.ReportType = '02'";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("���棺��ѯ�ϱ���ϸ���ݱ������쳣�� ");
        return;
    }
    if (arrResult == null || arrResult[0] == "0")
    {
        alert("���������Ҫ���ɱ��İ��ı��ģ� ");
        return;
    }
    else
    {
        var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "MakeAllInPackageFile";
        }
        catch (ex) {}
        document.forms(0).action = "DubitPkgMakeDealSave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * �������ɵ��ϱ�������Ϣ
 */
function downAllInPackageFile()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}

    var QuerySQL, arrResult;
    QuerySQL = "select PackageName "
             +   "from LXReportDataPacket a "
             +  "where 1 = 1 ";
    if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL += getWherePart("a.PackageNo", "ResendPackageNo")
    }
    else
    {
        QuerySQL += getWherePart("a.PackageNo", "PackageNo")
    }
    QuerySQL +=   "and a.DealState = '02'";
    //alert(QuerySQL);
    try
    {
        arrResult = easyExecSql(QuerySQL, 1, 0);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ǰ���İ�����״̬�����쳣�� ");
        return;
    }
    if (arrResult == null || trim(arrResult[0]) == "")
    {
        alert("��ѯ��ȡ��ǰ���İ����ص�ַʧ�ܣ� ");
        return;
    }
    else
    {
        var sZIPFileName = arrResult[0];
        window.open("send/" + sZIPFileName);
    }
}

/*============================================================================*/

/**
 * ������ط����ݰ�, ��ʾ�µĲ�
 */
function showResendPackageInfo()
{
    try
    {
        document.all("divResendPackageTitle").style.display = "block";
        document.all("divResendPackageInput").style.display = "block";
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


//<!-- JavaScript Document END -->
