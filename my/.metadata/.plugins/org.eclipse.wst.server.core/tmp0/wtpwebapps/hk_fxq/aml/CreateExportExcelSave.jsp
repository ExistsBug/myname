<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%
//�������ƣ�CreateExportExcelSave.jsp
//�����ܣ�������ϸ���ݱ���
//�������ڣ�2010-08-16 10:42:00
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
	tGI=(GlobalInput)session.getValue("GI");
	
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
	//1Ͷ������Ͷ��2W
	//2Ͷ�������ۼ�20W����
	//3Ͷ���ŵ�20W������
	//4Ͷ���ŵ�2W
	//5�˱�����1W������
	//6�˱��ŵ�1W������
	//7��������1W������
	//8�ŵ�����1W������
	if("1".equals(flag)) {
		excelName = "�����ֽ�2W����";
		tColumnName = new String[]{"��������","������","��������","������������","Ͷ������","Ͷ����������","Ͷ�����Ա�","Ͷ���˹���","Ͷ����ְҵ","Ͷ���˵�ַ","Ͷ������ϵ��ʽ","Ͷ����֤������",
				"֤������","��Ч����","Ͷ���˹�����λ","Ͷ����ְ��","Ͷ��������״��","Ͷ���˿ͻ���","����������","�������Ա�","�����˹���","������ְҵ","�����˵�ַ","��������ϵ��ʽ",
				"������֤������","������֤������","��Ч����","�����˹�����λ","������ְ��","����������״��","�����˿ͻ���","��Ͷ���˹�ϵ","����������","�뱻���˹�ϵ","�������Ա�","�����˹���",
				"������ְҵ","��ַ","��ϵ��ʽ","������֤������","������֤������","������λ","ְ��","����״��","�ͻ���","������������","�����ڽ�����",
				"����׷�ӱ���","�ɷѼ��","��������","�ۼƱ���","�����ֽ�ʽ","�����ֽ���ɱ��Ѳ���","Ͷ����������","������ȷ������","����ǩ��ʱ��"};
		sql = "select   b.managecom ��������,b.contno ������,b.salechnl ��������,"+
		      " (select codename from ldcode where codetype = 'branchtype' and code = b.salechnl) ������������,b.prtno Ͷ������,b.appntname Ͷ����������,"+
		      " (select ldcode.codename from ldcode where codetype = 'sex' and code = c.appntsex) Ͷ�����Ա�,"+
		      " (select ldcode.codename from ldcode where codetype = 'nativeplace' and code = c.nativeplace) Ͷ���˹���,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = c.occupationcode) Ͷ����ְҵ,"+
		      " (select postaladdress from lcaddress where customerno = b.appntno and addressno = c.addressno) Ͷ���˵�ַ,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = b.appntno and addressno = c.addressno) Ͷ������ϵ��ʽ,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.appntidtype) Ͷ����֤������,b.appntidno ֤������,(select ldperson.ideffenddate from ldperson where ldperson.customerno=c.appntno) ��Ч����,"+
		      " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = c.appntno and lcaddress.addressno = c.addressno) Ͷ���˹�����λ,'' Ͷ����ְ��,"+
		      " (select dd.impartparam || '��/��' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = c.contno and dd.customerno = c.appntno and dd.customernotype = '0') Ͷ��������״��,"+
		      " b.appntno Ͷ���˿ͻ���,b.insuredname ����������,(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) �������Ա�,"+
		      " (select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) �����˹���,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) ������ְҵ,"+
		      " (select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) �����˵�ַ,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) ��������ϵ��ʽ,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) ������֤������,b.insuredidno ������֤������,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.InsuredNo) ��Ч����,"+
	          " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) �����˹�����λ,'' ������ְ��,"+
		      " (select dd.impartparam || '��/��' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') ����������״��,"+
		      " b.insuredno �����˿ͻ���,(select codename from ldcode  where codetype = 'relation' and code = d.relationtoappnt) ��Ͷ���˹�ϵ,f.name ����������,"+
		      " (select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = f.relationtoinsured) �뱻���˹�ϵ,"+
		      " (select ldcode.codename from ldcode where codetype = 'sex' and code = f.sex) �������Ա�,'' �����˹���,'' ������ְҵ,'' ��ַ,'' ��ϵ��ʽ,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = f.idtype) ������֤������,f.idno ������֤������,'' ������λ,'' ְ��,'' ����״��,'' �ͻ���,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1) ������������,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')) �����ڽ�����,"+
		      " nvl((select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode in ('013001', '056001')),'0') ����׷�ӱ���,"+
		      " (select decode(Max(lcpol.payintv), '0', '����', '�꽻') from lcpol where contno = b.contno and polno = mainpolno) �ɷѼ��,"+
	          " (select decode(Max(lcpol.payintv), '0', '--', Max(lcpol.payyears)) from lcpol where contno = b.contno and polno = mainpolno) ��������,"+
	          " (b.sumprem + (select decode(Max(payintv), '0', 1, Max(payyears)) - 1 from lcpol where contno = b.contno and mainpolno = polno) *"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001'))) �ۼƱ���,'�ֽ�'  �����ֽ�ʽ,"+
		      " (select sum(paymoney) from ljtempfeeclass where otherno=b.prtno and paymode='1'  ) �����ֽ���ɱ��Ѳ���,b.polapplydate Ͷ����������,"+
		      " (select max(enteraccdate) from ljtempfeeclass where otherno=b.prtno and paymode='1' ) ������ȷ������,b.signdate ����ǩ��ʱ��"+
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
	  //��ʼ�ͽ�������
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
		//�������
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
		excelName = "����ת��20W����";
		tColumnName = new String[]{"��������","������","��������","������������","Ͷ������","Ͷ����������","Ͷ�����Ա�","Ͷ���˹���","Ͷ����ְҵ","Ͷ���˵�ַ","Ͷ������ϵ��ʽ","Ͷ����֤������",
				"֤������","��Ч����","Ͷ���˹�����λ","Ͷ����ְ��","Ͷ��������״��","Ͷ���˿ͻ���","����������","�������Ա�","�����˹���","������ְҵ","�����˵�ַ","��������ϵ��ʽ",
				"������֤������","������֤������","��Ч����","�����˹�����λ","������ְ��","����������״��","�����˿ͻ���","����������","�뱻���˹�ϵ","�������Ա�","�����˹���",
				"������ְҵ","��ַ","��ϵ��ʽ","������֤������","������֤������","������λ","ְ��","����״��","�ͻ���","��Ͷ���˹�ϵ","������������","�����ڽ�����",
				"����׷�ӱ���","�ɷѼ��","��������","�ۼƱ���","���ڽɷѷ�ʽ","Ԥ��ת�˱���","�˻���","�ͻ���������","ת���˺�","Ͷ����������","������ȷ������","����ǩ��ʱ��"};
		sql = "select b.managecom ��������,b.contno ������,b.salechnl ��������,(select codename from ldcode where codetype = 'branchtype' and code = b.salechnl) ������������,"+
		      " b.prtno Ͷ������,b.appntname Ͷ����������,(select ldcode.codename from ldcode where codetype = 'sex' and code = c.appntsex) Ͷ�����Ա�,"+
		      " (select ldcode.codename  from ldcode where codetype = 'nativeplace' and code = c.nativeplace) Ͷ���˹���,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = c.occupationcode) Ͷ����ְҵ,"+
		      " (select postaladdress from lcaddress where customerno = b.appntno and addressno = c.addressno) Ͷ���˵�ַ,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = b.appntno and addressno = c.addressno) Ͷ������ϵ��ʽ,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.appntidtype) Ͷ����֤������,b.appntidno ֤������,(select ldperson.ideffenddate from ldperson where ldperson.customerno=c.appntno) ��Ч����,"+
		      " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = c.appntno and lcaddress.addressno = c.addressno) Ͷ���˹�����λ,'' Ͷ����ְ��,"+
		      " (select dd.impartparam || '��/��' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = c.contno and dd.customerno = c.appntno and dd.customernotype = '0') Ͷ��������״��,"+
		      " b.appntno Ͷ���˿ͻ���,b.insuredname ����������,(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) �������Ա�,"+
		      " (select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) �����˹���,"+
		      " (select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) ������ְҵ,"+
		      " (select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) �����˵�ַ,"+
		      " (select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) ��������ϵ��ʽ,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) ������֤������, b.insuredidno ������֤������,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.InsuredNo) ��Ч����,"+
		      " (select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) �����˹�����λ,'' ������ְ��,"+
		      " (select dd.impartparam || '��/��' from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') ����������״��,"+
		      " b.insuredno �����˿ͻ���,f.name ����������,(select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = f.relationtoinsured) �뱻���˹�ϵ,"+
		      " (select ldcode.codename from ldcode where codetype = 'sex' and code = f.sex) �������Ա�,'' �����˹���,'' ������ְҵ,'' ��ַ,'' ��ϵ��ʽ,"+
		      " (select ldcode.codename from ldcode where codetype = 'idtype' and code = f.idtype) ������֤������,f.idno ������֤������,'' ������λ,'' ְ��,'' ����״��,'' �ͻ���,"+
		      " (select codename from ldcode where codetype = 'relation' and code = d.relationtoappnt) ��Ͷ���˹�ϵ,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1) ������������,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001')) �����ڽ�����,"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode in ('013001', '056001')) ����׷�ӱ���,"+
		      " (select decode(Max(lcpol.payintv), '0', '����', '�꽻') from lcpol where contno = b.contno and polno = mainpolno) �ɷѼ��,"+
		      " (select decode(Max(lcpol.payintv), '0', '--', Max(lcpol.payyears)) from lcpol where contno = b.contno and polno = mainpolno) ��������,"+
		      " (b.sumprem + (select decode(Max(payintv), '0', 1, Max(payyears)) - 1 from lcpol where contno = b.contno and mainpolno = polno) *"+
		      " (select sum(sumactupaymoney) from ljapayperson where contno = b.contno and mainpolyear = 1 and dutycode not in ('013001', '056001'))) �ۼƱ���,"+
		      " ' ת��' ���ڽɷѷ�ʽ,(select sum(paymoney) from ljtempfeeclass where otherno=b.prtno and paymode<>'1') Ԥ��ת�˱���,"+
		      " (select accname from ljtempfeeclass where otherno=b.prtno and paymode<>'1' and rownum=1) �˻���,"+
		      " (select codename from ldcode where codetype = 'headoffice' and code = (select bankcode from ljtempfeeclass where otherno=b.prtno and  paymode<>'1' and rownum=1)) �ͻ���������,"+
		      " (select bankaccno from ljtempfeeclass where otherno=b.prtno and  paymode<>'1' and rownum=1) ת���˺�,b.polapplydate Ͷ����������,"+
		      " (select enteraccdate from ljtempfeeclass where otherno=b.prtno and rownum=1) ������ȷ������,b.signdate ����ǩ��ʱ��"+
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
	    //��ʼ�ͽ�������
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
		//�������
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
		excelName = "����ת��20W����";
		tColumnName = new String[]{"��������","�������","�ŵ�����","����","ס��","��Ӫ��Χ","��֯��������","˰��Ǽ�֤����","�ͻ���","���ִ��","����","���뼰��Ч����",
				"�عɹɶ�","���˴���","������","��ϵ��","��ϵ����","���֤��","����","��Ч����","���˱�����","��������","������������","Ͷ������",
				"Ͷ����λ����","����������","֤������","֤������","���˱���","���ڽɷѷ�ʽ","Ԥ���ֽ𱣷�","Ͷ����������","��������","������ȷ������","����ǩ��ʱ��"};
		sql = "select b.managecom ��������,(select shortname from ldcom where comcode = b.managecom) �������,b.grpcontno �ŵ�����,d.name ����,"+
		      " d.postaladdress ס��,c.mainbussiness ��Ӫ��Χ,'' ��֯��������,'' ˰��Ǽ�֤����,d.customerno �ͻ���,'' ���ִ��,'' ����,"+
		      " '' ���뼰��Ч����,'' �عɹɶ�,'' ���˴���,'' ������,e.linkman1 ��ϵ��,e.department1 ��ϵ����,'' ���֤��,'' ����,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.CustomerNo) ��Ч����,"+
		      " b.contno ���˱�����,b.salechnl ��������,(select codename from ldcode where codetype='branchtype' and code=b.salechnl) ������������,"+
		      " b.prtno Ͷ������,b.appntname Ͷ����λ����,b.insuredname ����������,b.appntidtype ֤������,b.appntidno ֤������,"+
		      " b.sumprem ���˱���,(select codename from ldcode where codetype = 'paymode' and a.paymode = code) ���ڽɷѷ�ʽ,"+
		      " a.paymoney Ԥ���ֽ𱣷�,(select lcgrpcont.polapplydate from lcgrpcont where prtno=b.prtno ) Ͷ����������,"+
		      " a.paydate ��������,a.enteraccdate ������ȷ������,b.signdate ����ǩ��ʱ��"+
		      " from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
		      " where a.paymode <> '1' and a.paymoney >= 200000 and a.otherno = b.prtno and b.sumprem>=200000 and b.grpcontno=c.grpcontno"+
		      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('������','�����˻�')"+
		      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 200000 and insuredname<>'������'";
	    sql2 = "select count(1)" + " from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
	      " where a.paymode <> '1' and a.paymoney >= 200000 and a.otherno = b.prtno and b.sumprem>=200000 and b.grpcontno=c.grpcontno"+
	      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('������','�����˻�')"+
	      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 200000 and insuredname<>'������'";
	    //��ʼ�ͽ�������
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
		//�������
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
		excelName = "�����ֽ�2W����";
		tColumnName = new String[]{"��������","�������","�ŵ�����","����","ס��","��Ӫ��Χ","��֯��������","˰��Ǽ�֤����","�ͻ���","���ִ��","����","���뼰��Ч����",
				"�عɹɶ�","���˴���","������","��ϵ��","��ϵ����","���֤��","����","��Ч����","���˱�����","��������","������������","Ͷ������",
				"Ͷ����λ����","����������","֤������","֤������","���˱���","Ԥ���ֽ𱣷�","Ͷ����������","��������","������ȷ������","����ǩ��ʱ��"};
		
		sql = "select b.managecom ��������,(select shortname from ldcom where comcode = b.managecom) �������,b.grpcontno �ŵ�����,d.name ����,"+
		      " d.postaladdress ס��,c.mainbussiness ��Ӫ��Χ,'' ��֯��������,'' ˰��Ǽ�֤����,d.customerno �ͻ���,'' ���ִ��,'' ����,"+
		      " '' ���뼰��Ч����,'' �عɹɶ�,'' ���˴���,'' ������,e.linkman1 ��ϵ��,e.department1 ��ϵ����,'' ���֤��,'' ����,(select ldperson.ideffenddate from ldperson where ldperson.customerno=d.CustomerNo) ��Ч����,"+
		      " b.contno ���˱�����,b.salechnl ��������,(select codename from ldcode where codetype='branchtype' and code=b.salechnl) ������������,"+
		      " b.prtno Ͷ������,b.appntname Ͷ����λ����,b.insuredname ����������,b.appntidtype ֤������,b.appntidno ֤������,b.sumprem ���˱���,"+
		      " a.paymoney Ԥ���ֽ𱣷�,"+
		      " (select lcgrpcont.polapplydate from lcgrpcont where prtno=b.prtno ) Ͷ����������,a.paydate ��������,a.enteraccdate ������ȷ������,b.signdate ����ǩ��ʱ��"+
		      " from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
		      " where a.paymode = '1' and a.paymoney >= 20000 and a.otherno = b.prtno and b.sumprem>=20000 and b.grpcontno=c.grpcontno"+
		      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('������','�����˻�')"+
		      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 20000 and insuredname<>'������'";
		sql2 = "select count(1) "+" from ljtempfeeclass a, lccont b,lcgrpcont c,lcgrpappnt d,lcgrpaddress e"+
	      " where a.paymode = '1' and a.paymoney >= 20000 and a.otherno = b.prtno and b.sumprem>=20000 and b.grpcontno=c.grpcontno"+
	      " and b.grpcontno=d.grpcontno and c.appntno=e.customerno and c.addressno=e.addressno and insuredname not in('������','�����˻�')"+
	      " and a.otherno in (select prtno from lccont where conttype = '2' and sumprem >= 20000 and insuredname<>'������'";
		//��ʼ�ͽ�������
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
		//�������
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
		excelName = "�����˱�1W����";
		tColumnName = new String[]{"������","��������","�˱����뷽ʽ","�˱�������","�˱�����","�˱������֤����","�˱���֤������","�˱�ԭ��","�տ���","�տ���","�տ����˺�","�տ���㷽ʽ"};
		sql = "select distinct a.contno ������,(select riskname from lmrisk where riskcode=c.riskcode) ��������,"+
			  " (select codename from ldcode where codetype = 'edorapptype' and code=b.apptype)�˱����뷽ʽ,"+
			  " (case b.apptype when '3' then b.cpname when '1' then c.appntname when '2' then (select name from laagent where agentcode=c.agentcode) when '5' then c.appntname else '' end) �˱�������,"+
			  " b.edorappdate �˱�����,"+
			  " (case b.apptype when '3' then (select codename from ldcode where codetype='idtype' and code=b.cpidtype) when '1' then (select codename from ldcode where codetype='idtype' and code=d.appntidtype)"+
			  " when '5' then (select codename from ldcode where codetype='idtype' and code=d.appntidtype) when '2' then (select codename from ldcode where codetype='idtype' and code ="+
			  " (select idnotype from laagent where agentcode=c.agentcode)) else '' end) �˱������֤����,"+
			  " (case b.apptype when '3' then b.idcode when '1' then d.appntidno when '5' then d.appntidno when '2' then (select idno from laagent where agentcode=c.agentcode) else '' end) �˱���֤������,"+
			  " (select codename from ldcode where codetype='surrordereason' and code=a.edorreasoncode) �˱�ԭ��,"+
			  " (select max(drawer) from ljaget where otherno=a.edoracceptno) �տ���,"+
			  " (select nvl(sum(getmoney),0) from ljagetendorse where endorsementno=a.edorno and contno=c.contno and riskcode=c.riskcode) �տ���,"+
			  " (select max(bankaccno) from ljaget where otherno=a.edoracceptno)  �տ����˺�,"+
			  " decode(b.getform,'1','�ֽ�','3','֧Ʊ','ת��') �տ���㷽ʽ"+
			  " from lpedoritem a,lpedorapp b,lcpol c,lccont d"+
			  " where a.edoracceptno=b.edoracceptno and a.contno=c.contno and c.contno=d.contno"+
			  " and a.edortype in ('CT','XT','PA')"+
			  " and d.conttype='1'";
		sql2 = "select count(1)" + " from lpedoritem a,lpedorapp b,lcpol c,lccont d"+
		  " where a.edoracceptno=b.edoracceptno and a.contno=c.contno and c.contno=d.contno"+
		  " and a.edortype in ('CT','XT','PA')"+
		  " and d.conttype='1'"; 
		//��ʼ�ͽ�������
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
		//�������
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
		excelName = "�����˱�1W����";
		tColumnName = new String[]{"���屣����","Ͷ����λ","��������","EDORTYPE","�˱����뷽ʽ","�˱�������","�˱�����","�˱������֤����","�˱���֤������","�˱�ԭ��","�տ���","�տ���","�տ����˺�","�տ���㷽ʽ"};
		sql="select a.grpcontno ���屣����,c.grpname Ͷ����λ,(select riskname from lmrisk where riskcode=c.riskcode) ��������,a.edortype EDORTYPE,"+
		  " (select codename from ldcode where codetype = 'edorapptype' and code=b.apptype)�˱����뷽ʽ,"+
		  " (case b.apptype when '3' then b.cpname when '1' then c.grpname when '2' then (select name from laagent where agentcode=c.agentcode) else '' end) �˱�������,"+
		  " b.edorappdate �˱�����,"+
		  " (case b.apptype when '3' then (select codename from ldcode where codetype='idtype' and code=b.cpidtype) when '1' then ''"+
		  " when '2' then (select codename from ldcode m1,laagent m2 where m2.agentcode=c.agentcode and m1.code=m2.idnotype and m1.codetype='idtype') else '' end) �˱������֤����,"+
		  " (case b.apptype when '3' then b.idcode  when '1' then '' when '2' then (select idno from laagent where agentcode=c.agentcode) else '' end) �˱���֤������,"+
		  " (select codename from ldcode where codetype='surrordereason' and code=a.edorreasoncode) �˱�ԭ��,"+
		  " (select drawer from ljaget where otherno=a.edoracceptno) �տ���,"+
		  " (select nvl(sum(getmoney),0) from ljagetendorse where endorsementno=a.edorno and grpcontno=a.grpcontno and riskcode=c.riskcode) �տ���,"+
		  " (select bankaccno from ljaget where otherno=a.edoracceptno)  �տ����˺�,"+
		  " decode(b.getform,'1','�ֽ�','3','֧Ʊ','ת��') �տ���㷽ʽ"+
		  " from lpgrpedoritem a,lpedorapp b,lcgrppol c"+
		  " where a.edoracceptno=b.edoracceptno and a.grpcontno=c.grpcontno"+
		  " and a.edortype in ('CT','XT','PA')";
		sql2="select count(1)"+" from lpgrpedoritem a,lpedorapp b,lcgrppol c"+
		  " where a.edoracceptno=b.edoracceptno and a.grpcontno=c.grpcontno"+
		  " and a.edortype in ('CT','XT','PA')";
		//��ʼ�ͽ�������
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
		//�������
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
		excelName = "��������1W����";
		tColumnName = new String[]{"�ⰸ��","Ͷ��������","Ͷ�����Ա�","Ͷ���˹���","Ͷ����ְҵ","Ͷ���˵�ַ","Ͷ������ϵ��ʽ","Ͷ����֤������","Ͷ����֤������","��Ч����","Ͷ���˹�����λ","Ͷ����ְ��","Ͷ��������״��","Ͷ���˿ͻ���"
				,"����������","�������Ա�","�����˹���","������ְҵ","�����˵�ַ","��������ϵ��ʽ","������֤������","������֤������","�����˹�����λ","������ְ��","����������״��","�����˿ͻ���"
				,"����������","�뱻���˹�ϵ","�������Ա�","�����˹���","������ְҵ","��ַ","��ϵ��ʽ","������֤������","������֤������","������λ","ְ��","����״��","�ͻ���"};
		sql = "select e.clmno �ⰸ��,b.appntname Ͷ��������,"
		       +"(select ldcode.codename from ldcode where codetype = 'sex' and code = c.appntsex),"
		       +"(select ldcode.codename from ldcode where codetype = 'nativeplace' and code = c.nativeplace) Ͷ���˹���,"
		       +"(select ldoccupation.occupationname from ldoccupation where occupationcode = c.occupationcode) Ͷ����ְҵ,"
		       +"(select postaladdress from lcaddress where customerno = b.appntno and addressno = c.addressno) Ͷ���˵�ַ,"
		       +"(select nvl(mobile, companyphone) from lcaddress where customerno = b.appntno and addressno = c.addressno) Ͷ������ϵ��ʽ,"
		       +"(select ldcode.codename from ldcode where codetype = 'idtype' and code = b.appntidtype) Ͷ����֤������,"
		       +"b.appntidno Ͷ����֤������,(select ldperson.ideffenddate from ldperson where ldperson.customerno=c.appntno) ��Ч����,"
		       +"(select lcaddress.companyaddress from lcaddress where lcaddress.customerno = c.appntno and lcaddress.addressno = c.addressno) Ͷ���˹�����λ,"
		       +"'' Ͷ����ְ��,"
		       +"(select dd.impartparam from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = c.contno and dd.customerno = c.appntno and dd.customernotype = '0') Ͷ��������״��,"
		       +"b.appntno Ͷ���˿ͻ���,"
		       +"b.insuredname ����������,"
		       +"(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) �������Ա�,"
		       +"(select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) �����˹���,"
		       +"(select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) ������ְҵ,"
		       +"(select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) �����˵�ַ,"
		       +"(select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) ��������ϵ��ʽ,"
		       +"(select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) ������֤������,"
		       +"b.insuredidno ������֤������,"
		       +"(select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) �����˹�����λ,"
		       +"'' ������ְ��,"
		       +"(select dd.impartparam from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') ����������״��,"
		       +"b.insuredno �����˿ͻ���,"
		       +"e.name ����������,"
		       +"(select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = e.relationtoinsured) �뱻���˹�ϵ,"
		       +"(select ldcode.codename from ldcode where codetype = 'sex' and code = e.sex) �������Ա�,"
		       +"'' �����˹���,'' ������ְҵ,'' ��ַ,'' ��ϵ��ʽ,"
		       +"(select ldcode.codename from ldcode where codetype = 'idtype' and code = e.idtype) ������֤������,"
		       +"e.idno ������֤������,'' ������λ,'' ְ��,'' ����״��,'' �ͻ���"
		       +" from lccont b, lcappnt c, lcinsured d,llbnf e,  lcpol f"
		       +" where b.contno = c.contno"
		       +" and b.appntno = c.appntno"
		       +" and d.contno = b.contno"
		       +" and d.appntno = c.appntno"
		       +" and d.insuredno = b.insuredno"
		       +" and f.contno = b.contno"
		       +" and b.contno = e.contno"
		       +" and e.name != '����'"
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
		       +" and e.name != '����'"
		       +" and e.polno = f.polno"
		       +" and e.insuredno = b.insuredno"
		       +" and b.signdate is not null"
		       +" and b.contno in(select contno  from llbnf where clmno in("
		       +" select distinct otherno from ljagetclaim where 1=1" 
		       +" and exists (select 1 from lccont where contno = ljagetclaim.contno and conttype='2')";
		//��ʼ�ͽ�������
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
		//�������
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
		excelName = "��������1W����";
		tColumnName = new String[]{"������","�ŵ���","������","Ͷ����λ����"
				,"����������","�������Ա�","�����˹���","������ְҵ","�����˵�ַ","��������ϵ��ʽ","������֤������","������֤������","�����˹�����λ","������ְ��","����������״��","�����˿ͻ���"
				,"����������","�뱻���˹�ϵ","�������Ա�","�����˹���","������ְҵ","��ַ","��ϵ��ʽ","������֤������","������֤������","������λ","ְ��","����״��","�ͻ���"};
		sql="select  e.clmno ������,e.grpcontno �ŵ���,e.contno ������, b.appntname Ͷ����λ����,"+
		       //--����Ϊ��������Ϣ
		       "b.insuredname ����������,"+
		       "(select ldcode.codename from ldcode where codetype = 'sex' and code = b.insuredsex) �������Ա�,"+
		       "(select ldcode.codename from ldcode where codetype = 'nativeplace' and code = d.nativeplace) �����˹���,"+
		       "(select ldoccupation.occupationname from ldoccupation where occupationcode = d.occupationcode) ������ְҵ,"+
		       "(select postaladdress from lcaddress where customerno = d.insuredno and addressno = d.addressno) �����˵�ַ,"+
		       "(select nvl(mobile, companyphone) from lcaddress where customerno = d.insuredno and addressno = d.addressno) ��������ϵ��ʽ,"+
		       "(select ldcode.codename from ldcode where codetype = 'idtype' and code = b.insuredidtype) ������֤������,"+
		       "b.insuredidno ������֤������,"+
		       "(select lcaddress.companyaddress from lcaddress where lcaddress.customerno = d.insuredno and lcaddress.addressno = d.addressno) �����˹�����λ,"+
		       "'' ������ְ��,"+
		       "(select dd.impartparam from lccustomerimpartparams dd where dd.impartparamname = 'Money' and dd.contno = d.contno and dd.customerno = d.insuredno and dd.customernotype = '1') ����������״��,"+
		       "b.insuredno �����˿ͻ���,"+
		       //--����Ϊ��������Ϣ
		       "e.name ����������,"+
		       "(select dd.codename from ldcode dd where dd.codetype = 'relation' and dd.code = e.relationtoinsured) �뱻���˹�ϵ,"+
		       "(select ldcode.codename from ldcode where codetype = 'sex' and code = e.sex) �������Ա�,"+
		       "'' �����˹���,"+
		       "'' ������ְҵ,"+
		       "'' ��ַ,"+
		       "'' ��ϵ��ʽ,"+
		       "(select ldcode.codename from ldcode where codetype = 'idtype' and code = e.idtype) ������֤������,"+
		       "e.idno ������֤������,"+
		       "'' ������λ,"+
		       "'' ְ��,"+
		       "'' ����״��,"+
		       "'' �ͻ���"+
		" from lccont b, lcgrpappnt c, lcinsured d,llbnf e,  lcpol f"+
        " where b.grpcontno = c.grpcontno"+
		   " and d.contno = b.contno"+
		   " and d.insuredno = b.insuredno"+
		   " and f.contno = b.contno"+
		   " and b.contno = e.contno"+
		   " and e.name != '����'"+
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
		   " and e.name != '����'"+
		   " and e.polno = f.polno"+
		   " and e.insuredno = b.insuredno"+
		   " and b.signdate is not null"+
		   " and e.clmno in(select distinct otherno from   ljagetclaim where 1=1"+ 
	    " and exists (select 1 from lccont where contno = ljagetclaim.contno and conttype='2')";
		//��ʼ�ͽ�������
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
		//�������
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
	tTransferData.setNameAndValue("excelName",excelName);//����excel����
	tTransferData.setNameAndValue("flag",flag);//���ݱ�ʶ
	tTransferData.setNameAndValue("SQL",sql);//��Ҫ��ѯ��SQL���
	tTransferData.setNameAndValue("SQL2",sql2);//ͳ���ܼ�¼��
	tTransferData.setNameAndValue("ColumnName",tColumnName);//��������
	CreateExportExcelUI tCreateExportExcelUI = new CreateExportExcelUI();
    VData tVData = new VData();
	if(tGI==null)
	{
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
  	//ҳ����Ч
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
			    Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
			    FlagStr = "Fail";
			}
			if (!FlagStr.equals("Fail"))
			{

				tError = tCreateExportExcelUI.mErrors;
				if (!tError.needDealError())
				{

					Content = " �����ɹ�! ";
					FlagStr = "Succ";
				}
				else
				{
					Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
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


