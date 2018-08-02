package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;

public final class LXISTradeManualModifyDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/aml/../common/jsp/UsrCheck.jsp");
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

      out.write("\r<html>\r");
//程序名称：//程序功能：//创建日期：2002-08-21 09:25:18//创建人 ：HX//更新记录： 更新人  更新日期   更新原因/内容
      out.write('\r');
	GlobalInput tGI = new GlobalInput();	tGI = (GlobalInput) session.getValue("GI");  	String operator = tGI.Operator;   //记录操作员  	String manageCom = tGI.ManageCom; //记录管理机构  	String comcode = tGI.ComCode;     //记录登陆机构  	String tDealNo = new String(request.getParameter("DealNo"));		String tListNo = new String(request.getParameter("ListNo"));	String tOper = new String(request.getParameter("oper"));
      out.write("\r<head>\r<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />\r<SCRIPT src=\"../common/javascript/Common.js\" >\r</SCRIPT><SCRIPT src=\"../common/javascript/MulLine.js\">\r</SCRIPT><SCRIPT src=\"../common/Calendar/Calendar.js\">\r</SCRIPT><SCRIPT src=\"../common/javascript/EasyQuery.js\"></SCRIPT>\r<SCRIPT src=\"../common/cvar/CCodeOperate.js\"></SCRIPT>\r<SCRIPT src=\"../common/easyQueryVer3/EasyQueryVer3.js\"></SCRIPT>\r<SCRIPT src=\"../common/javascript/VerifyInput.js\" ></SCRIPT>\r<LINK href=\"../common/css/Project.css\" rel=stylesheet type=text/css>\r<LINK href=\"../common/css/mulLine.css\" rel=stylesheet type=text/css>\r<SCRIPT src=\"LXISTradeManualModifyDetail.js\"></SCRIPT>\r\r</head>\r<body onload=\"initElementtype();\">\r<form action=\"./LXISTradeManualModifyDetailSave.jsp\" method=post name=fm target=\"fraSubmit\" >\r\r\t<br><br>\r<!--\r    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\r                      引入可疑交易明细信息录入控件         \r    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV\r-->\r");
      out.write('\r');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "ISTradeTransPage.jsp", out, false);
      out.write("\r\t<br>\r\t\t<input type=\"hidden\" name=\"hideOperate\" id=\"hideOperate\" value=\"\" />\r\t\t<input type=\"hidden\" name=\"DealNo\" id=\"DealNo\" value=\"");
      out.print(tDealNo);
      out.write("\" />\r\t\t<input type=\"hidden\" name=\"ListNo\" id=\"ListNo\" value=\"");
      out.print(tListNo);
      out.write("\" />\r\t\t<input type=\"hidden\" name=\"Oper\" id=\"Oper\" value=\"");
      out.print(tOper);
      out.write("\" />\t\t\t\t\t\t\r\t\t<INPUT class=cssButton VALUE=\"\" name=\"subbutton\" TYPE=button onclick=\"return submitForm();\" />\r\t\t<INPUT class=cssButton VALUE=\" 返回 \" name=\"return\" TYPE=button onclick=\"return GoToReturn();\" />\t\t\t  \t\t\t\t\r<script>\r\tvar tOper = fm.all(\"Oper\").value;\r\tvar tDealNo = fm.all(\"DealNo\").value;\r\tvar tListNo = fm.all(\"ListNo\").value;\r\t//alert(tCRCD);\r\tvar element = document.getElementsByName(\"subbutton\")[0];\r\r\tif (tOper == \"insert\"){\r\t\telement.value = \" 添加可疑交易明细 \";\r\t\tfm.all(\"hideOperate\").value = \"INSERT||DETAIL\";\r\t} else{ \r\t\tif (tOper == \"update\"){\r\t\t\telement.value = \" 保存可疑交易明细 \";\r\t\t\tfm.all(\"hideOperate\").value = \"UPDATE||DETAIL\";\r\t\t} else if (tOper == \"delete\"){\r\t\t\telement.value = \" 删除可疑交易明细 \";\r\t\t\tfm.all(\"hideOperate\").value = \"DELETE||DETAIL\";\r\t\t}\r\t\t//查询结果\r\t\tvar strSQL = \"select CSNM, TICD, TSTM, TSTP, (select codename from ldcode b where a.TSTP = b.code and b.codetype = 'amltranstype'), \"\r\t\t\t+ \" CRTP, (select codename from ldcode b where a.CRTP = b.code and b.codetype = 'amlcurrencytype'),\"\r\t\t\t+ \" CRAT, \"\r\t\t\t+ \" CRDR, (select codename from ldcode b where a.CRDR = b.code and b.codetype = 'amloutpaytype'), \"\r\t\t\t+ \" CSTP, (select codename from ldcode b where a.CSTP = b.code and b.codetype = 'amlcstp'), \"\r\t\t\t+ \" CAOI, TCAN, TBNM, \"\r\t\t\t+ \" TBIT, (select codename from ldcode b where a.TBIT = b.code and b.codetype = 'amlidtype'), \"\r\t\t\t+ \" TBID from LXISTradeDetail a where DealNo = '\" + fm.all(\"DealNo\").value \r\t\t\t+ \"' and ListNo = '\" + tListNo + \"' \";\r\t\tvar strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);\r\t\tvar arr = decodeEasyQueryResult(strQueryResult);\r//\t\talert(arr);\r\t\tfm.all(\"CSNM\").value=arr[0][0];\r\t\tfm.all(\"TICD\").value=arr[0][1];\r\t\tfm.all(\"TSTM\").value=arr[0][2];\r\t\tfm.all(\"TSTP\").value=arr[0][3];\r\t\tfm.all(\"TSTPName\").value=arr[0][4];\r\t\tfm.all(\"CRTP\").value=arr[0][5];\r\t\tfm.all(\"CRTPName\").value=arr[0][6];\r\t\tfm.all(\"CRAT\").value=arr[0][7];\r\t\tfm.all(\"CRDR\").value=arr[0][8];\r\t\tfm.all(\"CRDRName\").value=arr[0][9];\r\t\tfm.all(\"CSTP\").value=arr[0][10];\r\t\tfm.all(\"CSTPName\").value=arr[0][11];\r\t\tfm.all(\"CAOI\").value=arr[0][12];\r\t\tfm.all(\"TCAN\").value=arr[0][13];\r\t\tfm.all(\"TBNM\").value=arr[0][14];\r\t\tfm.all(\"TBIT\").value=arr[0][15];\r\t\tfm.all(\"TBITName\").value=arr[0][16];\r\t\tfm.all(\"TBID\").value=arr[0][17];\r\t}\r\t\r\r</script>\r\r<br />\r\r</form>\r<span id=\"spanCode\" style=\"display: none; position:absolute; slategray\"></span>\r</body>\r<script>\rif (tOper == \"newquery\"){\r\tfor (var elementsNum=0; elementsNum< document.forms[0].elements.length; elementsNum++)\r\t{\r\t\tvar element = document.forms[0].elements[elementsNum];\r\t\telement.readOnly = true;\r\t\tif (element.name == \"insert\" || element.name == \"update\" || element.name == \"delete\" ||element.name == \"subbutton\")\r\t\t\t//element.style.visibility = \"hidden\";\r\t\t\telement.disabled = true;\r\t}\t\t\r}\r\t\t\r</script>\r</html>");
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
