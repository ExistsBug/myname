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
var turnPageStatGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ


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
     queryStatGridToday();

}
/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryStatGrid()
{   if (!verifyInput2())          return;

    var QuerySQL = "select "
                 +        "a.CSNM, "
                 +        "a.CTNM, " 
                 +        "a.Grade, "
                 +        "(select c.codealias from ldcode c where c.codetype='amlriskgrade' and c.code=a.Grade ),"  
                 +        "(select c.codealias from ldcode c where c.codetype='amlriskgradedetail' and c.code=a.Grade ),"            
                 +        "a.DealDate "
                 +    "from LXCustomer a   "
                 +    "where 1 = 1 "
                 +      getWherePart("a.CSNM", "CSNM")
                 +      getWherePart("a.CTNM", "CTNM")
                 +      getWherePart("a.Grade", "Grade")
                 //+      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.DealDate", "StartDate", ">=")
                 +      getWherePart("a.DealDate", "EndDate", "<=")
                 +   " order by a.DealDate desc, a.Grade desc  ";
    try
    {
        turnPageStatGrid.pageDivName = "divTurnPageStatGrid";
        turnPageStatGrid.queryModal(QuerySQL, StatGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}

//<!-- JavaScript Document END -->
//�ύǰ��У�顢����
function beforeSubmit()
{

//    StatGrid.delCheckFalseLine();
    var len = StatGrid.mulLineCount;
    var no=1;
    for(var i=0;i<len;i++){
    	if(StatGrid.getChkNo(i)){
    		no=0;
    		break;}
    	}
    if(no==1){
    alert("δѡ�н���");
    return false;
    }
    
   return true;
}


//�ύ�����水ť��Ӧ����
function submitForm()
{
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./RiskCustomerSave.jsp"
  fm.submit();

}
function checkBoxNext(parm1)
{
	var dealno="";
	var datastate="";
	dealno=fm.all( parm1 ).all('StatGrid1').value;
		customno=fm.all( parm1 ).all('StatGrid2').value;
			date=fm.all( parm1 ).all('StatGrid5').value;

	
   var sOpenWinURL = "./LXIHQueryMainInput.jsp";
   var sParameters = "DealNo=" + dealno;
   sParameters+="&CustomNo="+customno;
   sParameters+="&Date="+date;
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");

}
function resetForm(){
	      fm.all("StartDate").value = "";
				fm.all("CSNM").value = "";
				fm.all("CTNM").value = "";
				fm.all("Grade").value = "";	
				fm.all("GradeName").value = "";	
				return true;
	}