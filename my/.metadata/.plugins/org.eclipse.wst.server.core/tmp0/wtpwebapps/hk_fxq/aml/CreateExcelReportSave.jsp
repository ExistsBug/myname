<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.pubfun.*"%>
<%
	//�������ƣ�CreateExcelReportSave.jsp
	//�����ܣ����ɼ�ܱ���
	//�������ڣ�2010-08-19 10:45:00
	//������  ��tree
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

	//����SQL��䣬��ʼ��ֵ
	String sql = "";//�Թ��ͻ�/�¿ͻ�/����
	String sql2 = "";//�Թ��ͻ�/��������/����
	String sql3 = "";//�Թ��ͻ�/�¿ͻ�/������ʶ����
	String sql4 = "";//�Թ��ͻ�/��������/�������Ǳ���
	String sql5 = "";//�Թ��ͻ�/�¿ͻ�/��������
	String sql6 = "";//�Թ��ͻ�/��������/��������
	String sql7 = "";//��˽�ͻ�/�¿ͻ�/����
	String sql8 = "";//��˽�ͻ�/��������/����
	String sql9 = "";//��˽�ͻ�/�¿ͻ�/������ʶ����
	String sql10 = "";//��˽�ͻ�/��������/������ʶ����
	//excel����
	String excelName = "";
	//�洢�����Ϣ
	TransferData tTransferData = new TransferData();
	String StartDate = request.getParameter("StartDate").trim();
	String EndDate = request.getParameter("EndDate").trim();
	String tManageCom = request.getParameter("ManageCom").trim();
	excelName = "��ܱ���";
	sql = "select count(distinct c.appntno) �Թ��ͻ���     "
			+ "  from lcgrpcont c,ldcom a                                                    "
			+ " where 1=1                                                                    "
			+ "   and substr(c.managecom,1,6)=a.comcode                                      "
			+ "   and prem>=(select count(*) from lccont where grpcontno=c.grpcontno)*200000 "
			+ "   and exists (select 'x'                                                     "
			+ "                 from ljtempfee d,ljtempfeeclass e                            "
			+ "                where c.grpcontno=d.otherno                                   "
			+ "                  and d.tempfeeno=e.tempfeeno                                 "
			+ "                  and e.paymode<>'1')                                         "
			+ "   and c.grpname!='����'                                                      "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.comcode,a.shortname                                               "
			//+ " order by a.comcode                                                           ";
	sql2 = "select count(distinct actugetno) �տ����    from          "
			+ "( select c.grpcontno,c.managecom comcode,'1' type,a.*                "
			+ "   from ljfiget a, ljagetendorse b,lcgrpcont c                                     "
			+ "  where a.actugetno = b.actugetno                                                  "
			+ "    and b.grpcontno=c.grpcontno                                                    "
			+ "    and c.grpname!='����'                                                          "
			+ "    and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ "    and b.feefinatype in ('TF','TB')                                               "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "  union all                                                                        "
			+ " select c.grpcontno,c.managecom,'2',a.*                               "
			+ "   from ljfiget a, ljagetclaim b,lcgrpcont c                                       "
			+ "  where a.actugetno = b.actugetno                                                  "
			+ "    and b.grpcontno=c.grpcontno                                                    "
			+ "    and c.grpname!='����'                                                          "
			+ "    and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "     ) x                                                                   "
			+ " where 1=1                                                                         ";
			//+ "   and substr(x.comcode,1,6)=y.comcode                                             ";
			//+ " group by y.comcode,y.shortname                                                    "
			//+ " order by y.comcode                                                                ";
	sql3 = "select count(distinct c.appntno) �Թ��ͻ���                  "
			+ "  from lcgrpcont c,ldcom a                                                    "
			+ " where 1=1                                                                    "
			+ "   and substr(c.managecom,1,6)=a.comcode                                      "
			+ "   and c.salechnl<>'2'                                                        "
			+ "   and prem>=(select count(*) from lccont where grpcontno=c.grpcontno)*200000 "
			+ "   and exists (select 'x'                                                     "
			+ "                 from ljtempfee d,ljtempfeeclass e                            "
			+ "                where c.grpcontno=d.otherno                                   "
			+ "                  and d.tempfeeno=e.tempfeeno                                 "
			+ "                  and e.paymode<>'1')                                         "
			+ "   and c.grpname!='����'                                                      "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.shortname                                                         ";
	sql4 = "select count(distinct actugetno) �տ����     from          "
			+ "( select c.grpcontno,c.managecom comcode,'1' type,a.*                 "
			+ "   from ljfiget a, ljagetendorse b,lcgrpcont c                                     "
			+ "  where a.actugetno = b.actugetno                                                  "
			+ "    and b.grpcontno=c.grpcontno                                                    "
			+ "    and c.grpname!='����'                                                          "
			+ "    and c.salechnl<>'2'                                                            "
			+ "    and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ "    and b.feefinatype in ('TF','TB')                                               "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "  union all                                                                        "
			+ " select c.grpcontno,c.managecom,'2',a.*                               "
			+ "   from ljfiget a, ljagetclaim b,lcgrpcont c                                       "
			+ "  where a.actugetno = b.actugetno                                                  "
			+ "    and b.grpcontno=c.grpcontno                                                    "
			+ "    and c.grpname!='����'                                                          "
			+ "    and c.salechnl<>'2'                                                            "
			+ "    and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "     ) x                                                                           "
			+ " where 1=1                                                                         ";
			//+ "   and substr(x.comcode,1,6)=y.comcode                                             "
			//+ " group by y.comcode,y.shortname                                                    "
			//+ " order by y.comcode                                                                ";
	sql5 = "select count(distinct (select d.insuredno from lcbnf d,lccont b where b.contno=d.contno and b.grpcontno=c.grpcontno)) �Թ��ͻ��� "
			+ "  from lcgrpcont c,ldcom a                           "
			+ " where 1=1                                           "
			+ "   and substr(c.managecom,1,6)=a.comcode             "
			+ "   and c.prem>=200000                                "
			+ "   and exists (select 'x'                            "
			+ "                 from ljtempfee d,ljtempfeeclass e   "
			+ "                where c.grpcontno=d.otherno          "
			+ "                  and d.tempfeeno=e.tempfeeno        "
			+ "                  and e.paymode<>'1')                "
			+ "   and c.grpname!='����'                             "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.comcode,a.shortname                      "
			//+ " order by a.comcode                                  ";
	sql6 = " select count(distinct (select d.insuredno from lcbnf d,lccont b where b.contno=d.contno and b.grpcontno=x.grpcontno)) �Թ��ͻ��� "
			+ " from ( select c.grpcontno,c.managecom comcode,'1' type,a.*            "
			+ "    from ljfiget a, ljagetendorse b,lcgrpcont c                                     "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.grpcontno=c.grpcontno                                                    "
			+ "     and c.grpname!='����'                                                          "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ "     and b.feefinatype in ('TF','TB')                                               "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "   union all                                                                        "
			+ "  select c.grpcontno,c.managecom,'2',a.*                             "
			+ "    from ljfiget a, ljagetclaim b,lcgrpcont c                                       "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.grpcontno=c.grpcontno                                                    "
			+ "     and c.grpname!='����'                                                          "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "      ) x                                                                           "
			+ "  where 1=1                                                                         ";
			//+ "    and substr(x.comcode,1,6)=y.comcode                                             "
			//+ "  group by y.comcode,y.shortname                                                    "
			//+ "  order by y.comcode                                                              ";
	sql7 = "select count(distinct c.appntno) ��˽�ͻ��� "
			+ "  from lccont c,ldcom a                             "
			+ " where 1=1                                          "
			+ "   and substr(c.managecom,1,6)=a.comcode            "
			+ "   and ((exists (select 'x'                         "
			+ "                 from ljtempfee d,ljtempfeeclass e  "
			+ "                where c.contno=d.otherno            "
			+ "                  and d.tempfeeno=e.tempfeeno       "
			+ "                  and e.paymode<>'1')  and (select sum(n.sumactupaymoney*decode(m.payintv,12,payyears,1)) "
			+ "                                              from lcpol m,ljapayperson n                "
			+ "                                             where m.polno=n.polno                       "
			+ "                                               and n.dutycode not in ('013001','056001') "
			+ "                                               and n.paycount=1                          "
			+ "                                               and n.paytype='ZC'                        "
			+ "                                               and m.contno=c.contno)>=200000) or        "
			+ "        (exists (select 'x' "
			+ "                 from ljtempfee d,ljtempfeeclass e "
			+ "                where c.contno=d.otherno           "
			+ "                  and d.tempfeeno=e.tempfeeno      "
			+ "                  and e.paymode='1')  and (select sum(n.sumactupaymoney*decode(m.payintv,12,payyears,1)) "
			+ "                                              from lcpol m,ljapayperson n                "
			+ "                                             where m.polno=n.polno                       "
			+ "                                               and n.dutycode not in ('013001','056001') "
			+ "                                               and n.paycount=1                          "
			+ "                                               and n.paytype='ZC'                        "
			+ "                                               and m.contno=c.contno)>=20000))           "
			+ "   and (c.conttype='1' or c.contsource='2')          "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.comcode,a.shortname "
			//+ " order by a.comcode             ";
	sql8 = " select count(distinct actugetno) �տ����     from "
			+ " ( select c.contno,c.managecom comcode,'1' type,a.*                   "
			+ "    from ljfiget a, ljagetendorse b,lccont c                                        "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.contno=c.contno                                                          "
			+ "     and (c.conttype='1' or c.contsource='2')                                       "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ "     and b.feefinatype in ('TF','TB')                                               "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "   union all                                                                        "
			+ "  select c.contno,c.managecom,'2',a.*                                  "
			+ "    from ljfiget a, ljagetclaim b,lccont c                                          "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.contno=c.contno                                                          "
			+ "     and (c.conttype='1' or c.contsource='2')                                       "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "      ) x                                                                           "
			+ "  where 1=1                                                                         ";
			//+ "    and substr(x.comcode,1,6)=y.comcode                                             "
			//+ "  group by y.comcode,y.shortname                                                    "
			//+ "  order by y.comcode                                                                ";
	sql9 = " select count(distinct c.appntno) ��˽�ͻ��� "
			+ "   from lccont c,ldcom a                            "
			+ "  where 1=1                                         "
			+ "    and substr(c.managecom,1,6)=a.comcode           "
			+ "    and c.salechnl not in ('1','3','8')             "
			+ "    and ((exists (select 'x'                        "
			+ "                  from ljtempfee d,ljtempfeeclass e "
			+ "                 where c.contno=d.otherno           "
			+ "                   and d.tempfeeno=e.tempfeeno      "
			+ "                   and e.paymode<>'1')  and (select sum(prem*decode(payintv,12,payyears,1)) from lcpol where contno=c.contno)>=200000) or "
			+ "         (exists (select 'x'                        "
			+ "                  from ljtempfee d,ljtempfeeclass e "
			+ "                 where c.contno=d.otherno           "
			+ "                   and d.tempfeeno=e.tempfeeno      "
			+ "                   and e.paymode='1')  and (select sum(prem*decode(payintv,12,payyears,1)) from lcpol where contno=c.contno)>=20000)) "
			+ "    and (c.conttype='1' or c.contsource='2')          "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ "  group by a.comcode,a.shortname                      "
			//+ "  order by a.comcode                                  ";
	sql10 = " select count(distinct actugetno) �տ����        from "
			+ " ( select c.contno,c.managecom comcode,'1' type,a.*                     "
			+ "    from ljfiget a, ljagetendorse b,lccont c                                        "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.contno=c.contno                                                          "
			+ "     and c.salechnl not in ('1','3','8')                                            "
			+ "     and (c.conttype='1' or c.contsource='2')                                       "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ "     and b.feefinatype in ('TF','TB')                                               "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "   union all                                                                        "
			+ "  select c.contno,c.managecom,'2',a.*                                 "
			+ "    from ljfiget a, ljagetclaim b,lccont c                                          "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.contno=c.contno                                                          "
			+ "     and c.salechnl not in ('1','3','8')                                            "
			+ "     and (c.conttype='1' or c.contsource='2')                                       "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "      ) x                                                                   "
			+ "  where 1=1                                                                         ";
			//+ "    and substr(x.comcode,1,6)=y.comcode                                             "
			//+ "  group by y.comcode,y.shortname                                                    "
			//+ "  order by y.comcode                                                                ";
	System.out.println("sql=" + sql.replaceAll("  "," "));
	System.out.println("sql2=" + sql2.replaceAll("  "," "));
	System.out.println("sql3=" + sql3.replaceAll("  "," "));
	System.out.println("sql4=" + sql4.replaceAll("  "," "));
	System.out.println("sql5=" + sql5.replaceAll("  "," "));
	System.out.println("sql6=" + sql6.replaceAll("  "," "));
	System.out.println("sql7=" + sql7.replaceAll("  "," "));
	System.out.println("sql8=" + sql8.replaceAll("  "," "));
	System.out.println("sql9=" + sql9.replaceAll("  "," "));
	System.out.println("sql10=" + sql10.replaceAll("  "," "));

	System.out.println("=========================================");
	System.out.println(sql);
	tTransferData.setNameAndValue("excelName", excelName);//����excel����
	tTransferData.setNameAndValue("SQL", sql.replaceAll("  "," "));//�Թ��ͻ�/�¿ͻ�/����                       
	tTransferData.setNameAndValue("SQL2", sql2.replaceAll("  "," "));//�Թ��ͻ�/��������/����                   
	tTransferData.setNameAndValue("SQL3", sql3.replaceAll("  "," "));//�Թ��ͻ�/�¿ͻ�/������ʶ����             
	tTransferData.setNameAndValue("SQL4", sql4.replaceAll("  "," "));//�Թ��ͻ�/��������/�������Ǳ���           
	tTransferData.setNameAndValue("SQL5", sql5.replaceAll("  "," "));//�Թ��ͻ�/�¿ͻ�/��������                 
	tTransferData.setNameAndValue("SQL6", sql6.replaceAll("  "," "));//�Թ��ͻ�/��������/��������               
	tTransferData.setNameAndValue("SQL7", sql7.replaceAll("  "," "));//��˽�ͻ�/�¿ͻ�/����                     
	tTransferData.setNameAndValue("SQL8", sql8.replaceAll("  "," "));//��˽�ͻ�/��������/����                   
	tTransferData.setNameAndValue("SQL9", sql9.replaceAll("  "," "));//��˽�ͻ�/�¿ͻ�/������ʶ����             
	tTransferData.setNameAndValue("SQL10", sql10.replaceAll("  "," "));//��˽�ͻ�/��������/������ʶ����

	CreateExcelReportUI tCreateExcelReportUI = new CreateExcelReportUI();
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
			if (tCreateExcelReportUI.submitData(tVData, "")) {
				response.reset();
				response.setContentType("application/msexcel");
				//response.setContentType("application/octet-stream"); 
				response.setHeader("Content-disposition",
						"attachment;filename="
								+ new String(excelName
										.getBytes("gb2312"),
										"iso8859-1") + ".xls");
				OutputStream ops = response.getOutputStream();
				tCreateExcelReportUI.getHSSFWorkbook().write(ops);
				ops.flush();
				ops.close();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
			FlagStr = "Fail";
		}
		if (!FlagStr.equals("Fail")) {

			tError = tCreateExcelReportUI.mErrors;
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


