<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�LXISTradeManualInit.jsp
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
    alert("��LXISTradeManualInput.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

// �ͻ���Ϣ
function initCustomGrid()
{
    var iArray = new Array();
    try
    {
    	var i = 0;
        iArray[i]=new Array();
        iArray[i][0]="���";
        iArray[i][1]="30px";
        iArray[i][2]=30;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="�ͻ���";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="�ͻ�����";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="���ױ��";
        iArray[i][1]="150px";
        iArray[i][2]=100;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="���ɽ�������";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i][3]=2;
        iArray[i][4]="amlshadinessstamp";
		iArray[i++][9]="���ɽ�������|Code:amlshadinessstamp"; 

        iArray[i]=new Array();
        iArray[i][0]="���ɳ̶�";
        iArray[i][1]="80px";
        iArray[i][2]=150;
        iArray[i][3]=2;
        iArray[i][4]="amlshadiness";
		iArray[i++][9]="���ɽ�������|Code:amlshadiness"; 
		
        iArray[i]=new Array();
        iArray[i][0]="������������";
        iArray[i][1]="80px";
        iArray[i][2]=150;
        iArray[i++][3]=0;

        iArray[i]=new Array();
        iArray[i][0]="����";
        iArray[i][1]="40px";
        iArray[i][2]=150;
        iArray[i++][3]=0;

        CustomGrid = new MulLineEnter("fm", "CustomGrid");
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