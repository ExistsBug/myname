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
var turnPage = new turnPageClass();
var turnPageTasksGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var tDealNo;
var tCustomNo;
var tDate;

function queryTasksGrid()
{  
    if (tDealNo!=null) { 	
       var QuerySQL = "select DEALNo, "
                 +        "CRCD, "
                 +        "TSDT, "
                 +        "FINN, "
                 +        "CATP, "
                 +        "CTAC, "          
                 +        "TSTM "
                 +    "from LXIHTradeDetail  "
                 +    "where 1 = 1 "
                 +     "and DEALNo = '"
                 +    tDealNo
                 +   "' ";

    try
    {
        turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
        turnPageTasksGrid.queryModal(QuerySQL,TasksGrid);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
 
  }
		else {
	    	alert("����ѡ��һ��������ϸ��Ϣ��"); 
		}	
}

function GoToDetailInput(oper)
{ var cDealNo;
	

		var checkFlag = 0; 
	      checkFlag = TasksGrid.getSelNo()-1;


	if (checkFlag>=0) {
			var cDealNo = TasksGrid.getRowColData(checkFlag , 1);
			var cCRCD = TasksGrid.getRowColData(checkFlag , 2); //��������
			var cTSDT = TasksGrid.getRowColData(checkFlag , 3); //��ϸ����
			var sOpenWinURL = "./LXIHAffirmMainDetail.jsp";
			var sParameters = "Oper=" + oper 
	     		+ "&CustomerNo=" + tCustomNo 
	     		+ "&Date=" + tDate 
	     		+ "&DealNo=" + cDealNo
	     		+ "&CRCD=" + cCRCD 
	     		+ "&TSDT=" + cTSDT;
			OpenWindowNew(sOpenWinURL + "?" + sParameters, "��������ϸ", "left");
		}
		else {
	    	alert("����ѡ��һ��������ϸ��Ϣ��"); 
	    	return false;
		}
			} 

function afterQuery(tDealNo){
	//initTasksGrid();
	var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
	turnPageTasksGrid.queryModal(strSQL, TasksGrid);	
}

function GoToReturn(){
	try
	{
		var arrReturn = tDealNo;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}