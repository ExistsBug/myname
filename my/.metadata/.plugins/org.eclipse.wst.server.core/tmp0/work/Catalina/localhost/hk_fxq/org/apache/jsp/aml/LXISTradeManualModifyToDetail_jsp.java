package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LXISTradeManualModifyToDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
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

//程序名称：LAAgentQuery.html
//程序功能：
//创建日期：2002-08-16 15:31:09
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容

      out.write("\r\n");
      out.write("<!--Root=\"../../\" -->\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Sinosoft </title>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\tvar intPageWidth=screen.availWidth;\r\n");
      out.write("\tvar intPageHeight=screen.availHeight;\r\n");
      out.write("\twindow.resizeTo(intPageWidth,intPageHeight);\r\n");
      out.write("\twindow.focus();\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<!--<frameset rows=\"0,0,0,65,*\" frameborder=\"no\" border=\"1\" framespacing=\"0\" cols=\"*\"> -->\r\n");
      out.write("<frameset name=\"fraMain\" rows=\"0,0,0,0,*\" frameborder=\"no\" border=\"1\" framespacing=\"0\" cols=\"*\">\r\n");
      out.write("<!--标题与状态区域-->\r\n");
      out.write("\t<!--保存客户端变量的区域，该区域必须有-->\r\n");
      out.write("\t<frame name=\"VD\" src=\"../common/cvar/CVarData.html\">\r\n");
      out.write("\t\r\n");
      out.write("\t<!--保存客户端变量和WebServer实现交户的区域，该区域必须有-->\r\n");
      out.write("\t<frame name=\"EX\" src=\"../common/cvar/CExec.jsp\">\r\n");
      out.write("\t\r\n");
      out.write("\t<frame name=\"fraSubmit\"  scrolling=\"yes\" noresize src=\"about:blank\" >\r\n");
      out.write("\t<frame name=\"fraTitle\"  scrolling=\"no\" noresize src=\"\" >\r\n");
      out.write("\t<frameset name=\"fraSet\" cols=\"0%,*,0%\" frameborder=\"no\" border=\"1\" framespacing=\"0\" rows=\"*\">\r\n");
      out.write("\t\t<!--菜单区域-->\r\n");
      out.write("\t\t<frame name=\"fraMenu\" scrolling=\"yes\" noresize src=\"\">\r\n");
      out.write("\t\t<!--交互区域--> \r\n");
      out.write("\t\t<frame id=\"fraInterface\" name=\"fraInterface\" scrolling=\"auto\" src=\"./LXISTradeManualModifyDetail.jsp?DealNo=");
      out.print(request.getParameter("DealNo"));
      out.write("&ListNo=");
      out.print(request.getParameter("ListNo"));
      out.write("&oper=");
      out.print(request.getParameter("oper"));
      out.write("\" >\r\n");
      out.write("    <!--下一步页面区域-->\r\n");
      out.write("    <frame id=\"fraNext\" name=\"fraNext\" scrolling=\"auto\" src=\"about:blank\">\r\n");
      out.write("\t</frameset>\r\n");
      out.write("</frameset>\r\n");
      out.write("<noframes>\r\n");
      out.write("\t<body bgcolor=\"#ffffff\">\r\n");
      out.write("\t</body>\r\n");
      out.write("</noframes>\r\n");
      out.write("</html>\r\n");
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
