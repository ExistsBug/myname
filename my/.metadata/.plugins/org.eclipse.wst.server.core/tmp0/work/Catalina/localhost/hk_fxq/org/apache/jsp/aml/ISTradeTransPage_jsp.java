package org.apache.jsp.aml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ISTradeTransPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t\t<IMG  src= \"../common/images/butExpand.gif\" style= \"cursor:hand;\" OnClick= \"showPage(this,divDetail);\">\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t\t<td class= titleImg>\r\n");
      out.write("\t\t\t可疑交易明细信息\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<Div id= \"divDetail\" style= \"display: '' \">\r\n");
      out.write("\t<table class=common border=0>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 保险合同号</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"CSNM\" id=\"CSNM\" class=\"common\" verify=\"保险合同号|notnull&len<=32\"  elementtype=nacessary />\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 业务标示号</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <input name=\"TICD\" id=\"TICD\" class=\"readOnly\" readOnly />\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 交易日期</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"TSTM\" id=\"TSTM\" class=\"common\" verify=\"交易日期|notnull&len=10\"   elementtype=nacessary ><font color=red style=\"font:9pt\"> YYYYMMDDHH24</font>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 交易类型</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"TSTP\" id=\"TSTP\" class=\"codeno\" verify=\"交易类型|notnull&Code:amltranstype\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amltranstype',[this,TSTPName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amltranstype',[this,TSTPName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=TSTPName readOnly elementtype=nacessary >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 币种 </TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CRTP\" id=\"CRTP\" class=\"codeno\" verify=\"币种|notnull&len=3|Code:amlcurrencytype\" value=\"CNY\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlcurrencytype',[this,CRTPName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlcurrencytype',[this,CRTPName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=CRTPName readOnly elementtype=nacessary >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 交易金额 </TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CRAT\" id=\"CRAT\" class=\"common\"  verify=\"交易金额|notnull&num&len<=20\" elementtype=nacessary 　/>\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 资金进出方向 </TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CRDR\" id=\"CRDR\" class=\"codeno\" verify=\"资金进出方向|notnull&Code:amloutpaytype\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amloutpaytype',[this,CRDRName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amloutpaytype',[this,CRDRName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=CRDRName readOnly elementtype=nacessary >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 资金进出方式 </TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CSTP\" id=\"CSTP\" class=\"codeno\" verify=\"资金进出方式|notnull&Code:amlcstp\"\r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlcstp',[this,CSTPName],[0,1]);\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlcstp',[this,CSTPName],[0,1]);\"\r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=CSTPName readOnly elementtype=nacessary >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 资金账户开户行</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"CAOI\" id=\"CAOI\" class=\"common\" verify=\"资金账户开户行|notnull&len<=64\" elementtype=nacessary  >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 银行转帐资金账号</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t\t    <Input name=\"TCAN\" id=\"TCAN\" class=\"common\" verify=\"银行转帐资金账号|notnull&len<=64\" elementtype=nacessary >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 经办人姓名</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"TBNM\" id=\"TBNM\" class=\"common\" verify=\"经办人姓名|notnull&len<=32\" elementtype=nacessary />\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> </TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/> </TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR class=common>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 经办人身份证件类型</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input name=\"TBIT\" id=\"TBIT\" class=\"codeno\" verify=\"经办人身份证件类型|notnull&Code:amlidtype\" \r\n");
      out.write("      \t\t\t\t\tondblclick=\"showCodeList('amlidtype',[this,TBITName],[0,1], null,' #1# and code not like #2%# ', '1');\" \t\r\n");
      out.write("      \t\t\t\t\tonkeyup=\"showCodeListKey('amlidtype',[this,TBITName],[0,1], null,' #1# and code not like #2%# ', '1');\" \r\n");
      out.write("      \t\t\t\t\t/><Input class=codename name=TBITName readOnly elementtype=nacessary >\r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t\t\t<TD class=\"title\" /> 经办人身份证件号码</TD>\r\n");
      out.write("\t\t\t<TD class=\"input\"/>\r\n");
      out.write("\t\t        <Input  name=\"TBID\" id=\"TBID\" class=\"common\" verify=\"经办人身份证件号码|notnull&len<=20\"  elementtype=nacessary />\r\n");
      out.write("\t        </TD>\r\n");
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
