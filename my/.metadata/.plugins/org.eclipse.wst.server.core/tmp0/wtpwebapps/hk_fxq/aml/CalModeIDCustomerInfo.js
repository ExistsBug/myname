//���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug = "0"; //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass(); //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageTasksGrid = new turnPageClass(); //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

//��������
function submitForm() {
	if (!verifyForm('fm'))
		return false;

	if (!beforeSubmit())
		return false;
	var End = fm.EndDate.value;
	var cur = fm.CurrentDate.value;
	if (End > cur) {
		alert("������ȡֹ�ڲ��ܴ��ڽ���");
		return false;
	}

	var i = 0;
	var showStr = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr = "../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
	showInfo = window.showModelessDialog(urlStr, window,
			"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	fm.submit(); //�ύ

}

//�ύ�����,���������ݷ��غ�ִ�еĲ���
function afterSubmit(FlagStr, content) {
	showInfo.close();
	if (FlagStr == "Fail") {
		var urlStr = "../common/jsp/MessagePage.jsp?picture=C&content="
				+ content;
		showModalDialog(urlStr, window,
				"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
	} else {
		var urlStr = "../common/jsp/MessagePage.jsp?picture=S&content="
				+ content;
		showModalDialog(urlStr, window,
				"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
	}
}

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

//ִ������         
function CalSave() {
	fm.sFlag.value = "cal";
	submitForm();
}
function ReCalSave() {
	fm.sFlag.value = "recal";
	submitForm();
}
function FillCalSave() {
	fm.sFlag.value = "fillcal";
	submitForm();
}
function DeleteCalSave() {
	fm.sFlag.value = "delete";
	submitForm();
}
function beforeSubmit() {
	if (fm.all('StartDate').value > fm.all('EndDate').value) {
		alert("�������ڱ���С�ڵ��ڼ���ֹ�ڣ�");
		fm.all('StartDate').value = '';
		fm.all('EndDate').value = '';
		return false;
	} else {
		var startDate = fm.all('StartDate').value;
		var endDate = fm.all('EndDate').value;
		if (startDate.length > 0 && endDate.length > 0) {
			var arrStartDate = startDate.split("-");
			var arrEndDate = endDate.split("-");
			var allStartDate = new Date(arrStartDate[0], arrStartDate[1],
					arrStartDate[2]);
			var allEndDate = new Date(arrEndDate[0], arrEndDate[1],
					arrEndDate[2]);
			var l = (allEndDate.getTime() - allStartDate.getTime())
					/ (3600 * 1000 * 24);
			var QuerySQL1 = "select sysvarvalue from ldsysvar where sysvar='timeIHFlag'";
			var arrSelected = new Array();
			arrSelected = easyExecSql(QuerySQL1);
			var d = arrSelected[0][0];
			if (l >= d) {
				alert("Ŀǰֻ����ȡ31�����ڵ�����,���Ҫ��ȡ�����¼����ϵIT���ţ�");
				return false;
			}
		}
	}
	return true;
}

function backCal() {
	if (!verifyForm('fm1'))
		return false;

	var i = 0;
	var showStr = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr = "../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
	showInfo = window.showModelessDialog(urlStr, window,
			"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	fm1.submit(); //�ύ
}
function QueryGrid() {
	var QuerySQL = "select MANAGECOM, " + "COMNAME, " + "TRANSDATE, "
			+ " (case SALECHNL " + " when '01' then '����ֱ��'"
			+ " when '02' then '����Ӫ��' " + " when '03' then '���д���'"
			+ " when '04' then '��ҵ����'" + " when '05' then 'רҵ����'"
			+ " when '06' then '��������'" + " when '07' then '���ʹ���˾'"
			+ " when '08' then '�绰����'" + "  when '09' then '����'"
			+ "     end ) SALECHNL, " + "RISKNAME, " + "CONTNO, "
			+ "APPNTNAME , " + "INSUREDNAME, " + "BENENAME, " + "TRANSAMOUNT, "
			+ "(case PAYMODE " + " when '1' then '�ֽ�' "
			+ "	when '2' then '�ֽ�֧Ʊ'" + " when '3' then 'ת��֧Ʊ'"
			+ " when '4' then '����ת��'" + " when '5' then '�ڲ�ת��'"
			+ " when '6' then '��������'" + " when '7' then 'ҵ��Ա���ÿ�'"
			+ " when '9' then '����'" + " when 'A' then '����ͨ����Լ����'"
			+ " when 'C' then '����ͨ����Լ����'" + " when 'E' then '����ͨ��ȫ����'"
			+ " when 'S' then '����ͨ���ܺ�������'" + " when 'T' then '����ͨ���ܺ�������'"
			+ "end)  PAYMODE, " + " (case AMTTYPE " + " when '01' then '��'"
			+ " when '02' then '��' " + " end) AMTTYPE,  " + "(case TRANSTYPE "
			+ " when '1001' then '�������������ֽ�Ӧ�ɱ�������2��Ԫ���ϵĽ��׼�¼�Ľ��׼�'"
			+ " when '1002' then 'ת�˱�������20��Ԫ���ϵĽ��׼�¼'"
			+ " when '1003' then '�˻��ı��ѻ��˻��ı����ֽ��ֵ1��Ԫ����(�˱�)�Ľ��׼�¼'"
			+ " when '1004' then '�������˻�������������������ս�1��Ԫ����(����)���׼�¼'"
			+ "end) TRANSTYPE," + "appntno, " + "ENTERDATE  "
			+ "from ANTIMONEYCUSTINFO " + "where 1 = 1  "
			+ getWherePart("transdate", "StartDate1", ">=")
			+ getWherePart("transdate", "EndDate1", "<=")
			+ "order by CUSTOMERINFOID ";
	//alert(QuerySQL);
	try {
		turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
		turnPageTasksGrid.queryModal(QuerySQL, TasksGrid, 0, 1);
	} catch (ex) {
		alert("���棺��ѯ����������� ");
	}
}
function resetform1() {

	fm.all('StartDate1').value = '';
	fm.all('EndDate1').value = '';
	//fm.all('Flag').value = '';
	//fm.all('FlagName').value = '';
	resetForm();
}