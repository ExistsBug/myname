<%
//�������ƣ�ReportOMRInput.jsp
//�����ܣ�
//�������ڣ�2006-03-17
//������ ��simon
//���¼�¼�� ������  ��������   ����ԭ��/����
%>
<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.VData"%>
<%@page import="com.sinosoft.utility.CErrors"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*;"%>
<%  String FlagStr = "Succ";
    String Content = "";
    VData sVData = new VData();
    MMap mapDel = new MMap();
	  String dealno = request.getParameter("dealno");
    
            System.out.println("update LXISTradeMain set FileName = '@N', FilePath = '@N' where dealno = '" + dealno + "'");         
            mapDel.put("update LXISTradeMain set FileName = '', FilePath = '' where dealno = '" + dealno + "'", "UPDATE");
		sVData.add(mapDel);
		PubSubmit ps = new PubSubmit();

   if (!ps.submitData(sVData, "")) {
			Content = " ɾ������ʧ�ܣ�ԭ����: " + ps.mErrors;
      FlagStr = "Fail";
		}else{
			 	Content = "ɾ�������ɹ�" ;
  }
%>
<html>
	<script language="javascript">
	parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>', '<%=dealno%>');
</script>
</html>