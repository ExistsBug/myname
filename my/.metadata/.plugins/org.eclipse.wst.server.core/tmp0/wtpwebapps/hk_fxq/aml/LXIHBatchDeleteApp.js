/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п�����ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п����Ƽ��ɷ����޹�˾</p>
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
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
     queryWaitForBeFileGrid();

}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryWaitForBeFileGrid()
{
	if(!verifyInput2())
	{
		return false;
	}
    var QuerySQL = "select DEALNo, "
                 +        "CSNM, "
                 +        "CTNM, "
                 +        "DataState, "
                 +        "HTDT, "
                 +        "DealDate, "
                 +        "DealTime, "
                 +        "Operator "
                 +    "from LXIHTradeMain  "
                 +    "where 1 = 1 "
                 +     "and DataState in('N03','C03','A03','R03') "
                 +      getWherePart("htdt", "StartDate")
                 +   "order by DealDate desc, DealNo desc";
//    alert(QuerySQL);
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.pageLineNum=99999;
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}


/**
 * ��������
 */
function correctApplication()
{  if(!beforeSubmit())
  {
      return false;
  }
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./CorrectLXIHBatchDeleteAppSave.jsp"
  fm.submit();
}

/*============================================================================*/

/**
 * ɾ������
 */
function deleteApplication()
{if(!beforeSubmit())
  {
      return false;
  }
  if(!verifyInput2())
	{
		return false;
	}
  if(WaitForBeFileGrid.mulLineCount==0)
  {
  	alert("û�н��в�ѯ��û����Ҫ��������ɾ���Ľ���");
   	return false;
  }
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./DeleteLXIHBatchDeleteAppSave.jsp"
  fm.submit();
}

/*============================================================================*/


//<!-- JavaScript Document END -->
//�ύǰ��У�顢����
function beforeSubmit()
{


    
   return true;
}


//�ύ�����水ť��Ӧ����
function submitForm()
{
  if(!beforeSubmit())
  {
      return false;
  }
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./ReportOMBSubmit.jsp"
  fm.submit();

}
function checkBoxNext(parm1)
{
	var dealno="";
	var datastate="";
	dealno=fm.all( parm1 ).all('WaitForBeFileGrid1').value;
		customno=fm.all( parm1 ).all('WaitForBeFileGrid2').value;
			date=fm.all( parm1 ).all('WaitForBeFileGrid5').value;

	
   var sOpenWinURL = "./LXIHQueryMainInput.jsp";
   var sParameters = "DealNo=" + dealno;
   sParameters+="&CustomNo="+customno;
   sParameters+="&Date="+date;
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");

}
function afterQuery(tDealNo){
	queryWaitForBeFileGrid();
}
function apply()
{
	if(!verifyInput2())
	{
		return false;
	}
	var message;
	message="���׷�������Ϊ"+fm.StartDate.value;
	if(confirm("��ȷ��Ҫ��"+message+"�����ݽ�������ɾ��ô��"))
	{
		  fm.action="./LXIHBatchDeleteAppSave.jsp"
		  fm.submit();
	}
}
function bdafterSubmit(DealFlag, MsgContent,fileNo)
{
	if(DealFlag=="Fail")
	{
		alert(MsgContent);
		return false;
	}
	fm.target="_self";
	fm.action="largeTradeFileMakeInput.jsp?reportType=01&dataType=04&inFlag=bd&fileNo="+fileNo;
	fm.submit();
}