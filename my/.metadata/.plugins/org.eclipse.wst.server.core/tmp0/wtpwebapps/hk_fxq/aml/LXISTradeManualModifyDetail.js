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
	if(fm.all("hideOperate").value != "DELETE||DETAIL")
	{
		if(!beforeSubmit()) return false;
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
    //zhangyf add 
  	return;
  	//end 
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
     top.close();
  } 
  //���ظ�ҳ��
  top.close();
  window.close();
	try{
		var cDealNo = fm.all("DealNo").value;
		top.opener.afterQuery( cDealNo );
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�initIntBox�ӿڡ�" + ex );
	}
  top.opener.focus();

  
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
//     	if (!verifyInput2())          
//	return false;
   var TSTM = document.getElementById("TSTM").value;
	//�ж��Ƿ���YYYYMMDDHH24MISS
	var patrn=/^((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))(20|21|22|23|[0-1]?\d)$/;
	if(!patrn.exec(TSTM)){
		alert("������YYYYMMDDHH24�����ڸ�ʽ��" );
		document.getElementById("TSTM").value = "";
		document.getElementById("TSTM").focus();
		return false;
	}
	//���֤У��
	var TBIT = document.getElementById("TBIT").value;
	if (TBIT == "11"){
		var TBID = document.getElementById("TBID").value;
		if (!checkIdCard(TBID)) {
			document.getElementById("TBID").value= "";
			document.getElementById("TBID").focus() ;
			return false;
		}
	}	
	var sCSTP = document.getElementById("CSTP").value;
	var sCAOI = document.getElementById("CAOI").value;
	var sTCAN = document.getElementById("TCAN").value;
	if(sCSTP=="02")
	{
		if(sCAOI=="@N"||sTCAN=="@N")
		{
			alert("���ʽ������ʽΪת��ʱ�ʽ��˻������к�����ת���ʽ��˺Ų�����д�����!");
			return false;
		}
	}
	if(sCSTP!="02")
	{
		if(sCAOI=="@N"||sTCAN=="@N")
		{
			if(sCAOI!=sTCAN)
			{
				alert("�ʽ��˻������к�����ת���ʽ��˺������һ��Ϊ�����,���鶼��@N�����!");
				return false;
			}
		}
	}
//			//���������֤���͵�verify
//	var strSQL = "select code "
//		+ " from ldcode  where codetype = 'amlidtype' and code not like '2%25'"
//		+ " and code = '" + TBIT + "' " ;
//	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
//	//�ж��Ƿ��ѯ�ɹ�
//	if (!strQueryResult) {
//		alert("���������֤�����Ͳ����ڣ�");
//		document.getElementById("TBIT").value = "";
//		document.getElementById("TBIT").focus();		
//		return false;
//	}		    
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
		var arrReturn = fm.all("DealNo").value ;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}


