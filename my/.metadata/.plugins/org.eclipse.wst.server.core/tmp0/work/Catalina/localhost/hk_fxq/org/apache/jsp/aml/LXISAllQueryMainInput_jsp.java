package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.lis.pubfun.*;

public final class LXISAllQueryMainInput_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aml/../common/jsp/UsrCheck.jsp");
    _jspx_dependants.add("/aml/LXISAllQueryMainInit.jsp");
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

      out.write('\r');
      out.write('\n');

	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("  var operator = \"");
      out.print(tGI.Operator);
      out.write("\";   //记录操作员\r\n");
      out.write("  var manageCom = \"");
      out.print(tGI.ManageCom);
      out.write("\"; //记录管理机构\r\n");
      out.write("  var comcode = \"");
      out.print(tGI.ComCode);
      out.write("\"; //记录登陆机构\r\n");
      out.write("</script>\r\n");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\r\n");
      out.write("<title>可疑综合查询</title>\r\n");
      out.write("<!-- 公共引用样式 -->\r\n");
      out.write("<link href=\"../common/css/Project.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"../common/css/mulLine.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<!-- 公共引用脚本 -->\r\n");
      out.write("<script language=\"JavaScript\" src=\"../common/Calendar/Calendar.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"../common/javascript/Common.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"../common/cvar/CCodeOperate.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"../common/javascript/MulLine.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"../common/javascript/EasyQuery.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\"\r\n");
      out.write("\tsrc=\"../common/easyQueryVer3/EasyQueryVer3.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\"\r\n");
      out.write("\tsrc=\"../common/easyQueryVer3/EasyQueryCache.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"../common/javascript/VerifyInput.js\"></script>\r\n");
      out.write("<!-- 私有引用脚本 -->\r\n");
      out.write("<script language=\"JavaScript\" src=\"LXISAllQueryMain.js\"></script>\r\n");
      out.write('\r');
      out.write('\n');

/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文申请初始化
 ******************************************************************************/

      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- 调用 JSP Init 初始化页面 : 开始 -->\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    ");

        String sEndDate = PubFun.getCurrentDate();
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script language=\"JavaScript\">\r\n");
      out.write("\r\n");
      out.write("        var WaitForBeFileGrid;\r\n");
      out.write("\r\n");
      out.write("        /**\r\n");
      out.write("         * 总函数，初始化页面\r\n");
      out.write("         */\r\n");
      out.write("        function initForm()\r\n");
      out.write("        {\r\n");
      out.write("            try\r\n");
      out.write("            {\r\n");
      out.write("                initInputBox();\r\n");
      out.write("                initWaitForBeFileGrid();\r\n");
      out.write("                fm.all('ManageCom').value     = \"\";\r\n");
      out.write("                fm.all('ManageComName').value = \"\";\r\n");
      out.write("                fm.all('ManageCom').value = ");
      out.print( tGI.ManageCom );
      out.write(";\r\n");
      out.write("                showOneCodeName(\"stati\",\"ManageCom\",\"ManageComName\");                     \r\n");
      out.write("            }\r\n");
      out.write("            catch (ex)\r\n");
      out.write("            {\r\n");
      out.write("                alert(\"在 LXIHAppInit.jsp --> initForm 函数中发生异常: 初始化界面错误！\");\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**\r\n");
      out.write("         * 输入框的初始化\r\n");
      out.write("         */\r\n");
      out.write("        function initInputBox()\r\n");
      out.write("        {\r\n");
      out.write("            try\r\n");
      out.write("            {\r\n");
      out.write("                document.getElementsByName(\"EndDate\")[0].value = \"");
      out.print(sEndDate);
      out.write("\";\r\n");
      out.write("            }\r\n");
      out.write("            catch (ex)\r\n");
      out.write("            {\r\n");
      out.write("                alert(\"在 LXIHAppInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！\");\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**\r\n");
      out.write("         * 可选报文队列 MultiLine 的初始化\r\n");
      out.write("         */\r\n");
      out.write("        function initWaitForBeFileGrid()\r\n");
      out.write("        {\r\n");
      out.write("            var iArray = new Array();                           //总数组, 返回给 MultiLine 表格\r\n");
      out.write("\r\n");
      out.write("            try\r\n");
      out.write("            {\r\n");
      out.write("                iArray[0] = new Array();\r\n");
      out.write("                iArray[0][0] = \"序号\";                          //列名(顺序号, 无意义)\r\n");
      out.write("                iArray[0][1] = \"30px\";                          //列宽\r\n");
      out.write("                iArray[0][2] = 30;                              //列最大值\r\n");
      out.write("                iArray[0][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。\r\n");
      out.write("\r\n");
      out.write("                iArray[1] = new Array();\r\n");
      out.write("                iArray[1][0] = \"交易编号\";\r\n");
      out.write("                iArray[1][1] = \"140px\";\r\n");
      out.write("                iArray[1][2] = 200;\r\n");
      out.write("                iArray[1][3] = 0;\r\n");
      out.write("\r\n");
      out.write("                iArray[2] = new Array();\r\n");
      out.write("                iArray[2][0] = \"可疑交易特征\";\r\n");
      out.write("                iArray[2][1] = \"100px\";\r\n");
      out.write("                iArray[2][2] = 100;\r\n");
      out.write("                iArray[2][3] = 0;\r\n");
      out.write("\t\t\t\t        //iArray[2][4]=\"amlshadinessstamp\";                 \r\n");
      out.write("\t\t       \t    //iArray[2][9]=\"数据状态|Code:amlshadinessstamp\"; \t\r\n");
      out.write("       \t\r\n");
      out.write("                iArray[3] = new Array();\r\n");
      out.write("                iArray[3][0] = \"可疑程度\";\r\n");
      out.write("                iArray[3][1] = \"60px\";\r\n");
      out.write("                iArray[3][2] = 100;\r\n");
      out.write("                iArray[3][3] = 0;\r\n");
      out.write("\t\t\t\t        //iArray[3][4]=\"amlshadiness\";                 \r\n");
      out.write("\t\t       \t    //iArray[3][9]=\"数据状态|Code:amlshadiness\"; \t\r\n");
      out.write("\r\n");
      out.write("                iArray[4] = new Array();\r\n");
      out.write("                iArray[4][0] = \"客户号\";\r\n");
      out.write("                iArray[4][1] = \"80px\";\r\n");
      out.write("                iArray[4][2] = 200;\r\n");
      out.write("                iArray[4][3] = 0;\r\n");
      out.write("\r\n");
      out.write("                iArray[5] = new Array();\r\n");
      out.write("                iArray[5][0] = \"客户名称/姓名\";\r\n");
      out.write("                iArray[5][1] = \"100px\";\r\n");
      out.write("                iArray[5][2] = 100;\r\n");
      out.write("                iArray[5][3] = 0;\r\n");
      out.write("\r\n");
      out.write("                iArray[6] = new Array();\r\n");
      out.write("                iArray[6][0] = \"数据状态代码\";\r\n");
      out.write("                iArray[6][1] = \"60px\";\r\n");
      out.write("                iArray[6][2] = 100;\r\n");
      out.write("                iArray[6][3] = 3;\r\n");
      out.write("\t\t\t\t        //iArray[6][4]=\"amldatastate\";                 \r\n");
      out.write("\t\t       \t    //iArray[6][9]=\"数据状态|Code:amldatastate\"; \r\n");
      out.write("\t\t       \t    \r\n");
      out.write("\t\t       \t    iArray[7] = new Array();\r\n");
      out.write("                iArray[7][0] = \"数据状态\";\r\n");
      out.write("                iArray[7][1] = \"80px\";\r\n");
      out.write("                iArray[7][2] = 100;\r\n");
      out.write("                iArray[7][3] = 0;       \r\n");
      out.write("                \r\n");
      out.write("                iArray[8] = new Array();\r\n");
      out.write("                iArray[8][0] = \"证件类型\";\r\n");
      out.write("                iArray[8][1] = \"60px\";\r\n");
      out.write("                iArray[8][2] = 150;\r\n");
      out.write("                iArray[8][3] = 0;         \r\n");
      out.write("\r\n");
      out.write("                iArray[9] = new Array();\r\n");
      out.write("                iArray[9][0] = \"证件号码\";\r\n");
      out.write("                iArray[9][1] = \"120px\";\r\n");
      out.write("                iArray[9][2] = 150;\r\n");
      out.write("                iArray[9][3] = 0;\r\n");
      out.write("\r\n");
      out.write("                iArray[10] = new Array();\r\n");
      out.write("                iArray[10][0] = \"交易发生日期\";\r\n");
      out.write("                iArray[10][1] = \"80px\";\r\n");
      out.write("                iArray[10][2] = 100;\r\n");
      out.write("                iArray[10][3] = 0;\r\n");
      out.write("                //iArray[10][21] = 3;\r\n");
      out.write("                \r\n");
      out.write("                iArray[11] = new Array();\r\n");
      out.write("                iArray[11][0] = \"操作人员\";\r\n");
      out.write("                iArray[11][1] = \"60px\";\r\n");
      out.write("                iArray[11][2] = 100;\r\n");
      out.write("                iArray[11][3] = 0;\r\n");
      out.write("                \r\n");
      out.write("                iArray[12] = new Array();\r\n");
      out.write("                iArray[12][0] = \"机构代码\";\r\n");
      out.write("                iArray[12][1] = \"60px\";\r\n");
      out.write("                iArray[12][2] = 100;\r\n");
      out.write("                iArray[12][3] = 0;\r\n");
      out.write("                \r\n");
      out.write("                iArray[13] = new Array();\r\n");
      out.write("                iArray[13][0] = \"机构名称\";\r\n");
      out.write("                iArray[13][1] = \"60px\";\r\n");
      out.write("                iArray[13][2] = 100;\r\n");
      out.write("                iArray[13][3] = 0;\r\n");
      out.write("                \r\n");
      out.write("                iArray[14] = new Array();\r\n");
      out.write("                iArray[14][0] = \"提数日期\";\r\n");
      out.write("                iArray[14][1] = \"60px\";\r\n");
      out.write("                iArray[14][2] = 100;\r\n");
      out.write("                iArray[14][3] = 0;\r\n");
      out.write("                \r\n");
      out.write("                iArray[15] = new Array();\r\n");
      out.write("                iArray[15][0] = \"录入日期\";\r\n");
      out.write("                iArray[15][1] = \"60px\";\r\n");
      out.write("                iArray[15][2] = 100;\r\n");
      out.write("                iArray[15][3] = 0;\r\n");
      out.write("                \r\n");
      out.write("                iArray[16] = new Array();\r\n");
      out.write("                iArray[16][0] = \"筛选日期\";\r\n");
      out.write("                iArray[16][1] = \"60px\";\r\n");
      out.write("                iArray[16][2] = 100;\r\n");
      out.write("                iArray[16][3] = 0;             \r\n");
      out.write("                \r\n");
      out.write("            }\r\n");
      out.write("            catch (ex)\r\n");
      out.write("            {\r\n");
      out.write("                alert(\"在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化数组错误！\");\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            try\r\n");
      out.write("            {\r\n");
      out.write("                WaitForBeFileGrid = new MulLineEnter(\"fm\", \"WaitForBeFileGrid\");\r\n");
      out.write("                WaitForBeFileGrid.mulLineCount = 0;\r\n");
      out.write("                WaitForBeFileGrid.displayTitle = 1;\r\n");
      out.write("                WaitForBeFileGrid.locked = 1;\r\n");
      out.write("                WaitForBeFileGrid.hiddenPlus = 1;\r\n");
      out.write("                WaitForBeFileGrid.hiddenSubtraction = 1;\r\n");
      out.write("                WaitForBeFileGrid.canChk = 0;\r\n");
      out.write("                WaitForBeFileGrid.canSel = 1;\r\n");
      out.write("                WaitForBeFileGrid.chkBoxEventFuncName = \"\";\r\n");
      out.write("                WaitForBeFileGrid.selBoxEventFuncName = \"clickWaitForBeFileGrid\";\r\n");
      out.write("                //上面属性必须在 MulLineEnter loadMulLine 之前\r\n");
      out.write("                WaitForBeFileGrid.loadMulLine(iArray);\r\n");
      out.write("            }\r\n");
      out.write("            catch (ex)\r\n");
      out.write("            {\r\n");
      out.write("                alert(\"在 LXIHAppInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！\");\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    <!-- 调用 JSP Init 初始化页面 : 结束 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body topmargin=\"0\" onload=\"initForm()\" ondragstart=\"return false\">\r\n");
      out.write("\t<form name=\"fm\" method=\"post\" target=\"fraSubmit\">\r\n");
      out.write("\t\t<!-- 交易查询折叠展开 -->\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"common\"><img src=\"../common/images/butExpand.gif\"\r\n");
      out.write("\t\t\t\t\tstyle=\"cursor: hand\"\r\n");
      out.write("\t\t\t\t\tonclick=\"showPage(this,divWaitForBeFileSearch)\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"titleImg\">可疑综合查询</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<div id=\"divWaitForBeFileSearch\" style=\"display: ''\">\r\n");
      out.write("\t\t\t<!-- 交易查询录入表格 -->\r\n");
      out.write("\t\t\t<table class=\"common\">\r\n");
      out.write("\t\t\t\t<tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">起始日期</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"input\"><input type=\"text\" class=\"coolDatePicker\"\r\n");
      out.write("\t\t\t\t\t\tname=\"StartDate\" maxlength=\"10\" dateFormat=\"short\"\r\n");
      out.write("\t\t\t\t\t\tverify=\"起始日期|Date\"></td>\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">结束日期</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"input\"><input type=\"text\" class=\"coolDatePicker\"\r\n");
      out.write("\t\t\t\t\t\tname=\"EndDate\" maxlength=\"10\" dateFormat=\"short\"\r\n");
      out.write("\t\t\t\t\t\tverify=\"结束日期|Date\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">客户号</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"input\"><input type=\"text\" class=\"common\"\r\n");
      out.write("\t\t\t\t\t\tname=\"CSNM\"></td>\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">客户名称/姓名</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"input\"><input type=\"text\" class=\"common\"\r\n");
      out.write("\t\t\t\t\t\tname=\"CTNM\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<TD class=\"title\">可疑交易特征</TD>\r\n");
      out.write("\t\t\t\t\t<TD class=\"input\"><Input name=\"STCR\" id=\"STCR\" class=\"code\"\r\n");
      out.write("\t\t\t\t\t\tverify=\"可疑交易特征|Code:amlshadinessstamp\"\r\n");
      out.write("\t\t\t\t\t\tondblclick=\"showCodeList('amlshadinessstamp',[this]);\"\r\n");
      out.write("\t\t\t\t\t\tonkeyup=\"showCodeListKey('amlshadinessstamp',[this]);\"\r\n");
      out.write("\t\t\t\t\t\telementtype=nacessary /></TD>\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">数据状态</td>\r\n");
      out.write("\t\t\t\t\t<td class=\"input\"><Input name=\"DataState\" id=\"DataState\"\r\n");
      out.write("\t\t\t\t\t\tclass=\"code\" verify=\"数据状态|Code:amldatastate\"\r\n");
      out.write("\t\t\t\t\t\tondblclick=\"showCodeList('amldatastate',[this]);\"\r\n");
      out.write("\t\t\t\t\t\tonkeyup=\"showCodeListKey('amldatastate',[this]);\"\r\n");
      out.write("\t\t\t\t\t\telementtype=nacessary /></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">可疑程度</td>\r\n");
      out.write("\t\t\t\t\t<TD class=\"input\"><Input name=\"SDGR\" id=\"SDGR\" class=\"codeno\"\r\n");
      out.write("\t\t\t\t\t\tverify=\"可疑程度|Code:amlshadiness\"\r\n");
      out.write("\t\t\t\t\t\tondblclick=\"showCodeList('amlshadiness',[this,SDGRName],[0,1]);\"\r\n");
      out.write("\t\t\t\t\t\tonkeyup=\"showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);\" />\r\n");
      out.write("\t\t\t\t\t\t<Input class=codename name=SDGRName readOnly elementtype=nacessary />\r\n");
      out.write("\t\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">管理机构</td>\r\n");
      out.write("\t\t\t\t\t<TD class=\"input\"><Input name=\"ManageCom\" id=\"ManageCom\"\r\n");
      out.write("\t\t\t\t\t\tclass=\"codeno\" verify=\"管理机构|Code:station\"\r\n");
      out.write("\t\t\t\t\t\tondblclick=\"showCodeList('station',[this,ManageComName],[0,1]);\"\r\n");
      out.write("\t\t\t\t\t\tonkeyup=\"showCodeListKey('station',[this,ManageComName],[0,1]);\" />\r\n");
      out.write("\t\t\t\t\t\t<Input class=codename name=ManageComName readOnly\r\n");
      out.write("\t\t\t\t\t\telementtype=nacessary /></TD>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<!-- 提交数据操作按钮 -->\r\n");
      out.write("\t\t\t<input type=\"button\" class=\"cssButton\" value=\" 查 询 \"\r\n");
      out.write("\t\t\t\tonclick=\"queryWaitForBeFileGrid()\">\r\n");
      out.write("\t\t\t<!--\r\n");
      out.write("            <input type=\"button\" class=\"cssButton\" value=\" 导 出 \" onclick=\"turnPageWaitForBeFileGrid.makeExcel();\">\r\n");
      out.write("            -->\r\n");
      out.write("\t\t\t<input type=\"button\" class=\"cssButton\" value=\" 导 出 \"\r\n");
      out.write("\t\t\t\tonclick=\"GoToExcel()\">\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- 交易信息折叠展开 -->\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"common\"><img src=\"../common/images/butExpand.gif\"\r\n");
      out.write("\t\t\t\t\tstyle=\"cursor: hand\" onclick=\"showPage(this,divWaitForBeFileGrid)\"></td>\r\n");
      out.write("\t\t\t\t<td class=\"titleImg\">可疑综合查询结果</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<!-- 交易信息展现表格 -->\r\n");
      out.write("\t\t<div id=\"divWaitForBeFileGrid\" style=\"display: ''\">\r\n");
      out.write("\t\t\t<table class=\"common\">\r\n");
      out.write("\t\t\t\t<tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td><span id=\"spanWaitForBeFileGrid\"></span></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<!-- 交易信息结果翻页 -->\r\n");
      out.write("\t\t\t<div id=\"divTurnPageWaitForBeFileGrid\" align=\"center\"\r\n");
      out.write("\t\t\t\tstyle=\"display: 'none'\">\r\n");
      out.write("\t\t\t\t<input type=\"button\" class=\"cssButton\" value=\"首  页\"\r\n");
      out.write("\t\t\t\t\tonclick=\"turnPageWaitForBeFileGrid.firstPage()\"> <input\r\n");
      out.write("\t\t\t\t\ttype=\"button\" class=\"cssButton\" value=\"上一页\"\r\n");
      out.write("\t\t\t\t\tonclick=\"turnPageWaitForBeFileGrid.previousPage()\"> <input\r\n");
      out.write("\t\t\t\t\ttype=\"button\" class=\"cssButton\" value=\"下一页\"\r\n");
      out.write("\t\t\t\t\tonclick=\"turnPageWaitForBeFileGrid.nextPage()\"> <input\r\n");
      out.write("\t\t\t\t\ttype=\"button\" class=\"cssButton\" value=\"尾  页\"\r\n");
      out.write("\t\t\t\t\tonclick=\"turnPageWaitForBeFileGrid.lastPage()\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- 提交数据操作按钮 -->\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<!-- 查看非可疑原因 -->\r\n");
      out.write("\t\t<div id=\"divreasonofcancelreport\" style=\"display: 'none'\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td class=\"common\"><img src=\"../common/images/butExpand.gif\"\r\n");
      out.write("\t\t\t\t\t\tstyle=\"cursor: hand\" onclick=\"showPage(this,divreasonofcancel)\"></td>\r\n");
      out.write("\t\t\t\t\t<td class=\"titleImg\">非可疑原因</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t<div id=\"divreasonofcancel\" style=\"display: ''\">\r\n");
      out.write("\t\t\t\t<div id=\"divfileofcancel\" style=\"display: 'none'\">\r\n");
      out.write("\t\t\t\t\t<INPUT class=cssButton VALUE=\"原因附件下载\" id=\"download\" name=\"download\"\r\n");
      out.write("\t\t\t\t\t\tTYPE=button onclick=\"getFile();\" /> <br />\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<table class=\"common\">\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td class=\"input\" colspan=8><textarea style=\"width: 97%\"\r\n");
      out.write("\t\t\t\t\t\t\t\tname=\"reason\" id=\"reason\" class=\"common\" /></textarea></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- 获取数据的隐藏域 -->\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"Operation\"> <input type=\"hidden\"\r\n");
      out.write("\t\t\tid=\"FileName\" name=\"FileName\"> <input type=\"hidden\"\r\n");
      out.write("\t\t\tid=\"DisplayFileName\" name=\"DisplayFileName\">\r\n");
      out.write("\t\t<!--\r\n");
      out.write("    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\r\n");
      out.write("                      大额交易明细信息控件\r\n");
      out.write("    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\r\n");
      out.write("-->\r\n");
      out.write("\t\t<INPUT class=cssButton VALUE=\"查看交易信息\" name=\"query\" TYPE=button\r\n");
      out.write("\t\t\tonclick=\"return GoToDetailInput(this.name);\" />\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<!-- 通用下拉信息列表 -->\r\n");
      out.write("\t<span id=\"spanCode\" style=\"display: none; position: absolute;\"></span>\r\n");
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
