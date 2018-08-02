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
var sFeatures = "toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no";
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
     queryWaitForBeFileGrid(fm.UserCode.value);

}

/*============================================================================*/

/**
 * 查询可选上报报文信息
 */
function queryWaitForBeFileGrid(usercode)
{
		var tStr_RuleReason = "";
		if(fm.RuleReason.value != null&&fm.RuleReason.value != "")
		{
			if(fm.RuleReason.value=="ISX0x00x")
			{
				tStr_RuleReason = " and not exists (select 'X' from lxcalresult t where t.dealno=a.dealno ) ";
			}
			else
			{
				tStr_RuleReason = " and exists (select 'X' from lxcalresult t where t.dealno=a.dealno  "
						                + " and t.calcode='ISX0"+fm.RuleReason.value+"') ";
			}	
		}		
    //alert(usercode);
    var StrSql="SELECT PopEdom FROM LXUser where UserCode='"+usercode+"'";
    var edom=easyExecSql(StrSql);
    var QuerySQL = "select a.DEALNo, "
                 +        "a.STCR, "
                 +        "a.SDGR, "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.CTID, "
                 +        "a.DealDate, "
                 +        "a.DealTime, "
                 +        "a.Operator, "
                 + " (case (select 1 from lxcalresult t where t.dealno=a.dealno) when 1 then (select m.remark from lxcalmode m where m.crcd=a.stcr and m.no='0' and m.validity='1' and m.calcode in (select t.calcode from lxcalresult t where t.dealno = a.dealno)) else '可疑录入数据' end) , "
                 +        "a.DataState,"
                 +        "(select codename from ldcode where code=a.DataState and codetype='amldatastate'), "
                 +        "(select b.Missionprop1 from LWMission b where a.DealNo = b.Missionprop3 and rownum = 1) Missionprop1 "
                 +    "from LXISTradeMain a  "
                 +    "where 1 = 1  "
                // +		"and exists (select 1 "
                // + 		"from  LWMission c "
                // + 		"where a.DealNo = c.Missionprop3 "
                // +		"and c.Missionprop1 >= '" + edom + "' "
                 //+    " and c.activityid='0000009201' ) "
                 +     "and DataState in ('S00','S01','S04','S06','S09') "
                 //+     "and managecom like '" + comcode + "%25' "
                 + tStr_RuleReason
                 + " and exists (select 'X' from lxistradedetail d where d.dealno=a.dealno "
                 +      getWherePart("TSTP", "TSTP") + " ) "
                 +      getWherePart("DealNo", "DealNo")
                 +      getWherePart("CSNM", "CustomerNo")
                 +      getWherePart("CTNM", "CustomerName")
                 +      getWherePart("CTID", "IDNo")
                 +      getWherePart("DealDate", "StartDate", ">=")
                 +      getWherePart("DealDate", "EndDate", "<=")
                 +      getWherePart("ManageCom", "StatiCode", "like")
                 +   "order by a.DealDate desc,Missionprop1 Desc";
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
/**
 * 点击单条记录
 */
function onClickRadioBoxGrid()
{
        var checkFlag = 0;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) 
        {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
       if (checkFlag) 
       {
         var  dealState = WaitForBeFileGrid.getRowColData(checkFlag - 1, 11);
         //alert(dealState);
         if(dealState != null && dealState == 'S09'){//不报送（放弃报送）
        	 document.getElementsByName("affirm")[0].disabled =  false;
        	 document.getElementsByName("keep")[0].disabled =  true;
         }else if(dealState == 'S06'){ //审批中
        	 document.getElementsByName("affirm")[0].disabled =  true;
        	 document.getElementsByName("keep")[0].disabled =  true;
         }else if(dealState == 'S00'){//待确认
        	 document.getElementsByName("affirm")[0].disabled =  false;
        	 document.getElementsByName("keep")[0].disabled =  false;
         }
         else if(dealState == 'S01'){//已确认
        	 document.getElementsByName("affirm")[0].disabled =  true;
        	 document.getElementsByName("keep")[0].disabled =  true;
         }
         else if(dealState == 'S04'){//已驳回
        	 document.getElementsByName("affirm")[0].disabled =  false;
        	 document.getElementsByName("keep")[0].disabled =  false;
         }
         
       }
       else {
            alert("请先选择您要查看的交易信息！");
       }
}
function GoToDetailInput(oper)
{

    if (oper == "update"){
                var checkFlag1 = 0;
        for (var i=0; i<WaitForBeFileGrid.mulLineCount; i++) {
            if (WaitForBeFileGrid.getSelNo(i)) {
                checkFlag1 = WaitForBeFileGrid.getSelNo();
                break;
            }
        }
        if(checkFlag1){
      var sOpenWinURL = "LXISTradeManualToMain.jsp";
      var sParameters = "DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
            +"&CSNM=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 4)
            +"&Date=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 7)
            +"&DataState=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 11)
            +"&Oper=ViewAndUpdate";
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "查看可疑信息", "left");

//            window.open("./LXISTradeManualToDetail.jsp?DealNo=" + WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 1)
//            +"&DataState="+WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 6)+"&oper=query");
                }else {
            alert("请先选择一条您要查看交易信息！");
        }

    }
}
//初始化大额交易明细信息
function afterQuery(tDealNo){
    //initTasksGrid();
    var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM from LXIHTradeDetail where DealNo = '" + tDealNo +"' ";
    turnPageWaitForBeFileGrid.queryModal(strSQL, TasksGrid,0,1);
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
              datastate = WaitForBeFileGrid.getRowColData(checkFlag1 - 1, 11);
                }else {
            alert("请先选择一条大额交易信息！");
        }
   
  if(str=="keep")
  {
  	window.open("./LXISAffirmCancelMain.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str,"",sFeatures);
  }else if(str=="affirm")
  {
  	window.open("./LXISAffirmReportMain.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str,"",sFeatures);
  }
  else{
	  var showStr="正在处理数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	  fm.action="./LXISAffirmMainSave.jsp?dealno="+dealno+"&datastate="+datastate+"&oper="+str;
	  fm.submit();
  }

}
function afterQuery(str){
    queryWaitForBeFileGrid();
}