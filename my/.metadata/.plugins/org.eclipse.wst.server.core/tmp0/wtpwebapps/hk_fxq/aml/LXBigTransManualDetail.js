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
	if(!beforeSubmit()) return false;
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
  	//zhangyf modify ���ʧ������ת
  	return false;
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  } 
  //���ظ�ҳ��
  top.close();
	try{
		var cDealNo = fm.all("DealNo").value;
		top.opener.afterQuery( cDealNo );
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
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
	 if( verifyInput2() == false ) return false; 
	 	/**
  *zhangyf add  2008��11��3��16:39:46
 */
	
	//�������У�� begin
	
	var CRCD = fm.all("CRCD").value.trim();   //����������
	var CRTP = fm.all("CRTP").value.trim();   //����
	var CRAT = fm.all("CRAT").value.trim();   //���׽��
	var RMB="";
	var DOLLAR="";
	var cnt="";   //�м�ֵ ��DOLLAR/RATE*(1+0.05������
	var Info="�����ṩ�Ľ����ĿС�ڹ涨�Ľ����Բ��þٱ�";
	
//	if(CRTP=="CNY"){
//	if(CRCD=="0901"){
//     if(CRAT<200000){
//     alert(Info);
//     return false;
//     }
//     }else if(CRCD=="0902"){
//     if(CRAT<2000000){
//     alert(Info);
//     return false;
//     }
//     }else if(CRCD=="0903"){
//     if(CRAT<500000){
//     alert(Info);
//     return false;
//     }
//     }
//	}else if(CRTP=="@E"||CRTP=="@I"||CRTP=="@N"){
//		alert("����Ľ��Ҫ������Ҫ��Ľ��");
//		}
//		else{
//	var strSQL = "select  trim(OtherSign) from ldcode "
//		+ "  where 1 = 1 and codetype = 'amlcurrencytype' " 
//		+ " and code = '" + CRTP + "'" ;
//	var strQueryResult  =  easyQueryVer3(strSQL, 1, 0, 1);
//	var arrSelected = decodeEasyQueryResult(strQueryResult); 
//	 RATE = arrSelected[0][0];  
//	if (RATE.trim()=="0"||RATE.trim()=="") {
//	   // alert("������Ϊ�գ���������Ľ��������Ҫ��Ľ��"); 
//	   return true;
//	}else{							
//	 var  tRATE=RATE*(1.05); 
//	 if(CRCD=="0901"||CRCD=="0904"){
//	  DOLLAR=10000;
//	 cnt=DOLLAR/tRATE;  
//	 if(CRAT<cnt){
//	 alert(Info);
//	 return false;
//	 }
//	 }else if(CRCD=="0902"){
//	  DOLLAR=200000;
//	 cnt=DOLLAR/tRATE; 
//	 if(CRAT<cnt){
//	 alert(Info);
//	 return false;
//	 }
//	 }if(CRCD=="0903"){
//	  DOLLAR=100000;
//	 cnt=DOLLAR/tRATE; //alert(cnt);
//	 if(CRAT<cnt){
//	 alert(Info);
//	 return false;
//	 }
//	 }
//	 }
//	 }
	 //end
	
  //��Ӳ���
	var TSTP = fm.all("TSTP").value;  
	var TRCD = fm.all("TRCD").value;  	
	var TSTM = fm.all("TSTM").value;  	
	if (!verifyInput2())          
	return false;
	if (TSTP.substr(2,2) == "00" ){
		if (TRCD == null || TRCD == ""){
			alert("�ֽ��������Ͻ��׷�����!");
			fm.all("TRCD").focus;
			return false;
		}
	}
	//�ж��Ƿ���YYYYMMDDHH24MISS
		var patrn=/^((((1[6-9]|[2-9]\d)\d{2})(0?[13578]|1[02])(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(0?[13456789]|1[012])(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})0?2(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))0?229))(20|21|22|23|[0-1]?\d)[0-5]?\d[0-5]?\d$/;	
	if(!patrn.exec(TSTM)){
		alert("������YYYYMMDDHH24MISS�����ڸ�ʽ��" );
		document.getElementById("TSTM").value = "";
		document.getElementById("TSTM").focus();
		return false;
	}
	var htdt = "select htdt from lxihtrademain where dealno = '"+fm.all("DealNo").value+"' ";
	var strQueryResult  = easyQueryVer3(htdt, 1, 0, 1);	    
	if (!strQueryResult) {
		return false;
	}
	else{							
	var arrSelected = decodeEasyQueryResult(strQueryResult);
	htdt = arrSelected[0][0];
	htdt = replace(htdt,"-","");
	if(TSTM.substring(0, 8)!= htdt){
	    alert("������ϸ�ķ���ʱ������뽻������ķ���ʱ����ͬ");
	    return false;	
	 }
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
		//���������֤���͵�verify
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlidtype' and code not like '2%25'"
		+ " and code = '" + TBIT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//�ж��Ƿ��ѯ�ɹ�
	if (!strQueryResult) {
		alert("���������֤�����Ͳ����ڣ�");
		document.getElementById("TBIT").value = "";
		document.getElementById("TBIT").focus();		
		return false;
	}
	
	var TCIT = document.getElementById("TCIT").value;
	if (TCIT == "11"){
		var TCID = document.getElementById("TCID").value;
		if (!checkIdCard(TCID)) {
			document.getElementById("TCID").value= "";
			document.getElementById("TCID").focus() ;
			return false;
		}
	}	
	if (TCIT == "21"){
		var TCID = document.getElementById("TCID").value;
		if (TCID.length!=9) {
			alert("���׶�����֯���������Ӧ9λ");
			document.getElementById("TCID").value= "";
			document.getElementById("TCID").focus() ;
			return false;
		}
	}
	
	//���׷����ر���У��
	var TRCD = document.getElementById("TRCD").value;
	var strSQL = "select code1, name1 from ("
		+ " (select case when trim(code) in ('@N', '@I', '@E') then trim(code) else trim(code)||'000000' end as code1,  trim(codename) as name1 " 
		+ " from ldcode  where codetype = 'amlcountry' and code <> 'CHN') "
		+ " union all " 
		+ " (select 'CHN'||trim(code) ,trim(codename) "
		+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
		+ " and code1 = '" + TRCD + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//�ж��Ƿ��ѯ�ɹ�
	if (!strQueryResult) {
		alert("���׷����ر��벻�Ϸ���������ѡ��");
		document.getElementById("TRCD").value = "";
		document.getElementById("TRCD").focus();		
		return false;
	}	
	
	//����ȥ�����У��
	var TDRC = document.getElementById("TDRC").value;
	strSQL = "select code1, name1 from ("
		+ " (select case when trim(code) in ('@N', '@I', '@E') then trim(code) else trim(code)||'000000' end as code1,  trim(codename) as name1 " 
		+ " from ldcode  where codetype = 'amlcountry' and code <> 'CHN') "
		+ " union all " 
		+ " (select 'CHN'||trim(code) ,trim(codename) "
		+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
		+ " and code1 = '" + TDRC + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//�ж��Ƿ��ѯ�ɹ�
	if (!strQueryResult) {
		alert("����ȥ����벻�Ϸ���������ѡ��");
		document.getElementById("TDRC").value = "";
		document.getElementById("TDRC").focus();		
		return false;
	}		
	//�����˹�����verify
  var TBNT = document.getElementById("TBNT").value;
	var strSQL = "select code "
		+ " from ldcode  where codetype = 'amlcountry' "
		+ " and code = '" + TBNT + "' " ;
	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	//�ж��Ƿ��ѯ�ɹ�
	if (!strQueryResult) {
		alert("�����˹��������ڣ�");
		document.getElementById("TBNT").value = "";
		document.getElementById("TBNT").focus();		
		return false;
	}
	//���׷�����У�� add by huangchong
	if (TSTP.substring(0,4)=="0000")
	{
		if(TRCD == "@E" || TRCD == "@N" || TRCD == "@I")
		{
			alert("�ֽ��ױ�����д���׷�����");
			return false;
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


function showArea(str){
	var strUrl = "./LXShowAreaInputMain.jsp";	
	var strPara = "?otype=" + str;	
	OpenWindowNew(strUrl + strPara, "��������ѯ", "left");
}

function showAreaEx(str){
	var TSTP = fm.all("TSTP").value;
//	alert(TSTP.substr(2,2));
	if (TSTP.substr(2,2) == "00" )
		showArea(str);
	else {
		showArea(str);
	}
}

function clearTRCD(){
	fm.all("TRCD").value = "";
}


function afterQueryArea(arrQueryResult, strType){
	var arrResult = new Array();
	if( arrQueryResult != null )
	{
		arrResult = arrQueryResult;
		if (strType == 'TRCD'){
			var TRCD = arrResult[0][0];
			fm.all( 'TRCD' ).value = TRCD;
			var FIRC = arrResult[0][0].substr(3);
			if (FIRC == "000000" ){
				fm.all( 'FIRC' ).value = "@N";
			} else if (TRCD == "@N" || TRCD == "@E" || TRCD == "@I"){
				fm.all( 'FIRC' ).value = TRCD;	
			}
			else{
				fm.all( 'FIRC' ).value = FIRC;			
			}
		}else if (strType == 'TDRC'){
			fm.all( 'TDRC' ).value = arrResult[0][0];
		}
	}
}	
function GoToReturn(){
	try
	{
		var arrReturn = fm.all("DealNo").value;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}