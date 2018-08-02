package org.apache.jsp.logon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.db.*;
import com.sinosoft.lis.schema.*;
import com.sinosoft.lis.vschema.*;
import com.sinosoft.lis.pubfun.GlobalInput;

public final class menu2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=gb2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');

/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软人寿保险核心业务管理系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2006-12-13
 * @direction: 系统菜单主框架
 ******************************************************************************/

      out.write("\n");
      out.write("\n");
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

    //接受传入参数
    String sUserCode = request.getParameter("userCode");
    String sIPAddress = request.getParameter("Ip");

    //用户菜单容器
    String sMenuNodeData = new String("");
    String sDefaultURL = "about:blank";

    //查询用户菜单
    String QuerySQL = new String("");
    if (sUserCode == null || sUserCode.trim().equals(""))
    {
        QuerySQL = "select * from LDMenu where 1 = 2 order by NodeOrder asc";
    }
    else if (sUserCode.trim().equals("001"))
    {
        QuerySQL = "select * from LDMenu where 1 = 1 order by NodeOrder asc";
    }
    else
    {
        QuerySQL = "select * "
                 +   "from LDMenu "
                 +  "where NodeCode in "
                 +        "(select NodeCode "
                 +           "from LDMenuGrpToMenu "
                 +          "where MenuGrpCode in "
                 +                "(select MenuGrpCode "
                 +                   "from LDMenuGrp "
                 +                  "where MenuGrpCode in "
                 +                        "(select MenuGrpCode "
                 +                           "from LDUserToMenuGrp "
                 +                          "where UserCode = '" + sUserCode + "'))) "
                 +  "order by NodeOrder asc";
    }
    //System.out.println(QuerySQL);

    //查询 LDMenu
    LDMenuDB tLDMenuDB = new LDMenuDB();
    LDMenuSet tLDMenuSet = new LDMenuSet();
    try
    {
        tLDMenuSet = tLDMenuDB.executeQuery(QuerySQL);
    }
    catch (Exception ex) {}
    if (tLDMenuSet != null && tLDMenuSet.size() > 0)
    {
        StringBuffer sbMenuNodeData = new StringBuffer(256);
        for (int i = 1; i <= tLDMenuSet.size(); i++)
        {
            LDMenuSchema tLDMenuSchema = new LDMenuSchema();
            tLDMenuSchema = tLDMenuSet.get(i);
            sbMenuNodeData.append("\r\n");
            sbMenuNodeData.append("                ");
            sbMenuNodeData.append("nodes[\"");
            String sParentNodeCode = tLDMenuSchema.getParentNodeCode();
            if (sParentNodeCode == null || sParentNodeCode.trim().equals("") || sParentNodeCode.trim().equals("0"))
            {
                sbMenuNodeData.append("1");
            }
            else
            {
                sbMenuNodeData.append(sParentNodeCode);
            }
            sbMenuNodeData.append("_");
            sbMenuNodeData.append(tLDMenuSchema.getNodeCode());
            sbMenuNodeData.append("\"] = \"");
            sbMenuNodeData.append("text:");
            sbMenuNodeData.append(tLDMenuSchema.getNodeName());
            sbMenuNodeData.append("; url:");
            String sRunScript = tLDMenuSchema.getRunScript();
            if (sRunScript == null || sRunScript.trim().equals(""))
            {
                sbMenuNodeData.append(sDefaultURL);
            }
            else if (sRunScript.indexOf("?") != -1)
            {
                String sLinkPage = sRunScript.substring(0, sRunScript.indexOf("?"));
                String sLinkData = sRunScript.substring(sRunScript.indexOf("?") + 1);
                sbMenuNodeData.append(sLinkPage);
                sbMenuNodeData.append("; data:");
                sbMenuNodeData.append(sLinkData);
            }
            else
            {
                sbMenuNodeData.append(sRunScript);
            }
            sbMenuNodeData.append("; hint:");
            String sNodeHint = tLDMenuSchema.getNodeDescription();
            if (sNodeHint == null || sNodeHint.trim().equals(""))
            {
                sbMenuNodeData.append(tLDMenuSchema.getNodeName());
            }
            else
            {
                sbMenuNodeData.append(sNodeHint);
            }
            sbMenuNodeData.append("; method:showStation('");
            sbMenuNodeData.append(tLDMenuSchema.getNodeCode());
            sbMenuNodeData.append("');\";");
            tLDMenuSchema = null;
        }
        sMenuNodeData = sbMenuNodeData.toString();
    }
    tLDMenuDB = null;
    tLDMenuSet = null;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\n");
      out.write("    <meta name=\"MzTreeView Author\" content=\"meizz: http://www.meizz.com\">\n");
      out.write("    <title>系统菜单</title>\n");
      out.write("    <!-- 私有使用样式 -->\n");
      out.write("    <style type=text/css>\n");
      out.write("        body\n");
      out.write("        {\n");
      out.write("            font: tahoma,verdana,arial,helvetica,sans-serif;\n");
      out.write("            font-size: 12px;\n");
      out.write("            scrollbar-face-color: #799AE1;\n");
      out.write("            scrollbar-highlight-color: #799AE1;\n");
      out.write("            scrollbar-shadow-color: #799AE1;\n");
      out.write("            scrollbar-darkshadow-color: #799AE1;\n");
      out.write("            scrollbar-3dlight-color: #799AE1;\n");
      out.write("            scrollbar-arrow-color: #FFFFFF;\n");
      out.write("            scrollbar-track-color: #AABFEC;\n");
      out.write("        }\n");
      out.write("        a:link, a:visited, a:active\n");
      out.write("        {\n");
      out.write("            color: #000000;\n");
      out.write("            padding-left: 2px;\n");
      out.write("            text-decoration: none;\n");
      out.write("        }\n");
      out.write("        a:hover\n");
      out.write("        {\n");
      out.write("            color: #FF6600;\n");
      out.write("            padding-left: 2px;\n");
      out.write("            text-decoration: none;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <!-- 私有引用脚本 -->\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/TreeView/MzTreeView.js\"></script>\n");
      out.write("    <!-- 私有使用脚本 -->\n");
      out.write("    <script language=\"JavaScript\">\n");
      out.write("    <!--\n");
      out.write("        //检查访问地址\n");
      out.write("        if (top.location == self.location)\n");
      out.write("        {\n");
      out.write("            top.location = \"../indexlis.jsp\";\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        //显示状态栏信息\n");
      out.write("        defaultStatus = \"欢迎使用本系统\";\n");
      out.write("        top.window.status = defaultStatus;\n");
      out.write("\n");
      out.write("        var MenuTree = new MzTreeView(\"MenuTree\");\n");
      out.write("\n");
      out.write("        //显示用户菜单\n");
      out.write("        function initMenuTree()\n");
      out.write("        {\n");
      out.write("            with (MenuTree)\n");
      out.write("            {\n");
      out.write("                wordLine = false;\n");
      out.write("                icons[\"root\"] = \"root.png\";\n");
      out.write("                icons[\"folder\"] = \"folder_blue.png\";\n");
      out.write("                iconsExpand[\"folder\"] = \"folderopen_blue.png\";\n");
      out.write("                icons[\"file\"] = \"dot.gif\";\n");
      out.write("                setIconPath(\"../common/TreeView/images/\");\n");
      out.write("                setTarget(\"fraInterface\");\n");
      out.write("                nodes[\"0_1\"] = \"text:业务系统首页; url:");
      out.print(sDefaultURL);
      out.write(";\";\n");
      out.write("                ");
      out.print(sMenuNodeData);
      out.write("\n");
      out.write("                nodes[\"1_60001\"] = \"text:密码修改; icon:pwd; url:../changePwd/PwdInput.jsp; method:showStation('60001');\";\n");
      out.write("                nodes[\"1_60002\"] = \"text:重新登录; icon:exit; url:../logon/logout.jsp;\";\n");
      out.write("            }\n");
      out.write("            try\n");
      out.write("            {\n");
      out.write("                window.document.getElementById(\"divMenuTree\").innerHTML = MenuTree.toString();\n");
      out.write("            }\n");
      out.write("            catch (ex) {}\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        //显示用户位置\n");
      out.write("        function showStation(sNodeCode)\n");
      out.write("        {\n");
      out.write("            var sLinkURL;\n");
      out.write("            if (sNodeCode == null || sNodeCode == \"\")\n");
      out.write("            {\n");
      out.write("                sLinkURL = \"station.jsp\";\n");
      out.write("            }\n");
      out.write("            else\n");
      out.write("            {\n");
      out.write("                sLinkURL = \"station.jsp?nodecode=\" + sNodeCode + \"&Ip=");
      out.print(sIPAddress);
      out.write("\";\n");
      out.write("            }\n");
      out.write("            try\n");
      out.write("            {\n");
      out.write("                parent.fraQuick.window.location = sLinkURL;\n");
      out.write("            }\n");
      out.write("            catch (ex) {}\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        //退出业务系统\n");
      out.write("        function destroySession()\n");
      out.write("        {\n");
      out.write("            try\n");
      out.write("            {\n");
      out.write("                window.showModelessDialog(\"close.jsp\", window, \"status=0; help=0; close=0; dialogWidth=160px; dialogHeight=100px\");\n");
      out.write("            }\n");
      out.write("            catch (ex) {}\n");
      out.write("        }\n");
      out.write("    -->\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body topmargin=\"2\" bgcolor=\"#EFF1FA\" onunload=\"destroySession()\" oncontextmenu=\"return false\" ondragstart=\"return false\">\n");
      out.write("    <div id=\"divMenuTree\"></div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("<script language=\"JavaScript\">initMenuTree();showStation();</script>\n");
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
