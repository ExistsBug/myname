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
 * @direction: ���ɽ��ױ��İ����ɳ�ʼ��
 ******************************************************************************/
%>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
        String sStartDate = PubFun.calDate(sEndDate, -10, "D", null);
    %>

    <script language="JavaScript">

        var WaitForBePackageGrid, AlreadyInPackageGrid;

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBePackageGrid();
                initAlreadyInPackageGrid();
                checkDataTypeState();
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeDealInit.jsp --> initForm �����з����쳣: ��ʼ���������");
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
                document.getElementsByName("PackageNo")[0].value = "<%=request.getParameter("PackageNo")%>";
//                document.getElementsByName("StartDate1")[0].value = "<%=sStartDate%>";
                document.getElementsByName("EndDate1")[0].value = "<%=sEndDate%>";
                showOneCodeName("AmlPackageDataType", "DataType", "DataTypeName");
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeDealInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * ��ѡ���Ķ��� MultiLine �ĳ�ʼ��
         */
        function initWaitForBePackageGrid()
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
                iArray[1][0] = "���ı��";
                iArray[1][1] = "115px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "275px";
                iArray[2][2] = 300;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "����״̬";
                iArray[3][1] = "55px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlfiledealstate";

                iArray[4] = new Array();
                iArray[4][0] = "�������";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "���ʱ��";
                iArray[5][1] = "55px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][21] = 3;

                iArray[6] = new Array();
                iArray[6][0] = "����";
                iArray[6][1] = "50px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
                iArray[6][21] = 2;

                iArray[7] = new Array();
                iArray[7][0] = "����Ա";
                iArray[7][1] = "55px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeDealInit.jsp --> initWaitForBePackageGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                WaitForBePackageGrid = new MulLineEnter("fm", "WaitForBePackageGrid");
                WaitForBePackageGrid.mulLineCount = 3;
                WaitForBePackageGrid.displayTitle = 1;
                WaitForBePackageGrid.locked = 1;
                WaitForBePackageGrid.hiddenPlus = 1;
                WaitForBePackageGrid.hiddenSubtraction = 1;
                WaitForBePackageGrid.canChk = 1;
                WaitForBePackageGrid.canSel = 0;
                WaitForBePackageGrid.chkBoxEventFuncName = "";
                WaitForBePackageGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                WaitForBePackageGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeDealInit.jsp --> initWaitForBePackageGrid �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * ��ѡ���Ķ��� MultiLine �ĳ�ʼ��
         */
        function initAlreadyInPackageGrid()
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
                iArray[1][0] = "���ı��";
                iArray[1][1] = "115px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "275px";
                iArray[2][2] = 300;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "����״̬";
                iArray[3][1] = "55px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlfiledealstate";

                iArray[4] = new Array();
                iArray[4][0] = "�������";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "���ʱ��";
                iArray[5][1] = "55px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][21] = 3;

                iArray[6] = new Array();
                iArray[6][0] = "����";
                iArray[6][1] = "50px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
                iArray[6][21] = 2;

                iArray[7] = new Array();
                iArray[7][0] = "����Ա";
                iArray[7][1] = "55px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeDealInit.jsp --> initAlreadyInPackageGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                AlreadyInPackageGrid = new MulLineEnter("fm", "AlreadyInPackageGrid");
                AlreadyInPackageGrid.mulLineCount = 3;
                AlreadyInPackageGrid.displayTitle = 1;
                AlreadyInPackageGrid.locked = 1;
                AlreadyInPackageGrid.hiddenPlus = 1;
                AlreadyInPackageGrid.hiddenSubtraction = 1;
                AlreadyInPackageGrid.canChk = 1;
                AlreadyInPackageGrid.canSel = 0;
                AlreadyInPackageGrid.chkBoxEventFuncName = "";
                AlreadyInPackageGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                AlreadyInPackageGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeDealInit.jsp --> initAlreadyInPackageGrid �����з����쳣: ��ʼ���������");
            }
        }

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

