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
        GlobalInput tGI = new GlobalInput();
          tGI=(GlobalInput)session.getValue("GI");
          String OperatorCode=tGI.Operator;
          System.out.println("OperatorCode======"+OperatorCode);
    %>

    <script language="JavaScript">

        var WaitForBeFileGrid;
 var operator = "<%=tGI.Operator%>";   
  var manageCom = "<%=tGI.ManageCom%>"; 
  var comcode = "<%=tGI.ComCode%>";  
        /**
         * �ܺ�������ʼ��ҳ��
         */
        function initForm()
        {
            try
            {
                initInputBox();
                initWaitForBeFileGrid();
                initUserPower();
                initUserCheck();
						    fm.all('StatiCode').value = <%= tGI.ManageCom %>;
						    showOneCodeName('station','StatiCode','StatiCodeName');
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
                  *�鿴�û��Ƿ��д��ȷ�ϵ�Ȩ��---add by jinsh 2007-08-09
                  */
                 function initUserPower()
                 {
                                var Oper="<%=OperatorCode%>";
                                var StrSql1="SELECT PopEdom FROM LXUser where UserCode='"+Oper+"' and usertype in('02','03')";
                                var edom=easyExecSql(StrSql1);
                                if(edom==null||edom.length==0||edom=="")
                                {
                                    document.getElementsByName("affirm")[0].disabled =  true;
                                    document.getElementsByName("keep")[0].disabled =  true;
                                }
                 }

        /**
                 *�鿴�û���Ȩ���ǲ�����߼����,����ǽ����ύ�ϼ�---add by jinsh 2007-08-09
                 */
                 function initUserCheck()
                 {
                        var Oper="<%=OperatorCode%>";
                        var StrSql1="SELECT PopEdom FROM LXUser where UserCode='"+Oper+"'";
                        var edom=easyExecSql(StrSql1);
                        var StrSql2="select COUNT(*) FROM LXUser where PopEdom<'"+edom+"'";
                        var count=easyExecSql(StrSql2);
                        if(count=="0"||count=='0'||count==0)
                        {
                                try
                                {
                                    //document.getElementsByName("upgrade")[0].disabled =  true;
                                }
                                catch(ex)
                                {
                                    alert(ex);
                                }
                        }
                        else
                        {

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

                iArray[2] = new Array();
                iArray[2][0] = "��������";
                iArray[2][1] = "60px";
                iArray[2][2] = 100;
                iArray[2][3] = 2;
                iArray[2][4] = "amlshadinessstamp";

                iArray[3] = new Array();
                iArray[3][0] = "���ɳ̶�";
                iArray[3][1] = "60px";
                iArray[3][2] = 100;
                iArray[3][3] = 2;
                iArray[3][4] = "amlshadiness";

                iArray[4] = new Array();
                iArray[4][0] = "�ͻ���";
                iArray[4][1] = "60px";
                iArray[4][2] = 100;
                iArray[4][3] = 0;

                iArray[5] = new Array();
                iArray[5][0] = "�ͻ���";
                iArray[5][1] = "60px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;


                iArray[6] = new Array();
                iArray[6][0] = "֤������";
                iArray[6][1] = "70px";
                iArray[6][2] = 150;
                iArray[6][3] = 0;

                iArray[7] = new Array();
                iArray[7][0] = "��������";
                iArray[7][1] = "60px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;
                iArray[7][21] = 3;

                iArray[8] = new Array();
                iArray[8][0] = "����ʱ��";
                iArray[8][1] = "0px";
                iArray[8][2] = 0;
                iArray[8][3] = 3;
                iArray[8][21] = 3;

                iArray[9] = new Array();
                iArray[9][0] = "����Ա";
                iArray[9][1] = "60px";
                iArray[9][2] = 100;
                iArray[9][3] = 0;

		          iArray[10] = new Array();
		          iArray[10][0] = "������Ϣ";
		          iArray[10][1] = "100px";
		          iArray[10][2] = 800;
		          iArray[10][3] = 0;
		          
		          iArray[11] = new Array();
	                iArray[11][0] = "����״̬";
	                iArray[11][1] = "60px";
	                iArray[11][2] = 0;
	                iArray[11][3] = 0;

	                iArray[12] = new Array();
	                iArray[12][0] = "����״̬";
	                iArray[12][1] = "60px";
	                iArray[12][2] = 0;
	                iArray[12][3] = 0;
	                
	                iArray[13] = new Array();
	                iArray[13][0] = "����״̬";
	                iArray[13][1] = "0px";
	                iArray[13][2] = 0;
	                iArray[13][3] = 0;
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }

            try
            {
                WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
                WaitForBeFileGrid.mulLineCount = 3;
                WaitForBeFileGrid.displayTitle = 1;
                WaitForBeFileGrid.locked = 1;
                WaitForBeFileGrid.hiddenPlus = 1;
                WaitForBeFileGrid.hiddenSubtraction = 1;
                WaitForBeFileGrid.canChk = 0;
                WaitForBeFileGrid.canSel = 1;
                WaitForBeFileGrid.chkBoxEventFuncName = "";
                WaitForBeFileGrid.selBoxEventFuncName = "";
                //�������Ա����� MulLineEnter loadMulLine ֮ǰ
                 	WaitForBeFileGrid.selBoxEventFuncName ="onClickRadioBoxGrid" ;
                WaitForBeFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }
        }


    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

