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
                initTasksGrid();
                initUserPower();
                //initUserCheck();
						    fm.all('StatiCode').value = <%= tGI.ManageCom %>;
						    showOneCodeName("stati","StatiCode","StatiCodeName");
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
                                    document.getElementsByName("upgrade")[0].disabled =  true;
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
                  *�鿴�û��Ƿ��д��ȷ�ϵ�Ȩ��
                  */
                 function initUserPower()
                 {
                                var Oper="<%=OperatorCode%>";
                                var StrSql1="SELECT PopEdom FROM LXUser where UserCode='"+Oper+"' and usertype in('01','03')";
                                var edom=easyExecSql(StrSql1);
//                              alert(edom);
                                if(edom==null||edom.length==0||edom=="")
                                {
                                	if(document.getElementsByName("affirm")[0]!=null && document.getElementsByName("affirm")[0]!='undefined'){
	                                    document.getElementsByName("affirm")[0].disabled =  true;
                                	}
                                	if(document.getElementsByName("keep")[0]!=null &&��document.getElementsByName("keep")[0]!='undefined'){
	                                    document.getElementsByName("keep")[0].disabled =  true;
                                	}
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
                iArray[1][1] = "120px";
                iArray[1][2] = 150;
                iArray[1][3] = 0;

                iArray[2] = new Array();
                iArray[2][0] = "�ͻ���";
                iArray[2][1] = "70px";
                iArray[2][2] = 100;
                iArray[2][3] = 0;

                iArray[3] = new Array();
                iArray[3][0] = "�ͻ���";
                iArray[3][1] = "70px";
                iArray[3][2] = 100;
                iArray[3][3] = 0;

                iArray[4] = new Array();
                iArray[4][0] = "֤������";
                iArray[4][1] = "70px";
                iArray[4][2] = 100;
                iArray[4][3] = 2;
                iArray[4][4] = "amlidtype";

                iArray[5] = new Array();
                iArray[5][0] = "֤������";
                iArray[5][1] = "90px";
                iArray[5][2] = 100;
                iArray[5][3] = 0;

                iArray[6] = new Array();
                iArray[6][0] = "����";
                iArray[6][1] = "70px";
                iArray[6][2] = 100;
                iArray[6][3] = 2;
                iArray[6][4] = "ccountry";

                iArray[7] = new Array();
                iArray[7][0] = "��������";
                iArray[7][1] = "70px";
                iArray[7][2] = 100;
                iArray[7][3] = 0;

                iArray[8] = new Array();
                iArray[8][0] = "����״̬";
                iArray[8][1] = "70px";
                iArray[8][2] = 100;
                iArray[8][3] = 1;
				
                iArray[9] = new Array();
                iArray[9][0] = "����״̬";
                iArray[9][1] = "70px";
                iArray[9][2] = 100;
                iArray[9][3] = 1;

                iArray[10] = new Array();
                iArray[10][0] = "��������";
                iArray[10][1] = "0px";
                iArray[10][2] = 0;
                iArray[10][3] = 3;

                iArray[11] = new Array();
                iArray[11][0] = "����ʱ��";
                iArray[11][1] = "0px";
                iArray[11][2] = 0;
                iArray[11][3] = 3;

                iArray[12] = new Array();
                iArray[12][0] = "����Ա";
                iArray[12][1] = "0px";
                iArray[12][2] = 0;
                iArray[12][3] = 3;


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
                     //WaitForBeFileGrid.selBoxEventFuncName ="queryTasksGrid" ;     //���RadioBoxʱ��Ӧ��JS����
               	WaitForBeFileGrid.selBoxEventFuncName ="onClickRadioBoxGrid" ;
                WaitForBeFileGrid.loadMulLine(iArray);
            }
            catch (ex)
            {
                alert("�� LXIHAppInit.jsp --> initWaitForBeFileGrid �����з����쳣: ��ʼ���������");
            }
        }
function initTasksGrid()
{
    var iArray = new Array();
    try
    {
        iArray[0]=new Array();
        iArray[0][0]="���";
        iArray[0][1]="30px";
        iArray[0][2]=30;
        iArray[0][3]=0;

        iArray[1]=new Array();
        iArray[1][0]="���ױ��";
        iArray[1][1]="120px";
        iArray[1][2]=100;
        iArray[1][3]=0;

        iArray[2]=new Array();
        iArray[2][0]="��ϸ����";
        iArray[2][1]="0px";
        iArray[2][2]=0;
        iArray[2][3]=3;

        iArray[3]=new Array();
        iArray[3][0]="��������";
        iArray[3][1]="0px";
        iArray[3][2]=0;
        iArray[3][3]=3;

        iArray[4]=new Array();
        iArray[4][0]="��������";
        iArray[4][1]="80px";
        iArray[4][2]=100;
        iArray[4][3]=2;
        iArray[4][4]="amlbigstamp";

        iArray[5]=new Array();
        iArray[5][0]="���ڻ�����������";
        iArray[5][1]="120px";
        iArray[5][2]=150;
        iArray[5][3]=0;

        iArray[6]=new Array();
        iArray[6][0]="�˻�����";
        iArray[6][1]="70px";
        iArray[6][2]=100;
        iArray[6][3]=0;

        iArray[7]=new Array();
        iArray[7][0]="�˺�";
        iArray[7][1]="100px";
        iArray[7][2]=100;
        iArray[7][3]=0;

        iArray[8]=new Array();
        iArray[8][0]="����ʱ��";
        iArray[8][1]="70px";
        iArray[8][2]=100;
        iArray[8][3]=0;
        iArray[8][21]=4;

        TasksGrid = new MulLineEnter( "fm" , "TasksGrid" );
        //��Щ���Ա�����loadMulLineǰ
        TasksGrid.mulLineCount = 3;
        TasksGrid.displayTitle = 1;
        TasksGrid.locked = 1;
        TasksGrid.hiddenPlus = 1;
        TasksGrid.hiddenSubtraction = 1;
        TasksGrid.canSel = 1;
        TasksGrid.loadMulLine(iArray);
    }
    catch(ex)
    {
      alert(ex);
    }
}


    </script>

    <!-- ���� JSP Init ��ʼ��ҳ�� : ���� -->

