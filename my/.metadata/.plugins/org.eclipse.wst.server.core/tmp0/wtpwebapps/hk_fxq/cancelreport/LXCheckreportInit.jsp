<!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->

<script language="JavaScript">
        
        var LXCancelreportGrid;
        
         /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initLXCancelreportGrid();                    
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
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%=tGI.ManageCom%>;
                showOneCodeName("stati","ManageCom","ManageComName"); 
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
            }
        }
        
                /**
         * ��ѡ���Ķ��� MultiLine �ĳ�ʼ��
         */
        function initLXCancelreportGrid()
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
                iArray[1][1] = "100px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "40px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;
                
                iArray[3] = new Array();
                iArray[3][0] = "���ɳ̶�";
                iArray[3][1] = "40px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;
                
                iArray[4] = new Array();
                iArray[4][0] = "�ͻ���";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
       	
                iArray[5] = new Array();
                iArray[5][0] = "�ͻ�����/����";
                iArray[5][1] = "60px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;	

                iArray[6] = new Array();
                iArray[6][0] = "���׷�������";
                iArray[6][1] = "60px";
                iArray[6][2] = 200;
                iArray[6][3] = 0;

                iArray[7] = new Array();
                iArray[7][0] = "������ͨ��ԭ��";
                iArray[7][1] = "140px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;

                iArray[8] = new Array();
                iArray[8][0] = "������Ա";
                iArray[8][1] = "40px";
                iArray[8][2] = 100;
                iArray[8][3] = 0; 
                        
                iArray[9] = new Array();
                iArray[9][0] = "��������";
                iArray[9][1] = "60px";
                iArray[9][2] = 200;
                iArray[9][3] = 0;
                
                iArray[10] = new Array();
                iArray[10][0] = "����ʱ��";
                iArray[10][1] = "60px";
                iArray[10][2] = 200;
                iArray[10][3] = 0;
                
                iArray[11] = new Array();
                iArray[11][0] = "��������";
                iArray[11][1] = "40px";
                iArray[11][2] = 150;
                iArray[11][3] = 0;

                iArray[12] = new Array();
                iArray[12][0] = "��������";
                iArray[12][1] = "80px";
                iArray[12][2] = 150;
                iArray[12][3] = 0;
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initLXCancelreportGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                LXCancelreportGrid = new MulLineEnter("fm", "LXCancelreportGrid");
                LXCancelreportGrid.mulLineCount = 0;
                LXCancelreportGrid.displayTitle = 1;
                LXCancelreportGrid.locked = 1;
                LXCancelreportGrid.hiddenPlus = 1;
                LXCancelreportGrid.hiddenSubtraction = 1;
                LXCancelreportGrid.canChk = 0;
                LXCancelreportGrid.canSel = 0;
                LXCancelreportGrid.chkBoxEventFuncName = "";
                LXCancelreportGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                LXCancelreportGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXCancelreportInit.jsp --> initLXCancelreportGrid �����з����쳣: ��ʼ���������");
            }
        }


    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->
        
        
         