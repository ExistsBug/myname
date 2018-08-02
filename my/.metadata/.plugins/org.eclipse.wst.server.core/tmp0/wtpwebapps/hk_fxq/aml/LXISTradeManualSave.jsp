<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00, 1.01
 * @date     : 2007-07-12, 2007-07-26
 * @direction: 大额删除交易信息
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.db.*" %>
<%@ page import="com.sinosoft.utility.*" %>


<%
	// 输出参数
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";
  
	//输入参数
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
	String Operate = new String(request.getParameter("hideOperate")).toUpperCase();
	String cDealNo = new String(request.getParameter("DealNo"));	
	LXISTradeMainDelBL tLXISTradeMainDelBL = new LXISTradeMainDelBL();
  	VData tVData = new VData();

	if(tGI==null)
	{
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
  	//页面有效
	else {
		LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
		LXISTradeMainDB tLXISTradeMainDB = new LXISTradeMainDB();
		tLXISTradeMainDB.setDealNo(cDealNo);
		if (!tLXISTradeMainDB.getInfo()){
		    Content = "保存失败，原因是:" + tLXISTradeMainDB.mErrors.getFirstError();
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
			    Content = "保存失败，原因是:" + ex.toString();
			    FlagStr = "Fail";
			}
			if (!FlagStr.equals("Fail")){
				tError = tLXISTradeMainDB.mErrors;
				if (!tError.needDealError()){
					Content = " 保存成功! ";
					FlagStr = "Succ";
				}else{
					Content = " 保存失败，原因是:" + tError.getFirstError();
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
