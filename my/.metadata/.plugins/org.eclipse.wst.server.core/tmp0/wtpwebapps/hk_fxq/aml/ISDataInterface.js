//���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug = "0"; //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass(); //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageTasksGrid = new turnPageClass(); //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

//��������
function submitForm() {
	if ((fm.CalMngCom.value).length > 4) {
		alert("��ѡ��ֹ�˾���ܹ�˾���в�����");
		return false;
	}
	if (fm.CalMngCom.value == null || fm.CalMngCom.value == "") {
		alert("��ѡ��Ҫ�����Ļ�����");
		return false;
	}
	if (!verifyForm('fm')) {
		return false;
	}
	if (!beforeSubmit()) {
		return false;
	}

	var End = fm.EndDate.value;
	var cur = fm.CurrentDate.value;
	if (End > cur) {
		alert("����,��ȡֹ�ڲ��ܴ��ڽ���");
		return false;
	}
	if ((fm.CalMngCom.value).length > 2
			&& getDateDiff(fm.StartDate.value, End) > 4) {
		alert("�ֹ�˾������ȡ���׷��������뽻�׷���ֹ������5�������!");
		return false;
	}
	var i = 0;
	var showStr = "���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr = "../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
	showInfo = window.showModelessDialog(urlStr, window,
			"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	//�ύ
	fm.submit();
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
		//parent.fraInterface.initForm();
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
			var QuerySQL1 = "select sysvarvalue from ldsysvar where sysvar='timeISFlag'";
			var arrSelected = new Array();
			arrSelected = easyExecSql(QuerySQL1);
			var d = arrSelected[0][0];
			if (l > d) {
				alert("Ŀǰֻ����ȡ"+d+"�����ڵ�����,���Ҫ��ȡ�����¼����ϵIT���ţ�");
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
	var QuerySQL = "select appid, "
			+ "calcode, "
			+ "csnm, "
			+ "dealno, "
			+ "flag, "
			//                 +        "(select codename from ldcode where code=flag and codetype='amllxcalflag') , "         
			+ "HTDT, "
			+ "(select b.remark from lxcalmode b where LXCalResult.appid=b.appid and LXCalResult.calcode=b.calcode and no='0') ,"
			+ "ErrCause " + "from LXCalResult "
			+ "where 1 = 1 and calcode like 'IS%' and mngcom like '"
			+ fm.MngCom.value + "%' "
			+ getWherePart("HTDT", "StartDate1", ">=")
			+ getWherePart("HTDT", "EndDate1", "<=")
			+ getWherePart("Flag", "Flag")
			+ "order by modifydate desc, flag desc, dealno ";

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
	fm.all('Flag').value = '';
	fm.all('FlagName').value = '';
	resetForm();
}

//�������ڲcgh
function getDateDiff(date1, date2) {
	var re = /^(\d{4})\S(\d{1,2})\S(\d{1,2})$/;
	var dt1, dt2;
	if (re.test(date1)) {
		dt1 = new Date(RegExp.$1, RegExp.$2 - 1, RegExp.$3);
	}
	if (re.test(date2)) {
		dt2 = new Date(RegExp.$1, RegExp.$2 - 1, RegExp.$3);
	}
	return Math.floor((dt2 - dt1) / (1000 * 60 * 60 * 24))
}