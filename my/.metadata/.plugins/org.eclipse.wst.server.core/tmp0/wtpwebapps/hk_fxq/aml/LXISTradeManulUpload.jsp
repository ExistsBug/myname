<%
//程序名称：LXISTradeManulUpload.jsp
//程序功能：数据上传
//创建日期：2007-7-12
//创建人  ：huangx
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%
	//提示信息
	String tRela  = "";
	String FlagStr = "Fail";
	String Content = "";
	boolean flag=true;
	
	//传入参数
	String path = "";
	String tDealNo = new String(request.getParameter("DealNo"));
	String tCSNM = new String(request.getParameter("CSNM"));
	GlobalInput tG = new GlobalInput();
	tG=(GlobalInput)session.getValue("GI");
	if(tG == null){
		out.println("session has expired");
		return;
	}

	try	{
		int count=0;
		path = application.getRealPath("").replace('\\','/');
		if(path.endsWith("/")) {
			path += "aml/send/";
		}
		else{
			path += "/aml/send/";
		}
		DiskFileUpload fu = new DiskFileUpload();
		// maximun size that could be uploaded
		fu.setSizeMax(10000000);
		// maximum size that will be stored in memory?
		fu.setSizeThreshold(4096);
		// temp dictionary
		fu.setRepositoryPath(path);

		List fileItems = fu.parseRequest(request);
		//System.out.println(path);
		String ImportPath = "";
		String FileName = "";

		// 依次处理每个上传的文件
		Iterator iter = fileItems.iterator();
		while (iter.hasNext())
		{
			FileItem item = (FileItem) iter.next();
			System.out.println("item.getFieldName() \t" + item.getFieldName());
			if (item.getFieldName().compareTo("ImportPath")==0)
			{
				ImportPath = item.getString();
				System.out.println("上传路径:"+ImportPath);
			}
			//忽略其他不是文件域的所有表单信息
			if (!item.isFormField())
			{
				String name = item.getName();
				System.out.println(name);
				long size = item.getSize();
				System.out.println(size);
				//2097152, 文件大小限制在2M内
				if (size > 2097152){
					flag = false;
			    	FlagStr = "Fail";
			    	Content = "文件上传失败，原因是: 上传文件大小超过2M " ;
			    	break;				
				}				
				if((name==null||name.equals("")) && size==0)
					continue;
				ImportPath= path + ImportPath;
				FileName = name.replace('\\','/');
	      		FileName = tDealNo + ".ZIP";
      			System.out.println("生成的文件名字是："+ FileName);
				//System.out.println(ImportPath);
				//保存上传的文件到指定的目录
				try	{
					item.write(new File(ImportPath + FileName));
					count = 1;
				}	
				catch(Exception e){
					System.out.println("upload file error ...");
				}
			}
		}

		//输出参数
		CErrors tError = null;
		String Result="";

		System.out.println("*********************FileName:" + FileName);
		System.out.println("*********************FilePath:" + path);
		//上传成功更新状态
	  	if (flag == true){
			// 准备传输数据 VData
			VData tVData = new VData();
			LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
			tLXISTradeMainSchema.setDealNo(tDealNo);
			tLXISTradeMainSchema.setFileName(FileName);
			tLXISTradeMainSchema.setFilePath(path);
			tVData.add( tG );
			tVData.add( tLXISTradeMainSchema );
			LXISTradeManulUploadUI tLXISTradeManulUploadUI = new LXISTradeManulUploadUI();
			if (!tLXISTradeManulUploadUI.submitData(tVData, "UPDATE")){
				Content = "文件上传失败，原因是: " + tLXISTradeManulUploadUI.mErrors.getFirstError();
				FlagStr = "Fail";
			}
			//如果在Catch中发现异常，则不从错误类中提取错误信息
			if (FlagStr == "Fail")	{
		    	tError = tLXISTradeManulUploadUI.mErrors;
			    if (!tError.needDealError())   {
			    	Content = "文件成功上传" ;
			    	FlagStr = "Succ";
			    }
			    else {
			    	FlagStr = "Fail";
			    	Content = "文件上传失败，原因是: " + tLXISTradeManulUploadUI.mErrors.getFirstError();
				}
			}
		} // end of true flag

	} // end of try
	catch(Exception e)
	{
		e.printStackTrace();
		Content = Content.trim()+"提示：异常终止!";
	}
	
%>
<html>
<script language="javascript" type="">
	parent.fraInterface.afterSubmit("<%=FlagStr%>",'<%=Content%>', '<%=tDealNo%>');
</script>
</html>
