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
	if(fm.all("hideOperate").value != "DELETE||CUSTOM")
	{
		if(!beforeSubmit())return false;
	}
	
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
    initInpBox(tDealNo,tCSNM,tRiskCode);
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    initIntBox(tDealNo,fm.CSNM.value,fm.RiskCode.value);
  } 
}

//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{
	initForm();
} 

 
//�ύǰ��У�顢����  
function beforeSubmit()
{
  if (!verifyInput2())          
	return false;
	var tCSNM=document.getElementById("CSNM").value;
	if(!chkNotZh(tCSNM)){
		alert("���պ�ͬ���в������к��֣�");
		fm.CSNM.focus();
		return false;
		}
			var tRiskCode=document.getElementById("RiskCode").value;
	if(!chkNotZh(tRiskCode)){
		alert("���ֱ����в������к��֣�");
		fm.RiskCode.focus();
		return false;
		}
		var tISPS=document.getElementById("ISPS").value;
	var patrn=/^((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))$/;
	if(!patrn.exec(tISPS))
	{
		alert("�����ڼ�������YYYYMMDDHHYYYYMMDD��ʽ��");
		fm.ISPS.focus();
		return false;
	}
	if(tISPS.substring(0, 8) > tISPS.substring(8, 16)){
	    alert("�����ڼ�Ľ������ڲ���С�ڿ�ʼ����");
	    return false;	
	}
	var tISAT=document.getElementById("ISAT").value;	
	var RegChkExp = /^(\d+)(\.\d+)?$/;
    if(!RegChkExp.test(tISAT)){
    	alert("���ս��ֻ��Ϊ����");
		  fm.ISAT.focus();
    	return false;}
  var tISFE=document.getElementById("ISFE").value;	
    if(!RegChkExp.test(tISFE)){
    	alert("���շ�ֻ��Ϊ����");
		  fm.ISFE.focus();
    	return false;}
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




function afterQuery(str,str1,str2){
	initInpBox(str,str1,str2);
	initIntBox(str,str1,str2);
}



//���ӿͻ���Ϣ
function GoToAddCus(){
	mOperate = "INSERT||CUSTOM";
	if (!beforeSubmit()) return false;
	submitForm();
	//initInpBox();
	initInbBox();
}


//���¿ͻ���Ϣ
function GoToUpdateCus(){
	mOperate = "UPDATE||CUSTOM";
	if (!beforeSubmit()) return false;
	submitForm();
	//initInpBox();	
}

//ɾ���ͻ���Ϣ
function GoToDelCus(){
	mOperate = "DELETE||CUSTOM";
	if (!beforeSubmit()) return false;
	submitForm();
	//��ʼ���ͻ���Ϣ
	initInpBox();
}
//��ӱ�����
function GoToDetailInput(oper)
{ 
   if(oper == "update" ||oper == "delete" ||oper =="query"){
		var checkFlag = 0;
		for (var i=0; i<TasksGrid.mulLineCount; i++) {
	    	if (TasksGrid.getSelNo(i)) { 
	      		checkFlag = TasksGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
			var cCSNM = TasksGrid.getRowColData(checkFlag - 1, 2); //��������
			var cISNM = TasksGrid.getRowColData(checkFlag - 1, 3); //��������
			var cRiskCode = TasksGrid.getRowColData(checkFlag - 1, 4); 
			var	cInsuredNo = TasksGrid.getRowColData(checkFlag - 1, 5); 
			
			var sOpenWinURL = "LXISTradeInsuToMain.jsp";
      var sParameters = "oper=" + oper +"&CSNM=" + cCSNM + "&RiskCode=" + cRiskCode + "&DealNo=" + cDealNo
	     		+ "&InsuredNo=" + cInsuredNo + "&ISNM=" + cISNM ;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴��������Ϣ", "left"); 
			
//			window.open("./LXISTradeInsuToMain.jsp?oper=" + oper +"&CSNM=" + cCSNM + "&RiskCode=" + cRiskCode + "&DealNo=" + cDealNo
//	     		+ "&InsuredNo=" + cInsuredNo + "&ISNM=" + cISNM );
		}
		else {
	    	alert("��ѡ��һ����������Ϣ��"); 
	    	
		}
	}
	else if(oper == "insert"){
			var sOpenWinURL = "LXISTradeInsuToMain.jsp";
      var sParameters = "oper=" + oper +"&CSNM=" + fm.all("CSNM").value + "&RiskCode=" + fm.all("RiskCode").value + "&DealNo=" + fm.all("DealNo").value;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "�鿴��������Ϣ", "left"); 
//		window.open("./LXISTradeInsuToMain.jsp?oper=" + oper +"&CSNM=" + fm.all("CSNM").value + "&RiskCode=" + fm.all("RiskCode").value + "&DealNo=" + fm.all("DealNo").value);
	}

}
function GoToReturn(){
	try
	{
		var arrReturn = tDealNo ;
		top.opener.initContBox( arrReturn );
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}
