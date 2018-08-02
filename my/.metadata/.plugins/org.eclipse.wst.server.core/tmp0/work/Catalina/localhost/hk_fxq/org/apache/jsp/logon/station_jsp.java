package org.apache.jsp.logon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.logon.*;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.utility.*;
import com.sinosoft.lis.pubfun.GlobalInput;

public final class station_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/logon/../common/jsp/UsrCheck.jsp");
  }

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
      out.write("<!--*******************************************************\n");
      out.write("* 程序名称：station.jsp\n");
      out.write("* 程序功能：系统标题页面\n");
      out.write("* 最近更新人：朱向峰\n");
      out.write("* 最近更新日期：2005-3-21 14:45\n");
      out.write("*******************************************************-->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--\r\n");
      out.write("*******************************************************\r\n");
      out.write("* ³ÌÐòÃû³Æ£ºUsrCheck.jsp\r\n");
      out.write("* ³ÌÐò¹¦ÄÜ£ºÓÃ»§ÐÅÏ¢Ð£ÑéÒ³Ãæ\r\n");
      out.write("* ´´½¨ÈÕÆÚ£º2002-11-25\r\n");
      out.write("* ¸üÐÂ¼ÇÂ¼£º  ¸üÐÂÈË    ¸üÐÂÈÕÆÚ     ¸üÐÂÔ­Òò/ÄÚÈÝ\r\n");
      out.write("*******************************************************\r\n");
      out.write("-->\r\n");
      out.write("\r\n");

try
{
	if (session == null) {
		System.out.println("session is null");

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("catch (exception)\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

		return;
	}
	GlobalInput tG1 = (GlobalInput)session.getValue("GI");
	if (tG1 == null) {
		session.putValue("GI",null);
		out.println("ÍøÒ³³¬Ê±£¬ÇëÄúÖØÐÂµÇÂ¼");

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("catch (exception)\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

		return;
	}
	String  userCode = tG1.Operator;
	String comCode =tG1.ComCode;
	String manageCom = tG1.ManageCom;
	if ((userCode.length()==0) || (userCode.compareTo("")==0)||(comCode.length()==0) || (comCode.compareTo("")==0) ||(manageCom.length()==0) || (manageCom.compareTo("") == 0))
	{
		session.putValue("GI",null);
		String ContentErr = " ÇëÄúÖØÐÂµÇÂ¼£¡";
		System.out.println(ContentErr);

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("try\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("catch (exception)\r\n");
      out.write("{\r\n");
      out.write("\ttop.window.location =\"../indexlis.jsp\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");

		return;
	}
}
catch(Exception exception)
{
	String ContentErr = " exception:ÇëÄúÖØÐÂµÇÂ¼£¡";
	System.out.println(ContentErr);
	out.println("ÍøÒ³³¬Ê±£¬ÇëÄúÖØÐÂµÇÂ¼");

      out.write("\r\n");
      out.write("<script language=javascript>\r\n");
      out.write("top.window.location =\"../indexlis.jsp\";\r\n");
      out.write("</script>\r\n");

	return;
}

      out.write('\n');
      out.write('\n');

String nodecode = request.getParameter("nodecode");
String Ip = request.getParameter("Ip");
String ls="";
String strFlag = "00";

GlobalInput tG = (GlobalInput)session.getValue("GI");
String ManageCom = tG.ManageCom;
String Operator = tG.Operator;

if ((nodecode==null) || (nodecode.trim().equals("")))
{
    ls = "现在的位置：首页";
}
else
{
    if (nodecode.equals("60001"))
    {
        ls = "现在的位置：密码修改";
    }
    else
    {
        MenuShow menuShow = new MenuShow();

        ExeSQL exeSQL = new ExeSQL();
        String strNodeCode = exeSQL.getOneValue("SELECT NodeCode FROM LDMenu WHERE NodeCode = '" + nodecode + "'");

        if( strNodeCode == null || strNodeCode.equals("") ) {

            ls = "发现错误的菜单节点，请与系统维护人员联系。";
            strFlag = "01";

        } else {

            ls = menuShow.getStation(nodecode);
            ls = ls.substring(0,ls.length()-3);

            String tSql = "insert into LDUserTrace ( ManageCom,Operator,TraceType,TraceContent,ClientIP,MakeDate,MakeTime ) " +
                "values ( '"+tG.ComCode+"','"+tG.Operator+"','00','"+ls.substring(6)+"','"+Ip+"','"+PubFun.getCurrentDate()+"','"+PubFun.getCurrentTime()+"' )";
            ExeSQL tExeSQL = new ExeSQL();
            //执行用户轨迹操作
            try
            {
                tExeSQL.execUpdateSQL(tSql);
            }
            catch(Exception ex)
            {
                //System.out.println("dsfjklfajslkd");
                ex.printStackTrace();
            }
        }
    }
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\n");
      out.write("<script language=\"JavaScript\">\n");
      out.write("function showmenu()\n");
      out.write("{\n");
      out.write("    if(parent.fraSet.cols==\"0%,*,0%\")\n");
      out.write("    {\n");
      out.write("        document.all(\"menushow\").style.display = \"none\";\n");
      out.write("        parent.fraSet.cols = \"180,*,0%\";\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("if ( \"01\" == \"");
      out.print( strFlag );
      out.write("\" )\n");
      out.write("{\n");
      out.write("  alert(\"发现错误的菜单节点，请与系统维护人员联系。\");\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<link rel='stylesheet' type='text/css' href='../common/css/other.css'>\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginhigh=\"0\" oncontextmenu=\"return false\">\n");
      out.write("    <table width=100% height=\"25\" cellspacing=\"0\">\n");
      out.write("        <tr>\n");
      out.write("            <th width=\"10%\" align=\"left\" id=menushow style=\"display:none\" name=\"menushow\">\n");
      out.write("                &nbsp;&nbsp;\n");
      out.write("                <a href=\"#\" onclick=\"showmenu()\"><img src=\"../common/images/t_open.gif\" width=\"70\" height=\"13\" border=\"0\" title=\"显示菜单栏\"></a>\n");
      out.write("            </th>\n");
      out.write("            <th width=\"40%\" align=\"left\">&nbsp;&nbsp;<font style=\"font-size:9pt\" color=\"#FFFFFF\">登录机构：");
      out.print(ManageCom);
      out.write(" 登录用户：");
      out.print(Operator);
      out.write("</font></th>\n");
      out.write("            <th width=\"50%\" align=\"right\"><font style=\"font-size:9pt\" color=\"#FFFFFF\">");
      out.print(ls);
      out.write("&nbsp;</th>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
