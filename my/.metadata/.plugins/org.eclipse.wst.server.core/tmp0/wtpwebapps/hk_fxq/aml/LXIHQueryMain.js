/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主脚本
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();
var turnPageTasksGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
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
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
 
  }
		else {
	    	alert("请先选择一条大额交易明细信息！"); 
		}	
}

function GoToDetailInput(oper)
{ var cDealNo;
	

		var checkFlag = 0; 
	      checkFlag = TasksGrid.getSelNo()-1;


	if (checkFlag>=0) {
			var cDealNo = TasksGrid.getRowColData(checkFlag , 1);
			var cCRCD = TasksGrid.getRowColData(checkFlag , 2); //特征代码
			var cTSDT = TasksGrid.getRowColData(checkFlag , 3); //明细代码
			var sOpenWinURL = "./LXIHAffirmMainDetail.jsp";
			var sParameters = "Oper=" + oper 
	     		+ "&CustomerNo=" + tCustomNo 
	     		+ "&Date=" + tDate 
	     		+ "&DealNo=" + cDealNo
	     		+ "&CRCD=" + cCRCD 
	     		+ "&TSDT=" + cTSDT;
			OpenWindowNew(sOpenWinURL + "?" + sParameters, "申请大额明细", "left");
		}
		else {
	    	alert("请先选择一条大额交易明细信息！"); 
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
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}