package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ContPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t\t\t可疑交易合同信息\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<Div id= \"divCustom\" style= \"display: '' \">\r\n");
      out.write("\t<table class=common border=0>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 交易编号</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"DealNo\" id=\"DealNo\" class=\"common\" readOnly verify = \"交易编号|notnull\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险合同号</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"CSNM\" id=\"CSNM\" class=\"common\" verify = \"保险合同号|notnull&len<=32\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险种类</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"ISTP\" id=\"ISTP\" class=\"codeno\" verify = \"保险种类|notnull&len=2&Code:amlrisktype\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlrisktype',[this,ISTPName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlrisktype',[this,ISTPName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=ISTPName readOnly elementtype=nacessary>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险名称</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"ISNM\" id=\"ISNM\" class=\"common\" verify = \"保险名称|notnull&len<=32\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险编码</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t       <input name=\"RiskCode\" id=\"RiskCode\" class=\"common\" verify = \"保险编码|notnull&len<=10\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险期间</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"ISPS\" id=\"ISPS\" class=\"common\" verify = \"保险期间|notnull&len=16|len=2\" elementtype=nacessary/><font color=red style=\"font:9pt\"> YYYYMMDDYYYYMMDD</font>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险合同其他信息</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CTES\" id=\"CTES\" class=\"common\" verify = \"保险合同其他信息|notnull&len<=64\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险标的</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"ISOG\" id=\"ISOG\" class=\"common\" verify = \"保险标的|notnull&len<=128\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险金额</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"ISAT\" id=\"ISAT\" class=\"common\" verify = \"保险金额|notnull&num&len<=20\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险费</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"ISFE\" id=\"ISFE\" class=\"common\" verify = \"保险费|notnull&num&len<=20\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 缴费方式</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t\t    <Input name=\"ISPT\" id=\"ISPT\" class=\"codeno\" verify = \"缴费方式|notnull&len=2&Code:amlpayintv\" \r\n");
      out.write("      \t\t\t\tondblclick=\"showCodeList('amlpayintv',[this,ISPTName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\tonkeyup=\"showCodeListKey('amlpayintv',[this,ISPTName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t/><Input class=codename name=ISPTName readOnly elementtype=nacessary>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("<!--\t\t\t<TD class=\"title\" /> 保险合同其他信息</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CTES\" id=\"CTES\" class=\"common\" verify = \"保险合同其他信息|notnull\" elementtype=nacessary/>\r\n");
      out.write("\t        </TD>-->\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t</table>  \r\n");
      out.write("</Div>");
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
