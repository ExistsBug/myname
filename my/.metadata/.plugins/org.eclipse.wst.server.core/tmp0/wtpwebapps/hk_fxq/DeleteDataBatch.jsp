<%@page contentType="text/html;charset=GBK" %>
<%
//程序功能：删除数据
%>
<!--用户校验类-->
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="java.util.Date"%>
<%@page import="com.sinosoft.utility.RSWrapper"%>
<%
//删除身份识别数据
ExeSQL myExeSQL=new ExeSQL();
String strSQL = "delete  from LXPersonalInfo";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("删除LXPersonalInfo表数据成功!");
}
else
{
	System.out.println("删除LXPersonalInfo表数据失败!"+strSQL);
}
strSQL = "delete  from LXGroupAppntInfo";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("删除LXGroupAppntInfo表数据成功!");
}
else
{
	System.out.println("删除LXGroupAppntInfo表数据失败!"+strSQL);
} 
strSQL = "delete  from LXGroupInsuredBnfInfo";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("删除LXGroupInsuredBnfInfo表数据成功!");
}
else
{
	System.out.println("删除LXGroupInsuredBnfInfo表数据失败!"+strSQL);
} 
strSQL = "delete  from LXExcelDataFile";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("删除LXExcelDataFile表数据成功!");
}
else
{
	System.out.println("删除LXExcelDataFile表数据失败!"+strSQL);
} 
strSQL = "delete  from LXExcelImportLog";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("删除LXExcelImportLog表数据成功!");
}
else
{
	System.out.println("删除LXExcelImportLog表数据失败!"+strSQL);
} 
//删除风险数据
strSQL = "delete  from LXCustomerLevel";
if (myExeSQL.execUpdateSQL(strSQL))
{
	System.out.println("删除LXCustomerLevel表数据成功!");
}
else
{
	System.out.println("删除LXCustomerLevel表数据失败!"+strSQL);
}
%>
