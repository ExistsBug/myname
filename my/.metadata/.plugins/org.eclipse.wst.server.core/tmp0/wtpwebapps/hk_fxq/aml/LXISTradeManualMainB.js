 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var saveClick=false;
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
	if (!beforeSubmit()) return false; 
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


//�ϴ��ļ�
function GoToUpload(){
	var upfm = document.getElementById("upfm");
	var importFile = document.getElementById("FileName").value;
	//�ж��Ƿ�ѡ�п��ɽ���
	var checkFlag = 0;
	var DealNo = ""; //���׺�
	var CSNM = ""; //�ͻ���
	for (var i=0; i<TradeMainGrid.mulLineCount; i++) {
    	if (TradeMainGrid.getSelNo(i)) { 
      		checkFlag = TradeMainGrid.getSelNo();
      		break;
		}
	}
	if (checkFlag) {
		DealNo = TradeMainGrid.getRowColData(checkFlag - 1, 1);
		CSNM = TradeMainGrid.getRowColData(checkFlag - 1, 4);
	}
	else {
    	alert("����ѡ��һ�����ɽ�����Ϣ��"); 
    	return ;
	}
	//�ж��Ƿ���ZIP
	if( importFile== "" || importFile == null){
		alert("����ѡ���ϴ���ZIP�ļ���");
	  	return ;
	}
	var patrn=/\.[z,Z][i,I][p,P]$/;
	if(!patrn.exec(importFile)){
		alert("���ϴ�ZIP�ļ���" );
		document.getElementById("FileName").value = "";
		document.getElementById("FileName").focus();
		return ;
	}
	var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
	var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
	upfm.action = "./LXISTradeManulUpload.jsp?DealNo=" + DealNo + "&CSNM=" + CSNM +"&ImportFile=" + importFile ;
	upfm.submit(); //�ύ
}

//������ɲ���
function GoToInputTrade(oper)
{
	var DataState = "";
	var cDate = fm.all("Date").value;

	if (oper == "update" || oper == "delete" || oper == "query" || oper == "finish"){
		var checkFlag = 0;
		var DealNo = ""; //���׺�
		var CSNM = ""; //�ͻ���
		for (var i=0; i<TradeMainGrid.mulLineCount; i++) {
	    	if (TradeMainGrid.getSelNo(i)) { 
	      		checkFlag = TradeMainGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			DealNo = TradeMainGrid.getRowColData(checkFlag - 1, 1);
			CSNM = TradeMainGrid.getRowColData(checkFlag - 1, 4);
			DataState = TradeMainGrid.getRowColData(checkFlag - 1, 11);
			if (oper == "delete"){
				if (confirm("ɾ�����ɻָ�,��ȷ��Ҫɾ���������ɽ�����Ϣ��")){
					fm.all("hideDealNo").value = DealNo;
					fm.all("hideOperate").value = "DELETE";
					fm.submit();
				}
				else{
					return;
				}
			}else if (oper == "finish"){
					//1
					var tsql = "select COUNT(MissionID) from LWMission where MissionProp3='"+DealNo+"'";
					var numWork = parseInt(easyExecSql(tsql));
					if(numWork>0)
					{
						alert("����Ϣ�����Ѿ�¼�����,���Ѿ���������ڵ�!");
						top.close();
						return false;
					}
					var StrSQLCusPartner="select COUNT(*) FROM LXISTradeCusPartner where dealno='"+DealNo+"'";
					var countCusPartner=easyExecSql(StrSQLCusPartner);
					if(parseInt(countCusPartner)<=0)
					{
							alert("���ɽ��׿ͻ��ɶ���Ϣû��¼��,��¼��!");
							return false;
					}
					//2
					var StrSQLCont="select COUNT(*) FROM LXISTradeCont where dealno='"+DealNo+"'";
					var countCont=easyExecSql(StrSQLCont);
					if(parseInt(countCont)<=0)
					{
							alert("���ɽ��׺�ͬ��Ϣû��¼��,��¼��!");
							return false;
					}
					//3
					var StrSQLDetail="select COUNT(*) FROM LXISTradeDetail where dealno='"+DealNo+"'";
					var countDetail=easyExecSql(StrSQLDetail);
					if(parseInt(countDetail)<=0)
					{
							alert("���ɽ�����ϸ��Ϣû��¼��,��¼��!");
							return false;
					}
					//4
					var StrSQLInsured="select COUNT(*) FROM LXISTradeInsured where dealno='"+DealNo+"'";
					var countInsured=easyExecSql(StrSQLInsured);
					if(parseInt(countInsured)<=0)
					{
							alert("���ɽ��׺�ͬ���ֱ���������Ϣû��¼��,��¼��!");
							return false;
					}
					//5
					var StrSQLBnf="select COUNT(*) FROM LXISTradeBnf where dealno='"+DealNo+"'";
					var countBnf=easyExecSql(StrSQLBnf);
					if(parseInt(countBnf)<=0)
					{
							alert("���ɽ��׺�ͬ��������Ϣû��¼��,��¼��!");
							return false;
					}
					fm.all("hideDealNo").value = DealNo;
					fm.all("hideOperate").value = "FINISH";
					fm.submit();
			}
			else{
				var strUrl = "./LXISTradeManualToDetail.jsp";
				strPara = "?" + "DealNo=" + DealNo + "&DataState=" + DataState + "&oper=" + oper ;
				OpenWindowNew(strUrl + strPara, "���ɽ�������", "left"); 					
		    }
		}
		else {
	    	alert("����ѡ��һ�����ɽ�����Ϣ��"); 
	    	return ;
		}
	} 
	if (oper == "insert"){
		DataState = "";
		var strUrl = "./LXISTradeManualToDetail.jsp";
		strPara = "?" + "DealNo=" + DealNo + "&DataState=" + DataState + "&oper=" + oper ;
		OpenWindowNew(strUrl + strPara, "���ɽ�������", "left");
	}
}

function afterQuery(cDealNo){
	initInpBox(cDealNo);
}

function GoToReturn(){
//	try
//	{
//		top.opener.afterQuery( );
//	}
//	catch(ex)
//	{
//		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
//	}
	top.close();
}
function DelAccessories(oper)
{ 
	var DataState = "";
	if (oper == "delaccessories"){
		var checkFlag = 0;
		var DealNo = ""; //���׺�
		var CSNM = ""; //�ͻ���
		for (var i=0; i<TradeMainGrid.mulLineCount; i++) {
	    	if (TradeMainGrid.getSelNo(i)) { 
	      		checkFlag = TradeMainGrid.getSelNo();
	      		break;
			}
		}
		if (checkFlag) {
			DealNo = TradeMainGrid.getRowColData(checkFlag - 1, 1);
			var showStr="���ڴ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
      var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
      showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
      fm.action="./DelAccessoriesSave.jsp?dealno="+DealNo;
      fm.submit();
		}
		else {
	    	alert("����ѡ��Ҫɾ�������Ŀ��ɽ�����Ϣ��"); 
	    	return;
		}
	} 
}