/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : � <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ��������ű�
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageWaitForReasonGrid = new turnPageClass(); 
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
    var QuerySQL = "select a.DEALNo, "
                 +        "a.STCR, "
                 +        "a.SDGR, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.DataState, "
                 +        "a.CTID, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "a.Operator, "
                 +        "a.DataState "
                 +    "from LXISTradeMain a "
                 +    "where 1 = 1  and operator<>'Bacth'  "
                 +    " and (a.DataState='P2' or a.DataState='T2') "
       if( fm.ManageCom.value == null || fm.ManageCom.value == "" )
       {
         QuerySQL= QuerySQL +"and managecom like '" + comcode + "%' ";      
       }
         QuerySQL = QuerySQL + getWherePart("a.CSNM", "CSNM")
                 +      getWherePart("a.CTNM", "CTNM")
                 //+      getWherePart("a.DataState", "DataState")
                 +      getWherePart("a.STCR", "STCR")
                 +      getWherePart("a.SDGR", "SDGR")
                 +      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.dealdate", "StartDate", ">=")
                 +      getWherePart("a.dealdate", "EndDate", "<=")
                 +   "order by a.DealDate desc, a.DealNo desc";
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid, 0, 1);
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

//    WaitForBeFileGrid.delCheckFalseLine();
    var len = WaitForBeFileGrid.mulLineCount;
    var no=1;
    for(var i=0;i<len;i++){
        if(WaitForBeFileGrid.getSelNo(i)){
            no=0;
            break;}
        }
    if(no==1){
    alert("δѡ�н���");
    return false;
    }

   return true;
}

function GoToDetailInput(oper)
{

    if (oper == "query"){
                var checkFlag1 = 0;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag1 = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
        if(checkFlag1){
        	  var sOpenWinURL = "LXISTradeManualToDetail.jsp";
            var sParameters = "DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)+"&DataState="+WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 11)+"&oper=query";
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "�����ۺϲ�ѯ", "left");
        	  
//            window.open("./LXISTradeManualToDetail.jsp?DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
//            +"&DataState="+WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6)+"&oper=query");
                }else {
            alert("����ѡ��һ�����ɽ�����Ϣ��");
        }

    }
}
//��ʼ��������ϸ��Ϣ
function afterQuery(tDealNo){
    //initTasksGrid();
    var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
    turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid);
}

function SubmitWaitForBeFileGrid(str)
{
     if(!beforeSubmit())
  {
      return false;
  }
                var checkFlag1 = 0;
                var dealno;
                var datastate;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag1 = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
        if(checkFlag1){
                dealno = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1);
              datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6);
                }else {
            alert("����ѡ��һ��������Ϣ��");
        }
   var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./LXISAffirmMainSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
  fm.submit();

}
function afterQuery(str){
    queryWaitForBeFileGrid();
}

function GoToFilter(str)
{
			var flag = "N";
			var tMullineCount = WaitForBeFileGrid.mulLineCount;
			//alert(tMullineCount);
			var i=0;
			var j=0;
			for(;i<tMullineCount;i++)
			{	
					if(WaitForBeFileGrid.getSelNo(i))
					{
							flag = "Y";
							j=j+1;
					}
			}
			if(flag == "N")
			{
					alert("����û��ѡ������!");
					return false;
			}
		  var reason=fm.reason.value;
		  if(reason==null||reason.trim()==""){
			  alert("����д������!");
			  return false;
		  }else{
		      if(reason.trim().length<20){
		         alert("��������������20���֣�");
		         return false ;
		        }  
			  if(j>1){
				  if(confirm("��ѡ���˶������ݣ�ȷ��ʹ��ͬһ����������?")){
					  
				  }else{
					  return false;
				  }
			  }
		  }
		  var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
		  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
		  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
		  fm.action="./LXISFilterSaveF.jsp?oper="+str;
		  //alert(1);
		  fm.submit();
		  fm.reset();
		  initCheckReasonGrid();
}

function checkBoxNext(parm1)
{
	var dealno="";
	var datastate="";
	dealno=fm.all( parm1 ).all('WaitForBeFileGrid1').value;
	datastate=fm.all( parm1 ).all('WaitForBeFileGrid11').value;

   var sOpenWinURL = "./LXISTradeManualToDetail.jsp";
   var sParameters = "DealNo=" + dealno;
   sParameters+="&DataState="+datastate;
   sParameters+="&oper=query";
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");

}


//�����RadioBoxʱ��Ӧ��JS����
function clickWaitForBeFileGrid()
{  
	var checkFlag = 0;
	//ȡ�õ�ǰ�������
	checkFlag = WaitForBeFileGrid.getSelNo();
	if (checkFlag>0) { 
	     var dealNo = WaitForBeFileGrid.getRowColData(checkFlag - 1, 1);
	     
	     var QuerySQL = "select a.reason,(select name from ldcom where comcode=a.managecom),(select username from LDUser where usercode =a.operator),a.dealdate,a.dealtime from LXISTradeMainReasonNew  a where a.DealNo='"
	    	  			 + dealNo+"' ";
    try
    {
        turnPageWaitForReasonGrid.pageDivName = "divTurnPageWaitForReasonGrid";
        turnPageWaitForReasonGrid.queryModal(QuerySQL, WaitForReasonGrid, 0, 1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��������Ϣ�����쳣�� ");
    } 
			 
  }
}