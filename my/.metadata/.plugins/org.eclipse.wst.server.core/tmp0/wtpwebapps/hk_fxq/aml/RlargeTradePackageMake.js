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
//        		if(fm.dataType.value!="02")
//       		{
        			dealTheNewApply();
//        		}
//            else
//            	{
//								MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
//            		showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
//            	}
        }
        catch (ex) {}
    }
}

/*============================================================================*/



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
	if(!verifyForm('fm'))
	{
		return false;
	} 
    var QuerySQL = "select a.PackageNo, "
                 +        "a.reporttype, "
                 +        "a.datatype, "
                 +        "a.makedate, "
                 +        "a.Operator, "
                 +        "a.dealstate "
                 +    "from LXReportDataPacket a "
                 +   "where 1 = 1 "
                 +     "and a.ReportType = '01' "
                 +      getWherePart("a.PackageNo", "PackageNo")
                 //+      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.MakeDate", "StartDate", ">=")
                 +      getWherePart("a.MakeDate", "EndDate", "<=");
                 if(fm.dataType.value=="02")
                 {
                 		QuerySQL +=" and ((a.datatype in ('01','02') and a.DealState in ('04','05'))  ) ";
                	}
                	else
                		{
                			QuerySQL +=getWherePart("a.dataType", "dataType");
                			QuerySQL +=" and a.DealState = '01' "
                		}     
        QuerySQL +="order by a.MakeDate desc, a.MakeTime desc";
    //alert(QuerySQL);
    try
    {
        turnPage.queryModal(QuerySQL, FileMsgGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ���������ݰ������쳣�� ");
    }
//        //�ж��Ƿ��ѯ�ɹ�
//    if (!turnPage.strQueryResult) {
//    alert("û��������������Ϣ��");
//    return false;
//  }
//    if (!turnPage.queryModal) {
//          alert("no data");
//          FileMsgGrid.clearData();
//      return false;
//    }
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
//    	if(fm.dataType.value=="02")
//	{
//		if(FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,3)=="02"&&FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,6)=="02")
//		{
//			
//		}
//		else
//		{
//			alert("ֻ�д�����ϵ��ط����ݰ����ܽ��봦��˵�,���Ҫ�����ط����ݰ��������밴ť");
//			return false;
//		}
//	}
        var sPackageNo;
        var sMakeDate;
        try
        {
            sPackageNo = FileMsgGrid.getRowColData(nSelNo, 1);
            sMakeDate = FileMsgGrid.getRowColData(nSelNo, 4);
        }
        catch (ex) {}
        if (sPackageNo == null || sPackageNo.trim() == "")
        {
            alert("����ѡ��һ����Ч�İ���ţ� ");
            return;
        }
        else
        {
            var sOpenWinURL = "RlargeTradeFileToPackageMain.jsp";
            var sParameters = "PackageNo=" + sPackageNo;
            sParameters+="&dataType="+fm.dataType.value;
            sParameters+="&reportType="+fm.reportType.value;
            sParameters+="&makeDate="+sMakeDate;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�����������", "left");
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
	if(fm.dataType.value=="02")
	{
		if(FileMsgGrid.getSelNo()==0)
		{
			alert("����ѡ����Ҫ�ر������ݰ�");
			return false;
		}
		if(FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,3)=="02"&&FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,6)=="02")
		{
			alert("�����ݰ�Ϊ�ط����ݰ�����ֱ�ӵ������ť���봦��˵�");
			return false;
		}
	}
	var nPackageNo=FileMsgGrid.getRowColData(FileMsgGrid.getSelNo()-1,1);
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px"); 
 	fm.action="RlargeTradeToPackageSave.jsp?type=applyPackageNo&nPackageNo="+nPackageNo;
  fm.submit();
}
function childReturn()
{
	queryFileMsgGrid();
}

//<!-- JavaScript Document END -->
