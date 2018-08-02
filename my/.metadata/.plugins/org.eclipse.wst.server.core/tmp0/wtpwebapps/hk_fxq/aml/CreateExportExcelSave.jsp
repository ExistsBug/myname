<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%
//程序名称：CreateExportExcelSave.jsp
//程序功能：生成明细数据报表
//创建日期：2010-08-16 10:42:00
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
	tGI=(GlobalInput)session.getValue("GI");
	
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
	//1投保个单投保2W
	//2投保个单累计20W以上
	//3投保团单20W及以上
	//4投保团单2W
	//5退保个单1W及以上
	//6退保团单1W及以上
	//7个单理赔1W及以上
	//8团单理赔1W及以上
	if("1".equals(flag)) {
		excelName = "个人现金2W提数";
		tColumnName = new String[]{"机构代码","保单号","销售渠道","销售渠道名称","投保单号","投保单人姓名","投保人性别","投保人国籍","投保人职业","投保人地址","投保人联系方式","投保人证件类型",
				"证件号码","有效期限","投保人工作单位","投保人职务","投保人收入状况","投保人客户号","被保人姓名","被保人性别","被保人国籍","被保人职业","被保人地址","被保人联系方式",
				"被保人证件类型","被保人证件号码","有效期限","被保人工作单位","被保人职务","被保人收入状况","被保人客户号","与投保人关系","受益人姓名","与被保人关系","受益人性别","受益人国籍",
				"受益人职业","地址","联系方式","受益人证件类型","受益人证件号码","工作单位","职务","收入状况","客户号","首期整单保费","首期期交保费",
				"首期追加保费","缴费间隔","交费年期","累计保费","首期现金方式","首期现金缴纳保费部分","投保申请日期","财务到账确认日期","保单签发时间"};
		sql = "select   b.managecom 机构代码,b.contno 保单号,b.salechnl 销售渠道,"+
		      " (select codename from ldcode where codetype = 'branchtype' and code = b.salechnl) 销售渠道名称,b.prtno 投保单号,b.appntname 投保单人姓名,"+
		      " (select ldcode.codename from ldcode where codetype = 'sex' and code = c.appntsex) 投保人性别,"+
		      " (select ldcode.codename from ldcode where codetype = 'nativeplace' and code = c.nativeplace) 投保人国籍,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = c.occupationcode) 投保人职业,"+
		      " (select postaladdress from lcaddress where customerno = b.appntno and addressno = c.addressno) 投保人地址,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = b.appntno and addressno = c.addressno) 投保人联系方式,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.appntidtype) 投保人证件类型,b.appntidno 证件号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=c.appntno) 有效期限,"+
		      " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = c.appntno and lcaddress.addressno = c.addressno) 投保人工作单位,'' 投保人职务,"+
		      " (select dd.impartparam || '万/年' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = c.contno and dd.customerno = c.appntno and dd.customernotype = '0') 投保人收入状况,"+
		      " b.appntno 投保人客户号,b.insuredname 被保人姓名,(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) 被保人性别,"+
		      " (select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) 被保人国籍,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) 被保人职业,"+
		      " (select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人地址,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人联系方式,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) 被保人证件类型,b.insuredidno 被保人证件号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.InsuredNo) 有效期限,"+
	          " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) 被保人工作单位,'' 被保人职务,"+
		      " (select dd.impartparam || '万/年' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') 被保人收入状况,"+
		      " b.insuredno 被保人客户号,(select codename from ldcode  where codetype = 'relation' and code = d.relationtoappnt) 与投保人关系,f.name 受益人姓名,"+
		      " (select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = f.relationtoinsured) 与被保人关系,"+
		      " (select ldcode.codename from ldcode where codetype = 'sex' and code = f.sex) 受益人性别,'' 受益人国籍,'' 受益人职业,'' 地址,'' 联系方式,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = f.idtype) 受益人证件类型,f.idno 受益人证件号码,'' 工作单位,'' 职务,'' 收入状况,'' 客户号,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1) 首期整单保费,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')) 首期期交保费,"+
		      " nvl((select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode in ('013001', '056001')),'0') 首期追加保费,"+
		      " (select decode(Max(lcpol.payintv), '0', '趸交', '年交') from lcpol where contno = b.contno and polno = mainpolno) 缴费间隔,"+
	          " (select decode(Max(lcpol.payintv), '0', '--', Max(lcpol.payyears)) from lcpol where contno = b.contno and polno = mainpolno) 交费年期,"+
	          " (b.sumprem + (select decode(Max(payintv), '0', 1, Max(payyears)) - 1 from lcpol where contno = b.contno and mainpolno = polno) *"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001'))) 累计保费,'现金'  首期现金方式,"+
		      " (select sum(paymoney) from ljtempfeeclass where otherno=b.prtno and paymode='1'  ) 首期现金缴纳保费部分,b.polapplydate 投保申请日期,"+
		      " (select max(enteraccdate) from ljtempfeeclass where otherno=b.prtno and paymode='1' ) 财务到账确认日期,b.signdate 保单签发时间"+
		      " from lccont b, lcappnt c, lcinsured d,ljtempfeeclass j,lcbnf f"+
		      " where conttype = '1' and b.contno = c.contno and b.contno = d.contno and 20000 <= (b.sumprem +"+
		      " (select decode(payintv, '0', 1, payyears) - 1 from lcpol where contno = b.contno and mainpolno = polno and rownum=1) *"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')))"+
		      " and b.prtno=j.otherno and j.paymode='1' and j.makedate =(select min(makedate) from  ljtempfeeclass where otherno =j.otherno and paymode='1'  )"+
		      " and b.contno(+) =f.contno";
	    sql2 = "select count(1)"+" from lccont b, lcappnt c, lcinsured d,ljtempfeeclass j,lcbnf f"+
	      " where conttype = '1' and b.contno = c.contno and b.contno = d.contno and 20000 <= (b.sumprem +"+
	      " (select decode(payintv, '0', 1, payyears) - 1 from lcpol where contno = b.contno and mainpolno = polno and rownum=1) *"+
	      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')))"+
	      " and b.prtno=j.otherno and j.paymode='1' and j.makedate =(select min(makedate) from  ljtempfeeclass where otherno =j.otherno and paymode='1'  )"+
	      " and b.contno(+) =f.contno";
	  //开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and b.polapplydate >= to_date('"+StartDate+"', 'yyyy-mm-dd')" + " and b.polapplydate <= to_date('"+EndDate+"', 'yyyy-mm-dd')";
			sql2 = sql2 + " and b.polapplydate >= to_date('"+StartDate+"', 'yyyy-mm-dd')" + " and b.polapplydate <= to_date('"+EndDate+"', 'yyyy-mm-dd')";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and b.polapplydate >= to_date('"+StartDate+"', 'yyyy-mm-dd')";
			sql2 = sql2 + " and b.polapplydate >= to_date('"+StartDate+"', 'yyyy-mm-dd')";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and b.polapplydate <= to_date('"+EndDate+"', 'yyyy-mm-dd')";
			sql2 = sql2 + " and b.polapplydate <= to_date('"+EndDate+"', 'yyyy-mm-dd')";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and b.managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and b.managecom like '" + tManageCom + "%'";
		}
		sql = sql + " order by b.managecom,b.contno";
		sql2 = sql2 + " order by b.managecom,b.contno";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("2".equals(flag)){
		excelName = "个人转账20W提数";
		tColumnName = new String[]{"机构代码","保单号","销售渠道","销售渠道名称","投保单号","投保单人姓名","投保人性别","投保人国籍","投保人职业","投保人地址","投保人联系方式","投保人证件类型",
				"证件号码","有效期限","投保人工作单位","投保人职务","投保人收入状况","投保人客户号","被保人姓名","被保人性别","被保人国籍","被保人职业","被保人地址","被保人联系方式",
				"被保人证件类型","被保人证件号码","有效期限","被保人工作单位","被保人职务","被保人收入状况","被保人客户号","受益人姓名","与被保人关系","受益人性别","受益人国籍",
				"受益人职业","地址","联系方式","受益人证件类型","受益人证件号码","工作单位","职务","收入状况","客户号","与投保人关系","首期整单保费","首期期交保费",
				"首期追加保费","缴费间隔","交费年期","累计保费","首期缴费方式","预收转账保费","账户名","客户开户银行","转账账号","投保申请日期","财务到账确认日期","保单签发时间"};
		sql = "select b.managecom 机构代码,b.contno 保单号,b.salechnl 销售渠道,(select codename from ldcode where codetype = 'branchtype' and code = b.salechnl) 销售渠道名称,"+
		      " b.prtno 投保单号,b.appntname 投保单人姓名,(select ldcode.codename from ldcode where codetype = 'sex' and code = c.appntsex) 投保人性别,"+
		      " (select ldcode.codename  from ldcode where codetype = 'nativeplace' and code = c.nativeplace) 投保人国籍,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = c.occupationcode) 投保人职业,"+
		      " (select postaladdress from lcaddress where customerno = b.appntno and addressno = c.addressno) 投保人地址,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = b.appntno and addressno = c.addressno) 投保人联系方式,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.appntidtype) 投保人证件类型,b.appntidno 证件号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=c.appntno) 有效期限,"+
		      " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = c.appntno and lcaddress.addressno = c.addressno) 投保人工作单位,'' 投保人职务,"+
		      " (select dd.impartparam || '万/年' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = c.contno and dd.customerno = c.appntno and dd.customernotype = '0') 投保人收入状况,"+
		      " b.appntno 投保人客户号,b.insuredname 被保人姓名,(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) 被保人性别,"+
		      " (select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) 被保人国籍,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) 被保人职业,"+
		      " (select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人地址,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人联系方式,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) 被保人证件类型, b.insuredidno 被保人证件号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.InsuredNo) 有效期限,"+
		      " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) 被保人工作单位,'' 被保人职务,"+
		      " (select dd.impartparam || '万/年' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') 被保人收入状况,"+
		      " b.insuredno 被保人客户号,f.name 受益人姓名,(select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = f.relationtoinsured) 与被保人关系,"+
		      " (select ldcode.codename from ldcode where codetype = 'sex' and code = f.sex) 受益人性别,'' 受益人国籍,'' 受益人职业,'' 地址,'' 联系方式,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = f.idtype) 受益人证件类型,f.idno 受益人证件号码,'' 工作单位,'' 职务,'' 收入状况,'' 客户号,"+
		      " (select codename from ldcode where codetype = 'relation' and code = d.relationtoappnt) 与投保人关系,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1) 首期整单保费,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')) 首期期交保费,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode in ('013001', '056001')) 首期追加保费,"+
		      " (select decode(Max(lcpol.payintv), '0', '趸交', '年交') from lcpol where contno = b.contno and polno = mainpolno) 缴费间隔,"+
		      " (select decode(Max(lcpol.payintv), '0', '--', Max(lcpol.payyears)) from lcpol where contno = b.contno and polno = mainpolno) 交费年期,"+
		      " (b.sumprem + (select decode(Max(payintv), '0', 1, Max(payyears)) - 1 from lcpol where contno = b.contno and mainpolno = polno) *"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001'))) 累计保费,"+
		      " ' 转账' 首期缴费方式,(select sum(paymoney) from ljtempfeeclass where otherno=b.prtno and paymode<>'1') 预收转账保费,"+
		      " (select accname from ljtempfeeclass where otherno=b.prtno and paymode<>'1' and rownum=1) 账户名,"+
		      " (select codename from ldcode where codetype = 'headoffice' and code = (select bankcode from ljtempfeeclass where otherno=b.prtno and  paymode<>'1' and rownum=1)) 客户开户银行,"+
		      " (select bankaccno from ljtempfeeclass where otherno=b.prtno and  paymode<>'1' and rownum=1) 转账账号,b.polapplydate 投保申请日期,"+
		      " (select enteraccdate from ljtempfeeclass where otherno=b.prtno and rownum=1) 财务到账确认日期,b.signdate 保单签发时间"+
		      " from lccont b, lcappnt c, lcinsured d,lcbnf f"+
		      " where conttype = '1' and b.contno = c.contno and b.contno = d.contno and 200000 <= (b.sumprem +"+
		      " (select decode(payintv, '0', 1, payyears) - 1 from lcpol where contno = b.contno and mainpolno = polno and rownum=1) *"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')))"+
		      " and b.contno(+)=f.contno";
	    sql2 = "select count(1)" + " from lccont b, lcappnt c, lcinsured d,lcbnf f"+
	      " where conttype = '1' and b.contno = c.contno and b.contno = d.contno and 200000 <= (b.sumprem +"+
	      " (select decode(payintv, '0', 1, payyears) - 1 from lcpol where contno = b.contno and mainpolno = polno and rownum=1) *"+
	      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')))"+
	      " and b.contno(+)=f.contno";
	    //开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(b.polapplydate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(b.polapplydate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(b.polapplydate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(b.polapplydate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(b.polapplydate,'yyyy-mm-dd')>='"+StartDate+"'";
			sql2 = sql2 + " and to_char(b.polapplydate,'yyyy-mm-dd')>='"+StartDate+"'";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(b.polapplydate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(b.polapplydate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and b.managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and b.managecom like '" + tManageCom + "%'";
		}
		sql = sql + " order by b.managecom";
		sql2 = sql2 + " order by b.managecom";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("3".equals(flag)){
		excelName = "团体转账20W提数";
		tColumnName = new String[]{"机构代码","管理机构","团单号码","名称","住所","经营范围","组织机构代码","税务登记证号码","客户号","社会活动执照","名称","号码及有效期限",
				"控股股东","法人代表","负责人","联系人","联系部门","身份证件","号码","有效期限","个人保单号","销售渠道","销售渠道名称","投保单号",
				"投保单位名称","被保人姓名","证件类型","证件号码","个人保费","首期缴费方式","预收现金保费","投保申请日期","受理日期","财务到账确认日期","保单签发时间"};
		sql = "select b.managecom 机构代码,(select shortname from ldcom where comcode = b.managecom) 管理机构,b.grpcontno 团单号码,d.name 名称,"+
		      " d.postaladdress 住所,c.mainbussiness 经营范围,'' 组织机构代码,'' 税务登记证号码,d.customerno 客户号,'' 社会活动执照,'' 名称,"+
		      " '' 号码及有效期限,'' 控股股东,'' 法人代表,'' 负责人,e.linkman1 联系人,e.department1 联系部门,'' 身份证件,'' 号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.CustomerNo) 有效期限,"+
		      " b.contno 个人保单号,b.salechnl 销售渠道,(select codename from ldcode where codetype='branchtype' and code=b.salechnl) 销售渠道名称,"+
		      " b.prtno 投保单号,b.appntname 投保单位名称,b.insuredname 被保人姓名,b.appntidtype 证件类型,b.appntidno 证件号码,"+
		      " b.sumprem 个人保费,(select codename from ldcode where codetype = 'paymode' and a.paymode = code) 首期缴费方式,"+
		      " a.paymoney 预收现金保费,(select lcgrpcont.polapplydate from lcgrpcont where prtno=b.prtno ) 投保申请日期,"+
		      " a.paydate 受理日期,a.enteraccdate 财务到账确认日期,b.signdate 保单签发时间"+
		      " from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
		      " where a.paymode <> '1' and a.paymoney >= 200000 and a.otherno = b.prtno and b.sumprem>=200000 and b.grpcontno=c.grpcontno"+
		      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('无名单','公共账户')"+
		      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 200000 and insuredname<>'无名单'";
	    sql2 = "select count(1)" + " from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
	      " where a.paymode <> '1' and a.paymoney >= 200000 and a.otherno = b.prtno and b.sumprem>=200000 and b.grpcontno=c.grpcontno"+
	      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('无名单','公共账户')"+
	      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 200000 and insuredname<>'无名单'";
	    //开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
			sql2 = sql2 + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"')";
			sql2 = sql2 + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"')";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
			sql2 = sql2 + " and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and b.managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and b.managecom like '" + tManageCom + "%'";
		}
		sql = sql + " order by b.managecom";
		sql2 = sql2 + " order by b.managecom";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("4".equals(flag)){
		excelName = "团体现金2W提数";
		tColumnName = new String[]{"机构代码","管理机构","团单号码","名称","住所","经营范围","组织机构代码","税务登记证号码","客户号","社会活动执照","名称","号码及有效期限",
				"控股股东","法人代表","负责人","联系人","联系部门","身份证件","号码","有效期限","个人保单号","销售渠道","销售渠道名称","投保单号",
				"投保单位名称","被保人姓名","证件类型","证件号码","个人保费","预收现金保费","投保申请日期","受理日期","财务到账确认日期","保单签发时间"};
		
		sql = "select b.managecom 机构代码,(select shortname from ldcom where comcode = b.managecom) 管理机构,b.grpcontno 团单号码,d.name 名称,"+
		      " d.postaladdress 住所,c.mainbussiness 经营范围,'' 组织机构代码,'' 税务登记证号码,d.customerno 客户号,'' 社会活动执照,'' 名称,"+
		      " '' 号码及有效期限,'' 控股股东,'' 法人代表,'' 负责人,e.linkman1 联系人,e.department1 联系部门,'' 身份证件,'' 号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.CustomerNo) 有效期限,"+
		      " b.contno 个人保单号,b.salechnl 销售渠道,(select codename from ldcode where codetype='branchtype' and code=b.salechnl) 销售渠道名称,"+
		      " b.prtno 投保单号,b.appntname 投保单位名称,b.insuredname 被保人姓名,b.appntidtype 证件类型,b.appntidno 证件号码,b.sumprem 个人保费,"+
		      " a.paymoney 预收现金保费,"+
		      " (select lcgrpcont.polapplydate from lcgrpcont where prtno=b.prtno ) 投保申请日期,a.paydate 受理日期,a.enteraccdate 财务到账确认日期,b.signdate 保单签发时间"+
		      " from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
		      " where a.paymode = '1' and a.paymoney >= 20000 and a.otherno = b.prtno and b.sumprem>=20000 and b.grpcontno=c.grpcontno"+
		      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('无名单','公共账户')"+
		      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 20000 and insuredname<>'无名单'";
		sql2 = "select count(1) "+" from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
	      " where a.paymode = '1' and a.paymoney >= 20000 and a.otherno = b.prtno and b.sumprem>=20000 and b.grpcontno=c.grpcontno"+
	      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('无名单','公共账户')"+
	      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 20000 and insuredname<>'无名单'";
		//开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
			sql2 = sql2 + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"')";
			sql2 = sql2 + " and to_char(signdate,'yyyy-mm-dd')>='"+StartDate+"')";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
			sql2 = sql2 + " and to_char(signdate,'yyyy-mm-dd')<='"+EndDate+"')";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and b.managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and b.managecom like '" + tManageCom + "%'";
		}
		sql = sql + " order by b.managecom";
		sql2 = sql2 + " order by b.managecom";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("5".equals(flag)){	
		excelName = "个人退保1W提数";
		tColumnName = new String[]{"保单号","险种名称","退保申请方式","退保申请人","退保日期","退保人身份证种类","退保人证件号码","退保原因","收款人","收款金额","收款人账号","收款结算方式"};
		sql = "select distinct a.contno 保单号,(select riskname from lmrisk where riskcode=c.riskcode) 险种名称,"+
			  " (select codename from ldcode where codetype = 'edorapptype' and code=b.apptype)退保申请方式,"+
			  " (case b.apptype when '3' then b.cpname when '1' then c.appntname when '2' then (select name from laagent where agentcode=c.agentcode) when '5' then c.appntname else '' end) 退保申请人,"+
			  " b.edorappdate 退保日期,"+
			  " (case b.apptype when '3' then (select codename from ldcode where codetype='idtype' and code=b.cpidtype) when '1' then (select codename from ldcode where codetype='idtype' and code=d.appntidtype)"+
			  " when '5' then (select codename from ldcode where codetype='idtype' and code=d.appntidtype) when '2' then (select codename from ldcode where codetype='idtype' and code ="+
			  " (select idnotype from laagent where agentcode=c.agentcode)) else '' end) 退保人身份证种类,"+
			  " (case b.apptype when '3' then b.idcode when '1' then d.appntidno when '5' then d.appntidno when '2' then (select idno from laagent where agentcode=c.agentcode) else '' end) 退保人证件号码,"+
			  " (select codename from ldcode where codetype='surrordereason' and code=a.edorreasoncode) 退保原因,"+
			  " (select max(drawer) from ljaget where otherno=a.edoracceptno) 收款人,"+
			  " (select nvl(sum(getmoney),0) from ljagetendorse where endorsementno=a.edorno and contno=c.contno and riskcode=c.riskcode) 收款金额,"+
			  " (select max(bankaccno) from ljaget where otherno=a.edoracceptno)  收款人账号,"+
			  " decode(b.getform,'1','现金','3','支票','转账') 收款结算方式"+
			  " from lpedoritem a,lpedorapp b,lcpol c,lccont d"+
			  " where a.edoracceptno=b.edoracceptno and a.contno=c.contno and c.contno=d.contno"+
			  " and a.edortype in ('CT','XT','PA')"+
			  " and d.conttype='1'";
		sql2 = "select count(1)" + " from lpedoritem a,lpedorapp b,lcpol c,lccont d"+
		  " where a.edoracceptno=b.edoracceptno and a.contno=c.contno and c.contno=d.contno"+
		  " and a.edortype in ('CT','XT','PA')"+
		  " and d.conttype='1'"; 
		//开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"'";
			sql2 = sql2 + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"'";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and a.managecom like '" + tManageCom + "%'";
		}
		sql = sql + " and a.edorstate = '0'"+
		  " and exists (select 1 from ljagetendorse where endorsementno=a.edorno and contno=c.contno and riskcode=c.riskcode having(abs(nvl(sum(getmoney),0))>10000))";
		sql2 = sql2 + " and a.edorstate = '0'"+
		  " and exists (select 1 from ljagetendorse where endorsementno=a.edorno and contno=c.contno and riskcode=c.riskcode having(abs(nvl(sum(getmoney),0))>10000))";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("6".equals(flag)){
		excelName = "团体退保1W提数";
		tColumnName = new String[]{"团体保单号","投保单位","险种名称","EDORTYPE","退保申请方式","退保申请人","退保日期","退保人身份证种类","退保人证件号码","退保原因","收款人","收款金额","收款人账号","收款结算方式"};
		sql="select a.grpcontno 团体保单号,c.grpname 投保单位,(select riskname from lmrisk where riskcode=c.riskcode) 险种名称,a.edortype EDORTYPE,"+
		  " (select codename from ldcode where codetype = 'edorapptype' and code=b.apptype)退保申请方式,"+
		  " (case b.apptype when '3' then b.cpname when '1' then c.grpname when '2' then (select name from laagent where agentcode=c.agentcode) else '' end) 退保申请人,"+
		  " b.edorappdate 退保日期,"+
		  " (case b.apptype when '3' then (select codename from ldcode where codetype='idtype' and code=b.cpidtype) when '1' then ''"+
		  " when '2' then (select codename from ldcode m1,laagent m2 where m2.agentcode=c.agentcode and m1.code=m2.idnotype and m1.codetype='idtype') else '' end) 退保人身份证种类,"+
		  " (case b.apptype when '3' then b.idcode  when '1' then '' when '2' then (select idno from laagent where agentcode=c.agentcode) else '' end) 退保人证件号码,"+
		  " (select codename from ldcode where codetype='surrordereason' and code=a.edorreasoncode) 退保原因,"+
		  " (select drawer from ljaget where otherno=a.edoracceptno) 收款人,"+
		  " (select nvl(sum(getmoney),0) from ljagetendorse where endorsementno=a.edorno and grpcontno=a.grpcontno and riskcode=c.riskcode) 收款金额,"+
		  " (select bankaccno from ljaget where otherno=a.edoracceptno)  收款人账号,"+
		  " decode(b.getform,'1','现金','3','支票','转账') 收款结算方式"+
		  " from lpgrpedoritem a,lpedorapp b,lcgrppol c"+
		  " where a.edoracceptno=b.edoracceptno and a.grpcontno=c.grpcontno"+
		  " and a.edortype in ('CT','XT','PA')";
		sql2="select count(1)"+" from lpgrpedoritem a,lpedorapp b,lcgrppol c"+
		  " where a.edoracceptno=b.edoracceptno and a.grpcontno=c.grpcontno"+
		  " and a.edortype in ('CT','XT','PA')";
		//开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"'";
			sql2 = sql2 + " and to_char(a.edorappdate,'yyyy-mm-dd')>='"+StartDate+"'";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(a.edorappdate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and a.managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and a.managecom like '" + tManageCom + "%'";
		}
		sql = sql + " and a.edorstate = '0'"+
		  " and exists (select 1 from ljagetendorse where endorsementno=a.edorno and grpcontno=a.grpcontno and riskcode=c.riskcode having(abs(nvl(sum(getmoney),0))>10000))";
		sql2 = sql2 + " and a.edorstate = '0'"+
		  " and exists (select 1 from ljagetendorse where endorsementno=a.edorno and grpcontno=a.grpcontno and riskcode=c.riskcode having(abs(nvl(sum(getmoney),0))>10000))";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("7".equals(flag)){
		excelName = "个人理赔1W提数";
		tColumnName = new String[]{"赔案号","投保人姓名","投保人性别","投保人国籍","投保人职业","投保人地址","投保人联系方式","投保人证件类型","投保人证件号码","有效期限","投保人工作单位","投保人职务","投保人收入状况","投保人客户号"
				,"被保人姓名","被保人性别","被保人国籍","被保人职业","被保人地址","被保人联系方式","被保人证件类型","被保人证件号码","被保人工作单位","被保人职务","被保人收入状况","被保人客户号"
				,"受益人姓名","与被保人关系","受益人性别","受益人国籍","受益人职业","地址","联系方式","受益人证件类型","受益人证件号码","工作单位","职务","收入状况","客户号"};
		sql = "select e.clmno 赔案号,b.appntname 投保人姓名,"
		       +"(select ldcode.codename from ldcode where codetype = 'sex' and code = c.appntsex),"
		       +"(select ldcode.codename from ldcode where codetype = 'nativeplace' and code = c.nativeplace) 投保人国籍,"
		       +"(select ldoccupation.occupationname from ldoccupation where occupationcode = c.occupationcode) 投保人职业,"
		       +"(select postaladdress from lcaddress where customerno = b.appntno and addressno = c.addressno) 投保人地址,"
		       +"(select nvl(mobile, companyphone) from lcaddress where customerno = b.appntno and addressno = c.addressno) 投保人联系方式,"
		       +"(select ldcode.codename from ldcode where codetype = 'idtype' and code = b.appntidtype) 投保人证件类型,"
		       +"b.appntidno 投保人证件号码,(select ldperson.ideffenddate from ldperson where ldperson.customerno=c.appntno) 有效期限,"
		       +"(select lcaddress.companyaddress from lcaddress where lcaddress.customerno = c.appntno and lcaddress.addressno = c.addressno) 投保人工作单位,"
		       +"'' 投保人职务,"
		       +"(select dd.impartparam from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = c.contno and dd.customerno = c.appntno and dd.customernotype = '0') 投保人收入状况,"
		       +"b.appntno 投保人客户号,"
		       +"b.insuredname 被保人姓名,"
		       +"(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) 被保人性别,"
		       +"(select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) 被保人国籍,"
		       +"(select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) 被保人职业,"
		       +"(select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人地址,"
		       +"(select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人联系方式,"
		       +"(select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) 被保人证件类型,"
		       +"b.insuredidno 被保人证件号码,"
		       +"(select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) 被保人工作单位,"
		       +"'' 被保人职务,"
		       +"(select dd.impartparam from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') 被保人收入状况,"
		       +"b.insuredno 被保人客户号,"
		       +"e.name 受益人姓名,"
		       +"(select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = e.relationtoinsured) 与被保人关系,"
		       +"(select ldcode.codename from ldcode where codetype = 'sex' and code = e.sex) 受益人性别,"
		       +"'' 受益人国籍,'' 受益人职业,'' 地址,'' 联系方式,"
		       +"(select ldcode.codename from ldcode where codetype = 'idtype' and code = e.idtype) 受益人证件类型,"
		       +"e.idno 受益人证件号码,'' 工作单位,'' 职务,'' 收入状况,'' 客户号"
		       +" from lccont b, lcappnt c, lcinsured d,llbnf e,  lcpol f"
		       +" where b.contno = c.contno"
		       +" and b.appntno = c.appntno"
		       +" and d.contno = b.contno"
		       +" and d.appntno = c.appntno"
		       +" and d.insuredno = b.insuredno"
		       +" and f.contno = b.contno"
		       +" and b.contno = e.contno"
		       +" and e.name != '法定'"
		       +" and e.polno = f.polno"
		       +" and e.insuredno = b.insuredno"
		       +" and b.signdate is not null"
		       +" and b.contno in(select contno  from llbnf where clmno in("
		       +" select distinct otherno from ljagetclaim where 1=1" 
		       +" and exists (select 1 from lccont where contno = ljagetclaim.contno and conttype='2')";
		sql2 = "select count(1)"
			+" from lccont b, lcappnt c, lcinsured d,llbnf e, lcpol f"
		       +" where b.contno = c.contno"
		       +" and b.appntno = c.appntno"
		       +" and d.contno = b.contno"
		       +" and d.appntno = c.appntno"
		       +" and d.insuredno = b.insuredno"
		       +" and f.contno = b.contno"
		       +" and b.contno = e.contno"
		       +" and e.name != '法定'"
		       +" and e.polno = f.polno"
		       +" and e.insuredno = b.insuredno"
		       +" and b.signdate is not null"
		       +" and b.contno in(select contno  from llbnf where clmno in("
		       +" select distinct otherno from ljagetclaim where 1=1" 
		       +" and exists (select 1 from lccont where contno = ljagetclaim.contno and conttype='2')";
		//开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"'";
			sql2 = sql2 + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"'";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and managecom like '" + tManageCom + "%'";
		}
		sql = sql + " group by managecom,otherno,makedate having sum(pay) >=10000))";
		sql2 = sql2 + " group by managecom,otherno,makedate having sum(pay) >=10000))";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}else if("8".equals(flag)){
		excelName = "团体理赔1W提数";
		tColumnName = new String[]{"案件号","团单号","个单号","投保单位名称"
				,"被保人姓名","被保人性别","被保人国籍","被保人职业","被保人地址","被保人联系方式","被保人证件类型","被保人证件号码","被保人工作单位","被保人职务","被保人收入状况","被保人客户号"
				,"受益人姓名","与被保人关系","受益人性别","受益人国籍","受益人职业","地址","联系方式","受益人证件类型","受益人证件号码","工作单位","职务","收入状况","客户号"};
		sql="select  e.clmno 案件号,e.grpcontno 团单号,e.contno 个单号, b.appntname 投保单位名称,"+
		       //--以下为被保人信息
		       "b.insuredname 被保人姓名,"+
		       "(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) 被保人性别,"+
		       "(select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) 被保人国籍,"+
		       "(select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) 被保人职业,"+
		       "(select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人地址,"+
		       "(select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) 被保人联系方式,"+
		       "(select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) 被保人证件类型,"+
		       "b.insuredidno 被保人证件号码,"+
		       "(select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) 被保人工作单位,"+
		       "'' 被保人职务,"+
		       "(select dd.impartparam from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') 被保人收入状况,"+
		       "b.insuredno 被保人客户号,"+
		       //--以下为受益人信息
		       "e.name 受益人姓名,"+
		       "(select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = e.relationtoinsured) 与被保人关系,"+
		       "(select ldcode.codename from ldcode where codetype = 'sex' and code = e.sex) 受益人性别,"+
		       "'' 受益人国籍,"+
		       "'' 受益人职业,"+
		       "'' 地址,"+
		       "'' 联系方式,"+
		       "(select ldcode.codename from ldcode where codetype = 'idtype' and code = e.idtype) 受益人证件类型,"+
		       "e.idno 受益人证件号码,"+
		       "'' 工作单位,"+
		       "'' 职务,"+
		       "'' 收入状况,"+
		       "'' 客户号"+
		" from lccont b, lcgrpappnt c, lcinsured d,llbnf e,  lcpol f"+
        " where b.grpcontno = c.grpcontno"+
		   " and d.contno = b.contno"+
		   " and d.insuredno = b.insuredno"+
		   " and f.contno = b.contno"+
		   " and b.contno = e.contno"+
		   " and e.name != '法定'"+
		   " and e.polno = f.polno"+
		   " and e.insuredno = b.insuredno"+
		   " and b.signdate is not null"+
		   " and e.clmno in(select distinct otherno from   ljagetclaim where 1=1"+ 
	    " and exists (select 1 from lccont where contno = ljagetclaim.contno and conttype='2')";
		sql2="select count(1)"+
		"from lccont b, lcgrpappnt c, lcinsured d,llbnf e,  lcpol f"+
        " where b.grpcontno = c.grpcontno"+
		   " and d.contno = b.contno"+
		   " and d.insuredno = b.insuredno"+
		   " and f.contno = b.contno"+
		   " and b.contno = e.contno"+
		   " and e.name != '法定'"+
		   " and e.polno = f.polno"+
		   " and e.insuredno = b.insuredno"+
		   " and b.signdate is not null"+
		   " and e.clmno in(select distinct otherno from   ljagetclaim where 1=1"+ 
	    " and exists (select 1 from lccont where contno = ljagetclaim.contno and conttype='2')";
		//开始和结束日期
		String StartDate = request.getParameter("StartDate").trim();
		String EndDate = request.getParameter("EndDate").trim();
		if(!"".equals(StartDate) && StartDate != null && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"' and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		if(!"".equals(StartDate) && StartDate != null && ("".equals(EndDate) || EndDate == null)) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"'";
			sql2 = sql2 + " and to_char(makedate,'yyyy-mm-dd')>='"+StartDate+"'";
		}
		if(("".equals(StartDate) || StartDate == null) && !"".equals(EndDate) && EndDate != null) {
			sql = sql + " and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
			sql2 = sql2 + " and to_char(makedate,'yyyy-mm-dd')<='"+EndDate+"'";
		}
		//管理机构
		String tManageCom = request.getParameter("ManageCom").trim();
		if(!"".equals(tManageCom) && tManageCom != null) {
			sql = sql + " and managecom like '" + tManageCom + "%'";
			sql2 = sql2 + " and managecom like '" + tManageCom + "%'";
		}
		sql = sql + " group by managecom,otherno,makedate having sum(pay) >=10000)";
		sql2 = sql2 + " group by managecom,otherno,makedate having sum(pay) >=10000)";
		System.out.println("sql="+sql);
		System.out.println("sql2="+sql2);
	}
	System.out.println("=========================================");
	System.out.println(sql);
	tTransferData.setNameAndValue("excelName",excelName);//传递excel名字
	tTransferData.setNameAndValue("flag",flag);//传递标识
	tTransferData.setNameAndValue("SQL",sql);//所要查询的SQL语句
	tTransferData.setNameAndValue("SQL2",sql2);//统计总记录数
	tTransferData.setNameAndValue("ColumnName",tColumnName);//传递列名
	CreateExportExcelUI tCreateExportExcelUI = new CreateExportExcelUI();
    VData tVData = new VData();
	if(tGI==null)
	{
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
  	//页面有效
	else 
	{
		  	tVData.add(tGI);
			tVData.add(tTransferData);
			try
			{ 
				if(tCreateExportExcelUI.submitData(tVData, ""))
				{
						response.reset();
						response.setContentType("application/msexcel");   
						//response.setContentType("application/octet-stream"); 
						response.setHeader("Content-disposition","attachment;filename="+new String(excelName.getBytes("gb2312"), "iso8859-1")+".xls"); 
						OutputStream ops = response.getOutputStream();
						tCreateExportExcelUI.getHSSFWorkbook().write(ops);
						ops.flush();
						ops.close();
				}

			}
			catch(Exception ex)
			{
					ex.printStackTrace();
			    Content = "导出失败，原因是:" + ex.toString();
			    FlagStr = "Fail";
			}
			if (!FlagStr.equals("Fail"))
			{

				tError = tCreateExportExcelUI.mErrors;
				if (!tError.needDealError())
				{

					Content = " 导出成功! ";
					FlagStr = "Succ";
				}
				else
				{
					Content = " 导出失败，原因是:" + tError.getFirstError();
					FlagStr = "Fail";

				}
			}
			System.out.println("***Content="+Content+",FlagStr="+FlagStr);
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


