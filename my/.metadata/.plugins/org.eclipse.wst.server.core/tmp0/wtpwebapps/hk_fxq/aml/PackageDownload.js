/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-26
 * @direction: ���ױ��İ������������ű�
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
function afterSubmit(DealFlag, MsgContent, OtherMessage)
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
 * ��ѯ�������ϱ����İ���Ϣ
 */
function queryFilePkgGrid()
{
    var QuerySQL = "select a.PackageNo, "
                 +        "a.PackageName, "
                 +        "a.MakeDate, "
                 +        "a.MakeTime, "
                 +        "a.Operator, "
                 +        "a.DealState "
                 +    "from LXReportDataPacket a "
                 +   "where 1 = 1 "
                 +     "and a.DealState > '01' "
                 +     "and a.PackageName is not null "
                 +      getWherePart("a.PackageNo", "PackageNo")
                 //+      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.ReportType", "ReportType")
                 +      getWherePart("a.DataType", "DataType")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=")
                 +   "order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPageFilePkgGrid.pageDivName = "divTurnPageFilePkgGrid";
        turnPageFilePkgGrid.queryModal(QuerySQL, FilePkgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ�Ѵ�����İ������쳣�� ");
    }
}

/*============================================================================*/

/**
 * �����������ϱ�������Ϣ
 */
function downloadPackage()
{
    var nSelNo;
    try
    {
        nSelNo = FilePkgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    {
        alert("���Ȳ�ѯ��ѡ����Ҫ���صı��İ��� ");
        return;
    }
    else
    {
        var sPackageNo, sPackageName;
        try
        {
            sPackageNo = FilePkgGrid.getRowColData(nSelNo, 1);
            sPackageName = FilePkgGrid.getRowColData(nSelNo, 2);
        }
        catch (ex) {}
        if (sPackageNo == null || sPackageNo.trim() == "")
        {
            alert("����ѡ��һ����Ч�ı��İ���ţ� ");
            return;
        }
        else
        {
            window.open("send/" + sPackageName);
        }
    }
}

/*============================================================================*/


//<!-- JavaScript Document END -->
