package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import com.sinosoft.lis.pubfun.*;

public final class LXISTradeContMain_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/aml/../common/jsp/UsrCheck.jsp");
    _jspx_dependants.add("/aml/LXISTradeContMainInit.jsp");
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

      out.write("\n");
      out.write("<html>\n");

//程序名称：
//程序功能：
//创建日期：2002-08-21 09:25:18
//创建人 ：HX
//更新记录： 更新人  更新日期   更新原因/内容

      out.write('\n');
      out.write('\n');

  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");

      out.write("\n");
      out.write("<script>\n");
      out.write("  var operator = \"");
      out.print(tGI.Operator);
      out.write("\";   //记录操作员\n");
      out.write("  var manageCom = \"");
      out.print(tGI.ManageCom);
      out.write("\"; //记录管理机构\n");
      out.write("  var comcode = \"");
      out.print(tGI.ComCode);
      out.write("\";     //记录登陆机构\n");
      out.write("</script>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=GBK\" />\n");
      out.write("<SCRIPT src=\"../common/javascript/Common.js\" ></SCRIPT>\n");
      out.write("<SCRIPT src=\"../common/javascript/MulLine.js\"></SCRIPT>\n");
      out.write("<SCRIPT src=\"../common/cvar/CCodeOperate.js\"></SCRIPT>\n");
      out.write("<SCRIPT src=\"../common/Calendar/Calendar.js\"></SCRIPT>\n");
      out.write("<SCRIPT src=\"../common/javascript/VerifyInput.js\"></SCRIPT>\n");
      out.write("<SCRIPT src=\"../common/easyQueryVer3/EasyQueryVer3.js\"></SCRIPT>\n");
      out.write("<SCRIPT src=\"../common/easyQueryVer3/EasyQueryCache.js\"></SCRIPT>\n");
      out.write("<SCRIPT src=\"LXISTradeContMain.js\"></SCRIPT>\n");
      out.write("<LINK href=\"../common/css/Project.css\" rel=stylesheet type=text/css>\n");
      out.write("<LINK href=\"../common/css/mulLine.css\" rel=stylesheet type=text/css>\n");
      out.write('\n');
      out.write('\r');
      out.write('\n');

//程序名称：OrphanPolOutInit.jsp
//程序功能：
//创建日期：2005-05-26 15:39:06
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容

      out.write("\r\n");
      out.write("<!--用户校验类-->\r\n");
      out.write("<SCRIPT src=\"../common/javascript/Common.js\"></SCRIPT>\r\n");

    //添加页面控件的初始化。

    String tDealNo  = request.getParameter("DealNo") ;
    
   	String tCSNM = request.getParameter("CSNM");
   	System.out.println(tCSNM);
	  String tRiskCode = request.getParameter("RiskCode");
	  if(tCSNM == null || tCSNM.equals(""))
	  {
	  tCSNM="";
	  }
	  System.out.println(tCSNM);
	  if(tRiskCode==null||tRiskCode.equals("")){
	  tRiskCode="";}
	  
	   	String Oper = "";
	Oper = request.getParameter("oper");
	if (Oper==null||Oper=="" || "undefined".equals(Oper))
  		Oper = "query";
	else 
  		Oper = new String(request.getParameter("oper"));

      out.write("                            \r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("var tDealNo = '");
      out.print(tDealNo);
      out.write("' ;\r\n");
      out.write("var tCSNM = '");
      out.print(tCSNM);
      out.write("' ;\r\n");
      out.write("var tRiskCode = '");
      out.print(tRiskCode);
      out.write("' ;\r\n");
      out.write("var oper = '");
      out.print(Oper);
      out.write("' ;\r\n");
      out.write("function initForm()\r\n");
      out.write("{\r\n");
      out.write("  try\r\n");
      out.write("  { \r\n");
      out.write("  \tinitInpBox(tDealNo,tCSNM,tRiskCode);\r\n");
      out.write("\r\n");
      out.write("    initIntBox(tDealNo,tCSNM,tRiskCode);\r\n");
      out.write("  }\r\n");
      out.write("  catch(re)\r\n");
      out.write("  {\r\n");
      out.write("    alert(\"在LXISTradeContMain.jsp-->InitForm函数中发生异常:初始化界面错误!\");\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//查询合同信息\r\n");
      out.write("function initInpBox(tDealNo,tCSNM,tRiskCode){\r\n");
      out.write("\ttry{\r\n");
      out.write("\t\tif (tDealNo != null && tDealNo != \"\" && tRiskCode != null && tRiskCode != \"\" && tCSNM != null && tCSNM != \"\"){\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar strSQL = \"(select DealNo, CSNM, ISTP, (select b.codename from ldcode b where ISTP = b.code and b.codetype='amlrisktype'), \"\r\n");
      out.write("\t\t\t\t+ \" ISNM, RiskCode, \"\r\n");
      out.write("\t\t\t\t+ \" ISPS, ISOG, ISAT, \"\r\n");
      out.write("\t\t\t\t+ \" ISFE, ISPT, (select b.codename from ldcode b where ISPT = b.code and b.codetype='amlpayintv'), CTES \"\r\n");
      out.write("\t\t\t\t+ \" from LXISTradeCont a where a.DealNo = '\" + tDealNo + \"' and a.CSNM ='\" + tCSNM +\"' and a.RiskCode ='\" + tRiskCode +\"')\";\r\n");
      out.write("\t\t\tvar strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);\r\n");
      out.write("\t\t\t//判断是否查询成功\r\n");
      out.write("\t\t\tif (!strQueryResult) {\r\n");
      out.write("\t\t\t//\talert(\"合同不存在！\");\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse{\r\n");
      out.write("\t\t\t\t//查询成功则拆分字符串，返回二维数组\r\n");
      out.write("\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\tvar arrSelected = decodeEasyQueryResult(strQueryResult);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tfm.all(\"DealNo\").value = arrSelected[0][0];\r\n");
      out.write("\t\t\t\tfm.all(\"CSNM\").value = arrSelected[0][1];\r\n");
      out.write("\t\t\t\tfm.all(\"ISTP\").value = arrSelected[0][2];\r\n");
      out.write("\t\t\t\tfm.all(\"ISTPName\").value = arrSelected[0][3];\r\n");
      out.write("\t\t\t\tfm.all(\"ISNM\").value = arrSelected[0][4];\r\n");
      out.write("\t\t\t\tfm.all(\"RiskCode\").value =  arrSelected[0][5];\r\n");
      out.write("\t\t\t\tfm.all(\"ISPS\").value = arrSelected[0][6];\r\n");
      out.write("//\t\t\t\tfm.all(\"ITNM\").value = arrSelected[0][7];\r\n");
      out.write("\t\t\t\tfm.all(\"ISOG\").value = arrSelected[0][7];\r\n");
      out.write("\t\t\t\tfm.all(\"ISAT\").value = arrSelected[0][8];\r\n");
      out.write("\t\t\t\tfm.all(\"ISFE\").value = arrSelected[0][9];\r\n");
      out.write("\t\t\t\tfm.all(\"ISPT\").value = arrSelected[0][10];\r\n");
      out.write("\t\t\t\tfm.all(\"ISPTName\").value = arrSelected[0][11];\r\n");
      out.write("\t\t\t\tfm.all(\"CTES\").value = arrSelected[0][12];\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tfm.all(\"DealNo\").value = tDealNo;\r\n");
      out.write("\t\t\t\tfm.all(\"CSNM\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISTP\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISTPName\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISNM\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"RiskCode\").value =  \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISPS\").value = \"\";\r\n");
      out.write("//\t\t\t\tfm.all(\"ITNM\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISOG\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISAT\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISFE\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISPT\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"ISPTName\").value = \"\";\r\n");
      out.write("\t\t\t\tfm.all(\"CTES\").value = \"\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}catch(ex){\r\n");
      out.write("\t\talert(ex);\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//初始化被保人信息\r\n");
      out.write("function initIntBox(tDealNo,tCSNM,tRiskCode){\r\n");
      out.write("\tinitTasksGrid();\r\n");
      out.write("\tvar strSQL = \"select a.DealNo, a.CSNM, a.ISNM, a.RiskCode, a.InsuredNo, a.ISTN, (select codename from ldcode b where codetype = 'amlidtype' and b.code = a.IITP),a.ISID,a.RLTP from LXISTradeInsured a where a.DealNo = '\" + tDealNo + \"' and a.CSNM ='\" + tCSNM +\"' and a.RiskCode ='\" + tRiskCode +\"'\";\r\n");
      out.write("\tturnPage3.queryModal(strSQL, TasksGrid);\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("// 被保人信息\r\n");
      out.write("function initTasksGrid()\r\n");
      out.write("{                               \r\n");
      out.write("\tvar iArray = new Array();      \r\n");
      out.write("    try\r\n");
      out.write("    {\r\n");
      out.write("\t\tiArray[0]=new Array();\r\n");
      out.write("\t\tiArray[0][0]=\"序号\";   \t\t\t//列名（此列为顺序号，列名无意义，而且不显示）\r\n");
      out.write("\t\tiArray[0][1]=\"30px\"; \t     \t\t//列宽\r\n");
      out.write("\t\tiArray[0][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[0][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\r\n");
      out.write("\t\tiArray[1]=new Array();\r\n");
      out.write("\t\tiArray[1][0]=\"交易编号\";    \t\t  //列名\r\n");
      out.write("\t\tiArray[1][1]=\"110px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[1][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[1][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的\r\n");
      out.write("\r\n");
      out.write("\t\tiArray[2]=new Array();\r\n");
      out.write("\t\tiArray[2][0]=\"保险合同号\";    \t\t  //列名\r\n");
      out.write("\t\tiArray[2][1]=\"60px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[2][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[2][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的\r\n");
      out.write("\r\n");
      out.write("\t\tiArray[3]=new Array();\r\n");
      out.write("\t\tiArray[3][0]=\"保险名称\";    \t\t  //列名\r\n");
      out.write("\t\tiArray[3][1]=\"60px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[3][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[3][3]=0; //是否允许输入,1表示允许，0表示不允许,2表示代码选择，3表示该列是隐藏的\r\n");
      out.write("\r\n");
      out.write("\t\tiArray[4]=new Array();\r\n");
      out.write("\t\tiArray[4][0]=\"保险编码\";   \t\t  //列名\r\n");
      out.write("\t\tiArray[4][1]=\"60px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[4][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[4][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\r\n");
      out.write("\t\tiArray[5]=new Array();\r\n");
      out.write("\t\tiArray[5][0]=\"被保险人编码\";\t   \t\t//列名\r\n");
      out.write("\t\tiArray[5][1]=\"0px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[5][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[5][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\t\t     \r\n");
      out.write("\r\n");
      out.write("\t\tiArray[6]=new Array();\r\n");
      out.write("\t\tiArray[6][0]=\"被保险人姓名\";\t   \t\t//列名\r\n");
      out.write("\t\tiArray[6][1]=\"60px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[6][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[6][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\r\n");
      out.write("\t\tiArray[7]=new Array();\r\n");
      out.write("\t\tiArray[7][0]=\"被保险人身份证件类型\";\t   \t\t//列名\r\n");
      out.write("\t\tiArray[7][1]=\"120px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[7][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[7][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tiArray[8]=new Array();\r\n");
      out.write("\t\tiArray[8][0]=\"被保险人身份证件号码\";\t   \t\t//列名\r\n");
      out.write("\t\tiArray[8][1]=\"100px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[8][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[8][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tiArray[9]=new Array();\r\n");
      out.write("\t\tiArray[9][0]=\"投保人与被保险人的关系\";\t   \t\t//列名\r\n");
      out.write("\t\tiArray[9][1]=\"100px\";\t\t\t//列宽\r\n");
      out.write("\t\tiArray[9][2]=100;\t\t\t//列最大值\r\n");
      out.write("\t\tiArray[9][3]=0;  \t\t\t//是否允许输入,1表示允许，0表示不允许\r\n");
      out.write("\r\n");
      out.write("\t\tTasksGrid = new MulLineEnter( \"fm\" , \"TasksGrid\" ); \r\n");
      out.write("\t\t//这些属性必须在loadMulLine前\r\n");
      out.write("\t    TasksGrid.displayTitle = 1;\r\n");
      out.write("\t\tTasksGrid.locked = 1;\t    \r\n");
      out.write("\t    TasksGrid.hiddenPlus = 1;\r\n");
      out.write("\t    TasksGrid.hiddenSubtraction = 1;     \r\n");
      out.write("\t\tTasksGrid.canSel = 1;\r\n");
      out.write("\t    TasksGrid.loadMulLine(iArray);\r\n");
      out.write("\t}\r\n");
      out.write("\tcatch(ex)\r\n");
      out.write("\t{\r\n");
      out.write("\t  alert(ex);\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body onload=\"initForm(); initElementtype();\">\n");
      out.write("\t<form action=\"./LXISTradeContMainSave.jsp\" method=post name=\"fm\" target=\"fraSubmit\" >\t\t\n");
      out.write("<!--\n");
      out.write("    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\n");
      out.write("                      引入合同基本信息录入控件         \n");
      out.write("    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\n");
      out.write("-->\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "ContPage.jsp", out, false);
      out.write("\n");
      out.write("\t<input type=\"hidden\" name=\"hideOperate\" id=\"hideOperate\" value=\"\" />\n");
      out.write("\t<input type=\"hidden\" name=\"CSNM1\" id=\"CSNM1\" value=\"");
      out.print(tCSNM);
      out.write("\" />\n");
      out.write("\t<input type=\"hidden\" name=\"RiskCode1\" id=\"RiskCode1\" value=\"");
      out.print(tRiskCode);
      out.write("\" />\n");
      out.write("<INPUT class=cssButton VALUE=\" 保存合同信息 \" name=\"subbutton\" TYPE=button onclick=\"return submitForm();\" />\n");
      out.write("<SCRIPT>\n");
      out.write("var tOper = '");
      out.print(Oper);
      out.write("' ;\n");
      out.write("\tvar element = document.getElementsByName(\"subbutton\")[0];\n");
      out.write("\tif (tOper == \"insert\"){\n");
      out.write("\t\telement.value = \" 保存合同信息 \";\n");
      out.write("\t\tfm.all(\"hideOperate\").value = \"INSERT||CUSTOM\";\n");
      out.write("\t} else{ \n");
      out.write("\t\tif (tOper == \"update\"){\n");
      out.write("\t\t\telement.value = \" 修改合同信息 \";\n");
      out.write("\t\t\tfm.all(\"hideOperate\").value = \"UPDATE||CUSTOM\";\n");
      out.write("\t\t\t} else if (tOper == \"delete\"){\n");
      out.write("\t\t\telement.value = \" 删除合同信息 \";\n");
      out.write("\t\t\tfm.all(\"hideOperate\").value = \"DELETE||CUSTOM\";\n");
      out.write("\t\t\t\t}\n");
      out.write("\n");
      out.write("\t}\n");
      out.write("\t</SCRIPT>\n");
      out.write("<!--\n");
      out.write("    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\n");
      out.write("                      大额交易明细信息控件         \n");
      out.write("    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\n");
      out.write("-->\n");
      out.write("\t<table>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td class=common>\n");
      out.write("\t\t\t<IMG  src= \"../common/images/butExpand.gif\" style= \"cursor:hand;\" OnClick= \"showPage(this,divTasks);\">\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td class= titleImg>\n");
      out.write("\t\t\t\t被保人信息\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t</table>\n");
      out.write("\t\t<Div  id= \"divTasks\" style= \"display: '' \"/>\n");
      out.write("\t\t\t<table  class= common>\n");
      out.write("\t\t\t\t<tr  class= common>\n");
      out.write("\t\t\t\t\t<td text-align: left colSpan=1>\n");
      out.write("\t\t\t\t\t<span id=\"spanTasksGrid\" >\n");
      out.write("\t\t\t\t\t</span> \n");
      out.write("\t\t\t\t\t</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t\t<br />\n");
      out.write("\t\t</Div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t<INPUT class=cssButton VALUE=\" 添加被保人信息 \" name=\"insert\" TYPE=button onclick=\"return GoToDetailInput(this.name);\" />\t\n");
      out.write("\t\t<INPUT class=cssButton VALUE=\" 维护被保人信息 \" name=\"update\" TYPE=button onclick=\"return GoToDetailInput(this.name);\" />\t\n");
      out.write("\t\t<INPUT class=cssButton VALUE=\" 删除被保人信息 \" name=\"delete\" TYPE=button onclick=\"return GoToDetailInput(this.name);\" />\t\n");
      out.write("\t\t<INPUT class=cssButton VALUE=\" 查看被保人信息 \" name=\"query\" TYPE=button onclick=\"return GoToDetailInput(this.name);\" />\t\n");
      out.write("\t\t<INPUT class=cssButton VALUE=\" 返回 \" name=\"return\" TYPE=button onclick=\"return GoToReturn();\" />\t\t\t\t\n");
      out.write("\t</form>\t\n");
      out.write("\n");
      out.write("<span id=\"spanCode\" style=\"display: none; position:absolute; slategray\"></span>\n");
      out.write("</body>\n");
      out.write("<script>\n");
      out.write("if (oper == \"newquery\"){\n");
      out.write("\tfor (var elementsNum=0; elementsNum< document.forms[0].elements.length; elementsNum++)\n");
      out.write("\t{\n");
      out.write("\t\tvar element = document.forms[0].elements[elementsNum];\n");
      out.write("\t\telement.readOnly = true;\n");
      out.write("\t\tif (element.name == \"insert\" || element.name == \"update\" || element.name == \"delete\" ||element.name == \"subbutton\")\n");
      out.write("\t\t\t//element.style.visibility = \"hidden\";\n");
      out.write("\t\t\telement.disabled = true;\n");
      out.write("\t}\t\t\n");
      out.write("}\n");
      out.write("if (oper == \"delete\"){\n");
      out.write("\tfor (var elementsNum=0; elementsNum< document.forms[0].elements.length; elementsNum++)\n");
      out.write("\t{\n");
      out.write("\t\tvar element = document.forms[0].elements[elementsNum];\n");
      out.write("\t\telement.readOnly = true;\n");
      out.write("\t\tif (element.name == \"insert\" || element.name == \"update\" || element.name == \"delete\")\n");
      out.write("\t\t\t//element.style.visibility = \"hidden\";\n");
      out.write("\t\t\telement.disabled = true;\n");
      out.write("\t}\t\t\n");
      out.write("}\t\n");
      out.write("</script>\n");
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
