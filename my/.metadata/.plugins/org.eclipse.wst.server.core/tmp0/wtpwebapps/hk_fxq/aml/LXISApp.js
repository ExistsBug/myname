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
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页


/*============================================================================*/

/**
 * 提交后操作, 服务器数据返回后执行的操作
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
 * 查询可选上报报文信息
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
                 +    "where 1 = 1 "
                 +     "and DataState in('N03','C03','A03','R03','I03') "
                 +     "and managecom like '" + comcode + "%25' "
                 +      getWherePart("a.DealNo", "DealNo")
                 +      getWherePart("a.CSNM", "CustomerNo")
                 +      getWherePart("a.CTNM", "CustomerName")
                 +      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.CTID", "IDNo")
                 +      getWherePart("a.DealDate", "StartDate", ">=")
                 +      getWherePart("a.DealDate", "EndDate", "<=")
                 +   "order by a.DealDate desc, a.DealNo desc";
//    alert(QuerySQL);
    try
    {
        turnPageWaitForBeFileGrid.pageDivName = "divTurnPageWaitForBeFileGrid";
        turnPageWaitForBeFileGrid.queryModal(QuerySQL, WaitForBeFileGrid,0,1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}


/**
 * 纠错申请
 */
function correctApplication()
{  if(!beforeSubmit())
  {
      return false;
  }
  var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./CorrectLXISAppSave.jsp"
  fm.submit();
}

/*============================================================================*/

/**
 * 删除申请
 */
function deleteApplication()
{if(!beforeSubmit())
  {
      return false;
  }
  var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
  fm.action="./DeleteLXISAppSave.jsp"
  fm.submit();
}

/*============================================================================*/


//<!-- JavaScript Document END -->
//提交前的校验、计算
function beforeSubmit()
{

//    WaitForBeFileGrid.delCheckFalseLine();
    var len = WaitForBeFileGrid.mulLineCount;
    var no=1;
    for(var i=0;i<len;i++){
    	if(WaitForBeFileGrid.getChkNo(i)){
    		no=0;
    		break;}
    	}
    if(no==1){
    alert("未选中报文");
    return false;
    }
    
   return true;
}


//提交，保存按钮对应操作
function submitForm()
{
  if(!beforeSubmit())
  {
      return false;
  }
  var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
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
	datastate=fm.all( parm1 ).all('WaitForBeFileGrid11').value;

	
   var sOpenWinURL = "./LXISTradeManualToDetail.jsp";
   var sParameters = "DealNo=" + dealno;
   sParameters+="&DataState="+datastate;
   sParameters+="&oper=query";
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");

}
function afterQuery(tDealNo){
	queryWaitForBeFileGrid();
}