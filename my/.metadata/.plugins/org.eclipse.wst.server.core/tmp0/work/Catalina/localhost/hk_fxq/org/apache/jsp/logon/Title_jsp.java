package org.apache.jsp.logon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Title_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!--*******************************************************\n");
      out.write("* 程序名称：Title.jsp\n");
      out.write("* 程序功能：系统标题页面\n");
      out.write("* 最近更新人：朱向峰\n");
      out.write("* 最近更新日期：2002-08-21\n");
      out.write("* \t\t\t\t2004-11-3 16:58\n");
      out.write("*******************************************************-->\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=GBK\">\n");
      out.write("<!-- 页面样式  -->\n");
      out.write("<link rel='stylesheet' type='text/css' href='../common/css/Project.css'>\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("function showTitle(){\n");
      out.write("\tparent.fraMain.rows = \"0,0,0,0,*\";\n");
      out.write("\tparent.fraTalk.rows = \"30,*\";\n");
      out.write("}\n");
      out.write("function showHideFrame(){\n");
      out.write("\ttry{\n");
      out.write("\t\tif(parent.fraSet.cols==\t\"0%,*,0%\"){\n");
      out.write("\t\t\tparent.fraSet.cols = \"180,*,0%\";\n");
      out.write("\t\t\tmenuPowerImage.src = \"../common/images/butHide.gif\";\n");
      out.write("\t\t}\n");
      out.write("\t\telse if(parent.fraSet.cols==\"180,*,0%\"){\n");
      out.write("\t\t\tparent.fraSet.cols = \"0%,*,0%\";\n");
      out.write("\t\t\tmenuPowerImage.src = \"../common/images/butShow.gif\";\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\t\tcatch(re){}\n");
      out.write("\t}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<style type=\"text/css\">\n");
      out.write("<!--\n");
      out.write("\tbody {FONT-FAMILY: 宋体;font-size:9pt;FONT-WEIGHT: bold}\n");
      out.write("\ttd {FONT-FAMILY: 宋体;font-size:9pt;FONT-WEIGHT: bold}\n");
      out.write("\tinput {FONT-FAMILY: 宋体;font-size:9pt;FONT-WEIGHT: bold}\n");
      out.write("-->\n");
      out.write("</style>\n");
      out.write("<body text=\"#000000\" leftmargin=\"0\" topmargin=\"2\" marginwidth=\"0\" marginhigh=\"2\">\n");
      out.write("\t<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=center bgcolor=\"#94FEFC\">\n");
      out.write("\t\t<tr> \n");
      out.write("\t\t\t<td background=\"../common/images/bg.gif\" width=36 height=72 valign=bottom><img name=menuPowerImage src=\"../common/images/butHide.gif\" onclick=\"showHideFrame();\" width=\"36\" height=\"16\"></td>\n");
      out.write("\t\t\t<td width=735 height=72><img src=\"../common/images/logo.gif\" width=735 height=72></td>\n");
      out.write("\t\t\t<td width=100%>&nbsp;</td>\n");
      out.write("\t\t</tr>\n");
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
