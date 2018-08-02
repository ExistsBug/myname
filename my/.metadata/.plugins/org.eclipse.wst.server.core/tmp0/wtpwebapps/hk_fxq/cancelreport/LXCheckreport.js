/*============================================================================*/

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageLXCancelreportGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页

/*============================================================================*/


/**
 * 查询放弃上报信息
 */
function queryLXCancelreportGrid()
{
    var QuerySQL = "select a.DEALNo, "
    						 +        "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
    						 +        "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
                 +        "a.CSNM, "
                 +        "a.CTNM, "
                 +        "a.HTDT, "
                 +        "a.reason, "
                 +        "a.OPERATOR, a.makedate,a.maketime,"
                 +        "a.MANAGECOM, "
                 +        "(select name from ldcom where comcode=a.MANAGECOM) "
                 +    "from LXCancelreport a "
                 +    "where 1 = 1 and a.DataType='02' "
       if( fm.ManageCom.value == null || fm.ManageCom.value == "" )
       {
         QuerySQL= QuerySQL +"and managecom like '" + comcode + "%25' ";      
       }
         QuerySQL = QuerySQL + getWherePart("a.DEALNo", "DealNo")
                 +      getWherePart("a.CTNM", "CTNM")
                 +      getWherePart("a.HTDT", "StartDate",">=")
                 +      getWherePart("a.HTDT", "EndDate","<=")
                 +      getWherePart("a.CSNM", "CSNM")
                 +      getWherePart("a.OPERATOR", "OPERATOR")
                 +      getWherePart("a.ManageCom", "ManageCom","like")
                 +      getWherePart("a.TradeType", "TradeType")
                 +      "order by a.HTDT desc, a.DealNo desc";
    try
    {
        turnPageLXCancelreportGrid.pageDivName = "divTurnPageLXCancelreportGrid";
        turnPageLXCancelreportGrid.queryModal(QuerySQL, LXCancelreportGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询可选上报报文信息出现异常！ ");
    }
}

//导出Excel
function GoToExcel()
{
   var StartDate = fm.all('StartDate').value;
   var EndDate = fm.all('EndDate').value;
   if(StartDate != "" && StartDate != null && EndDate != "" && EndDate != null) {
       if(StartDate > EndDate) {
          alert("您好，起始日期不能大于结束日期！");
          return;
       }
   }
   var rowNum = LXCancelreportGrid.mulLineCount;
   if(rowNum>0) {
      fm.action = "../aml/CreateComQueryExcelSave.jsp?flag=3";
      fm.submit();
   }else {
      alert('没有数据，请先查询');
   }
}
