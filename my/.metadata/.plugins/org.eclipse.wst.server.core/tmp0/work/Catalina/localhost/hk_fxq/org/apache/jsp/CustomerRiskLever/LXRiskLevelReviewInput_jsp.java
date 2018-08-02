package org.apache.jsp.CustomerRiskLever;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.lis.pubfun.*;

public final class LXRiskLevelReviewInput_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/CustomerRiskLever/../common/jsp/UsrCheck.jsp");
    _jspx_dependants.add("/CustomerRiskLever/LXRiskLevelReviewInit.jsp");
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
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\r\n");
      out.write("    <title>高风险客户信息查询</title>\r\n");
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
      out.write("    <script language=\"JavaScript\" src=\"LXRiskLevelReviewInput.js\"></script>\r\n");
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
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script language=\"JavaScript\">\r\n");
      out.write("\r\n");
      out.write("    var WaitForBeFileGrid;\r\n");
      out.write("\t\tvar operator = \"");
      out.print(tGI.Operator);
      out.write("\";   \r\n");
      out.write("\t\tvar manageCom = \"");
      out.print(tGI.ManageCom);
      out.write("\"; \r\n");
      out.write("\t\tvar comcode = \"");
      out.print(tGI.ComCode);
      out.write("\";    \r\n");
      out.write("    /**\r\n");
      out.write("     * 总函数，初始化页面\r\n");
      out.write("     */\r\n");
      out.write("    function initForm()\r\n");
      out.write("    {\r\n");
      out.write("        try\r\n");
      out.write("        {\r\n");
      out.write("            initCustomerGrid();\r\n");
      out.write("        }\r\n");
      out.write("        catch (ex)\r\n");
      out.write("        {\r\n");
      out.write("            alert(\"在 LXRiskLevelReviewInit.jsp --> initForm 函数中发生异常: 初始化界面错误！\");\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    /**\r\n");
      out.write("     * 可选报文队列 MultiLine 的初始化\r\n");
      out.write("     */\r\n");
      out.write("     function initCustomerGrid()\r\n");
      out.write("     {\r\n");
      out.write("         var iArray = new Array();                           //总数组, 返回给 MultiLine 表格\r\n");
      out.write("\r\n");
      out.write("         try\r\n");
      out.write("         {\r\n");
      out.write("         \t\tvar i = 0;\r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"序号\";                          //列名(顺序号, 无意义)\r\n");
      out.write("             iArray[i][1] = \"30px\";                          //列宽\r\n");
      out.write("             iArray[i][2] = 30;                              //列最大值\r\n");
      out.write("             iArray[i++][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。\r\n");
      out.write("\r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"客户号\";//列名\r\n");
      out.write("             iArray[i][1] = \"70px\";//列宽，如果设置为0，该列隐藏\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;// iArray[1][3]=3;  0和1表示是否容许输入 2表示代码选择，3表示这一列是隐藏的，\r\n");
      out.write("                  \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"客户名\";\r\n");
      out.write("             iArray[i][1] = \"50px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"集体合同号\";\r\n");
      out.write("             iArray[i][1] = \"70px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("\r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"审核状态\";\r\n");
      out.write("             iArray[i][1] = \"50px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();//个合同号\r\n");
      out.write("             iArray[i][0] = \"合同号\";\r\n");
      out.write("             iArray[i][1] = \"110px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("\r\n");
      out.write("             iArray[i] = new Array();//个合同号\r\n");
      out.write("             iArray[i][0] = \"客户类型\";\r\n");
      out.write("             iArray[i][1] = \"55px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"自动评分风险得分\";\r\n");
      out.write("             iArray[i][1] = \"100px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("\r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"自动评分风险等级\";\r\n");
      out.write("             iArray[i][1] = \"100px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"机构\";\r\n");
      out.write("             iArray[i][1] = \"80px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("\r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"操作员\";\r\n");
      out.write("             iArray[i][1] = \"40px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"交易发生日期\";\r\n");
      out.write("             iArray[i][1] = \"75px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("\r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"提取日期\";\r\n");
      out.write("             iArray[i][1] = \"75px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 0;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"合同类型\";\r\n");
      out.write("             iArray[i][1] = \"55px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 3;\r\n");
      out.write("             \r\n");
      out.write("             iArray[i] = new Array();\r\n");
      out.write("             iArray[i][0] = \"流水号\";\r\n");
      out.write("             iArray[i][1] = \"80px\";\r\n");
      out.write("             iArray[i][2] = 100;\r\n");
      out.write("             iArray[i][7] = \"checkBoxNext\";\r\n");
      out.write("             iArray[i++][3] = 3;//隐藏\r\n");
      out.write("             \r\n");
      out.write("             CustomerGrid = new MulLineEnter(\"fm\", \"CustomerGrid\");\r\n");
      out.write("             CustomerGrid.mulLineCount = 0;\r\n");
      out.write("             CustomerGrid.displayTitle = 1;\r\n");
      out.write("             CustomerGrid.locked = 1;\r\n");
      out.write("             CustomerGrid.hiddenPlus = 1;//隐藏加号\r\n");
      out.write("             CustomerGrid.hiddenSubtraction = 1;//隐藏减号\r\n");
      out.write("             CustomerGrid.canChk = 0;//1  复选框 1：显示checkBox列;0：不显示复\r\n");
      out.write("             CustomerGrid.canSel = 1;//0  单选框 1 显示 ;0 隐藏（缺省值）\r\n");
      out.write("             CustomerGrid.chkBoxEventFuncName = \"\";\r\n");
      out.write("             CustomerGrid.selBoxEventFuncName = \"\";\r\n");
      out.write("             CustomerGrid.loadMulLine(iArray);\r\n");
      out.write("         }\r\n");
      out.write("         catch (ex)\r\n");
      out.write("         {\r\n");
      out.write("             alert(\"在 LXRiskLevelReviewInit.jsp --> initCustomerGrid 函数中发生异常: 初始化界面错误！\");\r\n");
      out.write("         }\r\n");
      out.write("     }\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    <!-- 调用 JSP Init 初始化页面 : 结束 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<!-- <body topmargin=\"0\" onload=\"initForm()\" ondragstart=\"return false\"> -->\r\n");
      out.write("<body onload=\"initForm(); initElementtype();\" >\r\n");
      out.write("    <form name=\"fm\" method=\"post\" target=\"fraSubmit\">\r\n");
      out.write("        <!-- 交易查询折叠展开 -->\r\n");
      out.write("        <table>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"common\"><img src=\"../common/images/butExpand.gif\" style=\"cursor:hand\" onclick=\"showPage(this,divWaitForBeFileSearch)\"></td>\r\n");
      out.write("                <td class=\"titleImg\">复评信息查询</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <div id=\"divWaitForBeFileSearch\" style=\"display:''\">\r\n");
      out.write("            <!-- 交易查询录入表格 -->\r\n");
      out.write("            <table class=\"common\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                   <TD  class = title>\r\n");
      out.write("                                                交易发生日期\r\n");
      out.write("                  </TD>\r\n");
      out.write("                  <TD  class= input>\r\n");
      out.write("                    <Input class= \"coolDatePicker\" dateFormat=\"short\" name=\"StartDate\" verify=\"交易发生日期|DATE\" >\r\n");
      out.write("                    </TD>\r\n");
      out.write("                   <td class=\"title\">初评等级</td>\r\n");
      out.write("                    <td  class= input><Input class=codeno name=\"CustomerLevelCode\" readonly \r\n");
      out.write("                    onDblClick=\"return showCodeList('customerrisklevel',[this,CustomerLevel],[0,1]);\" \r\n");
      out.write("                    onKeyUp=\"return showCodeListKey('customerrisklevel',[this,CustomerLevel],[0,1]);\"\r\n");
      out.write("                    /><input class=codename name=\"CustomerLevel\" readonly=true></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                \r\n");
      out.write("                 <tr class=\"common\">\r\n");
      out.write("\t\t\t\t\t<td class=\"title\">客户号</td>\r\n");
      out.write("                    <td class=\"input\"><input type=\"text\" class=\"common\" name=\"CustomerNo\"></td>\r\n");
      out.write("                     <td class=\"title\">客户名</td>\r\n");
      out.write("                    <td class=\"input\"><input type=\"text\" class=\"common\" name=\"CustomerName\"></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <!-- 提交数据操作按钮 -->\r\n");
      out.write("            <input type=\"hidden\" name=\"Operation\">\r\n");
      out.write("        \t<input type=\"hidden\" name=\"UserCode\" value=\"");
      out.print(OperatorCodee);
      out.write("\">\r\n");
      out.write("        \t<input type=\"hidden\" name=\"record\" value=\"01\">\r\n");
      out.write("        \t<!-- <input type=\"hidden\" name=\"record\" value=\"未复评\"> -->\r\n");
      out.write("        \t<input type=\"hidden\" name=\"record2\" value=\"\">\r\n");
      out.write("            <input type=\"button\" class=\"cssButton\" value=\" 查 询 \" onclick=\"queryCustomerGrid()\">\r\n");
      out.write("           \r\n");
      out.write("            <INPUT VALUE=\"重  置\" name=ExcelButton TYPE=button class=cssbutton onclick=\"setEmpty();\"> \r\n");
      out.write("             \r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- 交易信息折叠展开 -->\r\n");
      out.write("        <table>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"common\"><img src=\"../common/images/butExpand.gif\" style=\"cursor:hand\" onclick=\"showPage(this,divWaitForBeFileGrid)\"></td>\r\n");
      out.write("                <td class=\"titleImg\">复评信息查询结果</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <!-- 交易信息展现表格 -->\r\n");
      out.write("        <div id=\"divCustomerGrid\" style=\"display:''\">\r\n");
      out.write("            <table class=\"common\">\r\n");
      out.write("                <tr class=\"common\">\r\n");
      out.write("                    <td><span id=\"spanCustomerGrid\"></span></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <!-- 交易信息结果翻页 -->\r\n");
      out.write("            <div id=\"divTurnPageCustomerGrid\" align=\"center\" style=\"display:'none'\">\r\n");
      out.write("                <input type=\"button\" class=\"cssButton\" value=\"首  页\" onclick=\"turnPageCustomerGrid.firstPage()\">\r\n");
      out.write("                <input type=\"button\" class=\"cssButton\" value=\"上一页\" onclick=\"turnPageCustomerGrid.previousPage()\">\r\n");
      out.write("                <input type=\"button\" class=\"cssButton\" value=\"下一页\" onclick=\"turnPageCustomerGrid.nextPage()\">\r\n");
      out.write("                <input type=\"button\" class=\"cssButton\" value=\"尾  页\" onclick=\"turnPageCustomerGrid.lastPage()\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div><br/>\r\n");
      out.write("        <div  id= \"divput\" style= \"display:''\" >\r\n");
      out.write("\t\t\t<INPUT class=cssButton VALUE=\" 复评  \" name=\"check\" TYPE=button onclick=\"checkInfo();\" />\r\n");
      out.write("\t\t\t<INPUT class=cssButton name=\"batchReview\" VALUE=\"批量复评 \"  TYPE=button onclick=\"batchReviewInfo();\">\r\n");
      out.write("\t\t</div>\r\n");
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
