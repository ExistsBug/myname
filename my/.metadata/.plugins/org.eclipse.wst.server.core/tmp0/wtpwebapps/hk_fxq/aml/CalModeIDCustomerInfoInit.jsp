<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�IHDataInterfaceInit.jsp
//�����ܣ�
//�������ڣ�2007-11-08
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%
String CurrentDate = PubFun.getCurrentDate();
String CurrentTime = PubFun.getCurrentTime();
%>
<script language="JavaScript">
function initInpBox()
{
  try
  {
    initTasksGrid();
  }
  catch(ex)
  {
    alert("IHDataInterfaceInit.jsp-->InitInpBox�����з����쳣:��ʼ���������!");
  }
}


function initInpBox1()
{
  try
  {

    fm.all('StartDate').value = '';
    fm.all('EndDate').value = '';


  }
  catch(ex)
  {
    alert("IHDataInterfaceInit.jsp-->InitInpBox�����з����쳣:��ʼ���������!");
  }
}




function initForm()
{
  try
  {
    initInpBox();
  }
  catch(re)
  {
    alert("IHDataInterfaceInit.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

function initForm1()
{
  try
  {
    initInpBox1();
  }
  catch(re)
  {
    alert("IHDataInterfaceInit.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}
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
		iArray[1][0]="��������";    		  //����
		iArray[1][1]="80px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="��������";    		  //����
		iArray[2][1]="260px";			//�п�
		iArray[2][2]=300;			//�����ֵ
		iArray[2][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[3]=new Array();
		iArray[3][0]="��������";    		  //����
		iArray[3][1]="80px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[4]=new Array();
		iArray[4][0]="��������";   		  //����
		iArray[4][1]="80px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[5]=new Array();
		iArray[5][0]="���ռƻ�����";	   		//����
		iArray[5][1]="230px";			//�п�
		iArray[5][2]=300;			//�����ֵ
		iArray[5][3]=2;  			//�Ƿ���������,1��ʾ����0��ʾ������
		//iArray[5][4] = "amllxcalflag";     

		iArray[6]=new Array();
		iArray[6][0]="���պ�ͬ��";	   		//����
		iArray[6][1]="120px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[7]=new Array();
		iArray[7][0]="Ͷ����";	   		//����
		iArray[7][1]="60px";			//�п�
		iArray[7][2]=100;			//�����ֵ
		iArray[7][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[8]=new Array();
		iArray[8][0]="��������";	   		//����
		iArray[8][1]="60px";			//�п�
		iArray[8][2]=100;			//�����ֵ
		iArray[8][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
        
        iArray[9]=new Array();
		iArray[9][0]="������";	   		//����
		iArray[9][1]="60px";			//�п�
		iArray[9][2]=100;			//�����ֵ
		iArray[9][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[10]=new Array();
		iArray[10][0]="���׽��";	   		//����
		iArray[10][1]="80px";			//�п�
		iArray[10][2]=100;			//�����ֵ
		iArray[10][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[11]=new Array();
		iArray[11][0]="���׷�ʽ";	   		//����
		iArray[11][1]="120px";			//�п�
		iArray[11][2]=200;			//�����ֵ
		iArray[11][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[12]=new Array();
		iArray[12][0]="��֧����";	   		//����
		iArray[12][1]="60px";			//�п�
		iArray[12][2]=100;			//�����ֵ
		iArray[12][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[13]=new Array();
		iArray[13][0]="ʶ������";	   		//����
		iArray[13][1]="400px";			//�п�
		iArray[13][2]=100;			//�����ֵ
		iArray[13][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[14]=new Array();
		iArray[14][0]="��������";	   		//����
		iArray[14][1]="100px";			//�п�
		iArray[14][2]=100;			//�����ֵ
		iArray[14][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
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
