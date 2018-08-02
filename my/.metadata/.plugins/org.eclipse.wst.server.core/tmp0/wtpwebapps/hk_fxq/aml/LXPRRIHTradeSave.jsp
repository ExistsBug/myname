<%@page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%

//在此设置导出Excel的列名，应与sql语句取出的域相对应
GlobalInput tG = new GlobalInput();
CErrors mErrors = new CErrors();
CError cError = new CError( );
tG = (GlobalInput)session.getValue("GI");
String FlagStr = "";
String Content = "";
//取界面参数
String tManageCom = request.getParameter("ManageCom");//统计机构
String tStartDate = request.getParameter("StartDate");//对应日起期
String tEndDate = request.getParameter("EndDate");//截至日期
String tCTNM=request.getParameter("CTNM");//客户号
System.out.println("----------------------tCTNM-----------------------"+tCTNM);
String[][] mResult;
    
VData tVData = new VData();
TransferData tTransferData = new TransferData();
tTransferData.setNameAndValue("ManageCom",tManageCom);
tTransferData.setNameAndValue("StartDate",tStartDate);
tTransferData.setNameAndValue("EndDate",tEndDate);
tTransferData.setNameAndValue("CTNM",tCTNM);

tVData.addElement(tG);
tVData.addElement(tTransferData);
System.out.println("准备调用后台!");
LXPRRIHTradeUI tLXPRRIHTradeUI = new LXPRRIHTradeUI();
if(!tLXPRRIHTradeUI.submitData(tVData))
{
	FlagStr = "Fail";
	Content = "导出失败，原因是："+tLXPRRIHTradeUI.mErrors.getFirstError();
}
else
{
	mResult = tLXPRRIHTradeUI.getResult();	
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
	tLB.colName = new String[]{"序号"," 报送日期"
,"交易日期        "
,"客户号          "                   
,"客户名称        "                   
,"报文名称        "                   
,"交易金额        "                   
,"机构名称        "                   
,"机构代码        "                   
};
	tLB.data=mResult;          
	tLB.row1=0;                
	tLB.col1=0;                
	tLB.InitData();            
	listLB.add(tLB);           
                        
	try{	                     
	    response.reset();      
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition","attachment; filename="+tG.Operator+"Export"+mResult[0][0]+".xls");
	    OutputStream outOS = response.getOutputStream();	
	    BufferedOutputStream bos = new BufferedOutputStream(outOS);
	    ThirdFilesMake excel = new ThirdFilesMake();
	    excel.write(format,bos);
  	  bos.flush();           
	    bos.close();           
	    System.out.println("导出成功！");
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