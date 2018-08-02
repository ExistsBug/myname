package org.apache.jsp.common.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.utility.StrTool;

public final class MessagePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    JspFactory _jspxFactory = null;
    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      _jspxFactory = JspFactory.getDefaultFactory();
      response.setContentType("text/html;charset=GBK");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

//程序名称：MessagePage.jsp
//程序功能：信息显示页面
//创建日期：2002-05-10
//创建人  ：
//更新记录：  更新人    更新日期     更新原因/内容
//             欧阳晟   2002-05-10    修改

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>信息反馈</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/Project.css\">\r\n");

String SUCCESS = "S";	//成功
String FAILURE = "F";	//失败
String COMMON = "C";	//一般信息
String Picture = request.getParameter("picture");
String Content = StrTool.unicodeToGBK(request.getParameter("content"));
/*****************added by dingzhong for time out check*********************/
boolean bIsOutTime = false;
if (session == null)
{
	bIsOutTime = true;
}
else
{
	GlobalInput tG1 = (GlobalInput)session.getValue("GI");
	if (tG1 == null)
	{
		bIsOutTime = true;
	}
	else
	{
		String userCode = tG1.Operator;
		String comCode = tG1.ComCode;
		String manageCom = tG1.ManageCom;

		if ((userCode.length()==0) || (userCode.compareTo("")==0)||(comCode.length()==0) || (comCode.compareTo("")==0) ||(manageCom.length()==0) || (manageCom.compareTo("") == 0))
		{
			bIsOutTime = true;
		}
	}
}
if (bIsOutTime)
{
	Content = "页面超时，请重新登录.";
}
/*********************************************************************/

String strPicture ="";

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"interface\">\r\n");
      out.write("<h1><center>系统信息</center></h1>\r\n");
      out.write("<br>\r\n");

if(Picture==null)
{
	Picture = COMMON;
}

if(Picture.equalsIgnoreCase(SUCCESS))
{
	strPicture ="success.gif";
}
else if (Picture.equalsIgnoreCase(FAILURE))
{
	strPicture ="failure.gif";
}
else
{
	strPicture ="common.gif";
}

      out.write("\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<img src='../images/");
      out.print(strPicture);
      out.write("'>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td class=\"common\">\r\n");
      out.write("\t\t\t\t");
      out.print(Content);
      out.write("\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");

if (Content.indexOf("正在") == -1)
{

      out.write("\r\n");
      out.write("\t<center>\r\n");
      out.write("\t\t<input type=button class=common id=butSubmit value=\"确 定\" onclick=\"window.close()\" tabIndex=0>\r\n");
      out.write("\t</center>\r\n");

}

      out.write("\r\n");
      out.write("<script language=JavaScript>\r\n");
      out.write("ini = new Date().getTime();\r\n");
      out.write("var pc = 0;\r\n");
      out.write("\r\n");
      out.write("function load()\r\n");
      out.write("{\r\n");
      out.write("\tpc += 1;\r\n");
      out.write("\tlpc.style.width = pc + \"%\";\r\n");
      out.write("\ttime = setTimeout(\"load()\",30);\r\n");
      out.write("\tif (pc > 100)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tpc=0;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function loaded()\r\n");
      out.write("{\r\n");
      out.write("\tfim = new Date().getTime();\r\n");
      out.write("\tdif = fim - ini;\r\n");
      out.write("\tld.style.display = 'none';\r\n");
      out.write("\tbody.style.backgroundColor = 'silver';\r\n");
      out.write("\tq.innerHTML = dif/1000;\r\n");
      out.write("\tpage.style.display = '';\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function Show()\r\n");
      out.write("{\r\n");
      out.write("\tif (txt.style.display == \"none\")\r\n");
      out.write("\t{\r\n");
      out.write("\t\ttxt.style.display = \"\";\r\n");
      out.write("\t}\r\n");
      out.write("\telse\r\n");
      out.write("\t{\r\n");
      out.write("\t\ttxt.style.display = \"none\";\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\twindow.butSubmit.focus();\r\n");
      out.write("}\r\n");
      out.write("catch(e)\r\n");
      out.write("{}\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      if (_jspxFactory != null) _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
