 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var mOperate="";
var turnPage = new turnPageClass();
var turnPage1 = new turnPageClass();
var turnPage2 = new turnPageClass();
var turnPage3 = new turnPageClass();
var turnPageStockGrid = new turnPageClass();
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
	if (mOperate == null || mOperate == ""){
		alert("������Ϣ��ʧ�����ɽ��в���");
		return false;
	}
	fm.hideOperate.value = mOperate;
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
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
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
   	var stock = "";
   	var sHITP="";
   	var sHDID="";
   	var sHDNM = "";
   	var sHDVC="";
   	var sHEIF="";
   	var total = 0;
	for (var i=0; i<StockGrid.mulLineCount; i++) 
	{
		stock=StockGrid.getRowColData(i, 5);
		sHITP=StockGrid.getRowColData(i, 2);
		sHDID=StockGrid.getRowColData(i, 3);
		sHDNM=StockGrid.getRowColData(i, 1);
		sHDVC=StockGrid.getRowColData(i, 4);
		sHEIF=StockGrid.getRowColData(i, 6);
	  var CTTP = document.getElementById("CTTP").value;//Ͷ��������
		//����
		if(CTTP=="07")
	  {
	  	var sCRNM = document.getElementById("CRNM").value;
	  	var sCRIT = document.getElementById("CRIT").value;
	  	var sCRID = document.getElementById("CRID").value;
	  	if(sCRNM != "@N"||sCRIT != "@N"||sCRID != "@N")
	  	{
				alert("���˿ͻ���������Ϣ����д@N!");
				return false;
	  	}
		  if(sHITP == "" || sHITP == null || sHITP == "@I"){
			alert("��"+(i+1)+"�йɶ�֤������δ��д���Ҹ��˿ͻ�ֻ����д@N");
			return false;
			}
			if( sHDID == "" || sHDID == null || sHDID == "@I"){
			alert("��"+(i+1)+"�йɶ�֤����δ��д���Ҹ��˿ͻ�ֻ����д@N");
			return false;
			} 
			if(sHDNM == "" || sHDNM == null || sHDNM == "@I"){
			alert("��"+(i+1)+"�йɶ�����δ��д���Ҹ��˿ͻ�ֻ����д@N");
			return false;
			}
			if(sHDVC == "" || sHDVC == null  || sHDVC == "@I"){
			alert("��"+(i+1)+"�йɶ�ְҵδ��д���Ҹ��˿ͻ�ֻ����д@N");
			return false;
			}
			if( sHEIF == "" || sHEIF == null || sHEIF == "@I"){
			alert("��"+(i+1)+"�йɶ�������Ϣδ��д���Ҹ��˿ͻ�ֻ����д@N");
			return false;
			}
	  }
		if(CTTP!="07")
	  {
	  	var sCRNM = document.getElementById("CRNM").value;
	  	var sCRIT = document.getElementById("CRIT").value;
	  	var sCRID = document.getElementById("CRID").value;
	  	if(sCRNM == "@N"||sCRIT == "@N"||sCRID == "@N")
	  	{
				alert("�Ǹ��˿ͻ���������Ϣ�벻Ҫ��д@N!");
				return false;
	  	}
		  if(sHITP == "" || sHITP == null){
			alert("��"+(i+1)+"�йɶ�֤������δ��д��");
			return false;
			}
			if( sHDID == "" || sHDID == null){
			alert("��"+(i+1)+"�йɶ�֤����δ��д��");
			return false;
			} 
			if(sHDNM == "" || sHDNM == null){
			alert("��"+(i+1)+"�йɶ�����δ��д��");
			return false;
			}
			if(sHDVC == "" || sHDVC == null ){
			alert("��"+(i+1)+"�йɶ�ְҵδ��д��");
			return false;
			}
			if( sHEIF == "" || sHEIF == null){
			alert("��"+(i+1)+"�йɶ�������Ϣδ��д��");
			return false;
			}
	  }

			//�ɶ�ְҵУ��
		var strSQL = "select code "
		               + " from ldcode  where codetype = 'amloccupationtype' "
		               + " and code = '" + sHDVC + "' " ;
	   var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
   	//�ж��Ƿ��ѯ�ɹ�
   	if (!strQueryResult) {
	  	alert("��"+(i+1)+"�йɶ�ְҵ���Ͳ����ڣ�");	
	  	return false;
	  }	
		//�ɶ����֤��У��
			var strSQL = "select code "
		               + " from ldcode  where codetype = 'amlidtype' "
		               + " and code = '" + sHITP + "' " ;
	   var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
   	//�ж��Ƿ��ѯ�ɹ�
   	if (!strQueryResult) {
	  	alert("��"+(i+1)+"�йɶ����֤�����Ͳ����ڣ�");	
	  	return false;
	  }						
		if (sHITP == "11"){
			if (!checkIdCard(sHDID)) {
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}
	  //----------------------------------------------<cgh
		if (sHITP == "14"){
			if (sHDID.length<=5||sHDID.indexOf(".") != -1) {
				alert("���������֤������������5λ���Ҳ����С�.��");
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}
		if (sHITP == "21"){
			if (sHDID.length!=9||sHDID=="@N") {
				alert("�ɶ���֯���������Ӧ9λ,֤���Ų���Ϊ@N");//cgh ���У������
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}
		if (sHITP == "19")
		{
			var myDate = new Date();
			if (sHDID.substring(0,3)!="���ڱ�"||sHDID.substr(3)=="********"||BASEisNotDate(sHDID.substr(3))||(myDate.getFullYear()-parseInt(sHDID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(sHDID.substring(3,7),10))<0) //
			{
				alert("ֻ����С��18�����ѡ�񡰻��ڱ������������ա�����֤������");
				StockGrid.setRowColData(i, 3, "", StockGrid);
				return false;
			}
		}	
		//-------------------------------------------------->	
		//�ֹɱ���У��
	var RegChkExp = /^(\+?)(\-?)(\d+)(\.\d{1})?$/;
		if (stock == "" || stock == null ){
        	alert("�ɶ��ֹɱ�������Ϊ��");
			return false;        	
		}
//        else if (stock != "" ) {
//        	if (!RegChkExp.test(stock)){
//        		alert("�����ʽ���������ֻ��һλС����Ҫ��");
//				return false;        	
//			}
//        	if (parseFloat(stock)<=0||parseFloat(stock)>=100)
//        	{	
//        		alert("�ɶ��ֹɱ�������Ϊ0��100֮�����");
//				return false;
//			}
//        }	
//        total = total + parseFloat(stock);
	}
//	if (total >=100){
//		alert("�ɶ��ֹɱ���֮�Ͳ��ô��ڻ����100");
//		return false;	      	
//	}
	//--------------------------cgh----2008.11.04-------<���У��
	//���֤��У��
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
		if (CTID.length!=9||CTID=="@N") {
			alert("�ͻ���֯���������Ӧ9λ,֤���Ų���Ϊ@N");
			document.getElementById("CTID").value= "";
			document.getElementById("CTID").focus() ;
			return false;
		}
	}
		if (CITP == "19")
		{
			var CTID = document.getElementById("CTID").value;
			var myDate = new Date();
			if (CTID.substring(0,3)!="���ڱ�"||CTID.substr(3)=="********"||BASEisNotDate(CTID.substr(3))||(myDate.getFullYear()-parseInt(CTID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(CTID.substring(3,7),10))<0) //
			{
				alert("ֻ����С��18�����ѡ�񡰻��ڱ������������ա�����֤������");
				document.getElementById("CTID").value= "";
			  document.getElementById("CTID").focus() ;
				return false;
			}
		}
		if (CITP == "14"){
			var CTID = document.getElementById("CTID").value;
			if (CTID.length<=5||CTID.indexOf(".") != -1) {
				alert("���������֤������������5λ���Ҳ����С�.��");
				document.getElementById("CTID").value= "";
			  document.getElementById("CTID").focus() ;
				return false;
			}
		}
		
	
	//���֤��У��
	var CRIT = document.getElementById("CRIT").value;		
	if (CRIT == "11"){	
		var CRID = document.getElementById("CRID").value;	
		if (!checkIdCard(CRID)) {
			document.getElementById("CRID").value= "";
			document.getElementById("CRID").focus() ;
			return false;
		}	
	}
	if (CRIT == "21"){
		var CRID = document.getElementById("CRID").value;
		if (CRID.length!=9||CTID=="@N") {
			alert("��������֯���������Ӧ9λ,֤���Ų���Ϊ@N");
			document.getElementById("CRID").value= "";
			document.getElementById("CRID").focus() ;
			return false;
		}
	}	
	if (CRIT == "19")
		{
			var CRID = document.getElementById("CRID").value;
			var myDate = new Date();
			//alert(myDate.getFullYear()+":"+parseInt(CRID.substring(3,7),10));
			if (CRID.substring(0,3)!="���ڱ�"||CRID.substr(3)=="********"||BASEisNotDate(CRID.substr(3))||(myDate.getFullYear()-parseInt(CRID.substring(3,7),10))>=18||(myDate.getFullYear()-parseInt(CRID.substring(3,7),10))<0) //
			{
				alert("ֻ����С��18�����ѡ�񡰻��ڱ������������ա�����֤������");
				document.getElementById("CRID").value= "";
			  document.getElementById("CRID").focus() ;
				return false;
			}
		}
	if (CRIT == "14"){
		var CRID = document.getElementById("CRID").value;
		if (CRID.length<=5 || CRID.indexOf(".") != -1) {
			alert("���������֤������������5λ���Ҳ����С�.��");
			document.getElementById("CRID").value= "";
			document.getElementById("CRID").focus() ;
			return false;
		}
	}
	//--------------------------cgh----2008.11.04------->
	//��ͬ�Ų���Ϊ����
	var CSNM = document.getElementById("CSNM").value ;
	if(!chkNotZh(CSNM)){
		alert("�ͻ������в������к��֣�");
		fm.CSNM.focus();
		return false;
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
	
		   
  var CTTP = document.getElementById("CTTP").value;//Ͷ��������
  var CITP = document.getElementById("CITP").value;//�ͻ����֤������
  var CTID = document.getElementById("CTID").value;//�ͻ����֤������
	if(CTTP!="07")
  {//�Ǹ���
  	if(CITP=="@N"||CITP=="@E"||CITP=="@I")
  	{
  		document.getElementById("CITP").value="";
  		alert("����ͻ�֤�����Ͳ�����@N��@I��@E���棡");
  		return false;
  	}
  	if(CTID=="@N"||CTID=="@E"||CTID=="@I")
  	{
  		document.getElementById("CTID").value="";
  		alert("����ͻ�֤�����벻����@N��@I��@E���棡");
  		return false;
  	}
  }
	
	//�жϿͻ���ϸ��ַ�͵绰�����Ƿ�Ϊ@N
	//��Ϊ֮ǰ�й���ֵ����ebaoϵͳϵͳ�����������������һЩ��ַ�͵绰��Ϊ�յģ������Ͳ岻��ϵͳ�������������Ը���ֵ�ľ�����Ϊ@N
	//ͬʱ���Ϊ@N������������һ���ߣ�¼���ʱ��ҵ��Ա���п��ܲ����ֱ�Ӿͽ������ύ���Ӷ���������¼��Ĵ���
	var CCTL = document.getElementById("CCTL").value;//�ͻ���ϵ�绰
	var CTAR = document.getElementById("CTAR").value;//�ͻ���ϸ��ַ
	if(CCTL=="@N")
	{
		alert("�ͻ���ϵ�绰������@N����,����");
		return false;
	}
	if(CTAR=="@N")
	{
		alert("�ͻ���ϸ��ַ������@N����,����");
		return false;
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


//������ӿ��ɽ�����ϸ
function GoToDetailInput(oper)
{
	var strUrl = "./LXISTradeManualModifyToDetail.jsp";
	var strPara = "";
	if ( oper != "insert"){
		var checkFlag = 0;
		for (var i=0; i<DetailGrid.mulLineCount; i++) {
	    	if (DetailGrid.getSelNo(i)) { 
	      		checkFlag = DetailGrid.getSelNo();
	      		break;
			}
		}	
		if (checkFlag ) {
			var cDealNo = DetailGrid.getRowColData(checkFlag - 1, 1);
			var cListNo = DetailGrid.getRowColData(checkFlag - 1, 2); //��������
			strPara = "?" + "DealNo=" + cDealNo + "&ListNo=" + cListNo + "&oper=" + oper;
			OpenWindowNew(strUrl + strPara, "������ϸ����", "left"); 			
		}
		else {
	    	alert("����ѡ��һ�����ɽ�����ϸ��Ϣ��"); 
		}
	}else{
		strPara = "?" + "DealNo=" + fm.all("DealNo").value + "&ListNo=" + "" + "&oper=" + oper;
		OpenWindowNew(strUrl + strPara, "������ϸ����", "left"); 			
	}
}

function afterQuery(str){
	initDetailBox(str);
}

//����������Ϣ
function GoToInputMain(){
	mOperate = "Save";
	if (!beforeSubmit()) return false;	
	submitForm();
}

//������ӿ��ɱ�����ϸ
function GoToContInput(oper){
	if ( oper != "insert"){
		var checkFlag = 0;
		for (var i=0; i<ContGrid.mulLineCount; i++) {
	    	if (ContGrid.getSelNo(i)) { 
	      		checkFlag = ContGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag ) {
			var CSNM = ContGrid.getRowColData(checkFlag - 1, 1);
			var RiskCode = ContGrid.getRowColData(checkFlag - 1, 4); 
//			window.open("./LXISTradeContToMain.jsp?DealNo=" 
//				+ fm.all("DealNo").value + "&CSNM=" + CSNM 
//				+ "&RiskCode=" + RiskCode + "&oper=" + oper );
			var sOpenWinURL = "LXISTradeContToMain.jsp";
      var sParameters = "DealNo=" 
				+ fm.all("DealNo").value + "&CSNM=" + CSNM 
				+ "&RiskCode=" + RiskCode + "&oper=" + oper;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "�޸ĺ�ͬ��Ϣ", "left");
		}
		else {
	    	alert("����ѡ��һ�����ɽ��ױ�����Ϣ��"); 
		}
	}else{
//			window.open("./LXISTradeContToMain.jsp?DealNo=" 
//				+ fm.all("DealNo").value + "&CSNM=" + "&RiskCode=&oper=" + oper );
			var sOpenWinURL = "LXISTradeContToMain.jsp";
      var sParameters = "DealNo=" 
				+ fm.all("DealNo").value + "&CSNM=" + "&RiskCode=&oper=" + oper;
      OpenWindowNew(sOpenWinURL + "?" + sParameters, "������ͬ��Ϣ", "left");
	}	
}

function showArea(){
	var strUrl = "./LXShowAreaInputMain.jsp";
	OpenWindowNew(strUrl, "���ɽ������������Ϣ", "left"); 			
}

function afterQueryArea(arrQueryResult){
	var arrResult = new Array();

	if( arrQueryResult != null )
	{
		arrResult = arrQueryResult;
		fm.all( 'TRCD' ).value = arrResult[0][0];
		fm.all('TRCDName').value = arrResult[0][1];
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