    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->
<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
    %>

    <script language="JavaScript">

        var StatGrid;

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initStatGrid();
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
        function initStatGrid()
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
                iArray[1][0] = "�ͻ���";
                iArray[1][1] = "140px";
                iArray[1][2] = 60;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "�ͻ���";
                iArray[2][1] = "60px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "��������";
                iArray[3][1] = "160px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;

                iArray[4] = new Array();
                iArray[4][0] = "���׽��";
                iArray[4][1] = "100px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;

                iArray[5] = new Array();
                iArray[5][0] = "������ϸ��";
                iArray[5][1] = "100px";
                iArray[5][2] = 60;
                iArray[5][3] = 0;

            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initStatGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                StatGrid = new MulLineEnter("fm", "StatGrid");
                StatGrid.mulLineCount = 0;
                StatGrid.displayTitle = 1;
                StatGrid.locked = 1;
                StatGrid.hiddenPlus = 1;
                StatGrid.hiddenSubtraction = 1;
                StatGrid.canChk = 0;
                StatGrid.canSel = 0;
                StatGrid.chkBoxEventFuncName = "";
                StatGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                StatGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initStatGrid �����з����쳣: ��ʼ���������");
            }
        }

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

