<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п�����ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п����Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : � <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ��������ʼ��
 ******************************************************************************/
%>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
    %>

    <script language="JavaScript">

        var WaitForBeFileGrid;
        var WaitForReasonGrid;
        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
                initCheckReasonGrid();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('StartDate').value = "";
                fm.all('CSNM').value = "";
                fm.all('CTNM').value = "";
                fm.all('STCR').value = "";
                fm.all('SDGR').value = "";
                fm.all('SDGRName').value = "";
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
            var iArray = new Array();                           //������, ���ظ� MultiLine ����

            try
            {
                 iArray[0] = new Array();
                iArray[0][0] = "���";                          //����(˳���, ������)
                iArray[0][1] = "30px";                          //�п�
                iArray[0][2] = 30;                              //�����ֵ
                iArray[0][3] = 0;                               //�Ƿ���������: 0��ʾ������; 1��ʾ������

                iArray[1] = new Array();
                iArray[1][0] = "���ױ��";
                iArray[1][1] = "140px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;
								iArray[1][7] = "checkBoxNext";

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "60px";
                iArray[2][2] = 100;
                iArray[2][3] = 2;
								iArray[2][4]="amlshadinessstamp";                 
		       			iArray[2][9]="����״̬|Code:amlshadinessstamp"; 	
       					iArray[2][7] = "checkBoxNext";
       	
                iArray[3] = new Array();
                iArray[3][0] = "���ɳ̶�";
                iArray[3][1] = "60px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
								iArray[3][4]="amlshadiness";                 
		       			iArray[3][9]="����״̬|Code:amlshadiness"; 	
		       			iArray[3][7] = "checkBoxNext";

                iArray[4] = new Array();
                iArray[4][0] = "�ͻ���";
                iArray[4][1] = "120px";
                iArray[4][2] = 200;
                iArray[4][3] = 0;
                iArray[4][7] = "checkBoxNext";

                iArray[5] = new Array();
                iArray[5][0] = "�ͻ���";
                iArray[5][1] = "80px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][7] = "checkBoxNext";

                iArray[6] = new Array();
                iArray[6][0] = "����״̬";
                iArray[6][1] = "0px";
                iArray[6][2] = 100;
                iArray[6][3] = 3;
								iArray[6][4]="amldatastate";                 
		       			iArray[6][9]="����״̬|Code:amldatastate";    
		      		 	iArray[6][7] = "checkBoxNext";             

                iArray[7] = new Array();
                iArray[7][0] = "֤������";
                iArray[7][1] = "0px";
                iArray[7][2] = 150;
                iArray[7][3] = 0;
                iArray[7][7] = "checkBoxNext";

                iArray[8] = new Array();
                iArray[8][0] = "������������";
                iArray[8][1] = "80px";
                iArray[8][2] = 100;
                iArray[8][3] = 0;
                iArray[8][21] = 3;
                iArray[8][7] = "checkBoxNext";

                iArray[9] = new Array();
                iArray[9][0] = "����ʱ��";
                iArray[9][1] = "0px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;
                iArray[9][21] = 3;
				iArray[9][7] = "checkBoxNext";

                iArray[10] = new Array();
                iArray[10][0] = "����Ա";
                iArray[10][1] = "60px";
                iArray[10][2] = 100;
                iArray[10][3] = 0;
                iArray[10][7] = "checkBoxNext";
                
                iArray[11] = new Array();
                iArray[11][0] = "����״̬��";
                iArray[11][1] = "0px";
                iArray[11][2] = 100;
                iArray[11][3] = 0;
                iArray[11][7] = "checkBoxNext";
                
               // iArray[12] = new Array();
               // iArray[12][0] = "����������";
               // iArray[12][1] = "0px";
               // iArray[12][2] = 100;
               // iArray[12][3] = 0;
               // iArray[12][7] = "checkBoxReason";

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
                WaitForBeFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }
        }

    // ������������Ϣ
function initCheckReasonGrid()
{
	var iArray = new Array();      
    try
    {
    	var i = 0;
		iArray[i]=new Array();
		iArray[i][0]="���";   			//����������Ϊ˳��ţ����������壬���Ҳ���ʾ��
		iArray[i][1]="30px"; 	     		//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0;  			//�Ƿ���������,1��ʾ������0��ʾ������

		iArray[i]=new Array();
		iArray[i][0]="������";    		  //����
		iArray[i][1]="200px";			//�п�
		iArray[i][2]=300;			//�����ֵ
		iArray[i++][3]=0; //�Ƿ���������,1��ʾ������0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

        iArray[i]=new Array();
		iArray[i][0]="�������";    		  //����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0; //�Ƿ���������,1��ʾ������0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�		


		iArray[i]=new Array();
		iArray[i][0]="������";    		  //����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0; //�Ƿ���������,1��ʾ������0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�		

		iArray[i]=new Array();
		iArray[i][0]="�������";    		  //����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0; //�Ƿ���������,1��ʾ������0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�

        iArray[i]=new Array();
		iArray[i][0]="���ʱ��";    		  //����
		iArray[i][1]="80px";			//�п�
		iArray[i][2]=100;			//�����ֵ
		iArray[i++][3]=0; //�Ƿ���������,1��ʾ������0��ʾ������,2��ʾ����ѡ��3��ʾ���������ص�
        
		
		WaitForReasonGrid = new MulLineEnter( "fm" , "WaitForReasonGrid" ); 
		//��Щ���Ա�����loadMulLineǰ
	    WaitForReasonGrid.mulLineCount = 0;   
	    WaitForReasonGrid.displayTitle = 1;
		WaitForReasonGrid.locked = 1;	    
	    WaitForReasonGrid.hiddenPlus = 1;
	    WaitForReasonGrid.hiddenSubtraction = 1;     
		WaitForReasonGrid.canSel = 1;	    
	    WaitForReasonGrid.canChk =0; //��ѡ��
	    WaitForReasonGrid.loadMulLine(iArray);
	}
	catch(ex)
	{
	  alert(ex);
	}
}
    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->
