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
function submitForm(oper)
{	
	if (!beforeSubmit(oper))     
		return false;
	var i = 0;
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");  
	fm.action="./RiskIndentifyDetailSave.jsp?oper="+oper; 
	fm.submit(); //�ύ

}
function afterSubmit(DealFlag, MsgContent)
{   
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
     initInpBox();
     initIntBox();
     fm.all("CalCodeC").value = "";
				fm.all("NoC").value = "";
				fm.all("hideCalCodeC").value = "";
				fm.all("hideNoC").value = "";
				fm.all("CalFactorC").value = "";
				fm.all("ReMarkC").value = "";
}

//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{
	initForm();
} 

 
//�ύǰ��У�顢����  
function beforeSubmit(oper)
{
  if(oper == "main" || oper == "deletemain")  	{
  	if(fm.all("CalCode").value==""||fm.all("CalFactor").value==""||fm.all("Validity").value==""||fm.all("ReMark").value==""){
  		alert("�������㷨�����зǿ��ֶ���д��ȫ��")
  		return false  ;		
  	}
  if(fm.all("Validity").value!=1 && fm.all("Validity").value!=0 )	{
  	  alert("��Ч��ֻ��Ϊ1��0��")
  		return false  ;
  	}
  	
 } 	
 if(oper == "addson" || oper == "updateson")  	{
  	if(fm.all("CalCodeC").value==""||fm.all("CalFactorC").value==""||fm.all("NoC").value==""||fm.all("ReMarkC").value==""){
  		alert("�������㷨�����зǿ��ֶ���д��ȫ��")
  		return false  	;	
  	}
  	if( fm.all("NoC").value=="0"){
  		alert("���㷨����Ų�����Ϊ0��")
  		return false  ;	  		
  	}
}
  	if( oper == "deleteson" ){
  	var checkFlag = 0;
	   for (var i=0; i<TasksGrid.mulLineCount; i++) {
    	if (TasksGrid.getSelNo(i)) { 
      		checkFlag = TasksGrid.getSelNo();
      		break;
		}
	 }
    if (!checkFlag) { 
    	alert("��ѡ��һ���㷨��")
  		return false  ;	  
    	}
}
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
		top.opener.GoToQuery();
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}

function queryTasksGrid()
{  
	var checkFlag = 0;
	for (var i=0; i<TasksGrid.mulLineCount; i++) {
    	if (TasksGrid.getSelNo(i)) { 
      		checkFlag = TasksGrid.getSelNo();
      		break;
		}
	}
    if (checkFlag) {
    	  var tCalCode=TasksGrid.getRowColData(checkFlag - 1, 1);
        var strSQL = "select CalCode , NO , CalFactor , ReMark from LXCalMode  where Type = 'R' and NO = '"+TasksGrid.getRowColData(checkFlag - 1, 2)+"' and appid ='" + mCode+ "' and CalCode = '" + tCalCode+ "' and CRCD = '" + mCode + "'";
		    var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
		    
			//�ж��Ƿ��ѯ�ɹ�
			if (!strQueryResult) {
				alert("��ѯʧ�ܣ�");
				return false;
			}
		  	var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("CalCodeC").value = arrSelected[0][0];
				fm.all("NoC").value = arrSelected[0][1];
				fm.all("hideCalCodeC").value = arrSelected[0][0];
				fm.all("hideNoC").value = arrSelected[0][1];
				fm.all("CalFactorC").value = arrSelected[0][2];
				fm.all("ReMarkC").value = arrSelected[0][3];          
  }
		else {
	    	alert("����ѡ��һ�����㷨��"); 
		}	
}
