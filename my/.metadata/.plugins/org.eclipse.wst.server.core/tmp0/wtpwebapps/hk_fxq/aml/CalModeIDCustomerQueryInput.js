//���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug = "0"; //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass(); //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageTasksGrid = new turnPageClass(); //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm() {
	try {
		initForm();
	} catch (re) {
		alert("��DataInterface.js-->resetForm�����з����쳣:��ʼ���������!");
	}
}

//��ʾfrmSubmit��ܣ���������
function showSubmitFrame(cDebug) {
	if (cDebug == "1") {
		parent.fraMain.rows = "0,0,50,82,*";
	} else {
		parent.fraMain.rows = "0,0,0,82,*";
	}
}

function beforeSubmit() {
	if (fm.all('StartDate').value > fm.all('EndDate').value) {
		alert("�������ڱ���С�ڵ��ڼ���ֹ�ڣ�");
		fm.all('StartDate').value = '';
		fm.all('EndDate').value = '';
		return false;
	}
	return true;
}

function QueryGrid() {
	var QuerySQL = "SELECT (SELECT NAME FROM LDCOMA WHERE COMCODE=MANAGECOM),"
			+ "CONTNO,"
			+ "RISKNAME,"
			+ "APPNTNO,"
			+ "APPNTNAME,"
			+ "INSUREDNAME,"
			+ "BENENAME,"
			+ "(CASE SALECHNL "
			+ " WHEN '01' THEN '����ֱ��'"
			+ " WHEN '02' THEN '���д���' "
			+ " WHEN '03' THEN '��������'"
			+ " WHEN '04' THEN '���͹�˾'"
			+ " WHEN '05' THEN '����Ӫ��'"
			+ " WHEN '06' THEN 'רҵ����'"
			+ " WHEN '07' THEN '��ҵ����'"
			+ " WHEN '08' THEN '�绰����'"
			+ " WHEN '09' THEN '����'"
			+ " END) SALECHNL, "
			+ "TRANSDATE,"
			+ "TRANSAMOUNT,"
			+ "(CASE PAYMODE "
			+ " WHEN '1' THEN '�ֽ�' "
			+ "	WHEN '2' THEN '�ֽ�֧'"
			+ " WHEN '3' THEN '�ֽ���ȡ'"
			+ " WHEN '4' THEN '����ת��'"
			+ " WHEN '5' THEN '�ڲ�ת��'"
			+ " WHEN '6' THEN '��������'"
			+ " WHEN '7' THEN 'ҵ��Ա���ÿ�'"
			+ " WHEN '9' THEN '��������'"
			+ " WHEN 'A' THEN '�ʱ�ͨ'"
			+ " WHEN 'B' THEN '����ͨ'"
			+ " WHEN 'C' THEN '֧����'"
			+ " WHEN 'D' THEN 'ƽ̨�ո�'"
			+ " ELSE '����'"
			+ " END)  PAYMODE,"
			+ " (CASE AMTTYPE"
			+ " WHEN '01' THEN '��'"
			+ " WHEN '02' THEN '��'"
			+ " END) AMTTYPE,"
			+ "(SELECT CODENAME FROM LDCODE A WHERE CODETYPE='transtype' AND A.CODE=TRANSTYPE) TRANSTYPE "
			+ "FROM ANTIMONEYCUSTINFO WHERE 1 = 1 "
			+ getWherePart("salechnl", "salechnl")
			+ getWherePart("paymode", "paymode")
			+ getWherePart("transtype", "transtype")
			+ getWherePart("MANAGECOM", "StatiCode", "like")
			+ getWherePart("transdate", "StartDate", ">=")
			+ getWherePart("transdate", "EndDate", "<=");

	if (fm.all('transtype1').value == '00') {
		QuerySQL += " and transtype in('1001','1002','1003','1004') ";
	} else if (fm.all('transtype1').value == '01') {
		QuerySQL += " and transtype in('1005','1006','1007','1008') ";
	}
	QuerySQL += "order by CUSTOMERINFOID ";
	var strTempSQL = QuerySQL.replace(/%25/g, "*");//��str���е�%25�滻��* 
	fm.all('QuerySQL').value = strTempSQL;//������SQL������ExportSQL��
	try {
		turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
		turnPageTasksGrid.queryModal(QuerySQL, TasksGrid, 0, 1);
	} catch (ex) {
		alert("���棺��ѯ����������� ");
	}
}
/*
 function ExportExcel(){
 //if(TasksGrid.mulLineCount==0||fm.all('QuerySQL').value==null ||fm.all('QuerySQL').value==""){
 if(TasksGrid.mulLineCount==0){
 alert('���Ȳ�ѯ!');
 return false;
 }
 fm.action="./TasksGridQueryExport.jsp";
 var showStr="����׼����ӡ���ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
 var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
 showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
 fm.submit(); //�ύ
 showInfo.close();
 }
 */

//����Excel
function GoToExcel() {
	var StartDate = fm.all('StartDate').value;
	var EndDate = fm.all('EndDate').value;
	if (StartDate != "" && StartDate != null && EndDate != ""
			&& EndDate != null) {
		if (StartDate > EndDate) {
			alert("���ã���ʼ���ڲ��ܴ��ڽ������ڣ�");
			return;
		}
	}
	var rowNum = TasksGrid.mulLineCount;
	if (rowNum > 0) {
		fm.action = "./CreateComQueryExcelSave.jsp?flag=7";
		fm.submit();
	} else {
		alert('û�����ݣ����Ȳ�ѯ');
	}
}

//״̬��ѯ����
function showCode(cObj, cName) {
	//alert(cName)
	if (fm.all('transtype1').value == '00') {
		showCodeList("transtype", [ cObj, cName ], [ 0, 1 ], null,
				'1 and code in(#1001#,#1002#,#1003#,#1004#)', '1');
	} else if (fm.all('transtype1').value == '01') {
		showCodeList("transtype", [ cObj, cName ], [ 0, 1 ], null,
				'1 and code in(#1005#,#1006#,#1007#,#1008#)', '1');
	} else {
		showCodeList("transtype", [ cObj, cName ], [ 0, 1 ], null, '1', '1');
	}

}
function showCodeKey(cObj, cName) {//alert(111)
	if (fm.all('transtype1').value == '00') {
		showCodeListKey("transtype", [ cObj, cName ], [ 0, 1 ], null,
				'1 and code in(#1001#,#1002#,#1003#,#1004#)', '1');
	} else if (fm.all('transtype1').value == '01') {
		showCodeListKey("transtype", [ cObj, cName ], [ 0, 1 ], null,
				'1 and code in(#1005#,#1006#,#1007#,#1008#)', '1');
	} else {
		showCodeListKey("transtype", [ cObj, cName ], [ 0, 1 ], null, '1', '1');
	}

}