 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var arrDataSet;
var turnPage = new turnPageClass();


window.onfocus=myonfocus;
//ʹ�ôӸô��ڵ����Ĵ����ܹ��۽�
function myonfocus()
{
    if(showInfo!=null)
    {
      try
      {
        showInfo.focus();
      }
      catch(ex)
      {
        showInfo=null;
      }
    }
}

//�ύ�����水ť��Ӧ����
function submitForm()
{
//    if (!beforeSubmit()) return false;
    var i = 0;
    var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    try{
    fm.submit(); //�ύ
    }catch(ex){alert(ex);}
}

//�ύ�����,���������ݷ��غ�ִ�еĲ���
function afterSubmit( FlagStr, content, SelSql)
{
  if(showInfo != null && showInfo !=undefined)
    showInfo.close();
  if (FlagStr == "Fail" )
  {
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
  }
  else
  {
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


//�ύǰ��У�顢����
function beforeSubmit()
{
  //��Ӳ���
   if(!verifyInput()) return false;
   return true;
}


//��ʾfrmSubmit��ܣ���������
function showSubmitFrame(cDebug)
{
  if(cDebug=="1")
  {
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
    initCustomGrid();
    var strSQL = " select CSNM, "
    	+ "CTNM, "
    	+ "CITP, "
    	+ "CTID, "
    	+ "CTNT, "
    	+ "HTDT, "
    	+ "dealNo "
        + "from LXIHTradeMain "
        + "where 1=1 "
        + "and trim(DataState) is null "
        //+ "and managecom like '" + comcode + "%' "
        + getWherePart('CSNM','CSNM')
        + getWherePart('CTNM','CTNM','like')
        + getWherePart('HTDT','Date')
        + getWherePart("ManageCom", "StatiCode", "like")
        + " order by HTDT desc, CSNM asc, dealno asc ";
    try
    {
        turnPage.pageDivName = "divTurnPageCustom";
        turnPage.queryModal(strSQL, CustomGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
}

function afterQuery(){
    easyQuery();
}

//�������
function GoToInput()
{
    var checkFlag = 0;
    if (!beforeSubmit()) return false;
    for (var i=0; i<CustomGrid.mulLineCount; i++) {
        if (CustomGrid.getSelNo(i)) {
            checkFlag = CustomGrid.getSelNo();
            break;
        }
    }
    if (checkFlag) {
	    var cDate = fm.all("Date").value;   
        var CSNM = CustomGrid.getRowColData(checkFlag - 1, 1);
        var DealNo = CustomGrid.getRowColData(checkFlag - 1, 7);
	    var strUrl = "./LXBigTransManualToMain.jsp";         
        var strPara = "?" + "CSNM=" + CSNM 
        		+ "&Date=" + cDate 
        		+ "&DataState= " 
        		+ "&DealNo=" + DealNo 
        		+ "&Oper=All" ;
        OpenWindowNew(strUrl + strPara, "����", "left");
        //window.open(strUrl + strPara);
    }
    else {
	    var strUrl = "./LXBigTransManualToMain.jsp";       
        var strPara = "?" + "DataState=S00" + "&Oper=All" ;
        OpenWindowNew(strUrl + strPara, "����", "left");
    }
}

//ɾ��������Ϣ
function GoToDelInput(){
	var checkFlag ;
    for (var i=0; i<CustomGrid.mulLineCount; i++) {
        if (CustomGrid.getSelNo(i)) {
            checkFlag = CustomGrid.getSelNo();
            break;
        }
    }
    if (checkFlag) {
        var sDealNo = CustomGrid.getRowColData(checkFlag - 1, 7);
		var strPara = "?" + "DealNo=" + sDealNo + "&hideOperate=delete"; 
		document.forms(0).action = "./LXBigTransManualInputSave.jsp" + strPara;	
		submitForm();
    }	
    else {
        alert("����ѡ��һ��������Ϣ��");
        return;
    }
}


