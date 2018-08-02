<%@page contentType="text/html;charset=GBK" %>
  <%@include file="../common/jsp/UsrCheck.jsp"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.IHIS.*"%>
  <%@page language="java" import="com.jspsmart.upload.*"%>
  <jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%
 
  String Path = application.getRealPath("/");
  System.out.println(Path);
  if (!(Path.endsWith("\\") || Path.endsWith("/"))) {
    Path = Path + "/";
  }
  System.out.println(Path);  
  String Path1 = Path + "/IHIS/File/";
  
    //�����ļ�
	int count=0;        
	String filePath = "";
	String fileName = "";
	
	filePath = Path1;

	mySmartUpload.initialize(pageContext);
	mySmartUpload.setTotalMaxFileSize(1000000);

	System.out.println("...��ʼ�����ļ�");
	try	{
		mySmartUpload.upload();
	}
	catch(Exception ex)	{
		ex.printStackTrace();
	}

	String sFlagStr = "SUCC";
	String sContent = "���سɹ�";
	try {
		fileName = mySmartUpload.getFiles().getFile(0).getFileName();
		count = mySmartUpload.save(filePath);

		System.out.println(count + " file(s) uploaded.");
	} 
	catch (Exception e) { 
		sFlagStr = "Fail";
		sContent = "����ʧ��.������Ϣ:" + e.getMessage();		
	}
   System.out.println("���ؽ���!" + fileName);
/********************�����Ѿ����ص��ļ���Ϣ*********************************/
	
  ReadFileToServerUI oReadFileToServerUI = new ReadFileToServerUI();

  TransferData oTransferData = new TransferData();
  /*****���ص�����ļ����ƺ�·��*******/
  oTransferData.setNameAndValue("fileName", filePath + fileName);
  oTransferData.setNameAndValue("DetailFileName",fileName);
  oTransferData.setNameAndValue("Path",Path);
  //����һ�ֲ��������Ӧ�Ļ�ִ�ļ����ͻ��߲���ֱ�Ӵ��ļ�������ȡ��

  GlobalInput tGlobalInput = new GlobalInput(); 
  tGlobalInput = (GlobalInput)session.getValue("GI");

  VData inVData = new VData();
  inVData.add(oTransferData);
  inVData.add(tGlobalInput);
  
  String Content = "";
  String FlagStr = "";
  String strPackageNo = "";
  if (!oReadFileToServerUI.submitData(inVData, "READ")) {
    VData rVData = oReadFileToServerUI.getResult();
    Content = " ����ʧ�ܣ�ԭ����:" + (String)rVData.get(0);
  	FlagStr = "Fail";
  }
  else {
    Content = " ����ɹ�! ";
  	FlagStr = "Succ";
    VData rVData = oReadFileToServerUI.getResult();
    strPackageNo = (String)rVData.get(0);
  }

/*****************************************************/
   
%>  

<html>
<script language="javascript">
    parent.fraInterface.queryInfoFromFile('<%=strPackageNo%>');
    //parent.fraInterface.queryInfoFromFile();
	parent.fraInterface.afterSubmit('<%=sFlagStr%>', '<%=sContent%>');
</script>
</html>                    
