<%@page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>

<%
//在此设置导出Excel的列名，应与sql语句取出的域相对应
GlobalInput tG  = new GlobalInput();
CErrors mErrors = new CErrors();
CError cError   = new CError( );
tG = (GlobalInput)session.getValue("GI");
String FlagStr = "";
String Content = "";
//取界面参数
String tMngCom    = request.getParameter("MngCom");//统计机构
String tStartDate = request.getParameter("StartDate");//对应日起期
String tEndDate   = request.getParameter("EndDate");//截至日期
String tCTNM      = request.getParameter("CustomerName");//客户姓名

String[][] mResult;
    
VData tVData = new VData();
TransferData tTransferData = new TransferData();
tTransferData.setNameAndValue("MngCom",tMngCom);
tTransferData.setNameAndValue("StartDate",tStartDate);
tTransferData.setNameAndValue("EndDate",tEndDate);
tTransferData.setNameAndValue("CTNM",tCTNM);

tVData.addElement(tG);
tVData.addElement(tTransferData);
System.out.println(" =========== In LXPRRISDetailSave.jsp Start ============ ");
LXPRRISDetailUI tLXPRRISDetailUI = new LXPRRISDetailUI();
if(!tLXPRRISDetailUI.submitData(tVData,""))
{
	FlagStr = "Fail";
	Content = "导出失败，原因是："+tLXPRRISDetailUI.mErrors.getFirstError();
}
else
{
	mResult = tLXPRRISDetailUI.getResult();	
	
	ThirdFilesMake.Format format = new ThirdFilesMake.Format();
	ArrayList listCell = new ArrayList();
	ArrayList listLB = new ArrayList();
	ArrayList listColWidth = new ArrayList();
	format.mListCell=listCell;
	format.mListBL=listLB;
	format.mListColWidth=listColWidth;
	ThirdFilesMake.Cell tCell=null;
	ThirdFilesMake.ListBlock tLB=null;   
	listColWidth.add(new String[]{"0","5000"});     
	tLB = new ThirdFilesMake.ListBlock("001");
	tLB.colName = new String[]
	{
		"序号","交易日期","交易类型","资金账户开户行","银行转帐资金账户","币种",
		"交易额（按原币计）","交易额（折合美元）","资金进出方向","资金进出方式",
		"经办人姓名","经办人身份证件号码","备注","交易编号"
	};
	tLB.data=mResult;          
	tLB.row1=0;                
	tLB.col1=0;                
	tLB.InitData();            
	listLB.add(tLB);           
                        
	try
	{	                     
	    response.reset();      
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition","attachment; filename="+tG.Operator+"Export"+mResult[0][0]+".xls");
	    OutputStream outOS = response.getOutputStream();	
	    BufferedOutputStream bos = new BufferedOutputStream(outOS);
	    ThirdFilesMake excel = new ThirdFilesMake();
	    excel.write(format,bos);
  	  bos.flush();           
	    bos.close();           
	    System.out.println("===== IN LXPRRISDetailSave.jsp End =====");
	    FlagStr = "Succ";      
	    Content = "导出成功！";
	}                          
	catch(Exception e)         
	{                          
			System.out.println("导出Excel失败！"+e.toString());
			FlagStr = "Fail";      
			Content = "导出失败！原因可能是："+e.toString();
	}                          
}                            
%>                           
<html>                       
<script language="javascript">
parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script></html>