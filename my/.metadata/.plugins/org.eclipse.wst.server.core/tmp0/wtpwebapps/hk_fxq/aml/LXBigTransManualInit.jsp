<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�OrphanPolOutInit.jsp
//�����ܣ�
//�������ڣ�2005-05-26 15:39:06
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>


<script language="JavaScript">

function initForm()
{
  try
  {
    fm.all("CSNM").value = "";
    fm.all("CTNM").value = "";
    fm.all("Date").value = "";
    initCustomGrid();
    fm.all('StatiCode').value     = "";
    fm.all('StatiCodeName').value = "";
    fm.all('StatiCode').value = <%= tGI.ManageCom %>;
    showOneCodeName("stati","StatiCode","StatiCodeName");
  }
  catch(re)
  {
    alert("��LXBigTransManualInput.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

// �ͻ���Ϣ
function initCustomGrid()
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
        iArray[1][0]="�ͻ���";
        iArray[1][1]="80px";
        iArray[1][2]=100;
        iArray[1][3]=0;

        iArray[2]=new Array();
        iArray[2][0]="�ͻ���";
        iArray[2][1]="100px";
        iArray[2][2]=150;
        iArray[2][3]=0;

        iArray[3]=new Array();
        iArray[3][0]="֤������";
        iArray[3][1]="80px";
        iArray[3][2]=100;
        iArray[3][3]=2;
        iArray[3][4]="amlidtype";

        iArray[4]=new Array();
        iArray[4][0]="֤������";
        iArray[4][1]="120px";
        iArray[4][2]=150;
        iArray[4][3]=0;

        iArray[5]=new Array();
        iArray[5][0]="����";
        iArray[5][1]="100px";
        iArray[5][2]=100;
        iArray[5][3]=2;
        iArray[5][4]="ccountry";

        iArray[6]=new Array();
        iArray[6][0]="��������";
        iArray[6][1]="80px";
        iArray[6][2]=100;
        iArray[6][3]=0;
        iArray[6][21]=3;

        iArray[7]=new Array();
        iArray[7][0]="DEALNO";
        iArray[7][1]="0px";
        iArray[7][2]=0;
        iArray[7][3]=3;

        CustomGrid = new MulLineEnter( "fm" , "CustomGrid" );
        //��Щ���Ա�����loadMulLineǰ
        CustomGrid.mulLineCount = 3;
        CustomGrid.displayTitle = 1;
        CustomGrid.locked = 1;
        CustomGrid.hiddenPlus = 1;
        CustomGrid.hiddenSubtraction = 1;
        CustomGrid.canSel = 1;
        CustomGrid.canChk =0; //��ѡ��
        CustomGrid.loadMulLine(iArray);
    }
    catch(ex)
    {
      alert(ex);
    }
}
</script>