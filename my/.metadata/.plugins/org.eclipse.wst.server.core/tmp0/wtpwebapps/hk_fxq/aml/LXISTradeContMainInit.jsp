<%@page contentType="text/html;charset=GBK" %>
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
   	System.out.println(tCSNM);
	  String tRiskCode = request.getParameter("RiskCode");
	  if(tCSNM == null || tCSNM.equals(""))
	  {
	  tCSNM="";
	  }
	  System.out.println(tCSNM);
	  if(tRiskCode==null||tRiskCode.equals("")){
	  tRiskCode="";}
	  
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
var oper = '<%=Oper%>' ;
function initForm()
{
  try
  { 
  	initInpBox(tDealNo,tCSNM,tRiskCode);

    initIntBox(tDealNo,tCSNM,tRiskCode);
  }
  catch(re)
  {
    alert("��LXISTradeContMain.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

//��ѯ��ͬ��Ϣ
function initInpBox(tDealNo,tCSNM,tRiskCode){
	try{
		if (tDealNo != null && tDealNo != "" && tRiskCode != null && tRiskCode != "" && tCSNM != null && tCSNM != ""){		
			
			var strSQL = "(select DealNo, CSNM, ISTP, (select b.codename from ldcode b where ISTP = b.code and b.codetype='amlrisktype'), "
				+ " ISNM, RiskCode, "
				+ " ISPS, ISOG, ISAT, "
				+ " ISFE, ISPT, (select b.codename from ldcode b where ISPT = b.code and b.codetype='amlpayintv'), CTES "
				+ " from LXISTradeCont a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"')";
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//�ж��Ƿ��ѯ�ɹ�
			if (!strQueryResult) {
			//	alert("��ͬ�����ڣ�");
				return false;
			}
			else{
				//��ѯ�ɹ������ַ��������ض�ά����
								
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				
				fm.all("DealNo").value = arrSelected[0][0];
				fm.all("CSNM").value = arrSelected[0][1];
				fm.all("ISTP").value = arrSelected[0][2];
				fm.all("ISTPName").value = arrSelected[0][3];
				fm.all("ISNM").value = arrSelected[0][4];
				fm.all("RiskCode").value =  arrSelected[0][5];
				fm.all("ISPS").value = arrSelected[0][6];
//				fm.all("ITNM").value = arrSelected[0][7];
				fm.all("ISOG").value = arrSelected[0][7];
				fm.all("ISAT").value = arrSelected[0][8];
				fm.all("ISFE").value = arrSelected[0][9];
				fm.all("ISPT").value = arrSelected[0][10];
				fm.all("ISPTName").value = arrSelected[0][11];
				fm.all("CTES").value = arrSelected[0][12];
				return true;
			}
		}
		else{
			
				fm.all("DealNo").value = tDealNo;
				fm.all("CSNM").value = "";
				fm.all("ISTP").value = "";
				fm.all("ISTPName").value = "";
				fm.all("ISNM").value = "";
				fm.all("RiskCode").value =  "";
				fm.all("ISPS").value = "";
//				fm.all("ITNM").value = "";
				fm.all("ISOG").value = "";
				fm.all("ISAT").value = "";
				fm.all("ISFE").value = "";
				fm.all("ISPT").value = "";
				fm.all("ISPTName").value = "";
				fm.all("CTES").value = "";
			
				return true;
		}
	}catch(ex){
		alert(ex);
	}
}

//��ʼ����������Ϣ
function initIntBox(tDealNo,tCSNM,tRiskCode){
	initTasksGrid();
	var strSQL = "select a.DealNo, a.CSNM, a.ISNM, a.RiskCode, a.InsuredNo, a.ISTN, (select codename from ldcode b where codetype = 'amlidtype' and b.code = a.IITP),a.ISID,a.RLTP from LXISTradeInsured a where a.DealNo = '" + tDealNo + "' and a.CSNM ='" + tCSNM +"' and a.RiskCode ='" + tRiskCode +"'";
	turnPage3.queryModal(strSQL, TasksGrid);	
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
		iArray[1][0]="���ױ��";    		  //����
		iArray[1][1]="110px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="���պ�ͬ��";    		  //����
		iArray[2][1]="60px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[3]=new Array();
		iArray[3][0]="��������";    		  //����
		iArray[3][1]="60px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[4]=new Array();
		iArray[4][0]="���ձ���";   		  //����
		iArray[4][1]="60px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[5]=new Array();
		iArray[5][0]="�������˱���";	   		//����
		iArray[5][1]="0px";			//�п�
		iArray[5][2]=100;			//�����ֵ
		iArray[5][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		     

		iArray[6]=new Array();
		iArray[6][0]="������������";	   		//����
		iArray[6][1]="60px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[7]=new Array();
		iArray[7][0]="�����������֤������";	   		//����
		iArray[7][1]="120px";			//�п�
		iArray[7][2]=100;			//�����ֵ
		iArray[7][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[8]=new Array();
		iArray[8][0]="�����������֤������";	   		//����
		iArray[8][1]="100px";			//�п�
		iArray[8][2]=100;			//�����ֵ
		iArray[8][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[9]=new Array();
		iArray[9][0]="Ͷ�����뱻�����˵Ĺ�ϵ";	   		//����
		iArray[9][1]="100px";			//�п�
		iArray[9][2]=100;			//�����ֵ
		iArray[9][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		TasksGrid = new MulLineEnter( "fm" , "TasksGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    TasksGrid.displayTitle = 1;
		TasksGrid.locked = 1;	    
	    TasksGrid.hiddenPlus = 1;
	    TasksGrid.hiddenSubtraction = 1;     
		TasksGrid.canSel = 1;
	    TasksGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>