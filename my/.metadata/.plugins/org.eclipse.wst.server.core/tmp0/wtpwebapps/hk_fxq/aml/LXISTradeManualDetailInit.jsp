<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
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
	String tDealNo = "";
	tDealNo = request.getParameter("DealNo");
	if (tDealNo==null||tDealNo=="" || "undefined".equals(tDealNo))
  		tDealNo = PubFun1.CreateMaxNo("AMLDEALNO", 20);
	else 
  		tDealNo = new String(request.getParameter("DealNo"));

	String tDataState = "";
	tDataState = request.getParameter("DataState");
	if (tDataState==null||tDataState=="" || "undefined".equals(tDataState))
  		tDataState = "";
	else 
  		tDataState = new String(request.getParameter("DataState"));

	String toper = "";
	toper = request.getParameter("oper");
	if (toper==null||toper=="" || "undefined".equals(toper))
  		toper = "query";
	else 
  		toper = new String(request.getParameter("oper"));
  	
    String currentDate = PubFun.getCurrentDate();
    String currentTime = PubFun.getCurrentTime();  
    
    GlobalInput GI = new GlobalInput();
    GI = (GlobalInput) session.getValue("GI");
%>

<script language="JavaScript">

var tDealNo = '<%=tDealNo%>';
var tDataState = '<%=tDataState%>';
var toper = '<%=toper%>';
var tMngCom = '<%=GI.ComCode%>';

function initForm()
{
  try
  {
  	  initInpBox();
  	  initStockBox();
  	  initDetailBox(tDealNo);
  	  initContBox(tDealNo);
  	  fm.all("DealNo").value = tDealNo;
  	  fm.all("DataState").value = tDataState;
  	  if(fm.all("DealDate").value == null || fm.all("DealDate").value == ""){
  	     fm.all("DealDate").value = '<%=currentDate%>';
  	  }
  	  if(fm.all("DealTime").value == null || fm.all("DealTime").value == ""){
  	  fm.all("DealTime").value = '<%=currentTime%>';
  	  }
  }
  catch(re)
  {
    alert("��LXISTradeManualDetailInput.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

//��ѯ�ͻ���Ϣ
function initInpBox(){
	try{
			//�ͻ���, �ͻ�����, Ͷ��������
			var strSQL = "select CSNM, CTNM, CTTP, "
				+ " (select codename from ldcode b where a.CTTP = b.code and b.codetype = 'amlpolicyholdertype'), "
				//�ͻ����֤������, �ͻ�֤������, �ͻ���ϵ�绰
				+ " CITP, (select codename from ldcode b where a.CITP = b.code and b.codetype = 'amlidtype'), CTID, CCTL, "
				//���׷�����
				+ " TRCD, (select codename from ldcode b where substr(a.TRCD, 0, 3) = b.code and b.codetype = 'amlcountry') || "
				+ " (select codename from ldcode b where substr(a.TRCD, 4) = b.code and b.codetype = 'amlmanagecom'), "
				//�ͻ�ְҵ����ҵ
				+ " CTVC, (select codename from ldcode b where a.CTVC = b.code and b.codetype = 'amloccupationtype'), "
				//, ����������, ���������֤����, ���������֤������
				+ " CRNM, CRIT, (select codename from ldcode b where a.CRIT = b.code and b.codetype = 'amlidtype'), CRID, "
				//�ͻ���ϸ��ַ, �ͻ�������Ϣ
				+ " CTAR, CCEI, "
				//���ɽ������������ɳ̶�
				+ " STCR, SDGR, (select codename from ldcode b where a.SDGR = b.code and b.codetype = 'amlshadiness'), "
				//��ȡ��ʩ�� ������Ϊ����
				+ " TKMS, SSDS, "
				// ���, ���ɽ�����������, ���ɽ�������ʱ�� 
				+ " RPNM, DealDate, DealTime "
				+ " from LXISTradeMain a where a.DealNo = '" + tDealNo 
				+ "' and (a.DataState = '" + tDataState + "' or trim(a.DataState) is null ) "  ;
			var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//�ж��Ƿ��ѯ�ɹ�
			if (!strQueryResult) {
				if(fm.all("TRCD").value==null||fm.all("TRCD").value=='')
				{
				  if(tMngCom.length>=3)
				  {
				    tMngCom = tMngCom.substring(0,3);
				  }
				  var tSQL = " SELECT concat('CHN',CODE),codename FROM LDCODE  WHERE COMCODE= '"+tMngCom+"' "
				           + " and codetype = 'regcode' ";
				  var arr=easyExecSql(tSQL); 
				          
				  if(arr!=null && arr[0][0]!=null)
				  {
				    fm.all("TRCD").value=arr[0][0];
				    fm.all("TRCDName").value=arr[0][1];
				  }
				}				
				return ;
			}
			else{
				//��ѯ�ɹ������ַ��������ض�ά����
				var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("CSNM").value   = arrSelected[0][0];
				fm.all("CTNM").value = arrSelected[0][1];
				fm.all("CTTP").value = arrSelected[0][2];
				fm.all("CTTPName").value = arrSelected[0][3];
				
				fm.all("CITP").value = arrSelected[0][4];
				fm.all("CITPName").value = arrSelected[0][5];
				fm.all("CTID").value = arrSelected[0][6];
				fm.all("CCTL").value =  arrSelected[0][7];

				fm.all("TRCD").value = arrSelected[0][8];
				fm.all("TRCDName").value = arrSelected[0][9];
				fm.all("CTVC").value = arrSelected[0][10];
				fm.all("CTVCName").value = arrSelected[0][11];
				
				fm.all("CRNM").value = arrSelected[0][12];
				fm.all("CRIT").value = arrSelected[0][13];
				fm.all("CRITName").value = arrSelected[0][14];
				fm.all("CRID").value = arrSelected[0][15];
				
				fm.all("CTAR").value = arrSelected[0][16];
				fm.all("CCEI").value = arrSelected[0][17];
				
				//������Ϣ
				fm.all("STCR").value = arrSelected[0][18];
				fm.all("SDGR").value = arrSelected[0][19];
				fm.all("SDGRName").value = arrSelected[0][20];
				fm.all("TKMS").value = arrSelected[0][21].replace(/@Enter/g,"");
				fm.all("SSDS").value = arrSelected[0][22].replace(/@Enter/g,"");
				fm.all("RPNM").value = arrSelected[0][23];
				fm.all("DealDate").value = arrSelected[0][24];
				fm.all("DealTime").value = arrSelected[0][25];				
				return true;
			}
	}catch(ex){
		alert("��ʼ����Ϣ����" + ex);
	}
}


//��ʼ���ɶ���Ϣ
function initStockBox(){
	try{
	initStockGrid();
	//�ɶ�����, �ɶ�֤������, �ɶ�֤������, �ɶ�ְҵ����ҵ, �ɶ��ֹɱ���, �ɶ�������Ϣ
	var strSQL = "select HDNM, HITP, HDID, HDVC, HDRT, HEIF "
		+ " from LXISTradeCusPartner where DealNo = '" + tDealNo + "' " ;
	turnPage1.queryModal(strSQL, StockGrid);
	}catch(ex){
		alert(ex);
	}
}
// ��ʼ���ͻ��ɶ���Ϣ
function initStockGrid()
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
		iArray[1][0]="�ɶ�����/����";    		  //����
		iArray[1][1]="80px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=1; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="�ɶ�֤������";    		  //����
		iArray[2][1]="80px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=2; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		iArray[2][4]="amlidtype"; //
    iArray[2][9]="�ɶ�֤������|Code:amlidtype";
    
		iArray[3]=new Array();
		iArray[3][0]="�ɶ�֤������";    		  //����
		iArray[3][1]="80px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=1; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[4]=new Array();
		iArray[4][0]="�ɶ�ְҵ����ҵ";   		  //����
		iArray[4][1]="80px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=2;  			//�Ƿ���������,1��ʾ����0��ʾ������
		iArray[4][4]="amloccupationtype";  			//�Ƿ���������,1��ʾ����0��ʾ������
    	iArray[4][9]="�ɶ�ְҵ����ҵ|Code:amloccupationtype";
    
		iArray[5]=new Array();
		iArray[5][0]="�ɶ��ֹɱ���(%)";	   		//����
		iArray[5][1]="60px";			//�п�
		iArray[5][2]=100;			//�����ֵ
		iArray[5][3]=1;  			//�Ƿ���������,1��ʾ����0��ʾ������
		     
		iArray[6]=new Array();
		iArray[6][0]="�ɶ�������Ϣ";	   		//����
		iArray[6][1]="60px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=1;  			//�Ƿ���������,1��ʾ����0��ʾ������

		StockGrid = new MulLineEnter( "fm" , "StockGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    StockGrid.mulLineCount = 0;   
	    StockGrid.displayTitle = 1;
	    StockGrid.loadMulLine(iArray); 
	}
	catch(ex)
	{
	  alert(ex);
	}
}


//��ʼ�����ɽ�����ϸ��Ϣ
function initDetailBox(str){
	try{
		initDetailGrid();
		var strSQL = "select DealNo, ListNo, CSNM, TICD, TSTM,(select b.codename from ldcode b where TSTP = b.code and b.codetype='amltranstype'), (select b.codename from ldcode b where CRTP = b.code and b.codetype = 'amlcurrencytype'), "
			+ " CRAT, (select b.codename from ldcode b where CRDR = b.code and b.codetype='amloutpaytype'), TBNM from LXISTradeDetail "
			+ " where DealNo = '" + str + "' " ;
		turnPage2.queryModal(strSQL, DetailGrid);
	}catch(ex){
		alert(ex);
	}
}

function initDetailGrid(){
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
		iArray[1][1]="120px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="��ϸ����";    		  //����
		iArray[2][1]="50px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[3]=new Array();
		iArray[3][0]="���պ�ͬ��";    		  //����
		iArray[3][1]="90px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[4]=new Array();
		iArray[4][0]="ҵ���ʾ��";   		  //����
		iArray[4][1]="0px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[5]=new Array();
		iArray[5][0]="��������";	   		//����
		iArray[5][1]="60px";			//�п�
		iArray[5][2]=100;			//�����ֵ
		iArray[5][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		     
		iArray[6]=new Array();
		iArray[6][0]="��������";	   		//����
		iArray[6][1]="60px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[7]=new Array();
		iArray[7][0]="����";	   		//����
		iArray[7][1]="80px";			//�п�
		iArray[7][2]=100;			//�����ֵ
		iArray[7][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[8]=new Array();
		iArray[8][0]="���׽��";	   		//����
		iArray[8][1]="80px";			//�п�
		iArray[8][2]=100;			//�����ֵ
		iArray[8][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[9]=new Array();
		iArray[9][0]="�ʽ��������";	   		//����
		iArray[9][1]="80px";			//�п�
		iArray[9][2]=100;			//�����ֵ
		iArray[9][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[10]=new Array();
		iArray[10][0]="����������";	   		//����
		iArray[10][1]="80px";			//�п�
		iArray[10][2]=100;			//�����ֵ
		iArray[10][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		DetailGrid = new MulLineEnter( "fm" , "DetailGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    DetailGrid.mulLineCount = 0;   
	    DetailGrid.displayTitle = 1;
		DetailGrid.locked = 1;	    
	    DetailGrid.hiddenPlus = 1;
	    DetailGrid.hiddenSubtraction = 1;     
		DetailGrid.canSel = 1;
	    DetailGrid.loadMulLine(iArray); 
	}
	catch(ex)
	{
	  alert(ex);
	}
}


//��ʼ�����ɽ��ױ�����Ϣ
function initContBox(str){
	try{
		initContGrid();
		var strSQL = "select CSNM, (select b.codename from ldcode b where ISTP = b.code and b.codetype='amlrisktype'), ISNM, RiskCode, ISPS, ITNM, ISOG, ISAT, ISFE, (select b.codename from ldcode b where ISPT = b.code and b.codetype='amlpayintv'), CTES from LXISTradeCont "
			+ " where DealNo = '" + str + "' " ;
		turnPage3.queryModal(strSQL, ContGrid);
	}catch(ex){
		alert(ex);
	}
}

function initContGrid(){
	var iArray = new Array();      
    try
    {
		iArray[0]=new Array();
		iArray[0][0]="���";   			//����������Ϊ˳��ţ����������壬���Ҳ���ʾ��
		iArray[0][1]="30px"; 	     		//�п�
		iArray[0][2]=100;			//�����ֵ
		iArray[0][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[1]=new Array();
		iArray[1][0]="���պ�ͬ��";    		  //����
		iArray[1][1]="80px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="��������";    		  //����
		iArray[2][1]="80px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[3]=new Array();
		iArray[3][0]="��������";    		  //����
		iArray[3][1]="80px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[4]=new Array();
		iArray[4][0]="���ձ���";   		  //����
		iArray[4][1]="60px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[5]=new Array();
		iArray[5][0]="�����ڼ�";	   		//����
		iArray[5][1]="80px";			//�п�
		iArray[5][2]=100;			//�����ֵ
		iArray[5][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		     
		iArray[6]=new Array();
		iArray[6][0]="������������";	   		//����
		iArray[6][1]="60px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[7]=new Array();
		iArray[7][0]="���ձ��";	   		//����
		iArray[7][1]="60px";			//�п�
		iArray[7][2]=100;			//�����ֵ
		iArray[7][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[8]=new Array();
		iArray[8][0]="���ս��";	   		//����
		iArray[8][1]="60px";			//�п�
		iArray[8][2]=100;			//�����ֵ
		iArray[8][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[9]=new Array();
		iArray[9][0]="���շ�";	   		//����
		iArray[9][1]="60px";			//�п�
		iArray[9][2]=100;			//�����ֵ
		iArray[9][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[10]=new Array();
		iArray[10][0]="�ɷѷ�ʽ";	   		//����
		iArray[10][1]="80px";			//�п�
		iArray[10][2]=100;			//�����ֵ
		iArray[10][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[11]=new Array();
		iArray[11][0]="���պ�ͬ������Ϣ";	   		//����
		iArray[11][1]="0px";			//�п�
		iArray[11][2]=100;			//�����ֵ
		iArray[11][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		ContGrid = new MulLineEnter( "fm" , "ContGrid" ); 
		
		//��Щ���Ա�����loadMulLineǰ
	    ContGrid.mulLineCount = 0;   
	    ContGrid.displayTitle = 1;
		ContGrid.locked = 1;	    
	    ContGrid.hiddenPlus = 1;
	    ContGrid.hiddenSubtraction = 1;     
		ContGrid.canSel = 1;
	    ContGrid.loadMulLine(iArray); 
	}
	catch(ex)
	{
	  alert(ex);
	}
}
</script>