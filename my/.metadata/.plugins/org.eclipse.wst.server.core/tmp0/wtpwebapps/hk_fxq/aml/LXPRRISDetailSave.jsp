<%@page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>

<%
//�ڴ����õ���Excel��������Ӧ��sql���ȡ���������Ӧ
GlobalInput tG  = new GlobalInput();
CErrors mErrors = new CErrors();
CError cError   = new CError( );
tG = (GlobalInput)session.getValue("GI");
String FlagStr = "";
String Content = "";
//ȡ�������
String tMngCom    = request.getParameter("MngCom");//ͳ�ƻ���
String tStartDate = request.getParameter("StartDate");//��Ӧ������
String tEndDate   = request.getParameter("EndDate");//��������
String tCTNM      = request.getParameter("CustomerName");//�ͻ�����

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
	Content = "����ʧ�ܣ�ԭ���ǣ�"+tLXPRRISDetailUI.mErrors.getFirstError();
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
		"���","��������","��������","�ʽ��˻�������","����ת���ʽ��˻�","����",
		"���׶��ԭ�Ҽƣ�","���׶�ۺ���Ԫ��","�ʽ��������","�ʽ������ʽ",
		"����������","���������֤������","��ע","���ױ��"
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
	    Content = "�����ɹ���";
	}                          
	catch(Exception e)         
	{                          
			System.out.println("����Excelʧ�ܣ�"+e.toString());
			FlagStr = "Fail";      
			Content = "����ʧ�ܣ�ԭ������ǣ�"+e.toString();
	}                          
}                            
%>                           
<html>                       
<script language="javascript">
parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script></html>