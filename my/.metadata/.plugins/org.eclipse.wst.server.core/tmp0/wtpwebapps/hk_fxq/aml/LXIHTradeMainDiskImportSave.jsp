<%@page contentType="text/html;charset=GBK" %>

<!--用户校验类-->
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%

			String DealType=request.getParameter("DealType");
                        GlobalInput tGI = new GlobalInput();
                        tGI=(GlobalInput)session.getValue("GI");
                        String ManageCom=tGI.ManageCom;
                        String pOperator=tGI.Operator;
                        String Date=PubFun.getCurrentDate();
                        String Millis=String.valueOf(System.currentTimeMillis());
                        String filename2="";
                        if(DealType.equalsIgnoreCase("DE"))
                        {
                             filename2="IH"
                                       +"-"
                                       +ManageCom
                                       +"-"
                                       +pOperator
                                       +"-"
                                       +Date
                                       +"-"
                                       +Millis
                                       +".xls";
                        }
                        else
                        {
                             filename2="IS"
                                       +"-"
                                       +ManageCom
                                       +"-"
                                       +pOperator
                                       +"-"
                                       +Date
                                       +"-"
                                       +Millis
                                       +".xls";
                        }
			System.out.println("DealType======================="+DealType);
			TransferData tTransferData = new TransferData();
			String PathAndFileName="";
			VData tVData = new VData();
			GlobalInput tG = new GlobalInput();
			int count=0;
			boolean res = true;
			LXIHTradeDiskImportIn tLXIHTradeDiskImportIn=new LXIHTradeDiskImportIn();
			String path = application.getRealPath("").replace('\\','/');

			if(!path.endsWith("/"))
			{
			  	path += "/";
			}

			System.out.println("path=========="+path);
			DiskFileUpload fu = new DiskFileUpload();
			// 设置允许用户上传文件大小,单位:字节
			System.out.println("11111");
			fu.setSizeMax(10000000);
			// maximum size that will be stored in memory?
			// 设置最多只允许在内存中存储的数据,单位:字节
			fu.setSizeThreshold(4096);
			// 设置一旦文件大小超过getSizeThreshold()的值时数据存放在硬盘的目录
			fu.setRepositoryPath(path+"aml/import");
			PathAndFileName=path+"aml";
			//开始读取上传信息
			System.out.println("22222");
			List fileItems=null;
			try
			{
			   	fileItems = fu.parseRequest(request);
			}
			catch (Exception e)
			{
					e.printStackTrace();
			}
			System.out.println("333333");
			System.out.println("Path:"+path);
			String ImportPath = "";
			String FileName = "";

			// 依次处理每个上传的文件
			Iterator iter = fileItems.iterator();
			System.out.println("iter.hasNext():"+iter.hasNext());
			while (iter.hasNext())
			{
				  FileItem item = (FileItem) iter.next();
				  if (item.getFieldName().compareTo("ImportPath")==0)
				  {
						    ImportPath = item.getString();
						    System.out.println("上传路径:"+ImportPath);
				  }
  				//忽略其他不是文件域的所有表单信息
				  if (!item.isFormField())
				  {

						    String name = item.getName();
						    long size = item.getSize();
						    if((name==null||name.equals("")) && size==0)
                                                    continue;
                                                    ImportPath= path + "aml/import/";
								//ImportPath= path + ImportPath;
						    FileName = name.replace('\\','/');
						    FileName = FileName.substring(FileName.lastIndexOf("/") + 1);
						    System.out.println("FileName:"+ImportPath + FileName);
    						//保存上传的文件到指定的目录
						    try
						    {
								      //item.write(new File(ImportPath + FileName));
                                                                      item.write(new File(ImportPath + filename2));
								      count = 1;
								      System.out.println("count:"+count);
						    }
						    catch(Exception e)
						    {
                                                                e.printStackTrace();
						      		System.out.println("upload file error ...");
						    }
  				}
			}

			//输出参数
			CErrors tError = null;
			String tRela  = "";
			String FlagStr = "Fail";
			String Content = "";
			String Result="";
			//PathAndFileName=PathAndFileName+"/"+FileName;
			tTransferData.setNameAndValue("FilePath",PathAndFileName);
	    tTransferData.setNameAndValue("FileName",filename2);
	    tTransferData.setNameAndValue("DealType",DealType);
   		tG=(GlobalInput)session.getValue("GI");
 			tVData.add(tTransferData);
  		tVData.add(tG);
 			try
  		{
			    res= tLXIHTradeDiskImportIn.submitData(tVData,DealType);
			    System.out.println("res="+res);
  		}
		  catch(Exception ex)
		  {
			    Content = "保存失败，原因是:" + ex.toString();
			    FlagStr = "Fail";
		  }
		  if(res==false)
		  {
				  Content = "保存失败!";
				  FlagStr = "Fail";
		  }
		  else
		  {
			    Content = "保存成功!";
			    FlagStr = "True";
  		}

%>

<html>
<script language="javascript">
parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>
</html>
