
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%><%@include
	file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK"%>
<%
	//�������ƣ�DataInterfaceUISave.jsp
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
	System.out.println("========����ISDataInterfaceSave.jspҳ��==========");
	DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
	Tishu_IS_ResDeal tTishu_IS_ResDeal = new Tishu_IS_ResDeal();
	//�������
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
	System.out.println("������־============== " + sFlag);
	System.out.println("���׷�������========== " + startDate);
	System.out.println("���׷���ֹ��========== " + endDate);
	System.out.println("���ɻ���������־==== " + endDate);
	System.out.println("��ȡ����============== " + calmngcom);
	try {
		boolean TFLAG = tDataInterfaceUI.submitData(tVData, tOperate);
		sCount = tDataInterfaceUI.getSCount();
		fCount = tDataInterfaceUI.getFCount();
		System.out.println("�����ύ��DataInterfaceUI�У��������Ϊ= " + TFLAG);
		if (!TFLAG) {
			FlagStr = "Fail";
		}
	} catch (Exception ex) {
		System.out.println("��ISDataInterfaceSave.jsp�в����쳣��");
		Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		FlagStr = "Fail";
	}
	//��ȡ������ʾ��Ϣ
	tError = tDataInterfaceUI.mErrors;
	if (!FlagStr.equals("Fail")) {
		if (!tError.needDealError() && sFlag.equals("cal")) {
			Content = "�����ɹ�! <font color=red>��ȡ�ͻ���Ϣ�ɹ���Ŀ��" + sCount
					+ "������ȡ�ͻ���Ϣʧ����Ŀ��" + fCount + "��</font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("recal")) {
			Content = "�����ɹ�! <font color=red>������ȡ�ͻ���Ϣ�ɹ���Ŀ��" + sCount
					+ "����������ȡ�ͻ���Ϣʧ����Ŀ��" + fCount + "��</font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("fillcal")) {
			Content = "����ͻ���Ϣ�ɹ�! <font color=red>�ͻ���Ϣ�ɹ�����Ŀ��" + sCount
					+ "��������ͻ���Ϣʧ������Ŀ��" + fCount + "��</font>";
			FlagStr = "Succ";
		} else if (!tError.needDealError() && sFlag.equals("delete")) {
			Content = "�����ɹ�! <font color=red>ɾ��������Ŀ��"
					+ (sCount + fCount) + "��</font>";
			FlagStr = "Succ";
		} else {
			try {
				Content = "����ʧ��,ԭ����:" + tError.getFirstError();
				FlagStr = "Fail";
			} catch (Exception e) {
				System.out.println(e.toString());
				Content = " ����ʧ�ܣ�ԭ����:" + e.toString();
				FlagStr = "Fail";
			}
		}
	} else {
		try {
			Content = "����ʧ��,ԭ����:" + tError.getFirstError();
			FlagStr = "Fail";
		} catch (Exception e) {
			System.out.println(e.toString());
			Content = "����ʧ��,ԭ����:" + e.toString();
			FlagStr = "Fail";
		}
	}
	//���û�л��������ʧ����ʾ��Ϣ,��Щ������ʾ
	if("����ʧ��,ԭ����:".equals(Content)){
		Content = "����ʧ�ܣ�";
	}
%>
<html>
<script language="javascript">
	parent.fraInterface.afterSubmit("<%=FlagStr%>", "<%=Content%>");
</script>
</html>

