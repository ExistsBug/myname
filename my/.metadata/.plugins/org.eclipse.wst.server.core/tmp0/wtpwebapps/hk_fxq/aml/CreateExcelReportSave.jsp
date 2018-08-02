<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.pubfun.*"%>
<%
	//程序名称：CreateExcelReportSave.jsp
	//程序功能：生成监管报表
	//创建日期：2010-08-19 10:45:00
	//创建人  ：tree
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

	//公用SQL语句，初始化值
	String sql = "";//对公客户/新客户/总数
	String sql2 = "";//对公客户/其他情形/总数
	String sql3 = "";//对公客户/新客户/第三方识别数
	String sql4 = "";//对公客户/其他情形/第三方是别数
	String sql5 = "";//对公客户/新客户/受益人数
	String sql6 = "";//对公客户/其他情形/受益人数
	String sql7 = "";//对私客户/新客户/总数
	String sql8 = "";//对私客户/其他清形/总数
	String sql9 = "";//对私客户/新客户/第三方识别数
	String sql10 = "";//对私客户/其他清形/第三方识别数
	//excel名称
	String excelName = "";
	//存储相关信息
	TransferData tTransferData = new TransferData();
	String StartDate = request.getParameter("StartDate").trim();
	String EndDate = request.getParameter("EndDate").trim();
	String tManageCom = request.getParameter("ManageCom").trim();
	excelName = "监管报告";
	sql = "select count(distinct c.appntno) 对公客户数     "
			+ "  from lcgrpcont c,ldcom a                                                    "
			+ " where 1=1                                                                    "
			+ "   and substr(c.managecom,1,6)=a.comcode                                      "
			+ "   and prem>=(select count(*) from lccont where grpcontno=c.grpcontno)*200000 "
			+ "   and exists (select 'x'                                                     "
			+ "                 from ljtempfee d,ljtempfeeclass e                            "
			+ "                where c.grpcontno=d.otherno                                   "
			+ "                  and d.tempfeeno=e.tempfeeno                                 "
			+ "                  and e.paymode<>'1')                                         "
			+ "   and c.grpname!='卡单'                                                      "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.comcode,a.shortname                                               "
			//+ " order by a.comcode                                                           ";
	sql2 = "select count(distinct actugetno) 收款笔数    from          "
			+ "( select c.grpcontno,c.managecom comcode,'1' type,a.*                "
			+ "   from ljfiget a, ljagetendorse b,lcgrpcont c                                     "
			+ "  where a.actugetno = b.actugetno                                                  "
			+ "    and b.grpcontno=c.grpcontno                                                    "
			+ "    and c.grpname!='卡单'                                                          "
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
			+ "    and c.grpname!='卡单'                                                          "
			+ "    and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "     ) x                                                                   "
			+ " where 1=1                                                                         ";
			//+ "   and substr(x.comcode,1,6)=y.comcode                                             ";
			//+ " group by y.comcode,y.shortname                                                    "
			//+ " order by y.comcode                                                                ";
	sql3 = "select count(distinct c.appntno) 对公客户数                  "
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
			+ "   and c.grpname!='卡单'                                                      "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.shortname                                                         ";
	sql4 = "select count(distinct actugetno) 收款笔数     from          "
			+ "( select c.grpcontno,c.managecom comcode,'1' type,a.*                 "
			+ "   from ljfiget a, ljagetendorse b,lcgrpcont c                                     "
			+ "  where a.actugetno = b.actugetno                                                  "
			+ "    and b.grpcontno=c.grpcontno                                                    "
			+ "    and c.grpname!='卡单'                                                          "
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
			+ "    and c.grpname!='卡单'                                                          "
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
	sql5 = "select count(distinct (select d.insuredno from lcbnf d,lccont b where b.contno=d.contno and b.grpcontno=c.grpcontno)) 对公客户数 "
			+ "  from lcgrpcont c,ldcom a                           "
			+ " where 1=1                                           "
			+ "   and substr(c.managecom,1,6)=a.comcode             "
			+ "   and c.prem>=200000                                "
			+ "   and exists (select 'x'                            "
			+ "                 from ljtempfee d,ljtempfeeclass e   "
			+ "                where c.grpcontno=d.otherno          "
			+ "                  and d.tempfeeno=e.tempfeeno        "
			+ "                  and e.paymode<>'1')                "
			+ "   and c.grpname!='卡单'                             "
			+ SqlTools.writeDateSql("c.signdate",StartDate,">=")
			+ SqlTools.writeDateSql("c.signdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like");
			//+ " group by a.comcode,a.shortname                      "
			//+ " order by a.comcode                                  ";
	sql6 = " select count(distinct (select d.insuredno from lcbnf d,lccont b where b.contno=d.contno and b.grpcontno=x.grpcontno)) 对公客户数 "
			+ " from ( select c.grpcontno,c.managecom comcode,'1' type,a.*            "
			+ "    from ljfiget a, ljagetendorse b,lcgrpcont c                                     "
			+ "   where a.actugetno = b.actugetno                                                  "
			+ "     and b.grpcontno=c.grpcontno                                                    "
			+ "     and c.grpname!='卡单'                                                          "
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
			+ "     and c.grpname!='卡单'                                                          "
			+ "     and (select sum(getmoney) from ljfiget t where t.actugetno=b.actugetno)>=10000 "
			+ SqlTools.writeDateSql("a.confdate",StartDate,">=")
			+ SqlTools.writeDateSql("a.confdate",EndDate,"<=")
			+ SqlTools.writeSql("c.managecom",tManageCom,"like")
			+ "      ) x                                                                           "
			+ "  where 1=1                                                                         ";
			//+ "    and substr(x.comcode,1,6)=y.comcode                                             "
			//+ "  group by y.comcode,y.shortname                                                    "
			//+ "  order by y.comcode                                                              ";
	sql7 = "select count(distinct c.appntno) 对私客户数 "
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
	sql8 = " select count(distinct actugetno) 收款笔数     from "
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
	sql9 = " select count(distinct c.appntno) 对私客户数 "
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
	sql10 = " select count(distinct actugetno) 收款笔数        from "
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
	tTransferData.setNameAndValue("excelName", excelName);//传递excel名字
	tTransferData.setNameAndValue("SQL", sql.replaceAll("  "," "));//对公客户/新客户/总数                       
	tTransferData.setNameAndValue("SQL2", sql2.replaceAll("  "," "));//对公客户/其他情形/总数                   
	tTransferData.setNameAndValue("SQL3", sql3.replaceAll("  "," "));//对公客户/新客户/第三方识别数             
	tTransferData.setNameAndValue("SQL4", sql4.replaceAll("  "," "));//对公客户/其他情形/第三方是别数           
	tTransferData.setNameAndValue("SQL5", sql5.replaceAll("  "," "));//对公客户/新客户/受益人数                 
	tTransferData.setNameAndValue("SQL6", sql6.replaceAll("  "," "));//对公客户/其他情形/受益人数               
	tTransferData.setNameAndValue("SQL7", sql7.replaceAll("  "," "));//对私客户/新客户/总数                     
	tTransferData.setNameAndValue("SQL8", sql8.replaceAll("  "," "));//对私客户/其他清形/总数                   
	tTransferData.setNameAndValue("SQL9", sql9.replaceAll("  "," "));//对私客户/新客户/第三方识别数             
	tTransferData.setNameAndValue("SQL10", sql10.replaceAll("  "," "));//对私客户/其他清形/第三方识别数

	CreateExcelReportUI tCreateExcelReportUI = new CreateExcelReportUI();
	VData tVData = new VData();
	if (tGI == null) {
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
	//页面有效
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
			Content = "导出失败，原因是:" + ex.toString();
			FlagStr = "Fail";
		}
		if (!FlagStr.equals("Fail")) {

			tError = tCreateExcelReportUI.mErrors;
			if (!tError.needDealError()) {

				Content = " 导出成功! ";
				FlagStr = "Succ";
			} else {
				Content = " 导出失败，原因是:" + tError.getFirstError();
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


