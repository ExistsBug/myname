package org.apache.jsp.logon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menutop_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=gb2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("function hidemenu(){\n");
      out.write("\tif(parent.fraSet.cols==\"180,*,0%\"){\n");
      out.write("\t\tparent.fraSet.cols = \"0%,*,0%\";\n");
      out.write("\t\tparent.fraQuick.document.all(\"menushow\").style.display = \"\";\n");
      out.write("\t}\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\n");
      out.write("<!-- 页面样式  -->\n");
      out.write("<link rel='stylesheet' type='text/css' href='../common/css/other.css'>\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginhigh=\"0\" oncontextmenu=self.event.returnValue=false>\n");
      out.write("<table width=\"100%\" height=\"25\" cellspacing=\"0\">\n");
      out.write("  <tr>\n");
      out.write("    <th width=\"79%\" align=center><font color=\"#FFFFFF\">欢迎登录</font></th>\n");
      out.write("    <th width=\"21%\" align=\"left\"><img  src=\"../common/images/t_close.gif\" width=\"70\" height=\"13\" id=\"imgHideToc\" style=\"cursor:hand\" title=\"隐藏菜单\" onclick=\"hidemenu();\" /></th>\n");
      out.write("\t</tr>\n");
      out.write("\t</table>\n");
      out.write("</body>\n");
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
