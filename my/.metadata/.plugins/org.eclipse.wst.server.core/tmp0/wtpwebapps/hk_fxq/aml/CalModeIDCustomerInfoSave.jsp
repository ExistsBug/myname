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
			.println("===================����DataInterfaceUISave.jspҳ��===================");
	DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
	Tishu_IH_ResDeal tTishu_IH_ResDeal = new Tishu_IH_ResDeal();
	IDDataInterfaceDel tIDDataInterfaceDel = new IDDataInterfaceDel();

	//�������
	CErrors tError = null;
	CErrors sError = null;
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
	String tihoris = "";
	String calmngcom = "";
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
	tihoris = "ID";
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
			tIDDataInterfaceDel.submitData(tVData, tOperate);
		} else {
			boolean TFLAG = tDataInterfaceUI.submitData(tVData,
					tOperate);
			sCount = tDataInterfaceUI.getSCount();
			fCount = tDataInterfaceUI.getFCount();
			System.out.println("�ͻ�����Զ�ʶ������DataInterfaceUI�з��ؽ��= "
					+ TFLAG);
			if (!TFLAG) {
				FlagStr = "Fail";
			}
		}
	} catch (Exception ex) {
		System.out.println("1111111111111");
		Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		FlagStr = "Fail";
	}
	//��ô�����Ϣ
	tError = tDataInterfaceUI.mErrors;
	sError = tIDDataInterfaceDel.mErrors;
	if (!FlagStr.equals("Fail")) {
		if (!tError.needDealError() && sFlag.equals("cal")) {
			Content = "�����ɹ�!";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("recal")) {
			Content = "�����ɹ�! <font color=red></font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("fillcal")) {
			Content = "����ͻ���Ϣ�ɹ�!";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("delete")) {
			Content = "ɾ���ͻ���Ϣ�ɹ�!";
			FlagStr = "Succ";
		} else {
			Content = "����ʧ�ܣ�ԭ����:" + tError.getFirstError();
			FlagStr = "Fail";
		}
	} else {
		try {
			Content = "����ʧ�ܣ�ԭ����:" + tError.getFirstError();
			FlagStr = "Fail";
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
%>
<html>
<script language="javascript">
	parent.fraInterface.afterSubmit("<%=FlagStr%>", "<%=Content%>");
</script>
</html>

