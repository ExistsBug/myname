<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
//�������ƣ�OrphanPolOutInit.jsp
//�����ܣ�
//�������ڣ�2005-05-26 15:39:06
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

<script language="JavaScript">
function initForm()
{
  try
  { 
    initFileMsgGrid();
  }
  catch(re)
  {
    alert("��LXISTradeContMain.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

function initFileMsgGrid()
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
		iArray[1][0]="�������";    		  //����
		iArray[1][1]="60px";			//�п�
		iArray[1][2]=100;			//�����ֵ
		iArray[1][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="��������";    		  //����
		iArray[2][1]="60px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[3]=new Array();
		iArray[3][0]="��������";    		  //����
		iArray[3][1]="100px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		
		iArray[4]=new Array();
		iArray[4][0]="��ȡ��ʩ";    		  //����
		iArray[4][1]="100px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		     

		  FileMsgGrid = new MulLineEnter( "fm" , "FileMsgGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    FileMsgGrid.displayTitle = 1;
		  FileMsgGrid.locked = 1;	    
	    FileMsgGrid.hiddenPlus = 1;
	    FileMsgGrid.hiddenSubtraction = 1;     
		  FileMsgGrid.canSel = 1;
			FileMsgGrid.selBoxEventFuncName ="modifydetail" ;     //���RadioBoxʱ��Ӧ��JS����
	    FileMsgGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}


</script>