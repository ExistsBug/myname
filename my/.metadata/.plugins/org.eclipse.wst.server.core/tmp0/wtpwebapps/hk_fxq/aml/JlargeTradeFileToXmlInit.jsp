<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 ******************************************************************************/
%>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
    		String tradeDataState="";
    		String tReportType=request.getParameter("reportType");
            String mFDRC = "";
				String tDataType=request.getParameter("dataType");
				String sEndDate = PubFun.getCurrentDate();
				String addedDate = PubFun.getCurrentDate();
				System.out.println(request.getParameter("dataType"));
				System.out.println(request.getParameter("reportType"));
				System.out.println(request.getParameter("FileNo"));
				String sStartDate="";
					if(tDataType.equals("03")||tDataType.equals("01"))
				{
					sEndDate = sEndDate;
					addedDate = PubFun.calDate(sEndDate, -8, "D", null);
				}
			else
				{
					sEndDate =sEndDate;
				}
        if(tDataType.equals("01"))//�����������
				{
					tradeDataState="('S01')";
				}
        if(tDataType.equals("02"))//��������
        {
        	tradeDataState="('C01')";
        }
        if(tDataType.equals("03"))//��������
        {
        	tradeDataState="('S01','A01')";
        }
        if(tDataType.equals("04"))//���ɾ������
        {
        	tradeDataState="('D01')";
        }
        // add by jinsh
        if(tDataType.equals("05"))//��������
        {
        	tradeDataState="('I01')";
            mFDRC = "FDRC";
        }
        if(tDataType.equals("06"))//����ط�����
        {
        	tradeDataState="('R01')";
        }
    %>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ��ʼ -->



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
                checkCanDownloadFileMsg();
                fm.all('ManageCom').value     = "";
                fm.all('ManageComName').value = "";
                fm.all('ManageCom').value = <%= tGI.ManageCom %>;
                showOneCodeName("stati","ManageCom","ManageComName");                
            }
            catch (ex)
            {
                alert("�� DubitNormalMsgMakeDealInit.jsp --> initForm �����з����쳣: ��ʼ���������");
            }
        }

        /**
         * �����ĳ�ʼ��
         */
        function initInputBox()
        {
            try
            {
                /*document.getElementsByName("FileNo")[0].value = "<%=request.getParameter("FileNo")%>";*/

                document.getElementsByName("HTDT1")[0].value = "<%=sStartDate%>";
                document.getElementsByName("HTDT3")[0].value = "<%=sStartDate%>";
                document.getElementsByName("HTDT2")[0].value = "<%=sEndDate%>";
                document.getElementsByName("HTDT4")[0].value = "<%=sEndDate%>";
                document.getElementsByName("FDRC")[0].value = "<%=mFDRC%>";
            }
            catch (ex)
            {
                alert("�� DubitNormalMsgMakeDealInit.jsp --> initInputBox �����з����쳣: ��ʼ���������");
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
                var i=0;
				        iArray[i]=new Array();
				        iArray[i][0]="���";         //����
				        iArray[i][1]="30px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="���ױ��";         //����
				        iArray[i][1]="120px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="�ͻ���";         //����
				        iArray[i][1]="100px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="�ͻ�����";         //����
				        iArray[i][1]="100px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //����


				        iArray[i]=new Array();
				        iArray[i][0]="�ͻ�֤������";         //����
				        iArray[i][1]="100px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="���׷�������";         //����
				        iArray[i][1]="80px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //����


				        iArray[i]=new Array();
				        iArray[i][0]="����״̬";         //����
				        iArray[i][1]="60px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i][7] = "checkBoxNext";
				        iArray[i++][3]=0;         //����
            }
            catch (ex)
            {
                alert("�� DubitNormalMsgMakeDealInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
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
                alert("�� DubitNormalMsgMakeDealInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
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
                var i=0;
				        iArray[i]=new Array();
				        iArray[i][0]="���";         //����
				        iArray[i][1]="30px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="���ױ��";         //����
				        iArray[i][1]="120px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="�ͻ���";         //����
				        iArray[i][1]="100px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="�ͻ�����";         //����
				        iArray[i][1]="100px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����


				        iArray[i]=new Array();
				        iArray[i][0]="�ͻ�֤������";         //����
				        iArray[i][1]="100px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����

				        iArray[i]=new Array();
				        iArray[i][0]="���׷�������";         //����
				        iArray[i][1]="80px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����


				        iArray[i]=new Array();
				        iArray[i][0]="����״̬";         //����
				        iArray[i][1]="60px";         //����
				        iArray[i][2]=100;         //����
				        iArray[i++][3]=0;         //����
            }
            catch (ex)
            {
                alert("�� DubitNormalMsgMakeDealInit.jsp --> initAlreadyInFileGrid �����з����쳣: ��ʼ���������");
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
                alert("�� DubitNormalMsgMakeDealInit.jsp --> initAlreadyInFileGrid �����з����쳣: ��ʼ���������");
            }
        }

    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

