<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ����ɳ�ʼ��
 ******************************************************************************/
%>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
        String sStartDate = PubFun.calDate(sEndDate, -14, "D", null);
    %>

    <script language="JavaScript">

        var WaitForBeFileGrid, AlreadyInFileGrid;

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
                initAlreadyInFileGrid();
                checkDownloadState();
                checkDataTypeState();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                
            }
            catch (ex)
            {
                alert("�� DubitMsgMakeDealInit.jsp --> initForm �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * �����ĳ�ʼ��
         */
        function initInputBox()
        {
            try
            {
                document.getElementsByName("DataType")[0].value = "<%=request.getParameter("DataType")%>";
                document.getElementsByName("FileNo")[0].value = "<%=request.getParameter("FileNo")%>";
                document.getElementsByName("StartDate1")[0].value = "<%=sStartDate%>";
                document.getElementsByName("EndDate1")[0].value = "<%=sEndDate%>";
                showOneCodeName("AmlFileDataType", "DataType", "DataTypeName");
            }
            catch (ex)
            {
                alert("�� DubitMsgMakeDealInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
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
                iArray[1][1] = "110px";
                iArray[1][2] = 150;
                iArray[1][3] = 0;
                iArray[1][7] = "checkBoxNext";

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "45px";
                iArray[2][2] = 100;
                iArray[2][3] = 2;
                iArray[2][4] = "AmlShadinessStamp";

                iArray[3] = new Array();
                iArray[3][0] = "���ɳ̶�";
                iArray[3][1] = "45px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "AmlShadiness";

                iArray[4] = new Array();
                iArray[4][0] = "�ͻ���";
                iArray[4][1] = "55px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][7] = "checkBoxNext";

                iArray[5] = new Array();
                iArray[5][0] = "�ͻ���";
                iArray[5][1] = "55px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][7] = "checkBoxNext";

                iArray[6] = new Array();
                iArray[6][0] = "֤������";
                iArray[6][1] = "45px";
                iArray[6][2] = 100;
                iArray[6][3] = 2;
                iArray[6][4] = "amlidtype";

                iArray[7] = new Array();
                iArray[7][0] = "֤������";
                iArray[7][1] = "80px";
                iArray[7][2] = 150;
                iArray[7][3] = 0;
                iArray[7][7] = "checkBoxNext";

                iArray[8] = new Array();
                iArray[8][0] = "��������";
                iArray[8][1] = "55px";
                iArray[8][2] = 100;
                iArray[8][3] = 0;
                iArray[8][21] = 3;
                iArray[8][7] = "checkBoxNext";

                iArray[9] = new Array();
                iArray[9][0] = "���׽��";
                iArray[9][1] = "45px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;
                iArray[9][21] = 3;
                iArray[9][7] = "checkBoxNext";

                iArray[10] = new Array();
                iArray[10][0] = "������Ϊ����";
                iArray[10][1] = "85px";
                iArray[10][2] = 100;
                iArray[10][3] = 0;
                iArray[10][21] = 2;
                iArray[10][7] = "checkBoxNext";

                iArray[11] = new Array();
                iArray[11][0] = "�ֹ�˾���";
                iArray[11][1] = "45px";
                iArray[11][2] = 100;
                iArray[11][3] = 0;
                iArray[11][7] = "checkBoxNext";
            }
            catch (ex)
            {
                alert("�� DubitMsgMakeDealInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
                WaitForBeFileGrid.mulLineCount = 3;
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
                alert("�� DubitMsgMakeDealInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * ��ѡ���Ķ��� MultiLine �ĳ�ʼ��
         */
        function initAlreadyInFileGrid()
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
                iArray[1][1] = "110px";
                iArray[1][2] = 150;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "55px";
                iArray[2][2] = 100;
                iArray[2][3] = 2;
                iArray[2][4] = "AmlShadinessStamp";

                iArray[3] = new Array();
                iArray[3][0] = "���ɳ̶�";
                iArray[3][1] = "55px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "AmlShadiness";

                iArray[4] = new Array();
                iArray[4][0] = "�ͻ���";
                iArray[4][1] = "55px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;

                iArray[5] = new Array();
                iArray[5][0] = "�ͻ���";
                iArray[5][1] = "55px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;

                iArray[6] = new Array();
                iArray[6][0] = "֤������";
                iArray[6][1] = "55px";
                iArray[6][2] = 100;
                iArray[6][3] = 2;
                iArray[6][4] = "amlidtype";

                iArray[7] = new Array();
                iArray[7][0] = "֤������";
                iArray[7][1] = "80px";
                iArray[7][2] = 150;
                iArray[7][3] = 0;

                iArray[8] = new Array();
                iArray[8][0] = "��������";
                iArray[8][1] = "55px";
                iArray[8][2] = 100;
                iArray[8][3] = 0;
                iArray[8][21] = 3;

                iArray[9] = new Array();
                iArray[9][0] = "����ʱ��";
                iArray[9][1] = "55px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;
                iArray[9][21] = 3;

                iArray[10] = new Array();
                iArray[10][0] = "����";
                iArray[10][1] = "45px";
                iArray[10][2] = 100;
                iArray[10][3] = 0;
                iArray[10][21] = 2;

                iArray[11] = new Array();
                iArray[11][0] = "����Ա";
                iArray[11][1] = "55px";
                iArray[11][2] = 100;
                iArray[11][3] = 0;
            }
            catch (ex)
            {
                alert("�� DubitMsgMakeDealInit.jsp --> initAlreadyInFileGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                AlreadyInFileGrid = new MulLineEnter("fm", "AlreadyInFileGrid");
                AlreadyInFileGrid.mulLineCount = 3;
                AlreadyInFileGrid.displayTitle = 1;
                AlreadyInFileGrid.locked = 1;
                AlreadyInFileGrid.hiddenPlus = 1;
                AlreadyInFileGrid.hiddenSubtraction = 1;
                AlreadyInFileGrid.canChk = 1;
                AlreadyInFileGrid.canSel = 0;
                AlreadyInFileGrid.chkBoxEventFuncName = "";
                AlreadyInFileGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                AlreadyInFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� DubitMsgMakeDealInit.jsp --> initAlreadyInFileGrid �����з����쳣: ��ʼ���������");
            }
        }

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

