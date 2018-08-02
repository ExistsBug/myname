<%@page contentType="text/html;charset=GBK" %><%@page import="java.io.*"%><%@page import="java.nio.*"%><%@page import="javax.xml.parsers.*"%><%@page import="org.w3c.dom.*"%><%@page import="org.apache.xml.serialize.*"%><%@page import="java.util.*"%><%@page import="java.net.*"%><%@page import="com.sinosoft.lis.xpath.*"%><%@page import="com.sinosoft.lis.pubfun.*"%><%@page import="com.sinosoft.utility.*"%><%@page import="com.sinosoft.lis.schema.*"%><%@page import="com.sinosoft.lis.vschema.*"%><%@page import="com.sinosoft.lis.pubfun.*"%><%@page import="com.sinosoft.lis.f1print.*"%><%
request.setCharacterEncoding("UTF-8");
String OutputPath = application.getRealPath("printdata") + "/";
InputStream inputStream = request.getInputStream();
XMLOutputStream xos = new XMLOutputStream(inputStream,OutputPath);
xos.read(inputStream);
InputStream ins = (InputStream)(xos.getResult().get(0));
InputStreamReader isr = new InputStreamReader(ins,"UTF-8");
int n = 0;
String s="";
while ( (n = isr.read()) != -1) {
	out.print((char)n);
}
%>