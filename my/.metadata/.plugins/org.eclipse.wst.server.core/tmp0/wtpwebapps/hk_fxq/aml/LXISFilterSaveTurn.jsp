<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.db.*" %>
<%@ page import="com.sinosoft.lis.vschema.*" %>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@ page import="com.sinosoft.utility.*" %>
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.workflow.aml.*"%>

<%
    //接收数据变量
	String Oper = request.getParameter("oper");
	LXISTradeMainSet tLXISTradeMainSet = new LXISTradeMainSet();
	String InpWaitForBeFileGridChk="";
	String reason="";
	CErrors tError = null;
	String sflag = "";
	//处理上传文件开始
	String PathAndName="";
	int count=0;
	String path=application.getRealPath("").replace('\\','/');
	if(!path.endsWith("/")){
		path+="/";
	}
	System.out.println("@_@----------path="+path);
	DiskFileUpload dfu=new DiskFileUpload();
	// 设置允许用户上传文件大小,单位:字节
	dfu.setSizeMax(10000000);
	// maximum size that will be stored in memory?
	// 设置最多只允许在内存中存储的数据,单位:字节
	dfu.setSizeThreshold(4096);
	// 设置一旦文件大小超过getSizeThreshold()的值时数据存放在硬盘的目录
	dfu.setRepositoryPath(path + "/istemp");
	PathAndName = path + "istemp";
	//开始读取上传信息
	File f = new File(PathAndName);
    System.out.println("@_@----------PathAndName="+PathAndName);
    if(!f.exists()) {
    	f.mkdir();//若目录不存在，则新建目录
    	System.out.println("新建立目录成功");
    }
    List fileItems = null;
	try {
		fileItems = dfu.parseRequest(request);
	} catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println("Path:" + path);
	String ImportPath = "";
	String importPath = "";
	String FileName = "";
	String newName = "";
	
	// 依次处理每个上传的文件
	Iterator iter = fileItems.iterator();
	System.out.println("@_@----------iter.hasNext():" + iter.hasNext());
	while (iter.hasNext()) {
		FileItem item = (FileItem) iter.next();
		if (item.getFieldName().compareTo("ImportPath") == 0) {
			ImportPath = item.getString();
			System.out.println("@_@----------上传路径ImportPath=" + ImportPath);
		}
		//忽略其他不是文件域的所有表单信息
		if (!item.isFormField()) {
			String name = item.getName();
			long size = item.getSize();

			if ((name == null || name.equals("")) && size == 0)
				continue;
			ImportPath = path + "istemp/";

			FileName = name.replace('\\', '/');
			FileName = FileName
					.substring(FileName.lastIndexOf("/") + 1);
			System.out.println("FileName:" + ImportPath + FileName);
			//取得上传文件的后缀名
            String tFileName = FileName.substring(FileName.lastIndexOf("."));
            System.out.println("-------------tFileName="+tFileName);
            //重新为文件取别名
			long l = new Date().getTime();
			Random r = new Random();
			int temp = r.nextInt(10000);
			newName = l + "" + temp + tFileName;
			importPath=ImportPath;
			System.out.println("-------------ImportPath="+ImportPath);
			System.out.println("-------------newName="+newName);
			
			try
			{   //上传文件
			    PathAndName = ImportPath + newName;
				item.write(new File(PathAndName));
				count = 1;
				System.out.println("count:" + count);
			}
			catch(Exception ex)
			{
			    System.out.println("upload file error ...");
			}
	   }else{
		    if (item.getFieldName().compareTo("reason")==0){
		    	reason=item.getString();
				System.out.println("@_@----------reason="+reason);
			}
			if (item.getFieldName().compareTo("InpWaitForBeFileGridSel")==0){
				InpWaitForBeFileGridChk=item.getString().trim();
				System.out.println("@_@----------InpWaitForBeFileGridChk="+InpWaitForBeFileGridChk);
			}
			if(InpWaitForBeFileGridChk.equals("1")){
				if (item.getFieldName().compareTo("WaitForBeFileGridNo")==0){
					System.out.println("@_@----------WaitForBeFileGridNo="+item.getString());
				}
				if (item.getFieldName().compareTo("WaitForBeFileGrid1")==0){
					String WaitForBeFileGrid1=item.getString();
					System.out.println("@_@----------WaitForBeFileGrid1="+item.getString());
					LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
					LXISTradeMainDB tLXISTradeMainDB = new LXISTradeMainDB();
					tLXISTradeMainSchema.setDealNo(WaitForBeFileGrid1);
					tLXISTradeMainDB.setDealNo(WaitForBeFileGrid1);
					//tLXISTradeMainSet.add(tLXISTradeMainSchema);
					tLXISTradeMainSet = tLXISTradeMainDB.query();
					if(tLXISTradeMainSet.get(1).getManageCom().length()==4){
					    sflag = "U1";
					}else{
					    sflag = "D1";
					}
				}
			}
	   }
	}
	//处理上传文件结束
    //收集整理数据
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");

    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("reason", reason);
    tTransferData.setNameAndValue("fileNo", PubFun1.CreateMaxNo("NotIsFileNo", 20));
    tTransferData.setNameAndValue("FileName", FileName);
    tTransferData.setNameAndValue("newName", newName);
    tTransferData.setNameAndValue("ImportPath", importPath);
    
   
    tTransferData.setNameAndValue("DataState", sflag);
   
    //VData
    VData tVData = new VData();
    tVData.add(tGlobalInput);
    tVData.add(tTransferData);
    tVData.add(tLXISTradeMainSet);
    //垃圾处理
    //tGlobalInput = null;
    //tTransferData = null;

    //后台处理标记
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();
    //调用后台处理
    LXDataFilterFUI tLXDataFilterUI = new LXDataFilterFUI();
    AMLWorkFlowUI flowUI = new AMLWorkFlowUI();
    try
    {   
        boolean flag = false ;
        String managecom = tGlobalInput.ManageCom;
        flag = flowUI.submitData(tVData,"0000009230");
        if(!flag){
            tErrors.copyAllErrors(flowUI.getErrors());   
        }else if (!tLXDataFilterUI.submitData(tVData, Oper))
        {
            tErrors.copyAllErrors(tLXDataFilterUI.getErrors());
        }
    }catch(Exception e)
    {
    	e.printStackTrace();
    }

    tLXDataFilterUI = null;
    tVData = null;

    //页面反馈信息
    if (!tErrors.needDealError())
    {
        FlagStr = "Success";
        Content = "分发成功！";
    }
    else
    {
        FlagStr = "Fail";
        Content = "分发失败，原因是：" + tErrors.getFirstError();
    }
    tErrors = null;
%>


<html>
    <script language="JavaScript">
        try
        {
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
        }
        catch (ex)
        {
            alert('<%=Content%>');
        }
    </script>
</html>
