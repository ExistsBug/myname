    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->
<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
    <%@ page import="com.sinosoft.lis.pubfun.*" %>
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
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                
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
            {   var i=0;
                iArray[i] = new Array();
                iArray[i][0] = "���";                          //����(˳���, ������)
                iArray[i][1] = "30px";                          //�п�
                iArray[i][2] = 30;                              //�����ֵ
                iArray[i++][3] = 0;                               //�Ƿ���������: 0��ʾ������; 1��ʾ����

                iArray[i] = new Array();
                iArray[i][0] = "���ױ��";
                iArray[i][1] = "130px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "�ͻ���";
                iArray[i][1] = "80px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "�ͻ�����/����";
                iArray[i][1] = "100px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "����";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i][3] = 2;
				        iArray[i][4]="ccountry";                 
                iArray[i++][9]="����|Code:ccountry";  

                iArray[i] = new Array();
                iArray[i][0] = "����״̬����";
                iArray[i][1] = "80px";
                iArray[i][2] = 100;
                iArray[i++][3] = 3;

                iArray[i] = new Array();
                iArray[i][0] = "����״̬";
                iArray[i][1] = "80px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
				        //iArray[8][4]="amldatastate";                 
                //iArray[8][9]="����״̬|Code:amldatastate"; 
                
                iArray[i] = new Array();
                iArray[i][0] = "֤������";
                iArray[i][1] = "100px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
				        //iArray[4][4]="amlidtype";                 
                //iArray[4][9]="֤������|Code:amlidtype";     
                
                iArray[i] = new Array();
                iArray[i][0] = "֤������";
                iArray[i][1] = "120px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;

                iArray[i] = new Array();
                iArray[i][0] = "���׷�������";
                iArray[i][1] = "80px";
                iArray[i][2] = 150;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "������ȡ����";
                iArray[i][1] = "80px";
                iArray[i][2] = 150;
                iArray[i++][3] = 0;
                                               
                //iArray[i] = new Array();
                //iArray[i][0] = "��������";
                //iArray[i][1] = "0px";
                //iArray[i][2] = 100;
                //iArray[i++][3] = 0;
                //
                //iArray[i] = new Array();
                //iArray[i][0] = "����ʱ��";
                //iArray[i][1] = "0px";
                //iArray[i][2] = 100;
                //iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "������Ա";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "��������";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
                
                iArray[i] = new Array();
                iArray[i][0] = "��������";
                iArray[i][1] = "60px";
                iArray[i][2] = 100;
                iArray[i++][3] = 0;
                


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
		iArray[2][1]="0";			//�п�
		iArray[2][2]=200;			//�����ֵ
		iArray[2][3]=3; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[3]=new Array();
		iArray[3][0]="��������";    		  //����
		iArray[3][1]="80px";			//�п�
		iArray[3][2]=200;			//�����ֵ
		iArray[3][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
		//iArray[2][4]="amlbigstamp";                 
    //   	iArray[2][9]="����״̬|Code:amlbigstamp"; 			

		iArray[4]=new Array();
		iArray[4][0]="��ϸ����";    		  //����
		iArray[4][1]="0px";			//�п�
		iArray[4][2]=100;			//�����ֵ
		iArray[4][3]=0; //�Ƿ���������,1��ʾ����0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

		iArray[5]=new Array();
		iArray[5][0]="���ڻ�����������";   		  //����
		iArray[5][1]="150px";			//�п�
		iArray[5][2]=200;			//�����ֵ
		iArray[5][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������		

		iArray[6]=new Array();
		iArray[6][0]="�˻�����";	   		//����
		iArray[6][1]="60px";			//�п�
		iArray[6][2]=100;			//�����ֵ
		iArray[6][3]=2;  			//�Ƿ���������,1��ʾ����0��ʾ������
		iArray[6][4]="amlaccount";                 
       	iArray[6][9]="����״̬|Code:amlaccount"; 			     

		iArray[7]=new Array();
		iArray[7][0]="�˺�";	   		//����
		iArray[7][1]="120px";			//�п�
		iArray[7][2]=200;			//�����ֵ
		iArray[7][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������

		iArray[8]=new Array();
		iArray[8][0]="����ʱ��";	   		//����
		iArray[8][1]="100px";			//�п�
		iArray[8][2]=100;			//�����ֵ
		iArray[8][3]=0;  			//�Ƿ���������,1��ʾ����0��ʾ������
		
		iArray[9]=new Array();
		iArray[9][0]="�ʽ��ո���ʶ";	   		//����
		iArray[9][1]="60px";			//�п�
		iArray[9][2]=0;			//�����ֵ
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

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

