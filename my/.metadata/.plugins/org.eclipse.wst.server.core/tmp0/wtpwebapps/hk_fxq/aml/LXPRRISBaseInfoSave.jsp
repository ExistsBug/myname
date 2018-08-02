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
System.out.println(" =========== In LXPRRISBaseInfoSave.jsp Start ============ ");
LXPRRISBaseInfoUI tLXPRRISBaseInfoUI = new LXPRRISBaseInfoUI();
if(!tLXPRRISBaseInfoUI.submitData(tVData,""))
{
	FlagStr = "Fail";
	Content = "导出失败，原因是："+tLXPRRISBaseInfoUI.mErrors.getFirstError();
}
else
{
	mResult = tLXPRRISBaseInfoUI.getResult();	
	
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
		"序号"," 金融机构名称","金融机构代码","投保人名称/姓名","投保人类型","投保人身份证件/证明文件类型",
		"投保人身份证件/证明文件号码","客户职业或行业","对公客户法定代表姓名","对公客户法定代表人身份证件类型",
		"对公客户法定代表人证件代码","被保险人总数","被保险人名称/姓名","被保险人身份证件/证明文件类",
		"被保险人身份证件/证明文件号码","投保人与被保险人的关系","受益人总数","受益人名称/姓名","受益人身份证件/证明文件类型",
		"受益人身份证件/证明文件号码","可疑交易特征","保险合同总分数","保险种类","保险合同号","保险名称保险期间",
		"保险标的","保险金额","保险费","缴费方式","可疑行为描述","采取措施","其他需要说明的情况","交易编号"
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
	    System.out.println("===== IN LXPRRISBaseInfoSave.jsp End =====");
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