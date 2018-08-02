<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK"%>
<%
	//程序名称：IHDataInterfaceUISave.jsp
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
	System.out
			.println("===================进入IRDataInterfaceUISave.jsp页面===================");
	DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
	IRDataInterfaceDel tIRDataInterfaceDel = new IRDataInterfaceDel();

	//输出参数
	CErrors tError = null;
	CErrors mError = null;
	String tOperate = request.getParameter("sFlag");
	tOperate = tOperate.trim();
	String FlagStr = "Fail";
	String Content = "";
	GlobalInput tG = new GlobalInput();
	tG = (GlobalInput) session.getValue("GI");
	String sFlag = request.getParameter("sFlag");
	String startDate = "";
	String endDate = "";
	String backDate = "";
	String tihoris = "";//是大额提数还是可疑提数标志
	String calmngcom = "";
	String operator = tG.Operator;
	int sCount = 0;
	int fCount = 0;
	VData tVData = new VData();
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
	tihoris = "IR";
	calmngcom = tG.ComCode;
	tVData.add(sFlag);
	tVData.add(startDate);
	tVData.add(endDate);
	tVData.add(tihoris);
	tVData.add(calmngcom);
	tVData.add(tG);
	System.out.println("====sFlag========" + sFlag);
	System.out.println("====startDate====" + startDate);
	System.out.println("====endDate======" + endDate);
	System.out.println("====tihoris======" + tihoris);
	System.out.println("====calmngcom====" + calmngcom);
	FlagStr = "";
	try {
		if (sFlag.equals("delete")) {
			System.out.println("===========================删除数据信===");
			tIRDataInterfaceDel.submitData(tVData, tOperate);
		} else {

			boolean flag1 = tDataInterfaceUI.submitData(tVData,
					tOperate);
			sCount = tDataInterfaceUI.getSCount();
			fCount = tDataInterfaceUI.getFCount();
			System.out
					.println("客户风险等级提数DataInterfaceUI中返回结果= " + flag1);
		}
	} catch (Exception ex) {
		System.out.println("1111111111111");
		Content = "操作失败，原因是:" + ex.toString();
		FlagStr = "Fail";
	}

	if (!FlagStr.equals("Fail")) {
		tError = tDataInterfaceUI.mErrors;
		mError = tIRDataInterfaceDel.mErrors;

		if (!tError.needDealError() && sFlag.equals("cal")) {
			Content = " 提取数据成功!";
			FlagStr = "Succ";
		} else {
			if (sFlag.equals("cal")) {
				Content = " 操作失败，原因是:" + tError.getFirstError();
				FlagStr = "Fail";
			}
		}

		if (!mError.needDealError() && sFlag.equals("delete")) {
			Content = " 删除成功!  ";
			FlagStr = "Succ";
		} else {
			if (sFlag.equals("delete")) {
				Content = " 操作失败，原因是:" + mError.getFirstError();
				FlagStr = "Fail";
			}
		}
	}
%>
<html>
	<script language="javascript">
parent.fraInterface.afterSubmit("<%=FlagStr%>", "<%=Content%>");
</script>
</html>

