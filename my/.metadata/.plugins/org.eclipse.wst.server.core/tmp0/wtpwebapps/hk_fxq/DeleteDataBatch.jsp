<%@page contentType="text/html;charset=GBK" %>
<%
//�����ܣ�ɾ������
%>
<!--�û�У����-->
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="java.util.Date"%>
<%@page import="com.sinosoft.utility.RSWrapper"%>
<%
//ɾ�����ʶ������
ExeSQL myExeSQL=new ExeSQL();
String strSQL = "delete  from LXPersonalInfo";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("ɾ��LXPersonalInfo�����ݳɹ�!");
}
else
{
	System.out.println("ɾ��LXPersonalInfo������ʧ��!"+strSQL);
}
strSQL = "delete  from LXGroupAppntInfo";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("ɾ��LXGroupAppntInfo�����ݳɹ�!");
}
else
{
	System.out.println("ɾ��LXGroupAppntInfo������ʧ��!"+strSQL);
} 
strSQL = "delete  from LXGroupInsuredBnfInfo";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("ɾ��LXGroupInsuredBnfInfo�����ݳɹ�!");
}
else
{
	System.out.println("ɾ��LXGroupInsuredBnfInfo������ʧ��!"+strSQL);
} 
strSQL = "delete  from LXExcelDataFile";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("ɾ��LXExcelDataFile�����ݳɹ�!");
}
else
{
	System.out.println("ɾ��LXExcelDataFile������ʧ��!"+strSQL);
} 
strSQL = "delete  from LXExcelImportLog";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("ɾ��LXExcelImportLog�����ݳɹ�!");
}
else
{
	System.out.println("ɾ��LXExcelImportLog������ʧ��!"+strSQL);
} 
//ɾ����������
strSQL = "delete  from LXCustomerLevel";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("ɾ��LXCustomerLevel�����ݳɹ�!");
}
else
{
	System.out.println("ɾ��LXCustomerLevel������ʧ��!"+strSQL);
}
%>
