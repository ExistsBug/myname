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
//�ύ�����,���������ݷ��غ�ִ�еĲ���
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
/********************* ����fm *********************/
var turnPageUiminiGird = new turnPageClass();
function easyQueryUiminiGird(){
    initUiminiGird();
    // ��дSQL���
    var tReturn = getManageComLimitlike("managecom");
    var strSQL = " "
        //+ tReturn
    ;
    var strSQLexcel= strSQL;
    fm.all("tSQL").value=strSQL;
    turnPageUiminiGird.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);

    //�ж��Ƿ��ѯ�ɹ�
    if (!turnPageUiminiGird.strQueryResult) {
        alert("û�в�ѯ����������������");
        return false;
    }
    turnPageUiminiGird.queryModal(strSQL,UiminiGird);
}//function easyQueryUiminiGird
var turnPageUiminiDetailGird = new turnPageClass();
function easyQueryUiminiDetailGird(){
    initUiminiDetailGird();
    // ��дSQL���
    var tReturn = getManageComLimitlike("managecom");
    var strSQL = " "
        //+ tReturn
    ;
    var strSQLexcel= strSQL;
    fm.all("tSQL").value=strSQL;
    turnPageUiminiDetailGird.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);

    //�ж��Ƿ��ѯ�ɹ�
    if (!turnPageUiminiDetailGird.strQueryResult) {
        alert("û�в�ѯ����������������");
        return false;
    }
    turnPageUiminiDetailGird.queryModal(strSQL,UiminiDetailGird);
}//function easyQueryUiminiDetailGird
//Search
function queryAgent(){
    if(!confirm("�÷�����û��ʵ�֣��Ƿ����?")) return false;
    fm.hideOperate.value='queryagent';
    if(!verifyForm('fm')){
        return false;
    }
    //if (!beforeSubmitVerify(fm,"queryagent")){
    //    return false;
    //} 
    //TODO ����һ�������ϱߵ�easyQuery��������ѡ���±�һ�����ʵķ���
    //easyQueryUiminiGird();
    //easyQueryUiminiDetailGird();
    fm.hideOperate.value="";
    return true;
}
//Generate Summary Report
function queryAgent(){
    if(!confirm("�÷�����û��ʵ�֣��Ƿ����?")) return false;
    fm.hideOperate.value='';
    if(!verifyForm('fm')){
        return false;
    }
    //if (!beforeSubmitVerify(fm,"")){
    //    return false;
    //} 
    //TODO ����һ�������ϱߵ�easyQuery��������ѡ���±�һ�����ʵķ���
    //easyQueryUiminiGird();
    //easyQueryUiminiDetailGird();
    fm.hideOperate.value="";
    return true;
}
//Generate Detailed Report
function queryAgent(){
    if(!confirm("�÷�����û��ʵ�֣��Ƿ����?")) return false;
    fm.hideOperate.value='queryagent';
    if(!verifyForm('fm')){
        return false;
    }
    //if (!beforeSubmitVerify(fm,"queryagent")){
    //    return false;
    //} 
    //TODO ����һ�������ϱߵ�easyQuery��������ѡ���±�һ�����ʵķ���
    //easyQueryUiminiGird();
    //easyQueryUiminiDetailGird();
    fm.hideOperate.value="";
    return true;
}
//�ύ��fm
function submitfm(){
    var i = 0;
    var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    if (fm.hideOperate.value==""){
        alert("�����������ݶ�ʧ��");
        return false;
    }
    UiminiGird.delBlankLine();
    UiminiDetailGird.delBlankLine();
    fm.submit(); //�ύ
    fm.hideOperate.value="";
}
function afterQuery(arrQueryResult){
    if( arrQueryResult != null ){
        //TODO ��ֵ���д���±�
        /*
         fm.all('AgentCode').value = arrQueryResult[0][0];
         fm.all('Name').value = arrQueryResult[0][1];
         fm.all('Sex').value = arrQueryResult[0][2];
         fm.all('IDNo').value = arrQueryResult[0][3];
        */
        showCodeName();
        //��ѯMulLine
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
    //var rowData = UiminiDetailGird.getRowData(rowNo-1); //���Ǳ�ѡ�е��������ݣ������������Ӧ�û������       
    arrSelected = new Array();
    //TODO ��SQLд������
    var strSQL = "";
    var vResult = easyQueryVer3(strSQL, 1, 1, 1);

    //�ж��Ƿ��ѯ�ɹ�
    if (!vResult) {
        alert("û�з��������ļ�¼!");
        return false;
    }
    //��ѯ�ɹ������ַ��������ض�ά����
    arrSelected = decodeEasyQueryResult(vResult);
    return arrSelected;
}