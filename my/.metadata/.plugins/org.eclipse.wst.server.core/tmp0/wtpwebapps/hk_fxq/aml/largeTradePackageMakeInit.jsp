<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ʢ <Zhangls@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ����ɳ�ʼ��
 ******************************************************************************/
%>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->

    <script language="JavaScript">

        var FileMsgGrid;

        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initFileMsgGrid();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                   
            }
            catch (ex)
            {
                alert("�� largeTradePackageMakeInit.jsp --> initForm �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * �����ĳ�ʼ��
         */
        function initInputBox()
        {
            try
            {

                document.getElementsByName("StartDate")[0].value = "<%=sEndDate%>";
                document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
                document.getElementsByName("dataType")[0].value = "<%=request.getParameter("DataType")%>";
                showOneCodeName("AmlPackageDataType", "dataType", "dataTypeName");

            }
            catch (ex)
            {
                alert("�� largeTradePackageMakeInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * �����뱨�Ķ��� MultiLine �ĳ�ʼ��
         */
        function initFileMsgGrid()
        {
            var iArray = new Array();                           //������, ���ظ� MultiLine ���

            try
            {
                var i=0;
                        iArray[i]=new Array();
                        iArray[i][0]="���";
                        iArray[i][1]="30px";
                        iArray[i][2]=30;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="���ݰ����";
                        iArray[i][1]="160px";
                        iArray[i][2]=200;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="��������";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="��������";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="��������";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="����Ա";
                        iArray[i][1]="100px";
                        iArray[i][2]=100;
                        iArray[i++][3]=0;

                        iArray[i]=new Array();
                        iArray[i][0]="dealstate";
                        iArray[i][1]="0px";
                        iArray[i][2]=0;
                        iArray[i++][3]=3;
            }
            catch (ex)
            {
                alert("�� largeTradePackageMakeInit.jsp --> initFileMsgGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                FileMsgGrid = new MulLineEnter("fm", "FileMsgGrid");
                FileMsgGrid.mulLineCount = 3;
                FileMsgGrid.displayTitle = 1;
                FileMsgGrid.locked = 1;
                FileMsgGrid.hiddenPlus = 1;
                FileMsgGrid.hiddenSubtraction = 1;
                FileMsgGrid.canChk = 0;
                FileMsgGrid.canSel = 1;
                FileMsgGrid.chkBoxEventFuncName = "";
                FileMsgGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                FileMsgGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� largeTradePackageMakeInit.jsp --> initFileMsgGrid �����з����쳣: ��ʼ���������");
            }
        }

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

