<%@ page contentType="text/html; charset=gb2312" language="java"
errorPage="" %>

<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.ComInfoMag.*"%>
<%@ page import="com.sinosoft.lis.schema.*"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="com.spring.mail.*"%>
<!--�û�У����-->
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%
//�������ƣ�LXPostSaves.jsp
//�����ܣ���λ��Ϣ����
//�������ڣ�2010-04-02 11:19:10
//������  ��Lips
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = ""; 
	//String tOperate=request.getParameter("hideOperate");   //��ò�������
    //tOperate=tOperate.trim();
    String FilePath="";
    String mmResult="";
	boolean flag=true;
	int count = 0;

	//�������
	String path = "";
	GlobalInput tG = new GlobalInput();
	tG=(GlobalInput)session.getValue("GI");
	if(tG == null){
		out.println("session has expired");
		return;
	}

	try	{
	
		path = application.getRealPath("").replace('\\','/');
		if(path.endsWith("/")) {
			path += "aml/Information/";
		}
		else{
			path += "/aml/Information/";
		}
		DiskFileUpload fu = new DiskFileUpload();
		// maximun size that could be uploaded 
		fu.setSizeMax(100000000);
		// maximum size that will be stored in memory?
		fu.setSizeThreshold(4096);
		// temp dictionary
		fu.setRepositoryPath(path);

		List<FileItem> fileItems = fu.parseRequest(request);
		System.out.println(path);
		String ImportPath = "";
		String FileName = "";

		// ���δ���ÿ���ϴ����ļ�
		Iterator iter = fileItems.iterator();
		
		//ȡ�ñ��ύ�ĸ�������
		
		    FileItem item1 = (FileItem) fileItems.get(0);//�������
            FileItem item3 = (FileItem) fileItems.get(2);//�ؼ���
            FileItem item4 = (FileItem) fileItems.get(4);//����IDX
            FileItem item5 = (FileItem) fileItems.get(5);//����tOperate
            
    
            String managecom=item1.getString();
            String KeyWord=item3.getString();
   
            String Idx=item4.getString();   //��ò�������
            Idx=Idx.trim();
            String tOperate=item5.getString();
            tOperate=tOperate.trim();
             
     
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
				System.out.println("�����ϴ�·��:"+name);
				String tNo = PubFun1.CreateMaxNo("AMLA", 10);
				long size = item.getSize();
				System.out.println("======��С============="+size);
				//2097152, �ļ���С������2M��10485760
				if (size > 10485760){
					flag = false;
			    	FlagStr = "Fail";
			    	Content = "�ļ��ϴ�ʧ�ܣ�ԭ����: �ϴ��ļ���С����10M " ;
			    	break;				
				}	
				if((name==null||name.equals("")) && size==0){
				    //FilePath=null;
					continue;
					}
				else{
			    name="ZS" +tNo + name.substring(name.lastIndexOf("."));			
				ImportPath= path + ImportPath;
				System.out.println("111111111111111��"+ ImportPath);
				FileName = name.replace('\\','/');
      			System.out.println("���ɵ��ļ������ǣ�"+ FileName);
      		    FilePath=ImportPath + FileName;
      		    System.out.println("���ɵ��ļ�������4444��"+ FilePath);
				//System.out.println(ImportPath);
				//�����ϴ����ļ���ָ����Ŀ¼
				
				try	{
					item.write(new File(FilePath));
					count = 1;
				}	
				catch(Exception e){
					System.out.println("upload file error ...");
				  }
				}
			
		   }
		}
		/*
		    if (tOperate.equals("UPDATE||MAIN")){ 
		     ExeSQL exeSql = new ExeSQL();
			SSRS rss = new SSRS();
			String QuerySQL = "select State from LXKnowledgeField  where  IDX ='"
				+Idx+"'";
			rss = exeSql.execSQL(QuerySQL);
			if(rss!=null&&rss.getMaxRow()>0){
			   String state = rss.GetText(1,1);
			   System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" + state);
			//����Ҫ����˲�ͨ����״̬�������Ӧ��˱���������Ϊ��Ч
			    if("R04".equals(state)||"R06".equals(state)){
		     	System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" + FilePath);
				exeSql = new ExeSQL();
				String sql = "update LXInformationCheck set BAK1 ='False' "  
					+"where infoIDX ='"+Idx+"'"
					+" and infoStyle='04'";
			    if(!exeSql.execUpdateSQL(sql)){
				       flag = false;
			          }   
			        System.out.println("==========��˲�ͨ�����ݽ�����˱��еĶ�Ӧ������Ϊ��Ч=======================");
		         }
		      }
          }
          */
   		
		//�������
		String Result="";

		//System.out.println("*********************FileName:" + FileName);
		System.out.println("*********************FilePath:" + FilePath);
		//�ϴ��ɹ�����״̬
		if (flag == true){
		    
			// ׼���������� VData
			//String Operate = new String(request.getParameter("hideOperate")).toUpperCase();
	        LXKnowledgeFieldSchema tLXKnowledgeFieldSchema = new LXKnowledgeFieldSchema();
	        System.out.println("��ȡidx:"+Idx);
	        tLXKnowledgeFieldSchema.setIDX(Idx);
	       // tLXKnowledgeFieldSchema.setPubType(request.getParameter("PubType"));
	        tLXKnowledgeFieldSchema.setManageCom(managecom);
	       // tLXKnowledgeFieldSchema.setState(request.getParameter("State"));
	        tLXKnowledgeFieldSchema.setKeyWord(KeyWord); 
	        tLXKnowledgeFieldSchema.setFilePath(FilePath);
	        tLXKnowledgeFieldSchema.setOperator(tG.Operator);
	        LXKnowledgeInfoUI tLXKnowledgeInfoUI = new LXKnowledgeInfoUI();
             VData tVData = new VData();
			if(tG==null)
	          {
		         System.out.println("ҳ��ʧЧ,�����µ�½");
		          FlagStr = "Fail";
		         Content = "ҳ��ʧЧ,�����µ�½";
	           }
  	       //ҳ����Ч
	else 
	{
		  	    tVData.add(tG);
		      	tVData.add(tLXKnowledgeFieldSchema);
		  
			try
			{ 
				tLXKnowledgeInfoUI.submitData(tVData, tOperate); 
			}
			catch(Exception ex)
			{
			
			    Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
			    System.out.println("rrrrrr:"+Content);
			    FlagStr = "Fail";
			}
			
			if (!FlagStr.equals("Fail"))
			{
			
				tError = tLXKnowledgeInfoUI.mErrors;
				if (!tError.needDealError())
				{
				  if (tOperate.equals("INSERT||MAIN"))
                       { mmResult = tLXKnowledgeInfoUI.getResult();
                        }
                    if (tOperate.equals("UPDATE||MAIN"))
                       { mmResult = tLXKnowledgeFieldSchema.getIDX();
                        } 
                    if (tOperate.equals("DELETELOAD||MAIN"))
                       { mmResult = tLXKnowledgeInfoUI.getResult();
                        }
                    if (tOperate.equals("UPLOAD||MAIN"))
                       { mmResult = tLXKnowledgeInfoUI.getResult();
                            
                             //=================��ѯ�Զ����ʼ�����������=======================//
                            ExeSQL exeSql = new ExeSQL();
					        SSRS gSSRS = new SSRS();
						    String QuerySQL3 = " select Email from EmailTable  where 1=1  and managecom ='86'and Type='00' and State='00'";
						    gSSRS = exeSql.execSQL(QuerySQL3);
						    String EmailFrom = gSSRS.GetText(1,1);
						    System.out.println("==========EmailFrom ======================="+EmailFrom); 
		             	    SSRS tSSRS = new SSRS();
		             	    String QuerySQL2="";
		             	    QuerySQL2 = " select Email from EmailTable  where 1=1 and managecom ='86' and Type='01' and State='00'";
		             	    tSSRS = exeSql.execSQL(QuerySQL2);
		             	    if(tSSRS!=null&&tSSRS.getMaxRow()>0){
		             	    String EmailTo = tSSRS.GetText(1,1);
				            System.out.println("==========email ======================="+EmailTo);
			                SpringMailTest sender=new SpringMailTest();
			              try {
				                System.out.println("==========Start =======================");
				                String Settext ="";
		             	        Settext =" ���ã� Ŀǰ����֪ʶ԰�����ݴ���ˣ�������¼ϵͳ������ˣ���";
		             	        sender.sendMail(EmailTo,EmailFrom,"֪ʶ԰�����ݴ����",Settext);
			                  }
			                catch (Exception e) {
				                  e.printStackTrace();
			                  }
			               }else{
			                    System.out.println("=========���������ʼ������������ݿ���û�������ַ��=======================");
			                  } 
			            //=============================================================================================================//
			  
                        }     
                            
					Content = " ����ɹ�! ";
					FlagStr = "Succ";
				}
				else
				{
				    mmResult = tLXKnowledgeFieldSchema.getIDX();
				    System.out.println("eeeeeeeeeeeeeee"+mmResult);
					Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
					FlagStr = "Fail";
				}
			}
			
	  }
   }
}
catch(Exception e)
	{
		e.printStackTrace();
		Content = Content.trim()+"��ʾ���쳣��ֹ!";
	}
%>

<html>
	<script language="JavaScript">
	parent.fraInterface.fm.all('IDX').value = '<%=mmResult%>';
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>'); 
    </script>
    
</html>
