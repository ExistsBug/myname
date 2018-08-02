<%
//程序名称：ReportOMRInput.jsp
//程序功能：
//创建日期：2006-03-17
//创建人 ：simon
//更新记录： 更新人  更新日期   更新原因/内容
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
			Content = " 删除附件失败，原因是: " + ps.mErrors;
      FlagStr = "Fail";
		}else{
			 	Content = "删除附件成功" ;
  }
%>
<html>
	<script language="javascript">
	parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>', '<%=dealno%>');
</script>
</html>