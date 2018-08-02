<%@ page contentType="text/html; charset=gb2312" language="java"
errorPage="" %>

<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.ComInfoMag.*"%>
<%@ page import="com.sinosoft.lis.schema.*"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="com.spring.mail.*"%>
<!--用户校验类-->
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%
//程序名称：LXPostSaves.jsp
//程序功能：岗位信息处理
//创建日期：2010-04-02 11:19:10
//创建人  ：Lips
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%
	// 输出参数
	CErrors tError = null;
	String FlagStr = "";
	String Content = ""; 
	//String tOperate=request.getParameter("hideOperate");   //获得操作符号
    //tOperate=tOperate.trim();
    String FilePath="";
    String mmResult="";
	boolean flag=true;
	int count = 0;

	//传入参数
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

		// 依次处理每个上传的文件
		Iterator iter = fileItems.iterator();
		
		//取得表单提交的各个参数
		
		    FileItem item1 = (FileItem) fileItems.get(0);//管理机构
            FileItem item3 = (FileItem) fileItems.get(2);//关键字
            FileItem item4 = (FileItem) fileItems.get(4);//隐藏IDX
            FileItem item5 = (FileItem) fileItems.get(5);//隐藏tOperate
            
    
            String managecom=item1.getString();
            String KeyWord=item3.getString();
   
            String Idx=item4.getString();   //获得操作符号
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
				System.out.println("上传路径:"+ImportPath);
			}
			//忽略其他不是文件域的所有表单信息
			if (!item.isFormField())
			{
				String name = item.getName();
				System.out.println("界面上传路径:"+name);
				String tNo = PubFun1.CreateMaxNo("AMLA", 10);
				long size = item.getSize();
				System.out.println("======大小============="+size);
				//2097152, 文件大小限制在2M内10485760
				if (size > 10485760){
					flag = false;
			    	FlagStr = "Fail";
			    	Content = "文件上传失败，原因是: 上传文件大小超过10M " ;
			    	break;				
				}	
				if((name==null||name.equals("")) && size==0){
				    //FilePath=null;
					continue;
					}
				else{
			    name="ZS" +tNo + name.substring(name.lastIndexOf("."));			
				ImportPath= path + ImportPath;
				System.out.println("111111111111111："+ ImportPath);
				FileName = name.replace('\\','/');
      			System.out.println("生成的文件名字是："+ FileName);
      		    FilePath=ImportPath + FileName;
      		    System.out.println("生成的文件名字是4444："+ FilePath);
				//System.out.println(ImportPath);
				//保存上传的文件到指定的目录
				
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
			//假如要是审核不通过的状态，将其对应审核表中数据置为无效
			    if("R04".equals(state)||"R06".equals(state)){
		     	System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" + FilePath);
				exeSql = new ExeSQL();
				String sql = "update LXInformationCheck set BAK1 ='False' "  
					+"where infoIDX ='"+Idx+"'"
					+" and infoStyle='04'";
			    if(!exeSql.execUpdateSQL(sql)){
				       flag = false;
			          }   
			        System.out.println("==========审核不通过数据将其审核表中的对应数据置为无效=======================");
		         }
		      }
          }
          */
   		
		//输出参数
		String Result="";

		//System.out.println("*********************FileName:" + FileName);
		System.out.println("*********************FilePath:" + FilePath);
		//上传成功更新状态
		if (flag == true){
		    
			// 准备传输数据 VData
			//String Operate = new String(request.getParameter("hideOperate")).toUpperCase();
	        LXKnowledgeFieldSchema tLXKnowledgeFieldSchema = new LXKnowledgeFieldSchema();
	        System.out.println("获取idx:"+Idx);
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
		         System.out.println("页面失效,请重新登陆");
		          FlagStr = "Fail";
		         Content = "页面失效,请重新登陆";
	           }
  	       //页面有效
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
			
			    Content = "保存失败，原因是:" + ex.toString();
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
                            
                             //=================查询自动发邮件机器人邮箱=======================//
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
		             	        Settext =" 您好！ 目前有条知识园地数据待审核，请您登录系统进行审核！！";
		             	        sender.sendMail(EmailTo,EmailFrom,"知识园地数据待审核",Settext);
			                  }
			                catch (Exception e) {
				                  e.printStackTrace();
			                  }
			               }else{
			                    System.out.println("=========跳过发送邮件程序（由于数据库中没有邮箱地址）=======================");
			                  } 
			            //=============================================================================================================//
			  
                        }     
                            
					Content = " 保存成功! ";
					FlagStr = "Succ";
				}
				else
				{
				    mmResult = tLXKnowledgeFieldSchema.getIDX();
				    System.out.println("eeeeeeeeeeeeeee"+mmResult);
					Content = " 保存失败，原因是:" + tError.getFirstError();
					FlagStr = "Fail";
				}
			}
			
	  }
   }
}
catch(Exception e)
	{
		e.printStackTrace();
		Content = Content.trim()+"提示：异常终止!";
	}
%>

<html>
	<script language="JavaScript">
	parent.fraInterface.fm.all('IDX').value = '<%=mmResult%>';
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>'); 
    </script>
    
</html>
