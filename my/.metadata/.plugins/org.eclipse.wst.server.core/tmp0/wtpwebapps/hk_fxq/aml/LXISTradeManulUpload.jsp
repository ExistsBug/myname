<%
//�������ƣ�LXISTradeManulUpload.jsp
//�����ܣ������ϴ�
//�������ڣ�2007-7-12
//������  ��huangx
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
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
	//��ʾ��Ϣ
	String tRela  = "";
	String FlagStr = "Fail";
	String Content = "";
	boolean flag=true;
	
	//�������
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

		// ���δ���ÿ���ϴ����ļ�
		Iterator iter = fileItems.iterator();
		while (iter.hasNext())
		{
			FileItem item = (FileItem) iter.next();
			System.out.println("item.getFieldName() \t" + item.getFieldName());
			if (item.getFieldName().compareTo("ImportPath")==0)
			{
				ImportPath = item.getString();
				System.out.println("�ϴ�·��:"+ImportPath);
			}
			//�������������ļ�������б���Ϣ
			if (!item.isFormField())
			{
				String name = item.getName();
				System.out.println(name);
				long size = item.getSize();
				System.out.println(size);
				//2097152, �ļ���С������2M��
				if (size > 2097152){
					flag = false;
			    	FlagStr = "Fail";
			    	Content = "�ļ��ϴ�ʧ�ܣ�ԭ����: �ϴ��ļ���С����2M " ;
			    	break;				
				}				
				if((name==null||name.equals("")) && size==0)
					continue;
				ImportPath= path + ImportPath;
				FileName = name.replace('\\','/');
	      		FileName = tDealNo + ".ZIP";
      			System.out.println("���ɵ��ļ������ǣ�"+ FileName);
				//System.out.println(ImportPath);
				//�����ϴ����ļ���ָ����Ŀ¼
				try	{
					item.write(new File(ImportPath + FileName));
					count = 1;
				}	
				catch(Exception e){
					System.out.println("upload file error ...");
				}
			}
		}

		//�������
		CErrors tError = null;
		String Result="";

		System.out.println("*********************FileName:" + FileName);
		System.out.println("*********************FilePath:" + path);
		//�ϴ��ɹ�����״̬
	  	if (flag == true){
			// ׼���������� VData
			VData tVData = new VData();
			LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
			tLXISTradeMainSchema.setDealNo(tDealNo);
			tLXISTradeMainSchema.setFileName(FileName);
			tLXISTradeMainSchema.setFilePath(path);
			tVData.add( tG );
			tVData.add( tLXISTradeMainSchema );
			LXISTradeManulUploadUI tLXISTradeManulUploadUI = new LXISTradeManulUploadUI();
			if (!tLXISTradeManulUploadUI.submitData(tVData, "UPDATE")){
				Content = "�ļ��ϴ�ʧ�ܣ�ԭ����: " + tLXISTradeManulUploadUI.mErrors.getFirstError();
				FlagStr = "Fail";
			}
			//�����Catch�з����쳣���򲻴Ӵ���������ȡ������Ϣ
			if (FlagStr == "Fail")	{
		    	tError = tLXISTradeManulUploadUI.mErrors;
			    if (!tError.needDealError())   {
			    	Content = "�ļ��ɹ��ϴ�" ;
			    	FlagStr = "Succ";
			    }
			    else {
			    	FlagStr = "Fail";
			    	Content = "�ļ��ϴ�ʧ�ܣ�ԭ����: " + tLXISTradeManulUploadUI.mErrors.getFirstError();
				}
			}
		} // end of true flag

	} // end of try
	catch(Exception e)
	{
		e.printStackTrace();
		Content = Content.trim()+"��ʾ���쳣��ֹ!";
	}
	
%>
<html>
<script language="javascript" type="">
	parent.fraInterface.afterSubmit("<%=FlagStr%>",'<%=Content%>', '<%=tDealNo%>');
</script>
</html>
