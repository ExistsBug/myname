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
 * @date     : 2007-07-11
 * @direction: ���ɽ��ױ��İ����ɳ�ʼ��
 ******************************************************************************/
%>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        String sEndDate = PubFun.getCurrentDate();
    %>

    <script language="JavaScript">

        var FilePkgGrid;

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initFilePkgGrid();
                checkDataTypeState();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeApplyInit.jsp --> initForm �����з����쳣: ��ʼ���������");
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
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
                showOneCodeName("AmlPackageDataType", "DataType", "DataTypeName");
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeApplyInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * �����뱨�Ķ��� MultiLine �ĳ�ʼ��
         */
        function initFilePkgGrid()
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
                iArray[1][0] = "���İ����";
                iArray[1][1] = "160px";
                iArray[1][2] = 200;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "���İ�����";
                iArray[2][1] = "80px";
                iArray[2][2] = 100;
                iArray[2][3] = 2;
                iArray[2][4] = "amlpackagedatatype";

                iArray[3] = new Array();
                iArray[3][0] = "����״̬";
                iArray[3][1] = "80px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlpackagedealstate";

                iArray[4] = new Array();
                iArray[4][0] = "�������";
                iArray[4][1] = "80px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;
                iArray[4][21] = 3;

                iArray[5] = new Array();
                iArray[5][0] = "���ʱ��";
                iArray[5][1] = "80px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;
                iArray[5][21] = 3;

                iArray[6] = new Array();
                iArray[6][0] = "����Ա";
                iArray[6][1] = "80px";
                iArray[6][2] = 100;
                iArray[6][3] = 0;
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeApplyInit.jsp --> initFilePkgGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                FilePkgGrid = new MulLineEnter("fm", "FilePkgGrid");
                FilePkgGrid.mulLineCount = 3;
                FilePkgGrid.displayTitle = 1;
                FilePkgGrid.locked = 1;
                FilePkgGrid.hiddenPlus = 1;
                FilePkgGrid.hiddenSubtraction = 1;
                FilePkgGrid.canChk = 0;
                FilePkgGrid.canSel = 1;
                FilePkgGrid.chkBoxEventFuncName = "";
                FilePkgGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                FilePkgGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� DubitPkgMakeApplyInit.jsp --> initFilePkgGrid �����з����쳣: ��ʼ���������");
            }
        }

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

