 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var arrDataSet;
var turnPage = new turnPageClass();


window.onfocus=myonfocus;
//ʹ�ôӸô��ڵ����Ĵ����ܹ��۽�
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

//�ύ�����水ť��Ӧ����
function submitForm(){
    var i = 0;
    var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    fm.submit(); //�ύ
}

//�ύ�����,���������ݷ��غ�ִ�еĲ���
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

//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{
  initForm();
}

//��ʾfrmSubmit��ܣ���������
function showSubmitFrame(cDebug){
	if(cDebug=="1"){
		parent.fraMain.rows = "0,0,50,82,*";
	}
    else {
        parent.fraMain.rows = "0,0,0,82,*";
    }
}

//��ʾdiv����һ������Ϊһ��div�����ã��ڶ�������Ϊ�Ƿ���ʾ�����Ϊ"true"����ʾ��������ʾ
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

//��ѯ�ͻ������Ϣ
function easyQuery()
{
    var strSQL = " select CSNM, "
    		+ "CTNM, "
    		+ "DealNo, "
    		+ "STCR, "
    		+ "SDGR, "
    		+ "DealDate, "
    		+ "(case when exists (select 'x' from lxcancelreport b where b.dealno=a.dealno) then '���' else '' end)"
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

//������ɽ���
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
        OpenWindowNew(strUrl + strPara, "���ɽ���", "left");
        //window.open(strUrl + strPara);
    }
    else {
        var CSNM = CustomGrid.getRowColData(checkFlag - 1, 1);
        var strPara = "?" + "CSNM=" + CSNM 
        		+ "&Date=" + cDate 
        		+ "&DataState=" 
        		+ "&Oper=All" ;
        OpenWindowNew(strUrl + strPara, "���ɽ���", "left");
    }
}

function afterQuery(str){
    easyQuery();
}

//ɾ�����ɽ�����Ϣ
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
        alert("����ѡ��һ�����ɽ�����Ϣ��");
        return;
    }
}
