<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%
	//�������ƣ�CreateComQueryExcelSave.jsp
	//�����ܣ������ۺϲ�ѯ����
	//�������ڣ�2010-05-26 13:47:00
	//������  ��Lips
	//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";

	//�������
	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");

	//ͨ��ȡ����flagֵ�Ĳ�ͬ��ִ����Ӧ�Ĳ���
	String flag = request.getParameter("flag");
	//����SQL��䣬��ʼ��ֵ
	String sql = "";
	String sql2 = "";
	//excel����
	String excelName = "";
	//�洢�����Ϣ
	TransferData tTransferData = new TransferData();
	//���ڴ洢�����Ƶ�����
	String[] tColumnName = null;
	//1���������ۺϲ�ѯ
	//2����ۺϲ�ѯ
	//3������ͨ����ѯ
	//4�ܹ�˾�����ϱ���ѯ
	//5�ֹ�˾�����ϱ���ѯ
	//6�����ϱ���ѯ
	//7�ͻ�����ʶ���ۺϲ�ѯ
	//8���յȼ��ۺϲ�ѯ
	if ("1".equals(flag)) {
		excelName = "�����ۺϲ�ѯ���";
		tColumnName = new String[] { "���", "��������", "�ͻ���", "�ͻ�����/����",
				"֤������","��������","���۷�ʽ","��Ʒ����","��ȫ����","��ȫ��Ŀ","������","��ȫ���","��ϵ��Ϣ", "����������", "����������", "����״̬", "���׷�������", "��������",
				"ɸѡ����", "���ɳ̶�", "����Ա" };
		sql = "select distinct managecom,appntno,CTNM,CTID,salechnl,selltype,risktype,getcost,edortype,csnm,getmoney,CCTL,STCR,stcrn,DataState,"
				+"DealDate,makedate,checkdate,SDGR,Operator from  ("
					+"	select  (select name from ldcoma where comcode=NVL(a.comcode,a.managecom)) managecom, a.CSNM appntno, a.CTNM, a.CTID," 
					+"	(select codename from ldcode where codetype='salechnl' and code=d.salechnl) salechnl,"
					+"  (select codename from lis_ldcode where codetype='selltype' and code=d.selltype) selltype,"
					+"	(select codename from ldcode where codetype='risktype' and code=c.risktype) risktype,"
					+"	d.getcost,(select codename from lis_ldcode where codetype='edortype' and code=d.edortype) edortype, "
					+"   d.csnm,d.getmoney,a.CCTL,a.STCR,"
					+"	(select codename from ldcode where codetype='amlshadinessstamp' and code=a.STCR) stcrn," 
					+"	(select codename from ldcode where codetype='amldatastate' and code=a.DataState) DataState," 
					+"	a.DealDate, a.makedate,a.checkdate, (select codename from ldcode where codetype='amlshadiness' and code=a.SDGR) SDGR," 
					+"	a.Operator "
				
				/* "select  "
				+ "(select name from ldcoma where comcode=a.MANAGECOM), "
				+ "a.CSNM, "
				+ "a.CTNM, "
				+ "a.CTID, "
				+"(select codename from ldcode where codetype='salechnl' and code=d.salechnl),"
				+"(select codename from ldcode where codetype='risktype' and code=c.risktype),"
				+"d.getcost,d.edortype,d.csnm,d.getmoney,a.CCTL,"
				+ "a.STCR, "
				+ "(select codename from ldcode where codetype='amlshadinessstamp' and code=a.STCR), "
				+ "(select codename from ldcode where codetype='amldatastate' and code=a.DataState), "
				+ "a.DealDate, "
				+ "a.makedate,a.checkdate, "
				+ "(select codename from ldcode where codetype='amlshadiness' and code=a.SDGR), "
				+ "a.Operator " */

				+ "from LXISTradeMain a,lxistradedetail d,lxistradecont c " + "where 1 = 1 "
				+"and a.dealno=d.dealno and a.dealno=c.dealno ";
		//�ͻ���
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//�ͻ�����/����
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//���ɽ�������
		String tSTCR = request.getParameter("STCR").trim();
		if (!"".equals(tSTCR) && tSTCR != null) {
			sql = sql + " and a.STCR='" + tSTCR + "'";
		}
		//����״̬
		String tDataState = request.getParameter("DataState").trim();
		if (!"".equals(tDataState) && tDataState != null) {
			sql = sql + " and a.DataState='" + tDataState + "'";
		}
		//���ɳ̶�
		String tSDGR = request.getParameter("SDGR").trim();
		if (!"".equals(tSDGR) && tSDGR != null) {
			sql = sql + " and a.SDGR='" + tSDGR + "'";
		}
		//��������
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.dealdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		sql = sql + " order by a.DealDate desc, a.DealNo desc )";
		sql2 = "select COUNT(*) from ("+sql+")";
	} else if ("2".equals(flag)) {
		excelName = "����ۺϲ�ѯ���";
		tColumnName = new String[] { "���", "���ױ��", "�ͻ���", "�ͻ�����/����",
				"����", "����״̬����", "����״̬", "֤������", "֤������", "���׷�������",
				"������Ա", "��������", "��������" };
		sql = "select a.DEALNo, "
				+ "a.CSNM, "
				+ "a.CTNM, "
				+ "a.CTNT, "
				+ "a.DataState,"
				+ "(select codename from ldcode where codetype='amldatastate' and code=a.DataState), "
				+ "(select codename from ldcode where codetype='amlidtype' and code=a.CITP), "
				+ "a.CTID, " + "a.HTDT, " + "a.Operator, "
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXIHTradeMain a " + "where 1 = 1 ";
		//�ͻ���
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//�ͻ�����/����
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//��������
		String tCRCD = request.getParameter("CRCD").trim();
		sql = sql
				+ "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno";
		if (!"".equals(tCRCD) && tCRCD != null) {
			sql = sql + " and b.CRCD='" + tCRCD + "'";
		}
		sql = sql + ")";
		//����״̬
		String tDataState = request.getParameter("DataState").trim();
		if (!"".equals(tDataState) && tDataState != null) {
			sql = sql + " and a.DataState='" + tDataState + "'";
		}
		//������Դ
		String tDataSource = request.getParameter("DataSource").trim();
		sql = sql
				+ "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno";
		if (!"".equals(tDataSource) && tDataSource != null) {
			sql = sql + " and b.DataSource='" + tDataSource + "'";
		}
		sql = sql + ")";
		//��������
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.HTDT,'yyyy-mm-dd')<='" + EndDate
					+ "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		sql = sql + " order by a.htdt desc ,a.csnm desc";
		sql2 = "select COUNT(*) from LXIHTradeMain a";
	} else if ("3".equals(flag)) {
		excelName = "������ͨ����ѯ���";
		tColumnName = new String[] { "���", "���ױ��", "��������", "���ɳ̶�",
				"�ͻ���", "�ͻ�����/����", "���׷�������", "������ͨ��ԭ��", "������Ա", "��������",
				"����ʱ��", "��������", "��������" };
		sql = "select a.DEALNo, "
				+ "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
				+ "a.CSNM, " + "a.CTNM, " + "a.HTDT, " + "a.reason, "
				+ "a.OPERATOR, a.makedate,a.maketime,"
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXCancelreport a "
				+ "where 1 = 1 and a.DataType='02' ";
		//�ͻ���
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//�ͻ�����/����
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//���ױ��
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//��������
		String tTradeType = request.getParameter("TradeType").trim();
		if (!"".equals(tTradeType) && tTradeType != null) {
			sql = sql + " and a.TradeType='" + tTradeType + "'";
		}
		//������Ա
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//��������
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.HTDT,'yyyy-mm-dd')<='" + EndDate
					+ "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		sql = sql + " order by a.HTDT desc, a.DealNo desc";
		sql2 = "select COUNT(*) from LXCancelreport a";
	} else if ("4".equals(flag)) {
		excelName = "�ܹ�˾�����ϱ���ѯ���";
		tColumnName = new String[] { "���", "���ױ��", "��������", "���ɳ̶�",
				"�ͻ���", "�ͻ�����/����", "���׷�������", "�����ϱ�ԭ��", "������Ա", "��������",
				"����ʱ��", "��������", "��������" };
		sql = "select a.DEALNo, "
				+ "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
				+ "a.CSNM, " + "a.CTNM, " + "a.HTDT, " + "a.reason, "
				+ "a.OPERATOR, a.makedate,a.maketime,"
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXCancelreport a "
				+ "where 1 = 1 and a.DataType='01' ";
		//�ͻ���
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//�ͻ�����/����
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//���ױ��
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//��������
		String tTradeType = request.getParameter("TradeType").trim();
		if (!"".equals(tTradeType) && tTradeType != null) {
			sql = sql + " and a.TradeType='" + tTradeType + "'";
		}
		//������Ա
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//��������
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.HTDT,'yyyy-mm-dd')<='" + EndDate
					+ "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		sql = sql + " order by a.HTDT desc, a.DealNo desc";
		sql2 = "select COUNT(*) from LXCancelreport a";
	} else if ("5".equals(flag)) {
		excelName = "�ֹ�˾�����ϱ���ѯ���";
		tColumnName = new String[] { "���", "���ױ��", "��������", "���ɳ̶�",
				"�ͻ���", "�ͻ�����/����", "���׷�������", "�����ϱ�ԭ��", "������Ա", "��������",
				"����ʱ��", "��������", "��������" };
		sql = "select a.DEALNo, "
				+ "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
				+ "a.CSNM, " + "a.CTNM, " + "a.HTDT, " + "a.reason, "
				+ "a.OPERATOR, a.makedate,a.maketime,"
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXCancelreport a "
				+ "where 1 = 1 and a.DataType is null ";
		//�ͻ���
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//�ͻ�����/����
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//���ױ��
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//��������
		String tTradeType = request.getParameter("TradeType").trim();
		if (!"".equals(tTradeType) && tTradeType != null) {
			sql = sql + " and a.TradeType='" + tTradeType + "'";
		}
		//������Ա
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//��������
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.HTDT,'yyyy-mm-dd')<='" + EndDate
					+ "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.HTDT,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		sql = sql + " order by a.HTDT desc, a.DealNo desc";
		sql2 = "select COUNT(*) from LXCancelreport a";
	} else if ("6".equals(flag)) {
		excelName = "�����ϱ���ѯ���";
		tColumnName = new String[] { "���", "���ױ��", "��������", "���ɳ̶�",
				"�ͻ���", "�ͻ�����/����", "���׷�������", "�ϱ���Ա", "�ϱ�����", "���ؼ�ܻ���",
				"�ϱ���ע", "��������", "��������" };
		sql = "select a.DealNo,(select codename from ldcode where codetype='dealtype' and code='IH'),'',"
				+ "b.CSNM,b.CTNM,b.HTDT,a.reporter,a.dealdate,(select codename from ldcode where codetype='localregulators' and code=LocalRegulators),"
				+ "a.remark,a.ManageCom,(select name from ldcom where comcode=a.ManageCom) from LXReportLocal a,LXIHTradeMain b "
				+ "where 1=1 " + "and a.DealNo=b.DealNo ";
		//���ױ��
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//�ͻ�����/����
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and b.CTNM='" + tCTNM + "'";
		}
		//��������
		String tDealType = request.getParameter("DealType").trim();
		if (!"".equals(tDealType) && tDealType != null) {
			sql = sql + " and a.ReportType='" + tDealType + "'";
		}
		//�ͻ���
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and b.CSNM='" + tCSNM + "'";
		}
		//������Ա
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//��������
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.dealdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		//+" and a.managecom like '" + comcode + "%25' "
		sql = sql
				+ "union all "
				+ "select a.DealNo,(select codename from ldcode where codetype='dealtype' and code='IS'),"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=b.SDGR),"
				+ "b.CSNM,b.CTNM,b.DealDate,a.reporter,a.dealdate,(select codename from ldcode where codetype='localregulators' and code=LocalRegulators),"
				+ "a.remark,a.ManageCom,(select name from ldcom where comcode=a.ManageCom) from LXReportLocal a,LXISTradeMain b "
				+ "where 1=1 " + "and a.DealNo=b.DealNo ";
		//���ױ��
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//�ͻ�����/����
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and b.CTNM='" + tCTNM + "'";
		}
		//��������
		if (!"".equals(tDealType) && tDealType != null) {
			sql = sql + " and a.ReportType='" + tDealType + "'";
		}
		//�ͻ���
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and b.CSNM='" + tCSNM + "'";
		}
		//������Ա
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//��������
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//��ʼ�ͽ�������
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(a.dealdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.dealdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		//+" and a.managecom like '" + comcode + "%25' ";
		sql2 = "select COUNT(*) from LXReportLocal a";
	} else if ("7".equals(flag)) {
		excelName = "����ʶ���ۺϲ�ѯ����";
		tColumnName = new String[] { "���", "��������", "���պ�ͬ��", "��������",
				"�ͻ���", "Ͷ����", "��������", "������", "��������", "��������", "���׽��",
				"���׷�ʽ", "��֧����", "ʶ������" };
		sql = "select (select shortname from ldcomA where comcode=managecom and rownum = 1), "
				+ "CONTNO, "
				+ "RISKNAME, "
				+ "appntno, "
				+ "APPNTNAME , "
				+ "INSUREDNAME, "
				+ "BENENAME,"
				+ "(case SALECHNL when '01' then '����ֱ��' when '02' then '���д���' "
				+ "when '03' then '��������' when '04' then '���͹�˾' when '05' then '����Ӫ��' "
				+ "when '06' then 'רҵ����' when '07' then '��ҵ����' else '����' end ) SALECHNL,"
				+ "TRANSDATE, "
				+ "TRANSAMOUNT, "
				+ "(case PAYMODE "
				+ " when '1' then '�ֽ�' "
				+ "	when '2' then '�ֽ�֧Ʊ'"
				+ " when '3' then '������ȡ'"
				+ " when '4' then '����ת��'"
				+ " when '5' then '�ڲ�ת��'"
				+ " when '6' then '��������'"
				+ " when '7' then 'ҵ��Ա���ÿ�'"
				+ " when '9' then '��������'"
				+ " when 'A' then '���ʱ�ͨ'"
				+ " when 'B' then '����ͨ'"
				+ " when 'C' then '֧����'"
				+ " when 'D' then 'ƽ̨�ո�'"
				+ " else '���� ' "
				+ "end)  PAYMODE, "
				+ " (case AMTTYPE "
				+ " when '01' then '��'"
				+ " when '02' then '��' "
				+ " end) AMTTYPE,  "
				+ "(select codename from ldcode a where codetype='transtype' and a.code=TRANSTYPE ) TRANSTYPE "
				+ "from ANTIMONEYCUSTINFO " + "where 1 = 1  ";
		//��������
		String tsalechnl = request.getParameter("salechnl").trim();
		if (!"".equals(tsalechnl) && tsalechnl != null) {
			sql = sql + " and salechnl='" + tsalechnl + "'";
		}
		//���׷�ʽ
		String tpaymode = request.getParameter("paymode").trim();
		if (!"".equals(tpaymode) && tpaymode != null) {
			sql = sql + " and paymode='" + tpaymode + "'";
		}

		//��������
		String tManageCom = request.getParameter("StatiCode").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and ManageCom like '" + tManageCom + "%'";
		}

		//ʶ������
		String transtype = request.getParameter("transtype").trim();
		if (!"".equals(transtype) && transtype != null) {
			sql = sql + " and transtype='" + transtype + "'";
		}

		//ʶ��ʽ
		String transtype1 = request.getParameter("transtype1").trim();
		if (transtype1.equals("00")) {
			sql = sql
					+ " and transtype  in('1001','1002','1003','1004') ";
		} else if (transtype1.equals("01")) {
			sql = sql
					+ " and transtype in('1005','1006','1007','1008') ";
		}

		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(transdate,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(transdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(transdate,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(transdate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}

		sql2 = "select COUNT(*) from ANTIMONEYCUSTINFO ";
	} else if ("8".equals(flag)) {
		System.out
				.println("=====================AMLZHONG===================");
		excelName = "���յȼ��ۺϲ鱨��";
		tColumnName = new String[] { "���", "��������", "�ͻ���", "�ͻ�����",
				"���յȼ�", "���屣����", "���պ�ͬ��", "�������յ÷�", "�ͻ�����" };
		//sql =  "select (select name from ldcomA where comcode=a.managecom),a.customerno,a.customername,"
		sql = "select a.managecom,a.customerno,a.customername,"
				+ " a.CustomerLevel,"
				+ " a.grpcontno, a.contno,a.score,(case a.customertype when  '1' then 'Ͷ����' when '2' then '������' else '������' end)"
				+ " from lxcustomerriskresult a where 1=1 ";

		//���յȼ�
		String tCustomerLevel = request.getParameter(
				"CustomerLevelName").trim();
		if (!"".equals(tCustomerLevel) && tCustomerLevel != null) {
			sql = sql + " and CustomerLevel='" + tCustomerLevel + "'";
		}
		//�ͻ���
		String tCustomerNo = request.getParameter("CustomerNo").trim();
		if (!"".equals(tCustomerNo) && tCustomerNo != null) {
			sql = sql + " and CustomerNo='" + tCustomerNo + "'";
		}

		//��������
		String tManageCom = request.getParameter("StatiCode").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and ManageCom like '" + tManageCom + "%'";
		}

		//��ʼ�ͽ�������
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if (!"".equals(StartDate) && StartDate != null
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"
					+ StartDate
					+ "' and to_char(makedate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}
		if (!"".equals(StartDate) && StartDate != null
				&& ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"
					+ StartDate + "'";
		}
		if (("".equals(StartDate) || StartDate == null)
				&& !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')<='"
					+ EndDate + "'";
		}

		sql2 = "select COUNT(*) from lxcustomerriskresult  where 1=1 ";

		//���յȼ�
		/*
		String tCustomerLevel2= request.getParameter("CustomerLevelName").trim();
		if(!"".equals(tCustomerLevel2) && tCustomerLevel2 != null) {
		sql = sql + " and CustomerLevel='" + tCustomerLevel2 + "'";
		}
		//�ͻ���
		String tCustomerNo2 = request.getParameter("CustomerNo").trim();
		if(!"".equals(tCustomerNo2) && tCustomerNo2 != null) {
		sql = sql + " and CustomerNo='" + tCustomerNo2 + "'";
		}
		
		//��������
		String tManageCom2 = request.getParameter("StatiCode").trim();
		if(!"".equals(tManageCom2) && tManageCom2 != null) {
		sql = sql + " and ManageCom like '" + tManageCom2 + "%'";
		}

		//��ʼ�ͽ�������
		String StartDate2 = request.getParameter("StartDate").trim();
		String EndDate2 = request.getParameter("EndDate").trim();
		
		if(!"".equals(StartDate2) && StartDate2 != null && !"".equals(EndDate2) && EndDate2 != null) {
		sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate2+"' and to_char(makedate,'yyyy-mm-dd')<='"+EndDate2+"'";
		}
		if(!"".equals(StartDate2) && StartDate2 != null && ("".equals(EndDate2) || EndDate2 == null)) {
		sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate2+"'";
		}
		if(("".equals(StartDate2) || StartDate2 == null) && !"".equals(EndDate2) && EndDate2 != null) {
		sql = sql + " and to_char(makedate,'yyyy-mm-dd')<='"+EndDate2+"'";
		}*/

	}
	System.out.println("=========================================");
	System.out.println(sql);
	tTransferData.setNameAndValue("excelName", excelName);//����excel����
	tTransferData.setNameAndValue("flag", flag);//���ݱ�ʶ
	tTransferData.setNameAndValue("SQL", sql);//��Ҫ��ѯ��SQL���
	tTransferData.setNameAndValue("SQL2", sql2);//ͳ���ܼ�¼��
	tTransferData.setNameAndValue("ColumnName", tColumnName);//��������
	CreateComQueryExcelUI tCreateComQueryExcelUI = new CreateComQueryExcelUI();
	VData tVData = new VData();
	if (tGI == null) {
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
	//ҳ����Ч
	else {
		tVData.add(tGI);
		tVData.add(tTransferData);
		try {
			if (tCreateComQueryExcelUI.submitData(tVData, "")) {
				response.reset();
				response.setContentType("application/msexcel");
				//response.setContentType("application/octet-stream"); 
				response.setHeader("Content-disposition",
						"attachment;filename="
								+ new String(excelName
										.getBytes("gb2312"),
										"iso8859-1") + ".xls");
				OutputStream ops = response.getOutputStream();
				tCreateComQueryExcelUI.getHSSFWorkbook().write(ops);
				ops.flush();
				ops.close();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
			FlagStr = "Fail";
		}
		if (!FlagStr.equals("Fail")) {

			tError = tCreateComQueryExcelUI.mErrors;
			if (!tError.needDealError()) {

				Content = " �����ɹ�! ";
				FlagStr = "Succ";
			} else {
				Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
				FlagStr = "Fail";

			}
		}
		System.out.println("***Content=" + Content + ",FlagStr="
				+ FlagStr);
	}
%>
<html>
	<script language="JavaScript">
try {
	parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
} catch (ex) {
	alert('<%=Content%>');
}
</script>
</html>

