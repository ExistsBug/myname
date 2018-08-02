var showInfo;
var turnPage = new turnPageClass();
window.onfocus=function (){
    if(showInfo!=null){
        try{
            showInfo.focus();
        }catch(ex){
            showInfo=null;
        }
    }
};
//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content ){
    showInfo.close();
    if (FlagStr == "Fail" ){
        var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
    }
    else{
        var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
    }
}
/********************* 表单：fm *********************/
var turnPageUiminiGird = new turnPageClass();
function easyQueryUiminiGird(){
    initUiminiGird();
    // 书写SQL语句
    var tReturn = getManageComLimitlike("managecom");
    var strSQL = " "
        //+ tReturn
    ;
    var strSQLexcel= strSQL;
    fm.all("tSQL").value=strSQL;
    turnPageUiminiGird.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);

    //判断是否查询成功
    if (!turnPageUiminiGird.strQueryResult) {
        alert("没有查询到符合条件的数据");
        return false;
    }
    turnPageUiminiGird.queryModal(strSQL,UiminiGird);
}//function easyQueryUiminiGird
var turnPageUiminiDetailGird = new turnPageClass();
function easyQueryUiminiDetailGird(){
    initUiminiDetailGird();
    // 书写SQL语句
    var tReturn = getManageComLimitlike("managecom");
    var strSQL = " "
        //+ tReturn
    ;
    var strSQLexcel= strSQL;
    fm.all("tSQL").value=strSQL;
    turnPageUiminiDetailGird.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);

    //判断是否查询成功
    if (!turnPageUiminiDetailGird.strQueryResult) {
        alert("没有查询到符合条件的数据");
        return false;
    }
    turnPageUiminiDetailGird.queryModal(strSQL,UiminiDetailGird);
}//function easyQueryUiminiDetailGird
//Search
function queryAgent(){
    if(!confirm("该方法还没有实现，是否继续?")) return false;
    fm.hideOperate.value='queryagent';
    if(!verifyForm('fm')){
        return false;
    }
    //if (!beforeSubmitVerify(fm,"queryagent")){
    //    return false;
    //} 
    //TODO 这里一般会调用上边的easyQuery方法，请选择下边一个合适的方法
    //easyQueryUiminiGird();
    //easyQueryUiminiDetailGird();
    fm.hideOperate.value="";
    return true;
}
//Generate Summary Report
function queryAgent(){
    if(!confirm("该方法还没有实现，是否继续?")) return false;
    fm.hideOperate.value='';
    if(!verifyForm('fm')){
        return false;
    }
    //if (!beforeSubmitVerify(fm,"")){
    //    return false;
    //} 
    //TODO 这里一般会调用上边的easyQuery方法，请选择下边一个合适的方法
    //easyQueryUiminiGird();
    //easyQueryUiminiDetailGird();
    fm.hideOperate.value="";
    return true;
}
//Generate Detailed Report
function queryAgent(){
    if(!confirm("该方法还没有实现，是否继续?")) return false;
    fm.hideOperate.value='queryagent';
    if(!verifyForm('fm')){
        return false;
    }
    //if (!beforeSubmitVerify(fm,"queryagent")){
    //    return false;
    //} 
    //TODO 这里一般会调用上边的easyQuery方法，请选择下边一个合适的方法
    //easyQueryUiminiGird();
    //easyQueryUiminiDetailGird();
    fm.hideOperate.value="";
    return true;
}
//提交表单fm
function submitfm(){
    var i = 0;
    var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    if (fm.hideOperate.value==""){
        alert("操作控制数据丢失！");
        return false;
    }
    UiminiGird.delBlankLine();
    UiminiDetailGird.delBlankLine();
    fm.submit(); //提交
    fm.hideOperate.value="";
}
function afterQuery(arrQueryResult){
    if( arrQueryResult != null ){
        //TODO 赋值语句写到下边
        /*
         fm.all('AgentCode').value = arrQueryResult[0][0];
         fm.all('Name').value = arrQueryResult[0][1];
         fm.all('Sex').value = arrQueryResult[0][2];
         fm.all('IDNo').value = arrQueryResult[0][3];
        */
        showCodeName();
        //查询MulLine
        easyQueryUiminiGird();
        easyQueryUiminiDetailGird();
    }
    return true;
}
function getQueryResult(){
    var arrSelected = null;
    var rowNo = UiminiDetailGird.getSelNo();
    if( rowNo == 0 || rowNo == null )
        return arrSelected;
    //var rowData = UiminiDetailGird.getRowData(rowNo-1); //这是被选中的那行数据，返回这个数组应该会更方便       
    arrSelected = new Array();
    //TODO 把SQL写到这里
    var strSQL = "";
    var vResult = easyQueryVer3(strSQL, 1, 1, 1);

    //判断是否查询成功
    if (!vResult) {
        alert("没有符合条件的记录!");
        return false;
    }
    //查询成功则拆分字符串，返回二维数组
    arrSelected = decodeEasyQueryResult(vResult);
    return arrSelected;
}