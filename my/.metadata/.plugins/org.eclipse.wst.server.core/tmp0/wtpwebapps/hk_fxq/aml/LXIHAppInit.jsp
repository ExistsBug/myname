<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
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

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
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
            {
                iArray[0] = new Array();
                iArray[0][0] = "���";                          //����(˳���, ������)
                iArray[0][1] = "30px";                          //�п�
                iArray[0][2] = 30;                              //�����ֵ
                iArray[0][3] = 0;                               //�Ƿ���������: 0��ʾ������; 1��ʾ����

                iArray[1] = new Array();
                iArray[1][0] = "���ױ��";
                iArray[1][1] = "140px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;
                iArray[1][7] = "checkBoxNext";

                iArray[2] = new Array();
                iArray[2][0] = "�ͻ���";
                iArray[2][1] = "70px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;
                iArray[2][7] = "checkBoxNext";

                iArray[3] = new Array();
                iArray[3][0] = "�ͻ���";
                iArray[3][1] = "70px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;
                iArray[3][7] = "checkBoxNext";

                iArray[4] = new Array();
                iArray[4][0] = "����״̬";
                iArray[4][1] = "70px";
                iArray[4][2] = 100;
                iArray[4][3] = 2;
                iArray[4][4]="amldatastate";
                iArray[4][7] = "checkBoxNext";
                iArray[4][9]="����״̬|Code:amldatastate";

                iArray[5] = new Array();
                iArray[5][0] = "��������";
                iArray[5][1] = "65px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][7] = "checkBoxNext";

                iArray[6] = new Array();
                iArray[6][0] = "����ʱ��";
                iArray[6][1] = "65px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
                iArray[6][7] = "checkBoxNext";

                iArray[7] = new Array();
                iArray[7][0] = "����Ա";
                iArray[7][1] = "65px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;
                iArray[7][7] = "checkBoxNext";

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
                WaitForBeFileGrid.canChk = 1;
                WaitForBeFileGrid.canSel = 0;
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

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

