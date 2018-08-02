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
  
    //上载文件
	int count=0;        
	String filePath = "";
	String fileName = "";
	
	filePath = Path1;

	mySmartUpload.initialize(pageContext);
	mySmartUpload.setTotalMaxFileSize(1000000);

	System.out.println("...开始上载文件");
	try	{
		mySmartUpload.upload();
	}
	catch(Exception ex)	{
		ex.printStackTrace();
	}

	String sFlagStr = "SUCC";
	String sContent = "上载成功";
	try {
		fileName = mySmartUpload.getFiles().getFile(0).getFileName();
		count = mySmartUpload.save(filePath);

		System.out.println(count + " file(s) uploaded.");
	} 
	catch (Exception e) { 
		sFlagStr = "Fail";
		sContent = "上载失败.错误信息:" + e.getMessage();		
	}
   System.out.println("上载结束!" + fileName);
/********************处理已经上载的文件信息*********************************/
	
  ReadFileToServerUI oReadFileToServerUI = new ReadFileToServerUI();

  TransferData oTransferData = new TransferData();
  /*****上载的相关文件名称和路径*******/
  oTransferData.setNameAndValue("fileName", filePath + fileName);
  oTransferData.setNameAndValue("DetailFileName",fileName);
  oTransferData.setNameAndValue("Path",Path);
  //增加一种参数保存对应的回执文件类型或者不用直接从文件名称来取得

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
    Content = " 处理失败，原因是:" + (String)rVData.get(0);
  	FlagStr = "Fail";
  }
  else {
    Content = " 处理成功! ";
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
