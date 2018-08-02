<!-- 上载文件处理方法 -->

var turnPage = new turnPageClass();          //使用翻页功能，必须建立为全局变量
function submitForm(){
	
	var showStr="正在提交数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
    showInfo = window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit();
}
//显示对应的回执信息 通过对应的数据包名来取对应的文件信息
function queryInfoFromFile(strPackageNo){
	//LXReceiptFile   回执文件信息表
	//LXReceiptDetail 回执内容明细信息表
	var strSQL = "select (select PackageNo from lxreceiptFile where BackFileNo = lxreceiptDetail.BackFileNo),"
	              + "BackInfoType,FileNum,ErrFileName,ErrLocation,ErrCause from lxreceiptDetail "
	              + " where exists(select 'X' from lxreceiptFile where PackageNo = trim('" + strPackageNo + "'))";
    	              
	turnPage.queryModal(strSQL, LXReceiptFileGrid);
}

function afterSubmit( FlagStr, content ) {
	
  try { showInfo.close(); } catch(e) {}
  
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
  showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:300px");   
}   