<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@page import="java.io.*"%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.ComInfoMag.*"%>
<%@ page import="com.sinosoft.lis.schema.*"%>
<%@ page import="com.sinosoft.lis.vschema.*"%>
<%@ page import="com.sinosoft.lis.ReportForm.*"%>
<%@ page import="com.sinosoft.lis.ComInfoMag.*"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import ="com.sinosoft.lis.pubfun.PubFun" %>
<%@ page import="com.sinosoft.lis.pubfun.PubFun1"%>
<%@ page import="com.sinosoft.lis.pubfun.PubFun"%>

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
	//输入参数
	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");
	//取出登录机构
	String comcode =tGI.ComCode;    //记录登陆机构
	//记录操作人信息
	String operator = tGI.Operator;
	//当前时间
	 String currentDate = PubFun.getCurrentDate();
	 String currentTime = PubFun.getCurrentTime();
	
	//接收传递的三个参数
	String Operate = new String(request.getParameter("hideOperate"))
			.toUpperCase();
	String InfoStyle = request.getParameter("infoStyle");
	String InfoIDX = request.getParameter("IDX");
	if("RETURNMODIFY".equals(Operate)){
		System.out.println("==========同意审核通过信息修改走此工作流==========="+Operate);
		if("03".equals(InfoStyle)){
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXPolicRulmage set State ='R06' "
			+"where IDX ='"
			+InfoIDX+"'";
			//R02待审核状态
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="返回修改成功";
				
			}else{
				Content ="返回修改失败";	
			}
		}else if("02".equals(InfoStyle)){
			System.out.println("=========审核规章制度通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update RulesAndRegulations set State ='R06' "
			+"where IndexNo ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="返回修改成功";
				
			}else{
				Content ="返回修改失败";	
			}
		}else if("01".equals(InfoStyle)){
			System.out.println("=========审核通知通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXNotification set Stale ='R06' "
			+"where IDX ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="返回修改成功";
				
			}else{
				Content ="返回修改失败";	
			}
		}else if("04".equals(InfoStyle)){
			System.out.println("=========审核知识园地通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXKnowledgeField set state='R06' "
			+"where Idx ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="返回修改成功";
			}else{
				Content ="返回修改失败";	
			}
		}
	}else{
	//======审核通过走此工作，流，更新state字段=====
	if("PASS".equals (Operate)){	
		System.out.println("==========审核通过=========="+Operate);
		if("03".equals(InfoStyle)){
		ExeSQL exeSql = new ExeSQL();
		String sql = "update LXPolicRulmage set State ='R03' "
		+",BAK4='"+currentDate+"' "
		+"where IDX ='"
		+InfoIDX+"'";
		//R02待审核状态
		//提示用户操作是否成功
		if(exeSql.execUpdateSQL(sql)){
			Content ="政策法规审核成功";
			FlagStr="informSucc";
		}else{
			Content ="政策法规审核失败";	
			FlagStr="informFail";
		}
		}else if("02".equals(InfoStyle)){
			System.out.println("=========审核规章制度通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update RulesAndRegulations set State ='R03'"
			+"where IndexNo ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="规章制度审核成功";
				FlagStr="informSucc";
			}else{
				Content ="规章制度审核失败";	
				FlagStr="informFail";
			}
		}else if("01".equals(InfoStyle)){
			System.out.println("=========审核通知通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXNotification set Stale ='R03' "
			+"where IDX ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="通知审核成功";
				FlagStr="informSucc";
			}else{
				Content ="通知审核失败";	
				FlagStr="informFail";
			}
		}else if("04".equals(InfoStyle)){
			System.out.println("=========审核知识园地通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXKnowledgeField set state='R03'"
			+"where Idx ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="知识园地核成功";
				FlagStr="informSucc";
			}else{
				Content ="知识园地审核失败";	
				FlagStr="informFail";
			}
		}
	//===========如果审核不通过工作符============
	}else if ("NOPASS".equals (Operate)){
		System.out.println("=========审核不通过========"+Operate);
		
		if("03".equals(InfoStyle)){
			System.out.println("=========审核政策法规不通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXPolicRulmage set State ='R04' "
			+",BAK4='"+currentDate+"' "
			+"where IDX ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="政策法规审核成功";
				FlagStr="informSucc";
			}else{
				Content ="政策法规审核失败";	
				FlagStr="informFail";
			}
		}else if("02".equals(InfoStyle)){
			System.out.println("=========审核规章制度不通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update RulesAndRegulations set State ='R04'"
			+"where IndexNo ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="规章制度审核成功";
				FlagStr="informSucc";
			}else{
				Content ="规章制度审核失败";	
				FlagStr="informFail";
			}
		}else if("01".equals(InfoStyle)){
			System.out.println("=========审核通知不通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXNotification set Stale ='R04' "
			+"where IDX ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="通知审核成功";
				FlagStr="informSucc";
			}else{
				Content ="通知审核失败";	
				FlagStr="informFail";
			}
		}else if("04".equals(InfoStyle)){
			System.out.println("=========审核知识园地不通过========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXKnowledgeField set state='R04'"
			+"where Idx ='"
			+InfoIDX+"'";
			//提示用户操作是否成功
			if(exeSql.execUpdateSQL(sql)){
				Content ="知识园地核成功";
				FlagStr="informSucc";
			}else{
				Content ="知识园地审核失败";	
				FlagStr="informFail";
			}
		}
	}
	//from表单基本信息
	LXInformationCheckSchema tLXInformationCheckSchema = 
														new LXInformationCheckSchema();
	tLXInformationCheckSchema.setInfoIDX(InfoIDX);
	tLXInformationCheckSchema.setInfoStyle(InfoStyle);
	tLXInformationCheckSchema.setCheckOption(request.getParameter("CheckOption"));
	tLXInformationCheckSchema.setCheckCom(comcode);
	tLXInformationCheckSchema.setOperator(operator);
	
	tLXInformationCheckSchema.setCheckDate(currentDate);
	
///////////////////////////////////////////////////////////////////////////////////////////////////////
	LXInformationCheckUI tLXInformationCheckUI = new LXInformationCheckUI();

	VData tVData = new VData();
	if (tGI == null) {
		System.out.println("页面失效,请重新登录");
		FlagStr = "Fail";
		Content = "页面失效,请重新登录";
	}
	//页面有效
	else {
		tVData.add(tGI);
		tVData.add(tLXInformationCheckSchema);
		try {
			boolean flag= tLXInformationCheckUI.submitData(tVData, Operate);
			if(flag){
				FlagStr = "Uscc";
			}
		} catch (Exception ex) {
			Content = "保存失败，原因是:" + ex.toString();
			FlagStr = "Fail";
		}	
		if(Operate.equals("UPDATE")){
			if("Uscc".equals(FlagStr)){
			Content ="修改成功!";
			}
		}else if(Operate.equals("DELETE")){
			if("Uscc".equals(FlagStr)){
			Content ="删除成功!";
			}
		}else if (!FlagStr.equals("Fail")) {
			tError = tLXInformationCheckUI.mErrors;
			if (!tError.needDealError()) {
				Content = " 保存成功! ";
				FlagStr = "Succ";
			} else {
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
