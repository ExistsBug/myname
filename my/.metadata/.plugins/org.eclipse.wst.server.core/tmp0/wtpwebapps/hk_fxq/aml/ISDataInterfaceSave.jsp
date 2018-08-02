
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%><%@include
	file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK"%>
<%
	//程序名称：DataInterfaceUISave.jsp
	//程序功能：
	//创建日期：2003-06-24
	//创建人  ：
	//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@page import="com.sinosoft.lis.calfactor.*"%>
<%
	//接收信息，并作校验处理。
	//输入参数
	System.out.println("========进入ISDataInterfaceSave.jsp页面==========");
	DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
	Tishu_IS_ResDeal tTishu_IS_ResDeal = new Tishu_IS_ResDeal();
	//输出参数
	CErrors tError = null;
	String tOperate = request.getParameter("sFlag");
	tOperate = tOperate.trim();
	String FlagStr = "";
	String Content = "";

	GlobalInput tG = new GlobalInput();
	tG = (GlobalInput) session.getValue("GI");
	VData tVData = new VData();

	String sFlag = request.getParameter("sFlag");
	String startDate = "";
	String endDate = "";
	String ihoris = request.getParameter("STCR");
	if(ihoris==null||"".equals(ihoris))
	{
		ihoris = "IS";
	}else{
		ihoris = "ISX0"+ihoris;
	}
	
	String calmngcom = "";
	int sCount = 0;
	int fCount = 0;

	startDate = request.getParameter("StartDate");
	endDate = request.getParameter("EndDate");
	if (startDate.length() == 8) {
		startDate = startDate.substring(0, 4) + "-"
				+ startDate.substring(4, 6) + "-"
				+ startDate.substring(6, 8);
	}
	if (endDate.length() == 8) {
		endDate = endDate.substring(0, 4) + "-"
				+ endDate.substring(4, 6) + "-"
				+ endDate.substring(6, 8);
	}
	calmngcom = request.getParameter("CalMngCom");

	tVData.add(sFlag);
	tVData.add(startDate);
	tVData.add(endDate);
	tVData.add(ihoris);
	tVData.add(calmngcom);
	tVData.add(tG);
	System.out.println("操作标志============== " + sFlag);
	System.out.println("交易发生起期========== " + startDate);
	System.out.println("交易发生止期========== " + endDate);
	System.out.println("可疑或大额提数标志==== " + endDate);
	System.out.println("提取机构============== " + calmngcom);
	try {
		boolean TFLAG = tDataInterfaceUI.submitData(tVData, tOperate);
		sCount = tDataInterfaceUI.getSCount();
		fCount = tDataInterfaceUI.getFCount();
		System.out.println("数据提交到DataInterfaceUI中，操作结果为= " + TFLAG);
		if (!TFLAG) {
			FlagStr = "Fail";
		}
	} catch (Exception ex) {
		System.out.println("在ISDataInterfaceSave.jsp中捕获异常！");
		Content = "操作失败，原因是:" + ex.toString();
		FlagStr = "Fail";
	}
	//获取错误提示信息
	tError = tDataInterfaceUI.mErrors;
	if (!FlagStr.equals("Fail")) {
		if (!tError.needDealError() && sFlag.equals("cal")) {
			Content = "操作成功! <font color=red>提取客户信息成功数目：" + sCount
					+ "条。提取客户信息失败数目：" + fCount + "条</font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("recal")) {
			Content = "操作成功! <font color=red>重新提取客户信息成功数目：" + sCount
					+ "条。重新提取客户信息失败数目：" + fCount + "条</font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("fillcal")) {
			Content = "补提客户信息成功! <font color=red>客户信息成功总数目：" + sCount
					+ "条。补提客户信息失败总数目：" + fCount + "条</font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("delete")) {
			Content = "操作成功! <font color=red>删除数据数目："
					+ (sCount + fCount) + "条</font>";
			FlagStr = "Succ";
		} else {
			try {
				Content = "操作失败,原因是:" + tError.getFirstError();
				FlagStr = "Fail";
			} catch (Exception e) {
				System.out.println(e.toString());
				Content = " 操作失败，原因是:" + e.toString();
				FlagStr = "Fail";
			}
		}
	} else {
		try {
			Content = "操作失败,原因是:" + tError.getFirstError();
			FlagStr = "Fail";
		} catch (Exception e) {
			System.out.println(e.toString());
			Content = "操作失败,原因是:" + e.toString();
			FlagStr = "Fail";
		}
	}
	//如果没有获得完整的失败提示信息,做些美化提示
	if("操作失败,原因是:".equals(Content)){
		Content = "操作失败！";
	}
%>
<html>
<script language="javascript">
	parent.fraInterface.afterSubmit("<%=FlagStr%>", "<%=Content%>");
</script>
</html>

