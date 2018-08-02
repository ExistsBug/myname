//该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug = "0"; //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass(); //全局变量, 查询结果翻页, 必须有
var turnPageTasksGrid = new turnPageClass(); //全局变量, 可选上报报文查询结果翻页

//提数操作
function submitForm() {
	if (!verifyForm('fm'))
		return false;

	if (!beforeSubmit())
		return false;
	var End = fm.EndDate.value;
	var cur = fm.CurrentDate.value;
	if (End > cur) {
		alert("错误，提取止期不能大于今天");
		return false;
	}

	var i = 0;
	var showStr = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr = "../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
	showInfo = window.showModelessDialog(urlStr, window,
			"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	fm.submit(); //提交

}

//提交后操作,服务器数据返回后执行的操作
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

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm() {
	try {
		initForm();
	} catch (re) {
		alert("在DataInterface.js-->resetForm函数中发生异常:初始化界面错误!");
	}
}

//显示frmSubmit框架，用来调试
function showSubmitFrame(cDebug) {
	if (cDebug == "1") {
		parent.fraMain.rows = "0,0,50,82,*";
	} else {
		parent.fraMain.rows = "0,0,0,82,*";
	}
}

//执行提数         
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
		alert("计算起期必须小于等于计算止期！");
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
				alert("目前只能提取31天以内的数据,如果要提取更多记录请联系IT部门！");
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
	var showStr = "正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr = "../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
	showInfo = window.showModelessDialog(urlStr, window,
			"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	fm1.submit(); //提交
}
function QueryGrid() {
	var QuerySQL = "select MANAGECOM, " + "COMNAME, " + "TRANSDATE, "
			+ " (case SALECHNL " + " when '01' then '团险直销'"
			+ " when '02' then '个人营销' " + " when '03' then '银行代理'"
			+ " when '04' then '兼业代理'" + " when '05' then '专业代理'"
			+ " when '06' then '顾问行销'" + " when '07' then '经纪代理公司'"
			+ " when '08' then '电话销售'" + "  when '09' then '其它'"
			+ "     end ) SALECHNL, " + "RISKNAME, " + "CONTNO, "
			+ "APPNTNAME , " + "INSUREDNAME, " + "BENENAME, " + "TRANSAMOUNT, "
			+ "(case PAYMODE " + " when '1' then '现金' "
			+ "	when '2' then '现金支票'" + " when '3' then '转帐支票'"
			+ " when '4' then '银行转帐'" + " when '5' then '内部转帐'"
			+ " when '6' then '银行托收'" + " when '7' then '业务员信用卡'"
			+ " when '9' then '其它'" + " when 'A' then '银保通新契约交费'"
			+ " when 'C' then '银保通新契约冲正'" + " when 'E' then '银保通保全交费'"
			+ " when 'S' then '银保通总总合作冲正'" + " when 'T' then '银保通总总合作交费'"
			+ "end)  PAYMODE, " + " (case AMTTYPE " + " when '01' then '收'"
			+ " when '02' then '付' " + " end) AMTTYPE,  " + "(case TRANSTYPE "
			+ " when '1001' then '单个被保险人现金应缴保费收入2万元以上的交易记录的交易记'"
			+ " when '1002' then '转账保费收入20万元以上的交易记录'"
			+ " when '1003' then '退还的保费或退还的保单现金价值1万元以上(退保)的交易记录'"
			+ " when '1004' then '被保险人或者受益人请求给付保险金1万元以上(理赔)交易记录'"
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
		alert("警告：查询提数结果出错！ ");
	}
}
function resetform1() {

	fm.all('StartDate1').value = '';
	fm.all('EndDate1').value = '';
	//fm.all('Flag').value = '';
	//fm.all('FlagName').value = '';
	resetForm();
}