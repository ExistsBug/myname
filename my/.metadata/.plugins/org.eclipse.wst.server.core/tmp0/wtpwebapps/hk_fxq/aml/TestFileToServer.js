<!-- �����ļ������� -->

var turnPage = new turnPageClass();          //ʹ�÷�ҳ���ܣ����뽨��Ϊȫ�ֱ���
function submitForm(){
	
	var showStr="�����ύ���ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
    showInfo = window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit();
}
//��ʾ��Ӧ�Ļ�ִ��Ϣ ͨ����Ӧ�����ݰ�����ȡ��Ӧ���ļ���Ϣ
function queryInfoFromFile(strPackageNo){
	//LXReceiptFile   ��ִ�ļ���Ϣ��
	//LXReceiptDetail ��ִ������ϸ��Ϣ��
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