<%
//�������ƣ�NetReSpreadSave.jsp
//�����ܣ�
//�������ڣ� 
//������  �� liuyy
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>

<!--�û�У����-->
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.db.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
	 
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";
  
	//�������
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
	String Operate = request.getParameter("oper");
  	VData tVData = new VData();


	if(tGI==null)
	{
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
  	//ҳ����Ч
	else {
		  RiskIndentifyBL tRiskIndentifyBL=new RiskIndentifyBL();	  
		  LDCodeSchema tLDCodeSchema = new LDCodeSchema();
		  LDCodeSchema hideLDCodeSchema = new LDCodeSchema();
		  LDCodeSchema detailLDCodeSchema = new LDCodeSchema();
		  System.out.println(request.getParameter("code")+"=="+request.getParameter("codename")+"=="+request.getParameter("codealias"));
		  System.out.println(request.getParameter("hideCode")+"hidden");
		     tLDCodeSchema.setCode(request.getParameter("code"));
         tLDCodeSchema.setCodeName(request.getParameter("codename"));
         tLDCodeSchema.setCodeAlias(request.getParameter("codealias"));
         detailLDCodeSchema.setCode(request.getParameter("code"));
         detailLDCodeSchema.setCodeName(request.getParameter("codename"));
         detailLDCodeSchema.setCodeAlias(request.getParameter("codealiasD"));
         hideLDCodeSchema.setCode(request.getParameter("hideCode"));
	  	tVData.add(tGI);
	  	tVData.add(tLDCodeSchema);
	  	tVData.add(hideLDCodeSchema);
	  	tVData.add(detailLDCodeSchema);
	  	try{ 
	  	  	tRiskIndentifyBL.submitData(tVData, Operate);
		 	}catch(Exception ex){
		    	Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	
		 if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tRiskIndentifyBL.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " ����ɹ�! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
		    		FlagStr = "Fail";
		    	}
		  	}
}
%>
<html>
<script language="javascript">
	var oper='<%=Operate%>';
	if(oper=="DELETE"){
		parent.fraInterface.afterSubmit1("<%=FlagStr%>","<%=Content%>");
		}else{
			parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
			}
        
</script>
</html>