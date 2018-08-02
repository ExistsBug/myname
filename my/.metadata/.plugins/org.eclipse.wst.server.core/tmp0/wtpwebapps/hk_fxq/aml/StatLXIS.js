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
     queryStatGrid();

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
                 +        "(select codename from ldcode c where c.code=a.stcr and codetype='amlshadinessstamp'),"              
                 +        "sum(b.CRAT), "
                 +        "count(1) as cnt "
                 +    "from LXISTradeMain a , LXISTradeDetail b  "
                 +    "where 1 = 1 ";
      if( fm.ManageCom.value == null || fm.ManageCom.value == "" )
       {
         QuerySQL= QuerySQL +"and managecom like '" + comcode + "%25' ";      
       }
         QuerySQL = QuerySQL
                 +     "and a.dealno = b.dealno "
                 +      getWherePart("a.CSNM", "CSNM")
                 +      getWherePart("a.CTNM", "CTNM")
                 +      getWherePart("a.DataState", "DataState")
                 +      getWherePart("a.STCR", "STCR")
                 +      getWherePart("a.SDGR", "SDGR")
                 +      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.dealdate", "StartDate", ">=")
                 +      getWherePart("a.dealdate", "EndDate", "<=")
                 +   "group by a.csnm , a.ctnm , a.stcr order by a.csnm ,cnt desc ";
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
  fm.action="./CorrectLXIHAppSave.jsp"
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
  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./DeleteLXIHAppSave.jsp"
  fm.submit();
}

/*============================================================================*/


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
  fm.all("SDGR").value = "";
  fm.all("SDGRName").value = "";
  fm.all("DataState").value = "";
  fm.all("STCR").value = "";
  fm.all("ManageCom").value = "";  
  fm.all("ManageComName").value = "";  
  fm.all("CTNM").value = "";  
  fm.all("CSNM").value = "";  
  fm.all("StartDate").value = "";
	initForm();
	return true;		
}