 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var mOperate="";
var turnPage = new turnPageClass();
var turnPage3 = new turnPageClass();
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
	if (!beforeSubmit())     
		return false;
	var i = 0;
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit(); //�ύ

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
    initInpBox();
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
	
  } 
   GoToQuery();

}

function afterSubmit1( FlagStr, content, SelSql)
{ 
  if(showInfo != null && showInfo !=undefined)
  	showInfo.close();
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    initInpBox();
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
	
  } 
        fm.all("code").value = "";
				fm.all("codename").value = "";
				fm.all("codealias").value = "";
				fm.all("codealiasD").value = "";
        GoToQuery();

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
function GoToReturn(){
	try
	{ 
		top.opener.initIntBox(tDealNo,tCSNM,tRiskCode);
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}


function GoToQuery(){
	var strSQL = "select a.code,a.codename,a.codealias ,b.codealias from ldcode a ,ldcode b where a.codetype ='amlriskgrade' and b.codetype = 'amlriskgradedetail' and a.code=b.code "
	               +      getWherePart("a.code", "code")
                 +      getWherePart("a.codename", "codename")
//                 +      getWherePart("a.codealias", "codealias");
                 +      " order by a.code desc"
	turnPage3.queryModal(strSQL, FileMsgGrid);	
}


function GoToDetail(){
		var checkFlag = 0;
		for (var i=0; i<FileMsgGrid.mulLineCount; i++) {
	    	if (FileMsgGrid.getSelNo(i)) { 
	      		checkFlag = FileMsgGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			var code = FileMsgGrid.getRowColData(checkFlag - 1, 1);
			var sOpenWinURL = "RiskIndentifyDetailMain.jsp";
      var sParameters = "code=" + code;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "���չ�����", "left");
//			window.open("./RiskIndentifyDetailMain.jsp?code=" + code);
			
		}
		else {
	    	alert("��ѡ��һ�����ռ�����Ϣ��"); 	    	
		}
}

function gotomodify(oper){
	if (!beforeSubmit())     
		return false;
	var i = 0;
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");  
	fm.action="./RiskIndentifySave.jsp?oper="+oper; 
	fm.submit(); //�ύ
}

function modifydetail(){
var checkFlag = 0;
	for (var i=0; i<FileMsgGrid.mulLineCount; i++) {
    	if (FileMsgGrid.getSelNo(i)) { 
      		checkFlag = FileMsgGrid.getSelNo();
      		break;
		}
	}
    if (checkFlag) {
    	  var tCode=FileMsgGrid.getRowColData(checkFlag - 1, 1);
    	  var tCodeName=FileMsgGrid.getRowColData(checkFlag - 1, 2);
    	  var tCodeAlias=FileMsgGrid.getRowColData(checkFlag - 1, 3);
    	  var tCodeAliasD=FileMsgGrid.getRowColData(checkFlag - 1, 4);
    	  fm.all("code").value = tCode;
    	  fm.all("hideCode").value = tCode;
				fm.all("codename").value = tCodeName;
				fm.all("codealias").value = tCodeAlias;
				fm.all("codealiasD").value = tCodeAliasD;
}else{
	      fm.all("code").value = "";
				fm.all("codename").value = "";
				fm.all("codealias").value = "";
				fm.all("codealiasD").value = "";
	
	
	}
}
function cleartext(){
	      fm.all("code").value = "";
				fm.all("codename").value = "";
				fm.all("codealias").value = "";
				fm.all("codealiasD").value = "";
}
