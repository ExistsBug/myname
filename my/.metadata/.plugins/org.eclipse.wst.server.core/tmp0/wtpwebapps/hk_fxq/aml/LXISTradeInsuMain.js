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
		if (!beforeSubmit())     
			return false;
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
    initInpBox();
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
    top.close();

    top.opener.focus();
  try{
  	
		top.opener.afterQuery( tDealNo,tCSNM,tRiskCode );
		
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�initIntBox�ӿڡ�" + ex );
	}
	
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
	//if(!verifyInput()) return false;
	//if(!verifyInput2()) return false;
	
	if(!TasksGrid.checkValue("TasksGrid")) {
		return false;
	}   

	//���֤У��
	var IITP = document.getElementById("IITP").value;
	if (IITP == "11"){
		var ISID = document.getElementById("ISID").value;
		if (!checkIdCard(ISID)) {
			document.getElementById("ISID").value= "";
			document.getElementById("ISID").focus() ;
			return false;
		}
	} 
	
	
	//------------------------------------<cgh
		if (IITP == "19")
		{
			var ISID = document.getElementById("ISID").value;
			var myDate = new Date();
			if (ISID.substring(0,3)!="���ڱ�"||ISID.substr(3)=="********"||BASEisNotDate(ISID.substr(3))||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))<0) //
			{
				alert("ֻ����С��18�����ѡ�񡰻��ڱ������������ա�����֤������");
				document.getElementById("ISID").value= "";
			  document.getElementById("ISID").focus() ;
				return false;
			}
		}
		if (IITP == "14"){
			var ISID = document.getElementById("ISID").value;
			if (ISID.length<=5||ISID.indexOf(".") != -1) {
				alert("���������֤������������5λ���Ҳ����С�.��");
				document.getElementById("ISID").value= "";
			  document.getElementById("ISID").focus() ;
				return false;
			}
		}
		
		if (IITP == "21"){
		var ISID = document.getElementById("ISID").value;
		if (ISID.length!=9||ISID=="@N") {
			alert("��������֯���������Ӧ9λ,֤���Ų���Ϊ@N");
			document.getElementById("ISID").value= "";
			document.getElementById("ISID").focus() ;
			return false;
		}
	} 
	var RLTP = document.getElementById("RLTP").value;
	if(RLTP==null||RLTP=="")
	{
		alert("Ͷ�����뱻�����˵Ĺ�ϵ����Ϊ�գ�");
		return false;
	}
	
	// ������
	for(var i=0;i<TasksGrid.mulLineCount;i++) 
	{
		var sBnfNo = TasksGrid.getRowColData(i, 1);
		var sBNNM = TasksGrid.getRowColData(i, 2);
		var IITP = TasksGrid.getRowColData(i, 3);
		var ISID = TasksGrid.getRowColData(i, 4);	
		if(sBnfNo=="@N"||sBNNM=="@N"||IITP=="@N"||ISID=="@N")
		{
			alert("�����˵���Ϣ���û�н�����д@I");
			return false;
		}
		//if(ISID=="@N"||ISID=="@I")
		//{
		//	alert("������֤�����벻��Ϊ@N��@I");
		//	TasksGrid.setRowColData(i, 4, "", TasksGrid);
		//	return false;
		//}		
		if (IITP == "11"){
			if (!checkIdCard(ISID)) {
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
		if (IITP == "19") 
		{
			var myDate = new Date();
			if (ISID.substring(0,3)!="���ڱ�"||ISID.substr(3)=="********"||BASEisNotDate(ISID.substr(3))||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(ISID.substring(3,7),10))<0) //
			{
				alert("ֻ����С��18�����ѡ�񡰻��ڱ������������ա�����֤������");
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
		if (IITP == "14"){
			if (ISID.length<=5||ISID.indexOf(".") != -1) {
				alert("���������֤������������5λ���Ҳ����С�.��");
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
		if (IITP == "21"){
			if (ISID.length!=9||ISID=="@N") {
				alert("��������֯���������Ӧ9λ,֤���Ų���Ϊ@N");
				TasksGrid.setRowColData(i, 4, "", TasksGrid);
				return false;
			}
		}
	}
	//----------------------------------->
//   return false;
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
//�жϲ�Ϊ���ڷ���TRUE       cgh
function BASEisNotDate(theNum)
{
y   =   parseInt(theNum.substring(0,4),10); 
m   =   parseInt(theNum.substring(4,6),10)-1; 
d   =   parseInt(theNum.substr(6),10); 

dt   =   new   Date(y,m,d); 
if(dt.getFullYear()!=y   ||   dt.getMonth()!=m   ||   dt.getDate()!=d)  
  return true; 
else   
	return false; 

}