 //               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var arrDataSet;
var turnPage = new turnPageClass();


window.onfocus=myonfocus;
//使得从该窗口弹出的窗口能够聚焦
function myonfocus(){
	if(showInfo!=null){
		try{
        	showInfo.focus();
      	}
      	catch(ex){
        	showInfo=null;
		}
	}
}

//提交，保存按钮对应操作
function submitForm(){
    var i = 0;
    var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    fm.submit(); //提交
}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content, SelSql) {
	if(showInfo != null && showInfo !=undefined)
    	showInfo.close();
  	if (FlagStr == "Fail" ){
    	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;
    	showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
  	}
  	else{
    	var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;
    	showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
  	}	
  	easyQuery();
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
  initForm();
}

//显示frmSubmit框架，用来调试
function showSubmitFrame(cDebug){
	if(cDebug=="1"){
		parent.fraMain.rows = "0,0,50,82,*";
	}
    else {
        parent.fraMain.rows = "0,0,0,82,*";
    }
}

//显示div，第一个参数为一个div的引用，第二个参数为是否显示，如果为"true"则显示，否则不显示
function showDiv(cDiv,cShow)
{
  if (cShow=="true")
  {
    cDiv.style.display="";
  }
  else
  {
    cDiv.style.display="none";
  }
}

//查询客户相关信息
function easyQuery()
{
    var strSQL = " select CSNM, "
    		+ "CTNM, "
    		+ "DealNo, "
    		+ "STCR, "
    		+ "SDGR, "
    		+ "DealDate, "
    		+ "(case when exists (select 'x' from lxcancelreport b where b.dealno=a.dealno) then '打回' else '' end)"
        	+ "from LXISTradeMain a "
        	+ "where 1=1 "
        	+ "and trim(DataState) is null "
        	//+ "and managecom like '" + comcode + "%25' "
        	+ getWherePart('CSNM','CSNM')
        	+ getWherePart('CTNM','CTNM','like')
        	+ getWherePart('DealDate','Date')
        	+ getWherePart("ManageCom", "StatiCode", "like")
        	+ " order by DealDate desc, csnm asc, dealno asc ";
    //alert(strSQL);
    try {
        turnPage.pageDivName = "divTurnPageCustom";
        turnPage.queryModal(strSQL, CustomGrid, 0, 1);
    }
    catch (ex){
        alert(ex);
    }
}

//申请可疑交易
function GoToInput()
{
    var checkFlag = 0;
    var cDate = fm.all("Date").value;
    var strUrl = "./LXISTradeManualToMain.jsp";
    for (var i=0; i<CustomGrid.mulLineCount; i++) {
        if (CustomGrid.getSelNo(i)) {
            checkFlag = CustomGrid.getSelNo();
            break;
        }
    }

    if (checkFlag) {
        var CSNM = CustomGrid.getRowColData(checkFlag - 1, 1);
        var sDealNo = CustomGrid.getRowColData(checkFlag - 1, 3);        
        var strPara = "?" + "CSNM=" + CSNM 
        		+ "&Date=" + cDate 
        		+ "&DataState=" 
        		+ "&Oper=All" 
        		+ "&DealNo=" + sDealNo;	
        OpenWindowNew(strUrl + strPara, "可疑交易", "left");
        //window.open(strUrl + strPara);
    }
    else {
        var CSNM = CustomGrid.getRowColData(checkFlag - 1, 1);
        var strPara = "?" + "CSNM=" + CSNM 
        		+ "&Date=" + cDate 
        		+ "&DataState=" 
        		+ "&Oper=All" ;
        OpenWindowNew(strUrl + strPara, "可疑交易", "left");
    }
}

function afterQuery(str){
    easyQuery();
}

//删除可疑交易信息
function GoToDelInput(){
	var checkFlag ;
    for (var i=0; i<CustomGrid.mulLineCount; i++) {
        if (CustomGrid.getSelNo(i)) {
            checkFlag = CustomGrid.getSelNo();
            break;
        }
    }
    if (checkFlag) {
        var sDealNo = CustomGrid.getRowColData(checkFlag - 1, 3);
		var strPara = "?" + "DealNo=" + sDealNo + "&hideOperate=delete"; 
		document.forms(0).action = "./LXISTradeManualSave.jsp" + strPara;	
		submitForm();
    }	
    else {
        alert("请先选择一条可疑交易信息！");
        return;
    }
}
