<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00, 1.01
 * @date     : 2007-07-12, 2007-07-26
 * @direction: ���ɾ��������Ϣ
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.db.*" %>
<%@ page import="com.sinosoft.utility.*" %>


<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";
  
	//�������
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
	String Operate = new String(request.getParameter("hideOperate")).toUpperCase();
	String cDealNo = new String(request.getParameter("DealNo"));	
	LXISTradeMainDelBL tLXISTradeMainDelBL = new LXISTradeMainDelBL();
  	VData tVData = new VData();

	if(tGI==null)
	{
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
  	//ҳ����Ч
	else {
		LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
		LXISTradeMainDB tLXISTradeMainDB = new LXISTradeMainDB();
		tLXISTradeMainDB.setDealNo(cDealNo);
		if (!tLXISTradeMainDB.getInfo()){
		    Content = "����ʧ�ܣ�ԭ����:" + tLXISTradeMainDB.mErrors.getFirstError();
		    FlagStr = "Fail";		
		}else{
			tLXISTradeMainSchema = tLXISTradeMainDB.getSchema();		
			String sDataState = tLXISTradeMainSchema.getDataState();
			if (sDataState == null || "".equals(sDataState)){
				tLXISTradeMainSchema.setDataState(" ");
			}
		  	tVData.add(tGI);
		  	tVData.add(cDealNo);
		  	//tVData.add(tLXISTradeMainSchema);	 	  	
			try{ 
				tLXISTradeMainDelBL.submitData(tVData, Operate);
			 }catch(Exception ex){
			    Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
			    FlagStr = "Fail";
			}
			if (!FlagStr.equals("Fail")){
				tError = tLXISTradeMainDB.mErrors;
				if (!tError.needDealError()){
					Content = " ����ɹ�! ";
					FlagStr = "Succ";
				}else{
					Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
					FlagStr = "Fail";
				}
			}
		} 
	}
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
