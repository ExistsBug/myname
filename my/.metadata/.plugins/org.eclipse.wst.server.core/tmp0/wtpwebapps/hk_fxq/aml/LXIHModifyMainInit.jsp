
<!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage=""%>
<%@ page import="com.sinosoft.lis.pubfun.*"%>
<%
        String sEndDate = PubFun.getCurrentDate();
 %>

<script language="JavaScript">

        var WaitForBeFileGrid;

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
                initTasksGrid();
                initErrorGrid();
                queryWaitForBeFileGrid();
                initSendOut();
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initForm �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * �����ĳ�ʼ��
         */
        function initInputBox()
        {
            try
            {
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
				document.getElementsByName("CTNTName")[0].value = "�й� China";
						
		    fm.MngCom.value = "<%=tGI.ComCode%>";
		    showOneCodeName('station','MngCom','MngComName');		
				
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * ��ѡ���Ķ��� MultiLine �ĳ�ʼ��
         */
        function initWaitForBeFileGrid()
        {
            var iArray = new Array();                           //������, ���ظ� MultiLine ���

            try
            {
                iArray[0] = new Array();
                iArray[0][0] = "���";                          //����(˳���, ������)
                iArray[0][1] = "30px";                          //�п�
                iArray[0][2] = 30;                              //�����ֵ
                iArray[0][3] = 0;                               //�Ƿ���������: 0��ʾ������; 1��ʾ����

                iArray[1] = new Array();
                iArray[1][0] = "���ױ��";
                iArray[1][1] = "150px";
                iArray[1][2] = 100;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "�ͻ���";
                iArray[2][1] = "80px";
                iArray[2][2] = 200;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "�ͻ���";
                iArray[3][1] = "100px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;

                iArray[4] = new Array();
                iArray[4][0] = "֤������";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 2;
				iArray[4][4]="amlidtype";                 
                iArray[4][9]="֤������|Code:amlidtype";                 

                iArray[5] = new Array();
                iArray[5][0] = "֤������";
                iArray[5][1] = "100px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;

                iArray[6] = new Array();
                iArray[6][0] = "����";
                iArray[6][1] = "0px";
                iArray[6][2] = 100;
                iArray[6][3] = 2;
				iArray[6][4]="ccountry";                 
                iArray[6][9]="����|Code:ccountry"; 
                
                iArray[7] = new Array();
                iArray[7][0] = "��������";
                iArray[7][1] = "80px";
                iArray[7][2] = 150;
                iArray[7][3] = 0;

                iArray[8] = new Array();
                iArray[8][0] = "����״̬";
                iArray[8][1] = "60px";
                iArray[8][2] = 100;
                iArray[8][3] = 2;
				iArray[8][4]="amldatastate";                 
                iArray[8][9]="����״̬|Code:amldatastate";                   
                
                iArray[9] = new Array();
                iArray[9][0] = "��������";
                iArray[9][1] = "80px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;
                
                iArray[10] = new Array();
                iArray[10][0] = "����ʱ��";
                iArray[10][1] = "0px";
                iArray[10][2] = 100;
                iArray[10][3] = 3;
                
                iArray[11] = new Array();
                iArray[11][0] = "����Ա";
                iArray[11][1] = "60px";
                iArray[11][2] = 100;
                iArray[11][3] = 0;
                
                iArray[12] = new Array();
                iArray[12][0] = "����Ա";
                iArray[12][1] = "0px";
                iArray[12][2] = 100;
                iArray[12][3] = 3;

                iArray[13] = new Array();
                iArray[13][0] = "amlidtype";
                iArray[13][1] = "0px";
                iArray[13][2] = 100;
                iArray[13][3] = 3;
                
                iArray[14] = new Array();
                iArray[14][0] = "amldatastate";
                iArray[14][1] = "0px";
                iArray[14][2] = 100;
                iArray[14][3] = 3;                
                
                iArray[15] = new Array();
                iArray[15][0] = "�������";
                iArray[15][1] = "120px";
                iArray[15][2] = 100;
                iArray[15][3] = 0;  
                
                iArray[16] = new Array();
                iArray[16][0] = "�޸�״̬";
                iArray[16][1] = "100px";
                iArray[16][2] = 100;
                iArray[16][3] = 0;                  
                
                
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
                WaitForBeFileGrid.mulLineCount = 0;
                WaitForBeFileGrid.displayTitle = 1;
                WaitForBeFileGrid.locked = 1;
                WaitForBeFileGrid.hiddenPlus = 1;
                WaitForBeFileGrid.hiddenSubtraction = 1;
                WaitForBeFileGrid.canChk = 0;
                WaitForBeFileGrid.canSel = 1;
                WaitForBeFileGrid.chkBoxEventFuncName = "";
                WaitForBeFileGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                	 WaitForBeFileGrid.selBoxEventFuncName ="queryTasksGrid" ;     //���RadioBoxʱ��Ӧ��JS����
                WaitForBeFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
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
		iArray[1][0]="���ױ��";    		  //����
		iArray[1][1]="140px";			//�п�
		iArray[1][2]=200;			//�����ֵ
		iArray[1][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[2]=new Array();
		iArray[2][0]="������������";    		  //����
		iArray[2][1]="100px";			//�п�
		iArray[2][2]=100;			//�����ֵ
		iArray[2][3]=2; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		iArray[2][4]="amlbigstamp";                 
        iArray[2][9]="������������|Code:amlbigstamp";    		

		iArray[3]=new Array();
		iArray[3][0]="������ϸ����";    		  //����
		iArray[3][1]="100px";			//�п�
		iArray[3][2]=100;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[4]=new Array();
		iArray[4][0]="���ڻ�����������";   		  //����
		iArray[4][1]="120px";			//�п�
		iArray[4][2]=200;			//�����ֵ
		iArray[4][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[5]=new Array();
		iArray[5][0]="�˻�����";	   		//����
		iArray[5][1]="60px";			//�п�
		iArray[5][2]=100;			//�����ֵ
		iArray[5][3]=2;  			//�Ƿ���������,1��ʾ����0��ʾ������
		iArray[5][4]="amlaccount";                 
        iArray[5][9]="�˻�����|Code:amlaccount"; 

		iArray[6]=new Array();
		iArray[6][0]="�˺�";	   		//����
		iArray[6][1]="100px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[7]=new Array();
		iArray[7][0]="����ʱ��";	   		//����
		iArray[7][1]="100px";			//�п�
		iArray[7][2]=100;			//�����ֵ
		iArray[7][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

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


        function initErrorGrid()
        {
            var iArray = new Array();                           //������, ���ظ� MultiLine ���

            try
            {
                iArray[0] = new Array();
                iArray[0][0] = "���";                          //����(˳���, ������)
                iArray[0][1] = "30px";                          //�п�
                iArray[0][2] = 30;                              //�����ֵ
                iArray[0][3] = 0;                               //�Ƿ���������: 0��ʾ������; 1��ʾ����

                iArray[1] = new Array();
                iArray[1][0] = "��ִ�ļ����";
                iArray[1][1] = "120px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "��ִ���ݱ��";
                iArray[2][1] = "0px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "���ױ��";
                iArray[3][1] = "150px";
                iArray[3][2] = 200;
                iArray[3][3] = 0;

                iArray[4] = new Array();
                iArray[4][0] = "״̬";
                iArray[4][1] = "30px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                
                iArray[5]=new Array();
		        iArray[5][0]="����λ";	   		//����
		        iArray[5][1]="200px";			//�п�
		        iArray[5][2]=100;			//�����ֵ
		        iArray[5][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		                 
                
		        iArray[6]=new Array();
		        iArray[6][0]="����ԭ��";	   		//����
		        iArray[6][1]="180px";			//�п�
		        iArray[6][2]=100;			//�����ֵ
		        iArray[6][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initErrorGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                ErrorGrid = new MulLineEnter("fm", "ErrorGrid");
                ErrorGrid.mulLineCount = 0;
                ErrorGrid.displayTitle = 1;
                ErrorGrid.locked = 1;
                ErrorGrid.hiddenPlus = 1;
                ErrorGrid.hiddenSubtraction = 1;
                ErrorGrid.canChk = 0;
                ErrorGrid.canSel = 0;
                ErrorGrid.chkBoxEventFuncName = "";
                ErrorGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                ErrorGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initErrorGrid �����з����쳣: ��ʼ���������");
            }
        }
    </script>

<!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

