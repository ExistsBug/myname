package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class indexlis_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=gb2312");
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
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : sinosoft
 * @version  : 1.00
 * @date     : 2006-10-30
 * @direction: 核心业务管理系统主界面
 ******************************************************************************/

      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\r\n");
      out.write("    <title>中科软科技-反洗钱系统</title>\r\n");
      out.write("    <script language=\"JavaScript\">\r\n");
      out.write("    <!--\r\n");
      out.write("        //判断页面是否初始化完成\r\n");
      out.write("        var achieveEX = false;\r\n");
      out.write("        var achieveVD = false;\r\n");
      out.write("        //设置主窗口属性, 用于代码选择功能查找主窗口, 缓存数据\r\n");
      out.write("        window.name = \"Lis\";\r\n");
      out.write("        try\r\n");
      out.write("        {\r\n");
      out.write("            //window.resizeTo(screen.availWidth, screen.availHeight);\r\n");
      out.write("        }\r\n");
      out.write("        catch (ex) {}\r\n");
      out.write("        window.focus();\r\n");
      out.write("    -->\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("<frameset name=\"fraMain\" framespacing=\"0\" frameborder=\"no\" rows=\"0,0,0,0,*\" cols=\"*\" border=\"1\">\r\n");
      out.write("    <!-- 保存客户端变量的区域 -->\r\n");
      out.write("    <frame name=\"VD\" src=\"common/cvar/CVarData.html\" noresize />\r\n");
      out.write("    <!-- 实现服务器交户的区域 -->\r\n");
      out.write("    <frame name=\"EX\" src=\"common/cvar/CExec.jsp\" noresize />\r\n");
      out.write("    <!-- 提交客户端查询的区域 -->\r\n");
      out.write("    <frame name=\"fraSubmit\" src=\"about:blank\" scrolling=\"no\" noresize />\r\n");
      out.write("    <!-- 顶部显示标题栏的区域 -->\r\n");
      out.write("    <frame name=\"fraTitle\" src=\"logon/Title.jsp\" scrolling=\"no\" noresize />\r\n");
      out.write("    <!-- 显示菜单和交互的区域 -->\r\n");
      out.write("    <frameset name=\"fraSet\" framespacing=\"0\" frameborder=\"no\" rows=\"*\" cols=\"0%,*,0%\" border=\"1\">\r\n");
      out.write("        <!-- 显示菜单的区域 -->\r\n");
      out.write("        <frameset name=\"fraMenuMain\" framespacing=\"0\" frameborder=\"no\" rows=\"25,*\" border=\"1\">\r\n");
      out.write("            <frame name=\"fraMenuTop\" src=\"logon/menutop.jsp\" scrolling=\"no\" noresize />\r\n");
      out.write("            <frame name=\"fraMenu\" src=\"about:blank\" scrolling=\"auto\" noresize />\r\n");
      out.write("        </frameset>\r\n");
      out.write("        <!-- 实现交互的区域 -->\r\n");
      out.write("        <frameset name=\"fraTalk\" framespacing=\"0\" frameborder=\"no\" rows=\"0,*\" border=\"1\">\r\n");
      out.write("            <frame name=\"fraQuick\" src=\"logon/quick.jsp\" scrolling=\"no\" noresize />\r\n");
      out.write("            <frameset name=\"fraTalkCol\" framespacing=\"0\" frameborder=\"no\" cols=\"0,*\" border=\"1\">\r\n");
      out.write("                <frame name=\"fraPic\" src=\"about:blank\" scrolling=\"auto\" noresize />\r\n");
      out.write("                <frame name=\"fraInterface\" src=\"logon/main.jsp\" scrolling=\"auto\" noresize />\r\n");
      out.write("            </frameset>\r\n");
      out.write("        </frameset>\r\n");
      out.write("        <!-- 下一步操作区域 -->\r\n");
      out.write("        <frame name=\"fraNext\" src=\"about:blank\" scrolling=\"auto\" noresize />\r\n");
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
