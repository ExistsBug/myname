<%
//�������ƣ�BankDealQueryListInit.jsp
//�����ܣ�
//�������ڣ�
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<%
     //���ҳ��ؼ��ĳ�ʼ����
%>                            

<script language="JavaScript">

// �����ĳ�ʼ��������¼���֣�
function initInpBox()
{ 

  try
  {                                   
	fm.ReMark.value="";
	fm.dealno.value=tdealno;
	fm.datastate.value=tdatastate;
	fm.oper.value=toper;
  }
  catch(ex)
  {
    alert("��LXISAffirmCancelInit.jsp-->InitInpBox�����з����쳣:��ʼ���������!");
  }      
}

function initForm()
{
  try
  {
    initInpBox(); 
    initContent(); 
  }
  catch(re)
  {
    alert("��LXISAffirmCancelInit.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}
 
</script>