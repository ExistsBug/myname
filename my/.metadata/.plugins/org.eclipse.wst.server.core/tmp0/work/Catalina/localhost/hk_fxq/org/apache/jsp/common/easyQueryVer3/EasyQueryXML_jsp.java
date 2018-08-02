package org.apache.jsp.common.easyQueryVer3;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.sinosoft.utility.*;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.utility.*;

public final class EasyQueryXML_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//µ÷ÓÃEasyQueryUI½øÐÐSQLÓï¾äÌá½»ºÍÊý¾Ý¿â²éÕÒ£¬·µ»Ø½á¹û×Ö·û´®strResult
public String easyQueryKernel(String strSql, String strStart, String strLargeFlag, String strLimitFlag)
{
    String strResult = "";
    String strError = "";
    Integer intStart;
    Integer intLargeFlag;
    Integer intLimitFlag;

    //strStart
    if (strStart == null || strStart.trim().equals("") || strStart.equals("undefined"))
    {
        intStart = new Integer(String.valueOf("1"));
    }
    else
    {
        intStart = new Integer(strStart);
    }

    //strLargeFlag
    if (strLargeFlag == null || strLargeFlag.trim().equals("") || strLargeFlag.equals("undefined"))
    {
        intLargeFlag = new Integer(String.valueOf("0"));
    }
    else
    {
        intLargeFlag = new Integer(strLargeFlag);
    }

    //strLimitFlag
    if (strLimitFlag == null || strLimitFlag.trim().equals("") || strLimitFlag.equals("undefined"))
    {
        intLimitFlag = new Integer(String.valueOf("0"));
    }
    else
    {
        intLimitFlag = new Integer(strLimitFlag);
    }

    VData tVData = new VData();
    tVData.add(strSql);
    tVData.add(intStart);
    tVData.add(intLargeFlag);    //2005-04-18 zhuxf Ìí¼Ó´óÊý¾ÝÁ¿²éÑ¯±êÖ¾
    tVData.add(intLimitFlag);    //2006-09-29 XinYQ Ìí¼ÓÍ»ÆÆ 200 ÌõÏÞÖÆµÄ²éÑ¯±êÖ¾

    EasyQueryUI tEasyQueryUI = new EasyQueryUI();
    tEasyQueryUI.submitData(tVData, "QUERY||MAIN");
    if(tEasyQueryUI.mErrors.needDealError())
    {
        strError = tEasyQueryUI.mErrors.getFirstError();
    }
    else
    {
        tVData.clear() ;
        tVData = tEasyQueryUI.getResult() ;
        strResult = (String)tVData.getObject(0);
    }

    return strResult;
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/common/easyQueryVer3/./EasyQueryKernel.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

//³ÌÐòÃû³Æ£ºEasyQueryKernel.jsp
//³ÌÐò¹¦ÄÜ£ºEasyQuery²éÑ¯¹¦ÄÜµÄºËÐÄº¯Êý
//´´½¨ÈÕÆÚ£º2002-09-28
//´´½¨ÈË  £ººú²©
//¸üÐÂ¼ÇÂ¼£º  ¸üÐÂÈË    ¸üÐÂÈÕÆÚ     ¸üÐÂÔ­Òò/ÄÚÈÝ

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');

//程序名称：EasyQueryXML.jsp
//程序功能：查询等待页面，负责调用后台查询，并接收返回结果
//创建日期：2005-6-3 8:48
//创建人  ：涂强
//修改人  ：朱向峰  2006-4-13   设置Referer＆Host的校验
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);


String strResult = "";

String tReferer = request.getHeader("Referer");//获得申请此页的url信息
//System.out.println(request.getHeader("Referer"));
String tHost = "http://" + request.getHeader("host");//获取应用的url信息
String tHost1 = "https://" + request.getHeader("host");//获取应用的url信息
//System.out.println(tHost);

//校验请求此页面的url是否是应用框架内的页面
//System.out.println("tReferer:" + tReferer);
//System.out.println("tHost:" + tHost);
//System.out.println("tHost1:" + tHost1);
if(tReferer == null || (!tReferer.startsWith(tHost) && !tReferer.startsWith(tHost1)))
{
    System.out.println("不是一个地址的请求服务");

      out.write("\n");
      out.write("<script language=javascript>\n");
      out.write("session = null;\n");
      out.write("try\n");
      out.write("{\n");
      out.write("    CollectGarbage();\n");
      out.write("}\n");
      out.write("catch(ex)\n");
      out.write("{\n");
      out.write("    alert(ex.message);\n");
      out.write("}\n");
      out.write("top.window.location =\"../../indexlis.jsp\";\n");
      out.write("</script>\n");

//  response.sendRedirect("../../indexlis.jsp");
}
else
{
    InputStream ins = request.getInputStream();
    ByteArrayOutputStream baos = new ByteArrayOutputStream();

    int nChar = 0;

    nChar = ins.read();
    while( nChar != -1 ) {
        baos.write(nChar);
        nChar = ins.read();
    }

    /* Kevin 2006-08-04
     * The default encoding used by XMLHTTP is UTF-8
     *
     * Pay attention, don't use getParameter().
     * Because that you have to encode the query string in application/x-www-form-urlencoded form in js
     * to make sure you can get the correct content here, and I can't find a method to encode Chinese
     * Character well in js, so I use getInputStream() instead.
     *
     * BTW: You can find VBScript that can perform this task in the internet.
     *
     */

    String[] strParams = new String(baos.toByteArray(), "UTF-8").split("&");

    //设置request的接受字符集
    String strSql = strParams[0];
    String strStart =strParams[1];
    String strLargeFlag = strParams[2];
    String strLimitFlag = strParams[3];
    if(strSql.indexOf(".jsp")!=-1)
    {
    EasyQuerySql tEasyQuerySql=new EasyQuerySql();
    if (tEasyQuerySql.parsePara(strSql))
    {
    //System.out.println("EASYQUERY RAW SQL==="+strSql);
    String jspName=tEasyQuerySql.getJspName();
    //System.out.println("EASYQUERY JSP'S Name IS===="+jspName);
    request.setAttribute("EASYQUERYSQLID",tEasyQuerySql.getSqlId());
    for (int i = 0; i < tEasyQuerySql.getParaCount(); i++)
    {
        request.setAttribute(tEasyQuerySql.getParaName(i).toUpperCase(),tEasyQuerySql.getParaValue(i));
    }
  
      out.write('\n');
      out.write(' ');
      out.write(' ');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response,  jspName, out, false);
      out.write("\n");
      out.write("\n");
      out.write("  ");

    strSql=(String)request.getAttribute("EASYQUERYSQL");

    //System.out.println(strSql);
    strSql=tEasyQuerySql.convertToValue(strSql);
    //System.out.println("===EASYQUERY CONVERT SQL==="+strSql);
    }
    }
    try
    {
        strResult = easyQueryKernel(strSql, strStart, strLargeFlag, strLimitFlag);
    }
    catch(Exception ex)
    {
        System.out.println("easyQueryKernel throw Errors!\n" + "easyQuerySql:" + strSql +"\nStartRecord:" +strStart);
    }

    try
    {
        //做了一步特殊字符替换，可否考虑先判定是否含有特殊字符，然后再作处理
        //对于有回车的数据取出的可能性太小了
        if(strResult.indexOf("\"")!= -1 || strResult.indexOf("'")!= -1 || strResult.indexOf("\n")!= -1)
        {
            String strPath = application.getRealPath("config//Conversion.config");
            strResult = StrTool.Conversion(strResult, strPath);
        }
    }
    catch(Exception ex)
    {
        System.out.println("not found Conversion.config ");
    }
}

      out.write('\n');
      out.print(strResult);
      out.write('\n');
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
