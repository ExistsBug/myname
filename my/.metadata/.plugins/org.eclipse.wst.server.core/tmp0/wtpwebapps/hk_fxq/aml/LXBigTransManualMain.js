 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var mOperate="";
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
	if(mOperate != "DELETE|CUSTOM")
	{
		if (!beforeSubmit()) return false;
	}
	
	fm.hideOperate.value = mOperate;
	var i = 0;
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	fm.submit(); //�ύ	
}

//�ύ�����,���������ݷ��غ�ִ�еĲ���
function afterSubmit( FlagStr, content, Operate) {
	if(showInfo != null && showInfo !=undefined)
		showInfo.close();
	if (FlagStr == "Fail" ) {             
    	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    	showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  	} else { 
    	var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    	showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  	} 
  	if (Operate == "WorkFlow"){
  		GoParent();  		
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
	//��Ӳ���
	if (!verifyInput2()) return false;
	if(!chkNotZh(fm.CSNM.value)){
		alert("�ͻ��Ų����к���");
		fm.CSNM.focus();
		return false;
	}
	//���֤У��
	var CITP = document.getElementById("CITP").value;
	if (CITP == "11"){
		var CTID = document.getElementById("CTID").value;
		if (!checkIdCard(CTID)) {
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}	
	if (CITP == "21"){
		var CTID = document.getElementById("CTID").value;
		if (CTID.length!=9) {
			alert("�ͻ���֯���������Ӧ9λ(���һλУ����ǰ�����ӷ��ɲ�д)");
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}
	//������verify
  	var CTNT = document.getElementById("CTNT").value;
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlcountry' "
		+ " and code = '" + CTNT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//�ж��Ƿ��ѯ�ɹ�
	if (!strQueryResult) {
		alert("�����˹��������ڣ�");
		document.getElementById("CTNT").value = "";
		document.getElementById("CTNT").focus();		
		return false;
	}	
   return true;
}           


//��ʾfrmSubmit��ܣ���������
function showSubmitFrame(cDebug){
	if(cDebug=="1"){
		parent.fraMain.rows = "0,0,50,82,*";
	}else {
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


//������Ӵ�����ϸ
function GoToDetailInput(oper)
{
	var CustomerNo = fm.all("CSNM").value;
	var strUrl = "./LXBigTransManualToDetail.jsp";	
	var strPara = "";	
	if (oper == "update" || oper == "delete" ){
		var checkFlag = 0;
		for (var i=0; i<TasksGrid.mulLineCount; i++) {
	    	if (TasksGrid.getSelNo(i)) { 
	      		checkFlag = TasksGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
			var cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //��������
			var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //��ϸ���� 	
			strPara = "?" + "Oper=" + oper 
	     		+ "&CustomerNo=" + CustomerNo + "&Date=" + "&DealNo=" + cDealNo
	     		+ "&CRCD=" + cCRCD + "&TSDT=" + cTSDT ;
			OpenWindowNew(strUrl + strPara, "�����ϸ����", "left");			
		}
		else {
	    	alert("����ѡ��һ��������ϸ��Ϣ��"); 
		}
	} 
	if (oper == "insert"){
		//�ж������Ƿ���ڼ�¼
		var strSQL = " select * from LXIHTradeMain where DealNo = '" + fm.all("DealNo1").value + "' ";
		turnPage.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	  	//�ж��Ƿ��ѯ�ɹ�
	  	if (!turnPage.strQueryResult) {
	    	alert("���ȱ�����׵�������Ϣ��");
	    	return ;
	    }
		else{
			//��ѯ�ɹ������ַ��������ض�ά����
		  	arrSelected = decodeEasyQueryResult(turnPage.strQueryResult);
			strPara = "?" + "Oper=" + oper 
	     		+ "&CustomerNo=" + CustomerNo + "&DealNo=" + fm.all("DealNo1").value;
			OpenWindowNew(strUrl + strPara, "�����ϸ����", "left");
	    }
	}
}

function GoToDelDetail()
{
	var CustomerNo = fm.all("CSNM").value;
	var checkFlag = 0;
	for (var i=0; i<TasksGrid.mulLineCount; i++) {
		if (TasksGrid.getSelNo(i)) { 
			checkFlag = TasksGrid.getSelNo();
			break;
		}
	}
	if (checkFlag) {
		mOperate = "DELETE|CUSTOM";
		var cDealNo = TasksGrid.getRowColData(checkFlag - 1, 1);
		var cCRCD = TasksGrid.getRowColData(checkFlag - 1, 2); //��������
		var cTSDT = TasksGrid.getRowColData(checkFlag - 1, 3); //��ϸ���� 
		fm.action = "./LXBigTransManualDetailSave.jsp?DealNo=" + cDealNo + "&CRCD=" + cCRCD + "&TSDT=" + cTSDT + "&CRCD1=" + cCRCD + "&TSDT1=" + cTSDT ;
		submitForm();
		afterQuery(cDealNo);
	}
	else {
		alert("����ѡ��һ��������ϸ��Ϣ��"); 
	}
}

//��ѯ��ϸ��Ϣ
function afterQuery(str){
	initTasksGrid();
	var strSQL = "select DealNo, CRCD, TSDT, FINN, CATP, CTAC, TSTM "
		+ " from LXIHTradeDetail where DealNo = '" + str +"' ";
	turnPage.queryModal(strSQL, TasksGrid, 0, 1);	
}

//������������
function GoToMainInput(){
	var strPara = "?" + "hideOperate=Save" ;
	document.forms(0).action = "./LXBigTransManualMainSave.jsp" + strPara;	
	if (!beforeSubmit()) return false;	
	submitForm();
}

//¼�����
function GoToWorkFlow()
{
	
	var sDealNo = document.getElementsByName("DealNo1")[0].value;
	var tsql = "select COUNT(MissionID) from LWMission where MissionProp3='"+sDealNo+"'";
	var numWork = parseInt(easyExecSql(tsql));
	if(numWork>0)
	{
		alert("����Ϣ�����Ѿ�¼�����,���Ѿ���������ڵ�!");
		top.close();
		return false;
	}
	var strSQL= "select COUNT(*) from lxihtradedetail where DealNo='" + sDealNo + "'";
	var count = parseInt(easyExecSql(strSQL));
	if(count <= 0){
		alert("����û��¼����׵���ϸ��Ϣ,��¼��!");
		return false;
	}
	var strPara = "?" + "hideOperate=WorkFlow" ;
	document.forms(0).action = "./LXBigTransManualMainSave.jsp" + strPara;
	submitForm();
}

//���ظ�ҳ��
function GoParent(){
  	top.close();
//	try{
//		top.opener.afterQuery();
//	}
//	catch(ex)
//	{
//		top.close();
//		//alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
//	}
//  	top.opener.focus();
}
