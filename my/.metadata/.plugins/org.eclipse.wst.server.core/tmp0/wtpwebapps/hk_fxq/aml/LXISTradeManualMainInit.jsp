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
	String tDate = new String("");
	tDate = request.getParameter("Date");
	if (tDate==null||tDate=="" || "undefined".equals(tDate))
  		tDate = "";
	else 
  		tDate = new String(request.getParameter("Date"));
	
	String tCSNM = new String("");
	tCSNM = request.getParameter("CSNM");
	if (tCSNM==null||tCSNM=="" || "undefined".equals(tCSNM))
  		tCSNM = "";
	else 
  		tCSNM = new String(request.getParameter("CSNM"));

	String tDataState = new String("");
	tDataState = request.getParameter("DataState");
	if (tDataState==null||tDataState=="" || "undefined".equals(tDataState))
  		tDataState = "";
	else 
  		tDataState = new String(request.getParameter("DataState"));
	String tDealNo = new String("");
	tDealNo = request.getParameter("DealNo");
	if (tDealNo==null||tDealNo=="" || "undefined".equals(tDealNo))
  		tDealNo = "";
	else 
  		tDealNo = new String(request.getParameter("DealNo"));
  		
	String tOper = new String("");
	tOper = request.getParameter("Oper");
	if (tOper==null||tOper=="" || "undefined".equals(tOper))
  		tOper = "";
	else 
  		tOper = new String(request.getParameter("Oper"));  		
%>                            

<script language="JavaScript">
var tCSNM = '<%=tCSNM%>' ; //�ͻ���
var tDealDate = '<%=tDate%>' ; //ͳ������
var tDataState = '<%=tDataState%>' ; //����״̬
var tDealNo = '<%=tDealNo%>' ; 
var tOper = '<%=tOper%>' ; 

function initForm()
{
	try{
    	initInpBox(tDealNo);  
	    if (tOper == "ViewAndUpdate"){
	    	document.getElementsByName("finish")[0].disabled = true;
	    	document.getElementsByName("insert")[0].disabled = true;
	    }
	    else {
	    	document.getElementsByName("finish")[0].disabled = false;
	    	document.getElementsByName("insert")[0].disabled = false;
	    }
  }
  catch(re)
  {
    alert("��LXISTradeManualInit.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

//��ʼ�����ɽ�����Ϣ
function initInpBox(cDealNo){
	initTradeMainGrid();
	var strSQL = "select DealNo, "
		+ "STCR, "
		+ "SDGR, "
		+ "CSNM, "
		+ "CTNM, "
		+ "CITP, "
		+ "CTID, " 
		+ "TRCD, "
		+ "CTVC, "
		+ "FileName, "
		+ "DataState "
		+ "from LXISTradeMain a "
		+ "where 1=1 " 
		+ "and managecom like'" + comcode + "%' ";
	if (tDataState != null && tDataState != "" && tDataState != "undefined")
		strSQL = strSQL + "and trim(DataState) = '" + tDataState + "' ";
	else 
		strSQL = strSQL + "and trim(DataState) is null ";
	if (cDealNo != null && cDealNo != "" && cDealNo != "undefined")
		strSQL = strSQL + " and DealNo = '" + cDealNo + "' ";
	//alert(strSQL);
	turnPage.queryModal(strSQL, TradeMainGrid, 0, 1);
}


// ���ɽ���������Ϣ
function initTradeMainGrid()
{
	var iArray = new Array();      
    try
    {
    	var i = 0;
		iArray[i]=new Array();
		iArray[i][0]="���";   			//����������Ϊ˳��ţ����������壬���Ҳ���ʾ��
		iArray[i][1]="30px"; 	     		//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="���ױ��";    		  //����
		iArray[i][1]="150px";			//�п�
		iArray[i][2]=200;			//�����ֵ
		iArray[i++][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[i]=new Array();
		iArray[i][0]="���ɽ�������";    		  //����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i][3]=2; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		iArray[i][4]="amlshadinessstamp";                 
		iArray[i++][9]="���ɽ�������|Code:amlshadinessstamp"; 		

		iArray[i]=new Array();
		iArray[i][0]="���ɳ̶�";    		  //����
		iArray[i][1]="60px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i][3]=2; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		iArray[i][4]="amlshadiness";                 
		iArray[i++][9]="���ɽ�������|Code:amlshadiness"; 

		iArray[i]=new Array();
		iArray[i][0]="�ͻ���";   		  //����
		iArray[i][1]="100px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="�ͻ�����/����";	   		//����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="�ͻ����֤������";	   		//����
		iArray[i][1]="100px";			//�п�
		iArray[i][2]=200;			//�����ֵ
		iArray[i][3]=2;  			//�Ƿ���������,1��ʾ����0��ʾ������
		iArray[i][4]="amlidtype";                 
		iArray[i++][9]="���ɽ�������|Code:amlidtype"; 
		
		iArray[i]=new Array();
		iArray[i][0]="�ͻ�֤������";	   		//����
		iArray[i][1]="120px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="���׷�����";	   		//����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="�ͻ�ְҵ����ҵ";	   		//����
		iArray[i][1]="0px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="����";	   		//����
		iArray[i][1]="180px";			//�п�
		iArray[i][2]=200;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[i]=new Array();
		iArray[i][0]="����״̬";	   		//����
		iArray[i][1]="0px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		TradeMainGrid = new MulLineEnter( "fm" , "TradeMainGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    TradeMainGrid.mulLineCount = 10;   
	    TradeMainGrid.displayTitle = 1;
		TradeMainGrid.locked = 1;	    
	    TradeMainGrid.hiddenPlus = 1;
	    TradeMainGrid.hiddenSubtraction = 1;     
		TradeMainGrid.canSel = 1;	    
	    TradeMainGrid.canChk =0; //��ѡ��
	    TradeMainGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}
</script>