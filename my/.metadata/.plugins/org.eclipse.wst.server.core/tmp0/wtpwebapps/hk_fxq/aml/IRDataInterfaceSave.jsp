<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK"%>
<%
	//�������ƣ�IHDataInterfaceUISave.jsp
	//�����ܣ�
	//�������ڣ�2003-06-24
	//������  ��
	//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
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
	//������Ϣ������У�鴦��
	//�������
	System.out
			.println("===================����IRDataInterfaceUISave.jspҳ��===================");
	DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
	IRDataInterfaceDel tIRDataInterfaceDel = new IRDataInterfaceDel();

	//�������
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
	String tihoris = "";//�Ǵ���������ǿ���������־
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
			System.out.println("===========================ɾ��������===");
			tIRDataInterfaceDel.submitData(tVData, tOperate);
		} else {

			boolean flag1 = tDataInterfaceUI.submitData(tVData,
					tOperate);
			sCount = tDataInterfaceUI.getSCount();
			fCount = tDataInterfaceUI.getFCount();
			System.out
					.println("�ͻ����յȼ�����DataInterfaceUI�з��ؽ��= " + flag1);
		}
	} catch (Exception ex) {
		System.out.println("1111111111111");
		Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		FlagStr = "Fail";
	}

	if (!FlagStr.equals("Fail")) {
		tError = tDataInterfaceUI.mErrors;
		mError = tIRDataInterfaceDel.mErrors;

		if (!tError.needDealError() && sFlag.equals("cal")) {
			Content = " ��ȡ���ݳɹ�!";
			FlagStr = "Succ";
		} else {
			if (sFlag.equals("cal")) {
				Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
				FlagStr = "Fail";
			}
		}

		if (!mError.needDealError() && sFlag.equals("delete")) {
			Content = " ɾ���ɹ�!  ";
			FlagStr = "Succ";
		} else {
			if (sFlag.equals("delete")) {
				Content = " ����ʧ�ܣ�ԭ����:" + mError.getFirstError();
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

