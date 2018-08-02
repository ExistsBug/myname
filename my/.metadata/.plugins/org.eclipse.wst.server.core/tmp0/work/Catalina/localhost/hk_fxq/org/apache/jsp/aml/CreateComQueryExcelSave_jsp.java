package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.utility.*;
import java.io.*;
import com.sinosoft.lis.aml.*;

public final class CreateComQueryExcelSave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aml/../common/jsp/UsrCheck.jsp");
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html; charset=gb2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write("<!--\r\n");
      out.write("*******************************************************\r\n");
      out.write("* ³ÌÐòÃû³Æ£ºUsrCheck.jsp\r\n");
      out.write("* ³ÌÐò¹¦ÄÜ£ºÓÃ»§ÐÅÏ¢Ð£ÑéÒ³Ãæ\r\n");
      out.write("* ´´½¨ÈÕÆÚ£º2002-11-25\r\n");
      out.write("* ¸üÐÂ¼ÇÂ¼£º  ¸üÐÂÈË    ¸üÐÂÈÕÆÚ     ¸üÐÂÔ­Òò/ÄÚÈÝ\r\n");
      out.write("*******************************************************\r\n");
      out.write("-->\r\n");
      out.write("\r\n");

try
{
	if (session == null) {
		System.out.println("session is null");

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("catch (exception)\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

		return;
	}
	GlobalInput tG1 = (GlobalInput)session.getValue("GI");
	if (tG1 == null) {
		session.putValue("GI",null);
		out.println("ÍøÒ³³¬Ê±£¬ÇëÄúÖØÐÂµÇÂ¼");

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("catch (exception)\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

		return;
	}
	String  userCode = tG1.Operator;
	String comCode =tG1.ComCode;
	String manageCom = tG1.ManageCom;
	if ((userCode.length()==0) || (userCode.compareTo("")==0)||(comCode.length()==0) || (comCode.compareTo("")==0) ||(manageCom.length()==0) || (manageCom.compareTo("") == 0))
	{
		session.putValue("GI",null);
		String ContentErr = " ÇëÄúÖØÐÂµÇÂ¼£¡";
		System.out.println(ContentErr);

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("catch (exception)\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

		return;
	}
}
catch(Exception exception)
{
	String ContentErr = " exception:ÇëÄúÖØÐÂµÇÂ¼£¡";
	System.out.println(ContentErr);
	out.println("ÍøÒ³³¬Ê±£¬ÇëÄúÖØÐÂµÇÂ¼");

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("top.window.location =\"../indexlis.jsp\";\r\n");
      out.write("</script>\r\n");

	return;
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	//程序名称：CreateComQueryExcelSave.jsp
	//程序功能：生成综合查询报表
	//创建日期：2010-05-26 13:47:00
	//创建人  ：Lips
	//更新记录：  更新人    更新日期     更新原因/内容

      out.write('\r');
      out.write('\n');

	// 输出参数
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";

	//输入参数
	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");

	//通过取到的flag值的不同，执行相应的操作
	String flag = request.getParameter("flag");
	//公用SQL语句，初始化值
	String sql = "";
	String sql2 = "";
	//excel名称
	String excelName = "";
	//存储相关信息
	TransferData tTransferData = new TransferData();
	//用于存储列名称的数组
	String[] tColumnName = null;
	//1代表可疑综合查询
	//2大额综合查询
	//3审批不通过查询
	//4总公司放弃上报查询
	//5分公司放弃上报查询
	//6当地上报查询
	//7客户身份识别综合查询
	//8风险等级综合查询
	if ("1".equals(flag)) {
		excelName = "可疑综合查询结果";
		tColumnName = new String[] { "序号", "机构名称", "客户号", "客户名称/姓名",
				"证件号码","销售渠道","销售方式","产品类型","保全费用","保全项目","保单号","保全金额","联系信息", "可疑特征号", "可疑特征名", "数据状态", "交易发生日期", "提数日期",
				"筛选日期", "可疑程度", "操作员" };
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
		//客户号
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//客户名称/姓名
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//可疑交易特征
		String tSTCR = request.getParameter("STCR").trim();
		if (!"".equals(tSTCR) && tSTCR != null) {
			sql = sql + " and a.STCR='" + tSTCR + "'";
		}
		//数据状态
		String tDataState = request.getParameter("DataState").trim();
		if (!"".equals(tDataState) && tDataState != null) {
			sql = sql + " and a.DataState='" + tDataState + "'";
		}
		//可疑程度
		String tSDGR = request.getParameter("SDGR").trim();
		if (!"".equals(tSDGR) && tSDGR != null) {
			sql = sql + " and a.SDGR='" + tSDGR + "'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		excelName = "大额综合查询结果";
		tColumnName = new String[] { "序号", "交易编号", "客户号", "客户名称/姓名",
				"国籍", "数据状态代码", "数据状态", "证件类型", "证件号码", "交易发生日期",
				"操作人员", "机构代码", "机构名称" };
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
		//客户号
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//客户名称/姓名
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//大额交易特征
		String tCRCD = request.getParameter("CRCD").trim();
		sql = sql
				+ "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno";
		if (!"".equals(tCRCD) && tCRCD != null) {
			sql = sql + " and b.CRCD='" + tCRCD + "'";
		}
		sql = sql + ")";
		//数据状态
		String tDataState = request.getParameter("DataState").trim();
		if (!"".equals(tDataState) && tDataState != null) {
			sql = sql + " and a.DataState='" + tDataState + "'";
		}
		//数据来源
		String tDataSource = request.getParameter("DataSource").trim();
		sql = sql
				+ "and exists (select 1 from LXIHTradeDetail b where a.dealno = b.dealno";
		if (!"".equals(tDataSource) && tDataSource != null) {
			sql = sql + " and b.DataSource='" + tDataSource + "'";
		}
		sql = sql + ")";
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		excelName = "审批不通过查询结果";
		tColumnName = new String[] { "序号", "交易编号", "交易类型", "可疑程度",
				"客户号", "客户名称/姓名", "交易发生日期", "审批不通过原因", "操作人员", "操作日期",
				"操作时间", "机构代码", "机构名称" };
		sql = "select a.DEALNo, "
				+ "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
				+ "a.CSNM, " + "a.CTNM, " + "a.HTDT, " + "a.reason, "
				+ "a.OPERATOR, a.makedate,a.maketime,"
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXCancelreport a "
				+ "where 1 = 1 and a.DataType='02' ";
		//客户号
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//客户名称/姓名
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//交易编号
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//交易类型
		String tTradeType = request.getParameter("TradeType").trim();
		if (!"".equals(tTradeType) && tTradeType != null) {
			sql = sql + " and a.TradeType='" + tTradeType + "'";
		}
		//操作人员
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		excelName = "总公司放弃上报查询结果";
		tColumnName = new String[] { "序号", "交易编号", "交易类型", "可疑程度",
				"客户号", "客户名称/姓名", "交易发生日期", "放弃上报原因", "操作人员", "操作日期",
				"操作时间", "机构代码", "机构名称" };
		sql = "select a.DEALNo, "
				+ "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
				+ "a.CSNM, " + "a.CTNM, " + "a.HTDT, " + "a.reason, "
				+ "a.OPERATOR, a.makedate,a.maketime,"
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXCancelreport a "
				+ "where 1 = 1 and a.DataType='01' ";
		//客户号
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//客户名称/姓名
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//交易编号
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//交易类型
		String tTradeType = request.getParameter("TradeType").trim();
		if (!"".equals(tTradeType) && tTradeType != null) {
			sql = sql + " and a.TradeType='" + tTradeType + "'";
		}
		//操作人员
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		excelName = "分公司放弃上报查询结果";
		tColumnName = new String[] { "序号", "交易编号", "交易类型", "可疑程度",
				"客户号", "客户名称/姓名", "交易发生日期", "放弃上报原因", "操作人员", "操作日期",
				"操作时间", "机构代码", "机构名称" };
		sql = "select a.DEALNo, "
				+ "(select codename from ldcode where codetype='dealtype' and code=a.TradeType) ,"
				+ "(select codename from ldcode where codetype='amlshadiness' and code=(select SDGR from LXISTradeMain b where a.dealno=b.dealno)), "
				+ "a.CSNM, " + "a.CTNM, " + "a.HTDT, " + "a.reason, "
				+ "a.OPERATOR, a.makedate,a.maketime,"
				+ "a.MANAGECOM, "
				+ "(select name from ldcom where comcode=a.MANAGECOM) "
				+ "from LXCancelreport a "
				+ "where 1 = 1 and a.DataType is null ";
		//客户号
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and a.CSNM='" + tCSNM + "'";
		}
		//客户名称/姓名
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and a.CTNM='" + tCTNM + "'";
		}
		//交易编号
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//交易类型
		String tTradeType = request.getParameter("TradeType").trim();
		if (!"".equals(tTradeType) && tTradeType != null) {
			sql = sql + " and a.TradeType='" + tTradeType + "'";
		}
		//操作人员
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		excelName = "当地上报查询结果";
		tColumnName = new String[] { "序号", "交易编号", "交易类型", "可疑程度",
				"客户号", "客户名称/姓名", "交易发生日期", "上报人员", "上报日期", "当地监管机构",
				"上报备注", "机构代码", "机构名称" };
		sql = "select a.DealNo,(select codename from ldcode where codetype='dealtype' and code='IH'),'',"
				+ "b.CSNM,b.CTNM,b.HTDT,a.reporter,a.dealdate,(select codename from ldcode where codetype='localregulators' and code=LocalRegulators),"
				+ "a.remark,a.ManageCom,(select name from ldcom where comcode=a.ManageCom) from LXReportLocal a,LXIHTradeMain b "
				+ "where 1=1 " + "and a.DealNo=b.DealNo ";
		//交易编号
		String tDealNo = request.getParameter("DealNo").trim();
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//客户名称/姓名
		String tCTNM = request.getParameter("CTNM").trim();
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and b.CTNM='" + tCTNM + "'";
		}
		//交易类型
		String tDealType = request.getParameter("DealType").trim();
		if (!"".equals(tDealType) && tDealType != null) {
			sql = sql + " and a.ReportType='" + tDealType + "'";
		}
		//客户号
		String tCSNM = request.getParameter("CSNM").trim();
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and b.CSNM='" + tCSNM + "'";
		}
		//操作人员
		String tOPERATOR = request.getParameter("OPERATOR").trim();
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		//交易编号
		if (!"".equals(tDealNo) && tDealNo != null) {
			sql = sql + " and a.DealNo='" + tDealNo + "'";
		}
		//客户名称/姓名
		if (!"".equals(tCTNM) && tCTNM != null) {
			sql = sql + " and b.CTNM='" + tCTNM + "'";
		}
		//交易类型
		if (!"".equals(tDealType) && tDealType != null) {
			sql = sql + " and a.ReportType='" + tDealType + "'";
		}
		//客户号
		if (!"".equals(tCSNM) && tCSNM != null) {
			sql = sql + " and b.CSNM='" + tCSNM + "'";
		}
		//操作人员
		if (!"".equals(tOPERATOR) && tOPERATOR != null) {
			sql = sql + " and a.OPERATOR='" + tOPERATOR + "'";
		}
		//管理机构
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.ManageCom like '" + tManageCom + "%'";
		}
		//开始和结束日期
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
		excelName = "身份识别综合查询报表";
		tColumnName = new String[] { "序号", "机构名称", "保险合同号", "保险名称",
				"客户号", "投保人", "被保险人", "受益人", "销售渠道", "交易日期", "交易金额",
				"交易方式", "收支方向", "识别类型" };
		sql = "select (select shortname from ldcomA where comcode=managecom and rownum = 1), "
				+ "CONTNO, "
				+ "RISKNAME, "
				+ "appntno, "
				+ "APPNTNAME , "
				+ "INSUREDNAME, "
				+ "BENENAME,"
				+ "(case SALECHNL when '01' then '团险直销' when '02' then '银行代理' "
				+ "when '03' then '交叉销售' when '04' then '经纪公司' when '05' then '个人营销' "
				+ "when '06' then '专业代理' when '07' then '兼业代理' else '其它' end ) SALECHNL,"
				+ "TRANSDATE, "
				+ "TRANSAMOUNT, "
				+ "(case PAYMODE "
				+ " when '1' then '现金' "
				+ "	when '2' then '现金支票'"
				+ " when '3' then '银行收取'"
				+ " when '4' then '银行转帐'"
				+ " when '5' then '内部转帐'"
				+ " when '6' then '银行托收'"
				+ " when '7' then '业务员信用卡'"
				+ " when '9' then '网银代付'"
				+ " when 'A' then '银邮保通'"
				+ " when 'B' then '银保通'"
				+ " when 'C' then '支付宝'"
				+ " when 'D' then '平台收付'"
				+ " else '其他 ' "
				+ "end)  PAYMODE, "
				+ " (case AMTTYPE "
				+ " when '01' then '收'"
				+ " when '02' then '付' "
				+ " end) AMTTYPE,  "
				+ "(select codename from ldcode a where codetype='transtype' and a.code=TRANSTYPE ) TRANSTYPE "
				+ "from ANTIMONEYCUSTINFO " + "where 1 = 1  ";
		//销售渠道
		String tsalechnl = request.getParameter("salechnl").trim();
		if (!"".equals(tsalechnl) && tsalechnl != null) {
			sql = sql + " and salechnl='" + tsalechnl + "'";
		}
		//交易方式
		String tpaymode = request.getParameter("paymode").trim();
		if (!"".equals(tpaymode) && tpaymode != null) {
			sql = sql + " and paymode='" + tpaymode + "'";
		}

		//管理机构
		String tManageCom = request.getParameter("StatiCode").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and ManageCom like '" + tManageCom + "%'";
		}

		//识别类型
		String transtype = request.getParameter("transtype").trim();
		if (!"".equals(transtype) && transtype != null) {
			sql = sql + " and transtype='" + transtype + "'";
		}

		//识别方式
		String transtype1 = request.getParameter("transtype1").trim();
		if (transtype1.equals("00")) {
			sql = sql
					+ " and transtype  in('1001','1002','1003','1004') ";
		} else if (transtype1.equals("01")) {
			sql = sql
					+ " and transtype in('1005','1006','1007','1008') ";
		}

		//开始和结束日期
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
		excelName = "风险等级综合查报表";
		tColumnName = new String[] { "序号", "机构名称", "客户号", "客户名称",
				"风险等级", "集体保单号", "保险合同号", "保单风险得分", "客户类型" };
		//sql =  "select (select name from ldcomA where comcode=a.managecom),a.customerno,a.customername,"
		sql = "select a.managecom,a.customerno,a.customername,"
				+ " a.CustomerLevel,"
				+ " a.grpcontno, a.contno,a.score,(case a.customertype when  '1' then '投保人' when '2' then '被保人' else '受益人' end)"
				+ " from lxcustomerriskresult a where 1=1 ";

		//风险等级
		String tCustomerLevel = request.getParameter(
				"CustomerLevelName").trim();
		if (!"".equals(tCustomerLevel) && tCustomerLevel != null) {
			sql = sql + " and CustomerLevel='" + tCustomerLevel + "'";
		}
		//客户号
		String tCustomerNo = request.getParameter("CustomerNo").trim();
		if (!"".equals(tCustomerNo) && tCustomerNo != null) {
			sql = sql + " and CustomerNo='" + tCustomerNo + "'";
		}

		//管理机构
		String tManageCom = request.getParameter("StatiCode").trim();
		if (!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and ManageCom like '" + tManageCom + "%'";
		}

		//开始和结束日期
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

		//风险等级
		/*
		String tCustomerLevel2= request.getParameter("CustomerLevelName").trim();
		if(!"".equals(tCustomerLevel2) && tCustomerLevel2 != null) {
		sql = sql + " and CustomerLevel='" + tCustomerLevel2 + "'";
		}
		//客户号
		String tCustomerNo2 = request.getParameter("CustomerNo").trim();
		if(!"".equals(tCustomerNo2) && tCustomerNo2 != null) {
		sql = sql + " and CustomerNo='" + tCustomerNo2 + "'";
		}
		
		//管理机构
		String tManageCom2 = request.getParameter("StatiCode").trim();
		if(!"".equals(tManageCom2) && tManageCom2 != null) {
		sql = sql + " and ManageCom like '" + tManageCom2 + "%'";
		}

		//开始和结束日期
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
	tTransferData.setNameAndValue("excelName", excelName);//传递excel名字
	tTransferData.setNameAndValue("flag", flag);//传递标识
	tTransferData.setNameAndValue("SQL", sql);//所要查询的SQL语句
	tTransferData.setNameAndValue("SQL2", sql2);//统计总记录数
	tTransferData.setNameAndValue("ColumnName", tColumnName);//传递列名
	CreateComQueryExcelUI tCreateComQueryExcelUI = new CreateComQueryExcelUI();
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
			Content = "导出失败，原因是:" + ex.toString();
			FlagStr = "Fail";
		}
		if (!FlagStr.equals("Fail")) {

			tError = tCreateComQueryExcelUI.mErrors;
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

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\t<script language=\"JavaScript\">\r\n");
      out.write("try {\r\n");
      out.write("\tparent.fraInterface.afterSubmit('");
      out.print(FlagStr);
      out.write("', '");
      out.print(Content);
      out.write("');\r\n");
      out.write("} catch (ex) {\r\n");
      out.write("\talert('");
      out.print(Content);
      out.write("');\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
