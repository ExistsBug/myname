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
}

/*============================================================================*/

/**
 * ��ѯ�������ϱ�������Ϣ
 */
function queryFileMsgGrid()
{
    var QuerySQL = "select a.AppId, "
    			 +		  "a.CalCode, "
                 +        "a.CRCD, "
                 +        "a.Validity, "
                 +        "a.ReMark, "
                 +        "a.type "
                 +    "from LXCalMode a "
                 +   "where 1 = 1 "
                 +     "and a.no = '0' "
                 +     "and a.type in( 'S','C') "
                 +      getWherePart("a.CRCD", "CRCD")    
                 +      getWherePart("a.CalCode", "CalCode")
                 +      getWherePart("a.AppId", "AppId")                    
                 +   "order by a.CalCode, a.CRCD, a.Validity" ;
    //alert(QuerySQL);
    try
    {
        turnPageFileMsgGrid.pageDivName = "divTurnPageFileMsgGrid";
        turnPageFileMsgGrid.queryModal(QuerySQL, FileMsgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ�Ѷ���ӿڹ�������쳣�� ");
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
    { var sAppId="";
    	var sCalCode="";
    	var sType="";
    	var sOpenWinURL = "DataInterfaceIdyMain.jsp";
    	var sParameters = "AppId=" + sAppId + "&CalCode=" + sCalCode+ "&Type=" + sType;
        OpenWindowNew(sOpenWinURL, "��������������", "left");
//        window.open(sOpenWinURL);
    }
    else
    {
        var sAppId, sCalCode, sType;
        try
        {
            sAppId = FileMsgGrid.getRowColData(nSelNo, 1);
            sCalCode = FileMsgGrid.getRowColData(nSelNo, 2);
             sType = FileMsgGrid.getRowColData(nSelNo, 6);
        }
        catch (ex) {}
        if (sAppId == null || sAppId.trim() == "")
        {
            alert("����ѡ��һ����Ч�Ĺ����ţ� ");
            return;
        }
        else if (sCalCode == null || sCalCode.trim() == "")
        {
            alert("����ѡ��һ����Ч�Ĺ����ţ� ");
            return;
        }        
        else
        {
            var sOpenWinURL = "DataInterfaceIdyMain.jsp";
            var sParameters = "AppId=" + sAppId + "&CalCode=" + sCalCode+ "&Type=" + sType;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "��������������", "left");
//            window.open(sOpenWinURL + "?" + sParameters);

        }
    }
}

/**
 * ��������������
 */
function dealCRCDType(obj){
	var DealType = document.getElementById("DealType").value;	
	if (DealType == "01"){
		try{
			showCodeList('amlbigstamp', [obj]);
		} catch(ex){
			alert(ex);
		}
	}else if (DealType == "02"){
		try{
			showCodeList('amlshadinessstamp', [obj]);		
		}catch(ex){
			alert(ex);
		}
	}else {
		document.getElementById(obj.name).value ="";
	}
}

function dealCRCDTypeKey(obj){
	var DealType = document.getElementById("DealType").value;	
	if (DealType == "01"){
		try{
			showCodeListKey('amlbigstamp', [obj]);
		} catch(ex){
			alert(ex);
		}
	}else if (DealType == "02"){
		try{
			showCodeListKey('amlshadinessstamp', [obj]);		
		}catch(ex){
			alert(ex);
		}
	}else {
		document.getElementById(obj.name).value ="";
	}
}
/*============================================================================*/


//<!-- JavaScript Document END -->
