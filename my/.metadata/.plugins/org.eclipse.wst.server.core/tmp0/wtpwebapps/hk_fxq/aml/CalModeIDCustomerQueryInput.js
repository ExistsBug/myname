//该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug = "0"; //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass(); //全局变量, 查询结果翻页, 必须有
var turnPageTasksGrid = new turnPageClass(); //全局变量, 可选上报报文查询结果翻页

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

function beforeSubmit() {
	if (fm.all('StartDate').value > fm.all('EndDate').value) {
		alert("计算起期必须小于等于计算止期！");
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
			+ " WHEN '01' THEN '团险直销'"
			+ " WHEN '02' THEN '银行代理' "
			+ " WHEN '03' THEN '交叉销售'"
			+ " WHEN '04' THEN '经纪公司'"
			+ " WHEN '05' THEN '个人营销'"
			+ " WHEN '06' THEN '专业代理'"
			+ " WHEN '07' THEN '兼业代理'"
			+ " WHEN '08' THEN '电话销售'"
			+ " WHEN '09' THEN '其它'"
			+ " END) SALECHNL, "
			+ "TRANSDATE,"
			+ "TRANSAMOUNT,"
			+ "(CASE PAYMODE "
			+ " WHEN '1' THEN '现金' "
			+ "	WHEN '2' THEN '现金支'"
			+ " WHEN '3' THEN '现金收取'"
			+ " WHEN '4' THEN '银行转帐'"
			+ " WHEN '5' THEN '内部转帐'"
			+ " WHEN '6' THEN '银行托收'"
			+ " WHEN '7' THEN '业务员信用卡'"
			+ " WHEN '9' THEN '网银代付'"
			+ " WHEN 'A' THEN '邮保通'"
			+ " WHEN 'B' THEN '银保通'"
			+ " WHEN 'C' THEN '支付宝'"
			+ " WHEN 'D' THEN '平台收付'"
			+ " ELSE '其他'"
			+ " END)  PAYMODE,"
			+ " (CASE AMTTYPE"
			+ " WHEN '01' THEN '收'"
			+ " WHEN '02' THEN '付'"
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
	var strTempSQL = QuerySQL.replace(/%25/g, "*");//将str串中的%25替换成* 
	fm.all('QuerySQL').value = strTempSQL;//将导出SQL保存在ExportSQL中
	try {
		turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
		turnPageTasksGrid.queryModal(QuerySQL, TasksGrid, 0, 1);
	} catch (ex) {
		alert("警告：查询提数结果出错！ ");
	}
}
/*
 function ExportExcel(){
 //if(TasksGrid.mulLineCount==0||fm.all('QuerySQL').value==null ||fm.all('QuerySQL').value==""){
 if(TasksGrid.mulLineCount==0){
 alert('请先查询!');
 return false;
 }
 fm.action="./TasksGridQueryExport.jsp";
 var showStr="正在准备打印数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
 var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
 showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
 fm.submit(); //提交
 showInfo.close();
 }
 */

//导出Excel
function GoToExcel() {
	var StartDate = fm.all('StartDate').value;
	var EndDate = fm.all('EndDate').value;
	if (StartDate != "" && StartDate != null && EndDate != ""
			&& EndDate != null) {
		if (StartDate > EndDate) {
			alert("您好，起始日期不能大于结束日期！");
			return;
		}
	}
	var rowNum = TasksGrid.mulLineCount;
	if (rowNum > 0) {
		fm.action = "./CreateComQueryExcelSave.jsp?flag=7";
		fm.submit();
	} else {
		alert('没有数据，请先查询');
	}
}

//状态查询函数
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