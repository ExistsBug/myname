<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.utility.*"%>
<%
     //添加页面控件的初始化。

     GlobalInput tG = new GlobalInput();
     tG = (GlobalInput)session.getValue("GI");
%>  

<%
//在此设置导出Excel的列名，应与sql语句取出的域相对应



ExportExcel.Format format = new ExportExcel.Format();
ArrayList listCell = new ArrayList();
ArrayList listLB = new ArrayList();
ArrayList listColWidth = new ArrayList();
format.mListCell=listCell;
format.mListBL=listLB;
format.mListColWidth=listColWidth;

ExportExcel.Cell tCell=null;
ExportExcel.ListBlock tLB=null;

listColWidth.add(new String[]{"0","5000"});

  String strSQL = request.getParameter("QuerySQL");

		String 	sql = "";
		sql = sql + strSQL;
		sql = sql.replace('*','%');								
    System.out.println("ZGDExportSQL:"+ sql);
    tLB = new ExportExcel.ListBlock("001");
    tLB.colName=new String[]{"机构代码","机构名称","交易日期","销售渠道","保险计划名称","保险合同号","投保人","被保险人","受益人","交易金额","交易方式","收支方向","识别类型","交易特征"};
    tLB.sql=sql;
    tLB.row1=0;
    tLB.col1=0;
    tLB.InitData();
    listLB.add(tLB);            

try{
	
    response.reset();
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition","attachment; filename=ExportExcel.xls");

    OutputStream outOS=response.getOutputStream();

    BufferedOutputStream bos=new BufferedOutputStream(outOS);

    ExportExcel excel = new ExportExcel();

    excel.write(format,bos);

   // bos.flush();
    bos.close();
}
catch(Exception e){
    System.out.println("导出Excel失败！");
};

%>
