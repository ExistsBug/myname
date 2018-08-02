/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主脚本
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageWaitForReasonGrid = new turnPageClass(); 
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
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}



//<!-- JavaScript Document END -->
//提交前的校验、计算
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
    alert("未选中交易");
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
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "可疑综合查询", "left");
        	  
//            window.open("./LXISTradeManualToDetail.jsp?DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
//            +"&DataState="+WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6)+"&oper=query");
                }else {
            alert("请先选择一条可疑交易信息！");
        }

    }
}
//初始化大额交易明细信息
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
            alert("请先选择一条大额交易信息！");
        }
   var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
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
					alert("您还没有选择数据!");
					return false;
			}
		  var reason=fm.reason.value;
		  if(reason==null||reason.trim()==""){
			  alert("请填写审核意见!");
			  return false;
		  }else{
		      if(reason.trim().length<20){
		         alert("审核意见不能少于20个字！");
		         return false ;
		        }  
			  if(j>1){
				  if(confirm("您选择了多条数据，确定使用同一个审核意见吗?")){
					  
				  }else{
					  return false;
				  }
			  }
		  }
		  var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
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
   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");

}


//当点击RadioBox时响应的JS函数
function clickWaitForBeFileGrid()
{  
	var checkFlag = 0;
	//取得当前点击的行
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
        alert("警告：查询审核意见信息出现异常！ ");
    } 
			 
  }
}