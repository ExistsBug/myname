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

var showInfo;                                     //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();               //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageFileMsgGrid = new turnPageClass();    //ȫ�ֱ���, �����뱨�Ĳ�ѯ�����ҳ

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
    //���ļ������⴦��
    if (DealFlag == "succ" || DealFlag == "success")
    {
        try
        {
            dealTheNewApply();
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
            document.getElementsByName("btnApplyANewMsg")[0].disabled = true;
        }
        catch (ex) {}
    }
    else
    {
        try
        {
            document.getElementsByName("btnApplyANewMsg")[0].disabled = false;
        }
        catch (ex) {}
    }
}

/*============================================================================*/

/**
 * ����һ���µı����ļ�
 */
function applyANewFileMsg()
{
    var sDataType;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
    }
    catch (ex) {}
    if (sDataType != null && sDataType.trim() == "02")
    {
        alert("���ɾ����Ĳ�����ֱ�����룡 ");
        return;
    }
    else
    {
        var MsgContent = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
        var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
        showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
        try
        {
            document.getElementsByName("Operation")[0].value = "ApplyFileNo";
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
        queryFileMsgGrid();
        if (FileMsgGrid.mulLineCount > 0)
        {
            FileMsgGrid.selOneRow(1);
            dealTheFileMsg();
        }
    }
    catch (ex) {}
}

/*============================================================================*/

/**
 * ��ѯ�������ϱ�������Ϣ
 */
function queryFileMsgGrid()
{
    var sDataType, sDealNo;
    try
    {
        sDataType = document.getElementsByName("DataType")[0].value;
        sDealNo = document.getElementsByName("DealNo")[0].value;
    }
    catch (ex) {}

    var QuerySQL = "select a.FileNo, "
                 +        "a.DataType, "
                 +        "a.DealState, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '02' ";
    if (sDataType != null && sDataType.trim() == "02")
    {
        QuerySQL +=    "and a.DealState in ('03', '04', '05') "
                 +     "and (a.DataType in ('01', '02') or (a.DataType = '03' and a.DealState = '03')) "
                 +     "and exists "
                 +         "(select 'X' "
                 +            "from LXISTradeMain "
                 +           "where 1 = 1 "
                 +             "and DataState = 'C01' "
                 +             "and DealNo in "
                 +                 "(select DealNo "
                 +                    "from LXReportDetail "
                 +                   "where 1 = 1 "
                 +                     "and FileNo = a.FileNo)) ";
    }
    else
    {
        QuerySQL +=    "and a.DealState = '00' "
                 +      getWherePart("a.DataType", "DataType")
    }
        QuerySQL +=     getWherePart("a.FileNo", "FileNo")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=");
    if (sDealNo != null && sDealNo.trim() != "")
    {
        QuerySQL +=    "and a.FileNo in "
                 +         "(select FileNo "
                 +            "from LXReportDetail "
                 +           "where 1 = 1 "
                 +             "and DealNo = '" + sDealNo + "') ";
    }
    if(fm.DataType.value!=null&&fm.DataType.value!="02")
    {
    	  QuerySQL += " and a.makedate='"+fm.CurrentDate.value+"' "
    	}
        QuerySQL += "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageFileMsgGrid.pageDivName = "divTurnPageFileMsgGrid";
        turnPageFileMsgGrid.queryModal(QuerySQL, FileMsgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ�������ϱ������ļ������쳣�� ");
    }
}

/*============================================================================*/

/**
 * �����������ϱ�������Ϣ
 */
function dealTheFileMsg()
{
    var nSelNo;
    try
    {
        nSelNo = FileMsgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    {
        alert("���Ȳ�ѯ��ѡ����Ҫ������ļ��� ");
        return;
    }
    else
    {
        var sDataType, sFileNo;
        try
        {
            sDataType = document.getElementsByName("DataType")[0].value;
            sFileNo = FileMsgGrid.getRowColData(nSelNo, 1);
        }
        catch (ex) {}
        if (sFileNo == null || sFileNo.trim() == "")
        {
            alert("����ѡ��һ����Ч���ļ���ţ� ");
            return;
        }
        else
        {
            var sOpenWinURL = "DubitMsgMakeDealMain.jsp";
            var sParameters = "DataType=" + sDataType + "&FileNo=" + sFileNo;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�ϱ������ļ�����", "left");
        }
    }
}

/*============================================================================*/


//<!-- JavaScript Document END -->
