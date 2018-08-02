<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п�����ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п����Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.vschema.*" %>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@ page import="com.sinosoft.utility.*" %>
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.workflow.aml.*"%>
   <%@ page import="com.spring.mail.*"%>

<%
    //�������ݱ���
	String Oper = request.getParameter("oper");
	LXISTradeMainSet tLXISTradeMainSet = new LXISTradeMainSet();
	String InpWaitForBeFileGridChk="";
	String reason="";
	//�����ϴ��ļ���ʼ
	String PathAndName="";
	int count=0;
	String path=application.getRealPath("").replace('\\','/');
	if(!path.endsWith("/")){
		path+="/";
	}
	System.out.println("@_@----------path="+path);
	DiskFileUpload dfu=new DiskFileUpload();
	// ���������û��ϴ��ļ���С,��λ:�ֽ�
	dfu.setSizeMax(10000000);
	// maximum size that will be stored in memory?
	// �������ֻ�������ڴ��д洢������,��λ:�ֽ�
	dfu.setSizeThreshold(4096);
	// ����һ���ļ���С����getSizeThreshold()��ֵʱ���ݴ����Ӳ�̵�Ŀ¼
	dfu.setRepositoryPath(path + "/istemp");
	PathAndName = path + "istemp";
	//��ʼ��ȡ�ϴ���Ϣ
	File f = new File(PathAndName);
    System.out.println("@_@----------PathAndName="+PathAndName);
    if(!f.exists()) {
    	f.mkdir();//��Ŀ¼�����ڣ����½�Ŀ¼
    	System.out.println("�½���Ŀ¼�ɹ�");
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
	
	// ���δ���ÿ���ϴ����ļ�
	Iterator iter = fileItems.iterator();
	System.out.println("@_@----------iter.hasNext():" + iter.hasNext());
	while (iter.hasNext()) {
		FileItem item = (FileItem) iter.next();
		if (item.getFieldName().compareTo("ImportPath") == 0) {
			ImportPath = item.getString();
			System.out.println("@_@----------�ϴ�·��ImportPath=" + ImportPath);
		}
		//�������������ļ�������б�����Ϣ
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
			//ȡ���ϴ��ļ��ĺ�׺��
            String tFileName = FileName.substring(FileName.lastIndexOf("."));
            System.out.println("-------------tFileName="+tFileName);
            //����Ϊ�ļ�ȡ����
			long l = new Date().getTime();
			Random r = new Random();
			int temp = r.nextInt(10000);
			newName = l + "" + temp + tFileName;
			importPath=ImportPath;
			System.out.println("-------------ImportPath="+ImportPath);
			System.out.println("-------------newName="+newName);
			
			try
			{   //�ϴ��ļ�
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
					tLXISTradeMainSchema.setDealNo(WaitForBeFileGrid1);
					tLXISTradeMainSet.add(tLXISTradeMainSchema);
				}
			}
	   }
	}
	//�����ϴ��ļ�����
    //�ռ���������
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");

    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("reason", reason);
    tTransferData.setNameAndValue("fileNo", PubFun1.CreateMaxNo("NotIsFileNo", 20));
    tTransferData.setNameAndValue("FileName", FileName);
    tTransferData.setNameAndValue("newName", newName);
    tTransferData.setNameAndValue("ImportPath", importPath);
    
    if("yes".equals(Oper)){
      tTransferData.setNameAndValue("DataState", "S3");
    }else if("no".equals(Oper)){
      tTransferData.setNameAndValue("DataState", "S3");
    }else{
      tTransferData.setNameAndValue("DataState", "L3");
    }
    //VData
    VData tVData = new VData();
    tVData.add(tGlobalInput);
    tVData.add(tTransferData);
    tVData.add(tLXISTradeMainSet);
    //��������
    //tGlobalInput = null;
    //tTransferData = null;

    //��̨�������
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();
    //���ú�̨����
    LXDataFilterCUI tLXDataFilterUI = new LXDataFilterCUI();
    AMLWorkFlowUI flowUI = new AMLWorkFlowUI();
    try
    {   
        boolean flag = false ;
        flag = flowUI.submitData(tVData,"0000009223");
         
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

    //ҳ�淴����Ϣ
    if (!tErrors.needDealError())
    {
       if("yes".equals(Oper)||"no".equals(Oper)){
            //--------------------------------------�����ʼ�����--------------------------------------------//
			                ExeSQL exeSql = new ExeSQL();
			                //=================��ѯ�Զ����ʼ�����������=======================//
					        SSRS gSSRS = new SSRS();
						    String QuerySQL3 = " select Email from EmailTable  where 1=1  and managecom ='86'and Type='00' and State='00'";
						    gSSRS = exeSql.execSQL(QuerySQL3);
						    String EmailFrom = gSSRS.GetText(1,1);
						     System.out.println("==========EmailFrom ======================="+EmailFrom); 
		             	    SSRS tSSRS = new SSRS();
		             	    String QuerySQL2="";
		             	    QuerySQL2 = " select Email from EmailTable  where 1=1  and managecom ='86' and Type='01' and State='00'";
		             	    tSSRS = exeSql.execSQL(QuerySQL2);
		             	    if(tSSRS!=null&&tSSRS.getMaxRow()>0){
		             	    String EmailTo = tSSRS.GetText(1,1);
				            System.out.println("==========email ======================="+EmailTo);
			                SpringMailTest sender=new SpringMailTest();
			              try {
				                System.out.println("==========Start =======================");
				                String Settext =" ���ã� Ŀǰ�д���˵Ŀ���������Ϣ��������¼ϵͳ����������ˣ���";
				             // sender.sendMail("caoxu@sinosoft.com.cn","fanxiqian@hxlife.com","test�ʼ�","spring Mail�ļ򵥲���");
				               sender.sendMail(EmailTo,EmailFrom,"�����������",Settext);
			                  }
			                catch (Exception e) {
				                  e.printStackTrace();
			                  }
			               }else{
			                    System.out.println("=========���������ʼ������������ݿ���û�������ַ��=======================");
			                  } 
           }
        FlagStr = "Success";
        Content = "����ɹ���";
    }
    else
    {
        FlagStr = "Fail";
        Content = "����ʧ�ܣ�ԭ���ǣ�" + tErrors.getFirstError();
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