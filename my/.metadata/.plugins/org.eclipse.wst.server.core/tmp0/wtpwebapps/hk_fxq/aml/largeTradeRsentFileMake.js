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
 * ����ɹ�֮�����ϵ������洦�������
 */
function dealTheNewApply()
{
    queryFileMsgGrid();
    FileMsgGrid.selOneRow(1);
    dealTheFileMsg();
}

/*============================================================================*/

/**
 * ��ѯ�������ϱ�������Ϣ
 */
function queryFileMsgGrid()
{
    var QuerySQL = "select a.FileNo, "
                 +        "a.reporttype, "
                 +        "a.datatype, "
                 +        "a.makedate, "
                 +        "a.Operator "
                 +    "from LXReportDataFile a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '01' "
                 +     "and a.DealState = '00' "
                 +      getWherePart("a.FileNo", "FileNo")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=")
                 +      getWherePart("a.dataType", "dataType")
                 +   "order by a.MakeDate desc, a.MakeTime desc";
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
        var sFileNo;
        try
        {
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
            var sOpenWinURL = "largeTradeReSentFileToXmlInput.jsp";
            var sParameters = "FileNo=" + sFileNo;
            sParameters+="&dataType="+fm.dataType.value;
            sParameters+="&reportType="+fm.reportType.value;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�����������ϱ������ļ�����", "left");
        }
    }
}

/*============================================================================*/

function applyANewFileMsg()
{
    if(!verifyForm('fm'))
    {
        return false;
    }
    var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    fm.submit();
}

//<!-- JavaScript Document END -->
