/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageLXCancelreportGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

/*============================================================================*/


/**
 * ��ѯ�����ϱ���Ϣ
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
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}

//����Excel
function GoToExcel()
{
   var StartDate = fm.all('StartDate').value;
   var EndDate = fm.all('EndDate').value;
   if(StartDate != "" && StartDate != null && EndDate != "" && EndDate != null) {
       if(StartDate > EndDate) {
          alert("���ã���ʼ���ڲ��ܴ��ڽ������ڣ�");
          return;
       }
   }
   var rowNum = LXCancelreportGrid.mulLineCount;
   if(rowNum>0) {
      fm.action = "../aml/CreateComQueryExcelSave.jsp?flag=3";
      fm.submit();
   }else {
      alert('û�����ݣ����Ȳ�ѯ');
   }
}
