package org.apache.jsp.logon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.lis.aml.AntiInit;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!-- 登陆页面 -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

session.putValue("GI",null);
AntiInit tAntiInit=new AntiInit();
tAntiInit.init();
//System.out.println("rinm : "+AntiInit.rinm);

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>系统登陆</title>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\n");
      out.write("<script src=\"../common/javascript/Common.js\"></script>\n");
      out.write("<SCRIPT src=\"../common/cvar/CCodeOperate.js\"></SCRIPT>\n");
      out.write("<!-- 页面样式  -->\n");
      out.write("<link rel='stylesheet' type='text/css' href='../common/css/other.css'>\n");
      out.write("<LINK href=\"../common/css/Project.css\" rel=stylesheet type=text/css>\n");
      out.write("<script language=javascript>\n");
      out.write("function submitForm(){\n");
      out.write("\tif (!achieveInit()) return false;\n");
      out.write("\n");
      out.write("\tif(fm.UserCode.value.length == 0){\n");
      out.write("\t\talert(\"请输入用户名.\");\n");
      out.write("\t\treturn false;\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\tif (fm.StationCode.value.length == 0){\n");
      out.write("\t\talert(\"请选择管理机构.\");\n");
      out.write("\t\treturn false;\n");
      out.write("\t}\n");
      out.write("\tfm.ClientURL.value = document.location;\n");
      out.write("\treturn true;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function achieveInit() {\n");
      out.write("\ttry {\n");
      out.write("\t\tvar tVD = top.achieveVD;\n");
      out.write("\t\tvar tEX = top.achieveEX;\n");
      out.write("\n");
      out.write("\t\tif (!(tVD && tEX) || typeof(mCs) == \"undefined\") {\n");
      out.write("\t\t\t//alert(\"tVD:\" + tVD + \"\\ntEX:\" + tEX + \"\\nmCs:\" + typeof(mCs));\n");
      out.write("\t\t\ttop.window.location = \"../indexlis.jsp\";\n");
      out.write("\t\t\talert(\"页面初始化未完成，请等待！\");\n");
      out.write("\t\t\treturn false;\n");
      out.write("\t\t}\n");
      out.write("\t}\n");
      out.write("\tcatch(ex) {\n");
      out.write("\t\talert(\"页面初始化未错误!\\ntop.window.location = '../indexlis.jsp'\");\n");
      out.write("\t\treturn false;\n");
      out.write("\t}\n");
      out.write("\treturn true;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function MM_reloadPage(init) {  //reloads the window if Nav4 resized\n");
      out.write("  if (init==true) with (navigator) {if ((appName==\"Netscape\")&&(parseInt(appVersion)==4)) {\n");
      out.write("    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}\n");
      out.write("  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();\n");
      out.write("}\n");
      out.write("\n");
      out.write("MM_reloadPage(true);\n");
      out.write("</script>\n");
      out.write("<style type=\"text/css\">\n");
      out.write("\tbody\n");
      out.write("{\n");
      out.write("font: tahoma,verdana,arial,helvetica,sans-serif;\n");
      out.write("font-size: 8px; margin-top:0px;\n");
      out.write("SCROLLBAR-FACE-COLOR: #ffffff; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; \n");
      out.write("SCROLLBAR-SHADOW-COLOR: 254251248; SCROLLBAR-DARKSHADOW-COLOR: #ffffcc; \n");
      out.write("SCROLLBAR-3DLIGHT-COLOR: 254251248; SCROLLBAR-ARROW-COLOR: #ffffcc;\n");
      out.write("SCROLLBAR-TRACK-COLOR: #ffffff;\n");
      out.write("}\n");
      out.write("\ttd {FONT-FAMILY: 宋体;font-size:9pt}\n");
      out.write("\tinput {FONT-FAMILY: 宋体;font-size:9pt}\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\">\n");
      out.write("<table width=\"749\" height=\"0\" border=\"0\" align=\"center\" cellspacing=\"0\">\n");
      out.write("  <tr><td></td></tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"749\" height=\"566\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" background=\"../common/images/Login_L.jpg\" >\n");
      out.write("  <tr>\n");
      out.write("    <td align=\"left\" valign=\"top\" background=\"\" style=\"padding-left:55px\">\n");
      out.write("      <table width=\"100\" height=\"350\" border=\"0\" cellspacing=\"0\">\n");
      out.write("        <tr>\n");
      out.write("          <td>&nbsp;</td>\n");
      out.write("        </tr>\n");
      out.write("      </table>\n");
      out.write("      <form name=\"fm\" action=\"./LogonSubmit.jsp\" method=\"post\">\n");
      out.write("        <table width=\"250\" border=\"0\" cellspacing=\"0\">\n");
      out.write("          <tr>\n");
      out.write("            <td width=\"120\" align=\"center\" valign=\"top\"><table width=\"450\" height=\"80\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n");
      out.write("                <tr>\n");
      out.write("                  <td align=\"center\" valign=\"middle\">&nbsp;用 户 名:</td>\n");
      out.write("                  <td width=\"375\"><table width=\"20\" border=\"0\" cellspacing=\"0\" >\n");
      out.write("                      <tr>\n");
      out.write("                        <td width=\"15\"><input name=UserCode value='001' type=\"text\" id=\"UserCode2\" size=\"12\" maxlength=\"80\"></td>\n");
      out.write("                      </tr>\n");
      out.write("                  </table></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                  <td height=\"23\" align=\"center\" valign=\"middle\">&nbsp;密 &nbsp;&nbsp; 码:</td>\n");
      out.write("                  <td><table width=\"20\" border=\"0\" cellspacing=\"0\">\n");
      out.write("                      <tr>\n");
      out.write("                        <td><input name=PWD value='123456' type=\"Password\" id=\"PWD2\" size=\"12\" maxlength=\"40\"></td>\n");
      out.write("                      </tr>\n");
      out.write("                  </table></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                  <td  height=\"35\" align=\"center\" valign=\"middle\">&nbsp;管理机构:</td>\n");
      out.write("                  <td><table width=\"20\" border=\"0\" cellspacing=\"0\">\n");
      out.write("                      <tr>\n");
      out.write("\t\t\t\t\t\t<td align=\"center\"><input name=StationCode value='86' type=\"text\" class=\"code2\" id=\"StationCode\" value=\"\" onDblClick=\"if (achieveInit()) showCodeList('comcode',[this]);\"  onKeyUp=\"return showCodeListKey('comcode',[this]);\" size=\"12\" maxlength=\"18\"></td>\n");
      out.write("                      </tr>\n");
      out.write("                  </table></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr align=\"center\" valign=\"middle\">\n");
      out.write("                  <td height=\"10\" colspan=\"2\"><table width=\"519\" height=\"9\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("                      <tr>\n");
      out.write("                        <td width=\"20\" height=\"0\" align=\"center\">&nbsp;</td>\n");
      out.write("                        <td width=\"66\"><input type=\"image\" src=\"../common/images/button_login.PNG\" name=\"submit2\" width=\"57\" height=\"24\" onClick=\"return submitForm();\"></td>\n");
      out.write("                        <td width=\"355\" align=\"left\"><input type=\"image\" src=\"../common/images/button_reset.PNG\" name=\"reset2\" onClick=\"fm.reset();return false;\" width=\"57\" height=\"24\"></td>\n");
      out.write("                      </tr>\n");
      out.write("                  </table></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                  <td colspan=\"2\"><small><font face=\"Verdana\">\n");
      out.write("                    <input TYPE=\"hidden\" name=\"ClientURL\" value=\"\">\n");
      out.write("                    <br>\n");
      out.write("                  </font></small></td>\n");
      out.write("                </tr>\n");
      out.write("            </table></td>\n");
      out.write("          </tr>\n");
      out.write("        </table>\n");
      out.write("        <!--添加层-->\n");
      out.write("        <span id=\"spanCode\"  style=\"display: none; position:absolute; slategray; left: 736px; top: 264px; width: 229px; height: 44px;\"> </span>\n");
      out.write("    </form></td>\n");
      out.write("  </tr>\n");
      out.write("</table>\n");
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
