<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�OrphanPolOutInit.jsp
//�����ܣ�
//�������ڣ�2005-05-26 15:39:06
//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<script language="JavaScript">
function initForm()
{
  try
  { 
  	initInpBox();
  }
  catch(re)
  {
    alert("��SysVarMainInit.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

//��ѯ��ͬ��Ϣ
function initInpBox(){
	
	      var strSQL = "select sysvarvalue from ldsysvar where sysvar in ('amlRINM','amlRICD','amlFIRC','amlFICT','amlFICD','amlCPNM','amlCTTL','amlFIAR','amlFCEI') order by sysvar";
		  	var strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);
			//�ж��Ƿ��ѯ�ɹ�
			if (!strQueryResult) {
				alert("��ѯʧ�ܣ�");
				return false;
			}
		  	var arrSelected = decodeEasyQueryResult(strQueryResult);
				fm.all("CPNM").value = arrSelected[0][0];
				fm.all("CTTL").value = arrSelected[1][0];
				fm.all("FCEI").value = arrSelected[2][0];
				fm.all("FIAR").value = arrSelected[3][0];
				fm.all("FICD").value = arrSelected[4][0];
				fm.all("FICT").value = arrSelected[5][0];
				fm.all("FIRC").value = arrSelected[6][0];
				fm.all("RICD").value = arrSelected[7][0];
				fm.all("RINM").value = arrSelected[8][0];
			
				return true;
		}
		function afterSubmit(DealFlag, MsgContent)
{   
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
}
</script>