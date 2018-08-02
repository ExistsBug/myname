package org.apache.jsp.CustomerRiskLever;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.lis.pubfun.*;

public final class LXReviewInfoInput_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/CustomerRiskLever/../common/jsp/UsrCheck.jsp");
    _jspx_dependants.add("/CustomerRiskLever/LXReviewInfoInit.jsp");
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

      out.write('\r');
      out.write('\n');

/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 
 * @version  : 1.00
 * @date     : 2007-11-06
 * @direction: 可疑交易大额审核
 ******************************************************************************/

      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    ");

        GlobalInput tGe = new GlobalInput();
        tGe=(GlobalInput)session.getValue("GI");
        String OperatorCodee=tGe.Operator;
        System.out.println("OperatorCode======"+OperatorCodee);
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=GBK\">\r\n");
      out.write("    <title>复评确认</title>\r\n");
      out.write("    <!-- 公共引用样式 -->\r\n");
      out.write("    <link href=\"../common/css/Project.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"../common/css/mulLine.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("    <!-- 公共引用脚本 -->\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/Calendar/Calendar.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/javascript/Common.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/cvar/CCodeOperate.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/javascript/MulLine.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/javascript/EasyQuery.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/easyQueryVer3/EasyQueryVer3.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/easyQueryVer3/EasyQueryCache.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"../common/javascript/VerifyInput.js\"></script>\r\n");
      out.write("    <script language=\"JavaScript\" src=\"LXPubFun.js\"></script>\r\n");
      out.write("    <!-- 私有引用脚本 -->\r\n");
      out.write("    <script language=\"JavaScript\" src=\"LXReviewInfoInput.js\"></script>\r\n");
      out.write("    ");
      out.write('\r');
      out.write('\n');

/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 
 * @version  : 1.00
 * @date     : 2007-11-06
 * @direction: 可疑交易大额审核初始化界面
 ******************************************************************************/

      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=gb2312\" />\r\n");
      out.write("\r\n");
      out.write("    <!-- 调用 JSP Init 初始化页面 : 开始 -->\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    ");

        String sEndDate = PubFun.getCurrentDate();
        GlobalInput tGI = new GlobalInput();
          tGI=(GlobalInput)session.getValue("GI");
          String OperatorCode=tGI.Operator;
          System.out.println("OperatorCode======"+OperatorCode);
    
      out.write('\r');
      out.write('\n');
      out.write('	');

	   String contno1 = request.getParameter("contno");
	   //System.out.print(contno1+"LXReviewInfoInit.jsp");
	   String autoScore = request.getParameter("autoScore");
	   String autoLevel = request.getParameter("autoLevel"); 
	   autoLevel = new String(autoLevel.getBytes("ISO-8859-1"),"GBK");
	   String customerNo = request.getParameter("customerNo");
	   String poltype = request.getParameter("poltype");
	   String no = request.getParameter("no");
	  // System.out.println("LXReviewInfoInit.jsp页面接收 no============="+no);
	   //System.out.print(autoLevel+"=============");
	
      out.write("\r\n");
      out.write("    <script language=\"JavaScript\">\r\n");
      out.write("\r\n");
      out.write("        var WaitForBeFileGrid;\r\n");
      out.write("\t\tvar operator = \"");
      out.print(tGI.Operator);
      out.write("\";   \r\n");
      out.write("\t\tvar manageCom = \"");
      out.print(tGI.ManageCom);
      out.write("\"; \r\n");
      out.write("\t\tvar comcode = \"");
      out.print(tGI.ComCode);
      out.write("\"; \r\n");
      out.write("\t\tvar contno = \"");
      out.print(contno1);
      out.write("\";\r\n");
      out.write("\t\tvar autoScore = \"");
      out.print(autoScore);
      out.write("\";\r\n");
      out.write("\t\tvar autoLevel = \"");
      out.print(autoLevel);
      out.write("\";\r\n");
      out.write("\t\tvar customerNo = \"");
      out.print(customerNo);
      out.write("\"\r\n");
      out.write("\t\tvar poltype= \"");
      out.print(poltype);
      out.write("\"\r\n");
      out.write("\t\tvar no= \"");
      out.print(no);
      out.write("\"\r\n");
      out.write("\t\t//alert(\"LXReviewInfoInit.jsp页面接收 no=============\"+no); \r\n");
      out.write("    /**\r\n");
      out.write("     * 总函数，初始化页面\r\n");
      out.write("     */\r\n");
      out.write("    function initForm()\r\n");
      out.write("    {\r\n");
      out.write("       //alert(\"test\");\r\n");
      out.write("        fm.all('autoScore').value = autoScore;\r\n");
      out.write("        fm.all('autoLevel').value = autoLevel;\r\n");
      out.write("        fm.all('customerNo').value = customerNo;\r\n");
      out.write("        fm.all('contno').value = contno;\r\n");
      out.write("        fm.all('poltype').value = poltype;\r\n");
      out.write("        fm.all('no').value = no;\r\n");
      out.write("        //alert(autoScore);\r\n");
      out.write("       // alert(autoLevel);\r\n");
      out.write("       // alert(customerNo);\r\n");
      out.write("        //alert(\"contno =\"+contno);\r\n");
      out.write("       // alert(\"poltype =\"+poltype);\r\n");
      out.write("       // var ss = ");
      out.print(request.getParameter("contno"));
      out.write(";\r\n");
      out.write("        //alert(\"ss==\"+ss);\r\n");
      out.write("    }\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    <!-- 调用 JSP Init 初始化页面 : 结束 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"initForm(); initElementtype();\" >\r\n");
      out.write("    <form name=\"fm\" action=\"./LXReviewInfoSave.jsp\" method=\"post\" target=\"fraSubmit\">\r\n");
      out.write("        <!-- 交易查询折叠展开 -->\r\n");
      out.write("        <table>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"common\"><img src=\"../common/images/butExpand.gif\" style=\"cursor:hand\" onclick=\"showPage(this,divWaitForBeFileSearch)\"></td>\r\n");
      out.write("                <td class=\"titleImg\">复评</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <div id=\"divWaitForBeFileSearch\" style=\"display:''\">\r\n");
      out.write("            <!-- 交易查询录入表格 -->\r\n");
      out.write("            <table class=\"common\">\r\n");
      out.write("            \t<tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">自动评分风险得分</td>\r\n");
      out.write("                    <td class=\"input\"><input type=\"text\" class=\"common\" name=\"autoScore\" readonly></td>\r\n");
      out.write("                    <td class=\"title\">自动评分风险等级</td>\r\n");
      out.write("                    <td class=\"input\"><input type=\"text\" class=\"common\" name=\"autoLevel\" readonly></td>\t\r\n");
      out.write("                </tr>\r\n");
      out.write("                 <tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">复评风险得分</td>\r\n");
      out.write("                    <td class=\"input\"><input type=\"text\" class=\"common\" name=\"reviewScore\" onblur=\"calLevel();\" elementtype=nacessary verify=\"复评风险得分|NOTNULL&NUM\" ></td>\r\n");
      out.write("                    <td class=\"title\">复评风险等级</td>\r\n");
      out.write("                    <td class=\"input\"><input type=\"text\" class=\"common\" name=\"reviewLevel\" readonly></td>\t\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"title\" />\r\n");
      out.write("\t\t\t\t\t\t   复评备注\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"input\" colspan=8 >\r\n");
      out.write("\t\t\t\t\t\t\t<textarea style=\"width: 98%;height:50\" name=\"reviewRemark\" id=\"reviewRemark\"\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"common\" verify=\"复评备注|len<=200\"\r\n");
      out.write("\t\t\t\t\t\t\t/></textarea> <!-- elementtype=nacessary 加上就是必填项 -->\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <!-- 提交数据操作按钮 -->\r\n");
      out.write("            <input type=\"hidden\" name=\"Operation\">\r\n");
      out.write("        \t<input type=\"hidden\" name=\"UserCode\" value=\"");
      out.print(OperatorCodee);
      out.write("\">\r\n");
      out.write("        \t<input type=\"hidden\" name=\"record\" value=\"01\">\r\n");
      out.write("        \t<input type='hidden' name=\"record2\" value=\"\">\r\n");
      out.write("        \t<input type=\"hidden\" name=\"contno\" value=\"\">\r\n");
      out.write("        \t<input type='hidden' name=\"customerNo\" value=\"\">\r\n");
      out.write("        \t<input type='hidden' name=\"poltype\" value=\"\">\r\n");
      out.write("        \t<input type='hidden' name=\"no\" value=\"\">\r\n");
      out.write("            <input type=\"button\" class=\"cssButton\" value=\" 确认复评 \" onclick=\"reviewSure();\">\r\n");
      out.write("            <INPUT VALUE=\"取  消\" name=CancelButton TYPE=button class=cssbutton onclick=\"goParent();\">         \r\n");
      out.write("        </div>\r\n");
      out.write("    </form>\r\n");
      out.write("    <!-- 通用下拉信息列表 -->\r\n");
      out.write("    <span id=\"spanCode\" style=\"display:none; position:absolute; slategray\"></span>\r\n");
      out.write("</body>\r\n");
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
