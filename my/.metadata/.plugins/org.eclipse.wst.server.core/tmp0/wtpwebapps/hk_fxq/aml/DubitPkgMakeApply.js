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

var showInfo;                                     //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();               //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageFilePkgGrid = new turnPageClass();    //ȫ�ֱ���, �����뱨�Ĳ�ѯ�����ҳ

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
            //showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
    //���������⴦��
    if (DealFlag == "succ" || DealFlag == "success")
    {
        dealTheNewApply();
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
            document.getElementsByName("btnApplyANewPkg")[0].disabled = true;
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnApplyANewPkg")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * ����һ���µı��İ�
 */
function applyANewFilePkg()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        alert("�����ط����İ�������ֱ�����룡 ");
        return;
    }
    else
    {
        var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "ApplyPackageNo";
        }
        catch (ex) {}
        document.forms(0).action = "DubitMsgPkgApplySave.jsp";
        document.forms(0).submit();
    }
}

/*============================================================================*/

/**
 * ����ɹ�֮�����ϵ������洦�������
 */
function dealTheNewApply()
{
    try
    {
        queryFilePkgGrid();
        if (FilePkgGrid.mulLineCount > 0)
        {
            FilePkgGrid.selOneRow(1);
            dealTheFilePkg();
        }
    }
    catch (ex) {}
}

/*============================================================================*/

/**
 * ��ѯ�������ϱ����İ���Ϣ
 */
function queryFilePkgGrid()
{
    var sDataType, sFileNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sFileNo = document.getElementsByName("FileNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.PackageNo, "
                 +        "a.DataType, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "a.Operator "
                 +    "from LXReportDataPacket a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '02' ";
                 //+      getWherePart("a.ManageCom", "ManageCom", "like");
    if (sDataType != null && sDataType.trim() == "01")
    {
        QuerySQL +=    "and a.DataType = '01' "
                 +     "and a.DealState = '01' ";
    }
    else if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL +=    "and a.DataType in ('01', '02') "
                 +     "and a.DealState in ('04', '05') ";
    }
    else if (sDataType != null && sDataType.trim() == "03")
    {
        QuerySQL +=    "and a.DataType = '03' "
                 +     "and a.DealState = '01' ";
    }
        QuerySQL +=     getWherePart("a.PackageNo", "PackageNo")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=");
    if (sFileNo != null && sFileNo.trim() != "")
    {
        QuerySQL +=    "and a.PackageNo in "
                 +         "(select PackageNo "
                 +            "from LXReportDataFile "
                 +           "where 1 = 1 "
                 +             "and FileNo = '" + sFileNo + "') ";
    }
        QuerySQL +=  "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageFilePkgGrid.pageDivName = "divTurnPageFilePkgGrid";
        turnPageFilePkgGrid.queryModal(QuerySQL, FilePkgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ�������ϱ����İ������쳣�� ");
    }
}

/*============================================================================*/

/**
 * �����������ϱ�������Ϣ
 */
function dealTheFilePkg()
{
    var nSelNo;
    try
    {
        nSelNo = FilePkgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    {
        alert("���Ȳ�ѯ��ѡ����Ҫ����ı��İ��� ");
        return;
    }
    else
    {
        var sDataType, sPackageNo;
        try
        {
            sDataType = document.getElementsByName("DataType")[0].value;
            sPackageNo = FilePkgGrid.getRowColData(nSelNo, 1);
        }
        catch (ex) {}
        if (sPackageNo == null || sPackageNo.trim() == "")
        {
            alert("����ѡ��һ����Ч�ı��İ���ţ� ");
            return;
        }
        else
        {
            var sOpenWinURL = "DubitPkgMakeDealMain.jsp";
            var sParameters = "DataType=" + sDataType + "&PackageNo=" + sPackageNo;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�ϱ����İ�����", "left");
        }
    }
}

/*============================================================================*/


//<!-- JavaScript Document END -->
