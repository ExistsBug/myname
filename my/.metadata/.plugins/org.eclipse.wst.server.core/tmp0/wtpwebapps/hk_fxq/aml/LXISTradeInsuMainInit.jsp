<%
//�������ƣ�OrphanPolOutInit.jsp
//�����ܣ�
//�������ڣ�2005-05-26 15:39:06
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<%
    //���ҳ��ؼ��ĳ�ʼ����

    String tDealNo  = request.getParameter("DealNo") ;
   	String tCSNM = request.getParameter("CSNM");
	  String tRiskCode = request.getParameter("RiskCode");
	  String tInsuredNo = request.getParameter("InsuredNo");
	  if(tInsuredNo==null||tInsuredNo.equals("")){
	  tInsuredNo="";
	  }
	  	String Oper = "";
	Oper = request.getParameter("oper");
	if (Oper==null||Oper=="" || "undefined".equals(Oper))
  		Oper = "query";
	else 
  		Oper = new String(request.getParameter("oper"));
%>                            

<script language="JavaScript">
var tDealNo = '<%=tDealNo%>' ;
var tCSNM = '<%=tCSNM%>' ;
var tRiskCode = '<%=tRiskCode%>' ;
var tInsuredNo = '<%=tInsuredNo%>' ;	
var oper = '<%=Oper%>' ;

function initForm()
{
  try
  { 
  	initInpBox();

    initIntBox();
  }
  catch(re)
  {
    alert("��LXISTradeInsuMain.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

//��ѯ��ͬ��Ϣ
function initInpBox(){
	try{
		if(oper == 'update' ||oper =='delete' || oper =='query' ){
		if (tDealNo != null && tDealNo != "" && tRiskCode != null && tRiskCode != "" && tCSNM != null && tCSNM != "" &&tInsuredNo != null && tInsuredNo != ""){		
		  var strSQL = "(select DealNo, CSNM, ISNM, RiskCode, "
				+ " InsuredNo, ISTN, "
				+ " IITP, (select b.codename from ldcode b where IITP = b.code and b.codetype='amlidtype'), ISID, RLTP,(select b.codename from ldcode b where RLTP = b.code and b.codetype='relation') "
				+ " from LXISTradeInsured a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"' and a.InsuredNo ='" + tInsuredNo +"')";
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//�ж��Ƿ��ѯ�ɹ�
			if (!strQueryResult) {
				alert("�����˲����ڣ�");
				return false;
			}
			else{
				//��ѯ�ɹ������ַ��������ض�ά����								
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("DealNo").value = arrSelected[0][0];
				fm.all("CSNM").value = arrSelected[0][1];
				fm.all("ISNM").value = arrSelected[0][2];
				fm.all("RiskCode").value = arrSelected[0][3];
				fm.all("InsuredNo").value = arrSelected[0][4];
				fm.all("ISTN").value =  arrSelected[0][5];
				fm.all("IITP").value = arrSelected[0][6];
				fm.all("IITPName").value = arrSelected[0][7];
				fm.all("ISID").value = arrSelected[0][8];
				fm.all("RLTP").value = arrSelected[0][9];
				fm.all("RLTPName").value = arrSelected[0][10];
				return true;
		}
	}
}else{
	
	      var strSQL = "(select DealNo, CSNM, ISNM, RiskCode "
				+ " from LXISTradeCont a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"')";
		  	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//�ж��Ƿ��ѯ�ɹ�
			if (!strQueryResult) {
				alert("�ú�ͬ�����ڣ������Ƿ��޸��˺�ͬ��Ϣδ����");
				top.close();
				return false;
			}
		  	var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("DealNo").value = arrSelected[0][0];
				fm.all("CSNM").value = arrSelected[0][1];
				fm.all("ISNM").value = arrSelected[0][2];
				fm.all("RiskCode").value = arrSelected[0][3];
				fm.all("InsuredNo").value = "";
				fm.all("ISTN").value = "";
				fm.all("IITP").value = "";
				fm.all("IITPName").value = "";
				fm.all("ISID").value = "";
				fm.all("RLTP").value = "";
				fm.all("RLTPName").value = "";
			
				return true;
		}
	}
		catch(ex){
		alert(ex);
	}
}

//��ʼ����������Ϣ
function initIntBox(){
	initTasksGrid();
 if(oper == 'update' ||oper =='delete' || oper =='query'){
 	if (tInsuredNo != null && tInsuredNo != "")
   {	
   	var strSQL = "select BnfNo,BNNM,BITP,BNID from LXISTradeBnf where DealNo = '" + tDealNo + "' and CSNM ='" + tCSNM +"' and RiskCode ='" + tRiskCode +"' and InsuredNo ='" + tInsuredNo +"'";
 	  turnPage3.queryModal(strSQL, TasksGrid);	
   }
  }
}

// ��������Ϣ
function initTasksGrid()
{                               
	var iArray = new Array();      
    try
    {
		iArray[0]=new Array();
		iArray[0][0]="���";   			//����������Ϊ˳��ţ����������壬���Ҳ���ʾ��
		iArray[0][1]="30px"; 	     		//�п�
		iArray[0][2]=100;			//�����ֵ
		iArray[0][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[1]=new Array();
		iArray[1][0]="�����˴���";    		  //����
		iArray[1][1]="60px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=1; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
    iArray[1][9]="�����˴���|notnull&len<=4"
 
		iArray[2]=new Array();
		iArray[2][0]="����������";    		  //����
		iArray[2][1]="60px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=1; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
    iArray[2][9]="����������|notnull&len<=64"

		iArray[3]=new Array();
		iArray[3][0]="���������֤������";    		  //����
		iArray[3][1]="60px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=2; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
    iArray[3][4]="amlidtype";
    iArray[3][9]="���������֤������|notnull&len=2&Code:amlidtype"
    
		iArray[4]=new Array();
		iArray[4][0]="���������֤������";   		  //����
		iArray[4][1]="60px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=1;  			//�Ƿ���������,1��ʾ����0��ʾ������
    iArray[4][9]="���������֤������|notnull&len<=20"



		TasksGrid = new MulLineEnter( "fm" , "TasksGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    TasksGrid.displayTitle = 1;
	    TasksGrid.mulLineCount = 0;
	    TasksGrid.loadMulLine(iArray);

	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>