<%@page contentType="text/html;charset=GBK" %>

<!--�û�У����-->
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%
//String DealType=request.getParameter("DealType");
//System.out.println("DealType======================="+DealType);
TransferData tTransferData = new TransferData();
String PathAndFileName="";
VData tVData = new VData();
GlobalInput tG = new GlobalInput();
int count=0;
boolean res = true;
LXBackDiskSave tLXBackDiskSave=new LXBackDiskSave();
String path = application.getRealPath("").replace('\\','/');

if(!path.endsWith("/")){
  path += "/";
}

System.out.println("path=========="+path);
DiskFileUpload fu = new DiskFileUpload();
// ���������û��ϴ��ļ���С,��λ:�ֽ�
System.out.println("11111");
fu.setSizeMax(10000000);
// maximum size that will be stored in memory?
// �������ֻ�������ڴ��д洢������,��λ:�ֽ�
fu.setSizeThreshold(4096);
// ����һ���ļ���С����getSizeThreshold()��ֵʱ���ݴ����Ӳ�̵�Ŀ¼
fu.setRepositoryPath(path+"/aml/back");
PathAndFileName=path+"aml/back";
//��ʼ��ȡ�ϴ���Ϣ
System.out.println("22222");
List fileItems=null;
try
{
   fileItems = fu.parseRequest(request);
}
catch (Exception e){e.printStackTrace();}
System.out.println("333333");
System.out.println("Path:"+path);
String ImportPath = "";
String FileName = "";

// ���δ���ÿ���ϴ����ļ�
Iterator iter = fileItems.iterator();
System.out.println("iter.hasNext():"+iter.hasNext());
while (iter.hasNext())
{
  FileItem item = (FileItem) iter.next();
  if (item.getFieldName().compareTo("ImportPath")==0)
  {
    ImportPath = item.getString();
    System.out.println("�ϴ�·��:"+ImportPath);
  }
  //�������������ļ�������б���Ϣ
  if (!item.isFormField())
  {

    String name = item.getName();
    long size = item.getSize();

    if((name==null||name.equals("")) && size==0)
      continue;
    ImportPath= path + "aml/back/";
//    ImportPath= path + ImportPath;

    FileName = name.replace('\\','/');
    FileName = FileName.substring(FileName.lastIndexOf("/") + 1);
    System.out.println("FileName:"+ImportPath + FileName);


    //�����ϴ����ļ���ָ����Ŀ¼
    try
    {
      item.write(new File(ImportPath + FileName));
      count = 1;
      System.out.println("count:"+count);
    }
    catch(Exception e){
      System.out.println("upload file error ...");
    }
  }
}

//�������
CErrors tError = null;
String tRela  = "";
String FlagStr = "Fail";
String Content = "";
String Result="";
PathAndFileName=PathAndFileName+"/"+FileName;
    tTransferData.setNameAndValue("FileName",PathAndFileName);
    //tTransferData.setNameAndValue("DealType",DealType);

    tG=(GlobalInput)session.getValue("GI");
 tVData.add(tTransferData);
  tVData.add(tG);
 try
  {
    res= tLXBackDiskSave.submitData(tVData,"");
    System.out.println("res="+res);
    
  }
  catch(Exception ex)
  {
    Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
    FlagStr = "Fail";
  }
  if(res==false)
  {
    Content ="����ʧ��!";
    FlagStr = "Fail";
  }
  else
  {
    Content ="����ɹ�!";
    FlagStr = "True";
  }

%>

<html>
<script language="javascript">
parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>
</html>
