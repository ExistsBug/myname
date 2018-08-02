var mSwitch = parent.VD.gVSwitch;

/**
 * 
 */
function RSubmit()
 {
    if(verifyInput()==false) 
    {
    	return false;
    }
    fm.ReportSubmit.disabled = true;
    fm.Cancel.disabled = true;
	var showStr="正在处理请求，请您稍候并且不要修改屏幕上的值或链接其他页面";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	
	fm.submit(); //提交
  
}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content ) {
  try 
  { 
    showInfo.close();
    fm.ReportSubmit.disabled = false;
    fm.Cancel.disabled = false;
    if (FlagStr == "Fail")
    {
    
        var urlStr="../common/jsp/MessagePage.jsp?picture=F&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
    }
    else{
    	var urlStr = "../common/jsp/MessagePage.jsp?picture=S&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
        top.close();
    }
  }
  catch(e){}

}
function initContent()
{
	var tSql =  " select ssds from lxistrademain where dealno='"+fm.dealno.value+"' ";
	var tResult = easyExecSql(tSql);
	var temp = tResult[0][0];
	fm.ReMark.value = temp.replace(/@Enter/g,"");
}