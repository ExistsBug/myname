<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%@page import="java.io.*"%>
<%@ include file="../common/jsp/UsrCheck.jsp"%>
<%@ page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.lis.ComInfoMag.*"%>
<%@ page import="com.sinosoft.lis.schema.*"%>
<%@ page import="com.sinosoft.lis.vschema.*"%>
<%@ page import="com.sinosoft.lis.ReportForm.*"%>
<%@ page import="com.sinosoft.lis.ComInfoMag.*"%>
<%@ page import="com.sinosoft.utility.*"%>
<%@ page import ="com.sinosoft.lis.pubfun.PubFun" %>
<%@ page import="com.sinosoft.lis.pubfun.PubFun1"%>
<%@ page import="com.sinosoft.lis.pubfun.PubFun"%>

<%
	//�������ƣ�LXPostSaves.jsp
	//�����ܣ���λ��Ϣ����
	//�������ڣ�2010-04-02 11:19:10
	//������  ��Lips
	//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";
	//�������
	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");
	//ȡ����¼����
	String comcode =tGI.ComCode;    //��¼��½����
	//��¼��������Ϣ
	String operator = tGI.Operator;
	//��ǰʱ��
	 String currentDate = PubFun.getCurrentDate();
	 String currentTime = PubFun.getCurrentTime();
	
	//���մ��ݵ���������
	String Operate = new String(request.getParameter("hideOperate"))
			.toUpperCase();
	String InfoStyle = request.getParameter("infoStyle");
	String InfoIDX = request.getParameter("IDX");
	if("RETURNMODIFY".equals(Operate)){
		System.out.println("==========ͬ�����ͨ����Ϣ�޸��ߴ˹�����==========="+Operate);
		if("03".equals(InfoStyle)){
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXPolicRulmage set State ='R06' "
			+"where IDX ='"
			+InfoIDX+"'";
			//R02�����״̬
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="�����޸ĳɹ�";
				
			}else{
				Content ="�����޸�ʧ��";	
			}
		}else if("02".equals(InfoStyle)){
			System.out.println("=========��˹����ƶ�ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update RulesAndRegulations set State ='R06' "
			+"where IndexNo ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="�����޸ĳɹ�";
				
			}else{
				Content ="�����޸�ʧ��";	
			}
		}else if("01".equals(InfoStyle)){
			System.out.println("=========���֪ͨͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXNotification set Stale ='R06' "
			+"where IDX ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="�����޸ĳɹ�";
				
			}else{
				Content ="�����޸�ʧ��";	
			}
		}else if("04".equals(InfoStyle)){
			System.out.println("=========���֪ʶ԰��ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXKnowledgeField set state='R06' "
			+"where Idx ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="�����޸ĳɹ�";
			}else{
				Content ="�����޸�ʧ��";	
			}
		}
	}else{
	//======���ͨ���ߴ˹�������������state�ֶ�=====
	if("PASS".equals (Operate)){	
		System.out.println("==========���ͨ��=========="+Operate);
		if("03".equals(InfoStyle)){
		ExeSQL exeSql = new ExeSQL();
		String sql = "update LXPolicRulmage set State ='R03' "
		+",BAK4='"+currentDate+"' "
		+"where IDX ='"
		+InfoIDX+"'";
		//R02�����״̬
		//��ʾ�û������Ƿ�ɹ�
		if(exeSql.execUpdateSQL(sql)){
			Content ="���߷�����˳ɹ�";
			FlagStr="informSucc";
		}else{
			Content ="���߷������ʧ��";	
			FlagStr="informFail";
		}
		}else if("02".equals(InfoStyle)){
			System.out.println("=========��˹����ƶ�ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update RulesAndRegulations set State ='R03'"
			+"where IndexNo ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="�����ƶ���˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="�����ƶ����ʧ��";	
				FlagStr="informFail";
			}
		}else if("01".equals(InfoStyle)){
			System.out.println("=========���֪ͨͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXNotification set Stale ='R03' "
			+"where IDX ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="֪ͨ��˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="֪ͨ���ʧ��";	
				FlagStr="informFail";
			}
		}else if("04".equals(InfoStyle)){
			System.out.println("=========���֪ʶ԰��ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXKnowledgeField set state='R03'"
			+"where Idx ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="֪ʶ԰�غ˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="֪ʶ԰�����ʧ��";	
				FlagStr="informFail";
			}
		}
	//===========�����˲�ͨ��������============
	}else if ("NOPASS".equals (Operate)){
		System.out.println("=========��˲�ͨ��========"+Operate);
		
		if("03".equals(InfoStyle)){
			System.out.println("=========������߷��治ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXPolicRulmage set State ='R04' "
			+",BAK4='"+currentDate+"' "
			+"where IDX ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="���߷�����˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="���߷������ʧ��";	
				FlagStr="informFail";
			}
		}else if("02".equals(InfoStyle)){
			System.out.println("=========��˹����ƶȲ�ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update RulesAndRegulations set State ='R04'"
			+"where IndexNo ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="�����ƶ���˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="�����ƶ����ʧ��";	
				FlagStr="informFail";
			}
		}else if("01".equals(InfoStyle)){
			System.out.println("=========���֪ͨ��ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXNotification set Stale ='R04' "
			+"where IDX ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="֪ͨ��˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="֪ͨ���ʧ��";	
				FlagStr="informFail";
			}
		}else if("04".equals(InfoStyle)){
			System.out.println("=========���֪ʶ԰�ز�ͨ��========"+InfoStyle);
			ExeSQL exeSql = new ExeSQL();
			String sql = "update LXKnowledgeField set state='R04'"
			+"where Idx ='"
			+InfoIDX+"'";
			//��ʾ�û������Ƿ�ɹ�
			if(exeSql.execUpdateSQL(sql)){
				Content ="֪ʶ԰�غ˳ɹ�";
				FlagStr="informSucc";
			}else{
				Content ="֪ʶ԰�����ʧ��";	
				FlagStr="informFail";
			}
		}
	}
	//from��������Ϣ
	LXInformationCheckSchema tLXInformationCheckSchema = 
														new LXInformationCheckSchema();
	tLXInformationCheckSchema.setInfoIDX(InfoIDX);
	tLXInformationCheckSchema.setInfoStyle(InfoStyle);
	tLXInformationCheckSchema.setCheckOption(request.getParameter("CheckOption"));
	tLXInformationCheckSchema.setCheckCom(comcode);
	tLXInformationCheckSchema.setOperator(operator);
	
	tLXInformationCheckSchema.setCheckDate(currentDate);
	
///////////////////////////////////////////////////////////////////////////////////////////////////////
	LXInformationCheckUI tLXInformationCheckUI = new LXInformationCheckUI();

	VData tVData = new VData();
	if (tGI == null) {
		System.out.println("ҳ��ʧЧ,�����µ�¼");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�¼";
	}
	//ҳ����Ч
	else {
		tVData.add(tGI);
		tVData.add(tLXInformationCheckSchema);
		try {
			boolean flag= tLXInformationCheckUI.submitData(tVData, Operate);
			if(flag){
				FlagStr = "Uscc";
			}
		} catch (Exception ex) {
			Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
			FlagStr = "Fail";
		}	
		if(Operate.equals("UPDATE")){
			if("Uscc".equals(FlagStr)){
			Content ="�޸ĳɹ�!";
			}
		}else if(Operate.equals("DELETE")){
			if("Uscc".equals(FlagStr)){
			Content ="ɾ���ɹ�!";
			}
		}else if (!FlagStr.equals("Fail")) {
			tError = tLXInformationCheckUI.mErrors;
			if (!tError.needDealError()) {
				Content = " ����ɹ�! ";
				FlagStr = "Succ";
			} else {
				Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
				FlagStr = "Fail";
			}
		}
	}
}
%>
<html>
	<script language="JavaScript">
        try
        {
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
        }
        catch (ex)
        {
            alert('<%=Content%>');
        }
    </script>
</html>
