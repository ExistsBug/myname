package org.apache.jsp.CustomerRiskLever;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LXRiskLevelAdjustMain_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软人寿保险核心业务管理系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 黄潇 <HuangXiao@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-14
 * @direction: 大额交易信息录入
 ******************************************************************************/

      out.write('\r');
      out.write('\n');
request.setCharacterEncoding("GBK"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>信息录入</title>\r\n");
      out.write("</head>\r\n");
      out.write("<frameset name=\"fraMain\" framespacing=\"0\" frameborder=\"no\" rows=\"0,0,0,0,*\" cols=\"*\" border=\"1\">\r\n");
      out.write("    <!-- 保存客户端变量的区域 -->\r\n");
      out.write("    <frame name=\"VD\" src=\"../common/cvar/CVarData.html\">\r\n");
      out.write("    <!-- 实现服务器交户的区域 -->\r\n");
      out.write("    <frame name=\"EX\" src=\"../common/cvar/CExec.jsp\">\r\n");
      out.write("    <!-- 提交客户端查询的区域 -->\r\n");
      out.write("    <frame name=\"fraSubmit\" src=\"about:blank\" scrolling=\"no\" noresize>\r\n");
      out.write("    <!-- 顶部显示标题栏的区域 -->\r\n");
      out.write("    <frame name=\"fraTitle\" src=\"about:blank\" scrolling=\"no\" noresize>\r\n");
      out.write("    <!-- 显示菜单和交互的区域 -->\r\n");
      out.write("    <frameset name=\"fraSet\" framespacing=\"0\" frameborder=\"no\" rows=\"*\" cols=\"0%,*,0%\" border=\"1\">\r\n");
      out.write("        <!-- 显示菜单的区域 -->\r\n");
      out.write("        <frame name=\"fraMenu\" src=\"about:blank\" scrolling=\"yes\" noresize>\r\n");
      out.write("        <!-- 实现交互的区域 -->\r\n");
      out.write("        <frame id=\"fraInterface\" name=\"fraInterface\" scrolling=\"auto\" src=\"./LXAdjustInfoInput.jsp?contno=");
      out.print(request.getParameter("contno"));
      out.write("&finalScore=");
      out.print(request.getParameter("finalScore"));
      out.write("&finalLevel=");
      out.print(new String(request.getParameter("finalLevel").getBytes("ISO-8859-1"),"GBK"));
      out.write("&poltype=");
      out.print(request.getParameter("poltype"));
      out.write("&no=");
      out.print(request.getParameter("no") );
      out.write("\">\r\n");
      out.write("        <!-- 下一步操作区域 -->\r\n");
      out.write("        <frame name=\"fraNext\" src=\"about:blank\" scrolling=\"auto\">\r\n");
      out.write("    </frameset>\r\n");
      out.write("</frameset>\r\n");
      out.write("<noframes>\r\n");
      out.write("    <body bgcolor=\"#FFFFFF\">\r\n");
      out.write("        <br><br><br><br><br>\r\n");
      out.write("        <center>\r\n");
      out.write("            <font size=\"2\">对不起，您的浏览器不支持框架网页。</font>\r\n");
      out.write("            <br><br>\r\n");
      out.write("            <font size=\"2\">请使用 IE 5.0 或其以上浏览本系统。</font>\r\n");
      out.write("        </center>\r\n");
      out.write("    </body>\r\n");
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
