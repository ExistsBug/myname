<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.upload.*"%>
<%@page import="java.io.*"%>
<%
	SmartUpload su = new SmartUpload();
	su.initialize(pageContext);
	su.setContentDisposition(null);
	out.clear();
	out = pageContext.pushBody();
	//取得文件名称
	String fileName = request.getParameter("FileName");
	String downloadFileName = request.getParameter("DisplayFileName");
	System.out.println("+++++++++fileName=" + fileName);
	//取得文件路径
	String path = request.getParameter("Path");
	System.out.println("+++++++++path=" + path);
	path = path + fileName;
	if (fileName == null || fileName.equals("")) {
		su.downloadFile(path);
	} else {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < fileName.length(); i++) {
			char c = fileName.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%"
							+ Integer.toHexString(k).toUpperCase());
				}
			}
		}
		su.downloadFile(path, null, new String(downloadFileName
				.getBytes("gb2312"), "iso8859-1"));
	}
%>
<html>
</html>