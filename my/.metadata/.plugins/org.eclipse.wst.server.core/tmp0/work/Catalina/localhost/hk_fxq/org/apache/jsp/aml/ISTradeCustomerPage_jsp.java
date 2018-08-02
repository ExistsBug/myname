package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ISTradeCustomerPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<table>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td class=common>\r\n");
      out.write("\t\t<IMG  src= \"../common/images/butExpand.gif\" style= \"cursor:hand;\" OnClick= \"showPage(this,divCustom);\">\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td class= titleImg>\r\n");
      out.write("\t\t\t客户基本信息\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<Div id= \"divCustom\" style= \"display: '' \">\r\n");
      out.write("\t<table class=common border=0>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户号码</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"CSNM\" id=\"CSNM\" class=\"common\" verify = \"客户号码|notnull&len<=32\" elementtype=nacessary  />\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户名称</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"CTNM\" id=\"CTNM\" class=\"common\" verify = \"客户名称|notnull&len<=32\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 投保人类型</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CTTP\" id=\"CTTP\" class=\"codeno\" verify = \"投保人类型|notnull&Code:amlpolicyholdertype\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlpolicyholdertype',[this,CTTPName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlpolicyholdertype',[this,CTTPName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=CTTPName readOnly elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户身份证件类型</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CITP\" id=\"CITP\" class=\"codeno\"  verify = \"客户身份证件类型|notnull&Code:amlidtype\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlidtype',[this,CITPName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlidtype',[this,CITPName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=CITPName readOnly elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户证件号码</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CTID\" id=\"CTID\" class=\"common\" verify = \"客户证件号码|notnull&len<=20\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户联系电话</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CCTL\" id=\"CCTL\" class=\"common\" verify = \"客户联系电话|notnull&len<=32\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 交易发生地编码</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"TRCD\" id=\"TRCD\" class=\"code\" verify = \"交易发生地编码|notnull\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"return showArea();\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"return showArea();\"\telementtype=nacessary\r\n");
      out.write("      \t\t\t\t\t/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 交易发生地</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"TRCDName\" id=\"TRCDName\" class=\"readOnly\" verify = \" 交易发生地|notnull\" ReadOnly elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户职业或行业</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t\t    <Input name=\"CTVC\" id=\"CTVC\" class=\"codeno\" verify = \"客户职业或行业|notnull&Code:amloccupationtype\"\r\n");
      out.write("      \t\t\t\tondblclick=\"showCodeListCTVC(this);\" \t\r\n");
      out.write("      \t\t\t\tonkeyup=\"showCodeListKeyCTVC(this);\"\r\n");
      out.write("      \t\t\t\t/><Input class=codename name=CTVCName readOnly elementtype=nacessary>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 代表人姓名</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CRNM\" id=\"CRNM\" class=\"common\" verify = \" 代表人姓名|notnull&len<=32\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 代表人身份证件类型</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CRIT\" id=\"CRIT\" class=\"codeno\" verify = \"代表人身份证件类型|notnull&Code:amlidtype\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlidtype',[this,CRITName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlidtype',[this,CRITName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=CRITName readOnly elementtype=nacessary>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 代表人身份证件号码</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input  name=\"CRID\" id=\"CRID\" class=\"common\" verify = \" 代表人身份证件号码|len<=20&notnull\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户详细地址</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\" colspan=5 />\r\n");
      out.write("\t\t        <textarea style=\"width:97%\" name=\"CTAR\" id=\"CTAR\" verify=\" 客户详细地址|notnull&len<=128\" class=\"common\" elementtype=nacessary/></textarea>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 客户其他信息</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\" colspan=5  />\r\n");
      out.write("\t\t        <textarea style=\"width:97%\"  name=\"CCEI\" id=\"CCEI\" class=\"common\" verify=\" 客户其他信息|notnull&len<=64\"  elementtype=nacessary/></textarea>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t</table>  \r\n");
      out.write("</Div>\r\n");
      out.write("<script>\r\n");
      out.write("function showCodeListCTVC(cObj){\r\n");
      out.write("\tvar strSQL = \"\";\r\n");
      out.write("\tvar CTTP = document.getElementById(\"CTTP\").value;\r\n");
      out.write("\tif (CTTP == \"07\"){\r\n");
      out.write("\t \tstrSQL = \" #1# and code like #1%# \";\r\n");
      out.write("\t \ttry{\r\n");
      out.write("\t\t\tshowCodeList('amloccupationtype',[cObj], null, null, strSQL, \"1\");\t \t\r\n");
      out.write("\t\t}catch(ex){\r\n");
      out.write("\t\t\talert(ex);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\telse{\r\n");
      out.write("\t\tshowCodeList('amloccupationtype',[cObj],[0,1]);\t\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function showCodeListKeyCTVC(){\r\n");
      out.write("\tvar strSQL = \"\";\r\n");
      out.write("\tvar CTTP = document.getElementById(\"CTTP\").value;\r\n");
      out.write("\tif (CTTP == \"07\"){\r\n");
      out.write("\t \tstrSQL = \" #1# and code like #1%# \";\r\n");
      out.write("\t \ttry{\r\n");
      out.write("\t\t\tshowCodeListKey('amloccupationtype',[cObj], null, null, strSQL, \"1\");\t \t\r\n");
      out.write("\t\t}catch(ex){\r\n");
      out.write("\t\t\talert(ex);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\telse{\r\n");
      out.write("\t\tshowCodeListKey('amloccupationtype',[cObj],[0,1]);\t\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\t\r\n");
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
