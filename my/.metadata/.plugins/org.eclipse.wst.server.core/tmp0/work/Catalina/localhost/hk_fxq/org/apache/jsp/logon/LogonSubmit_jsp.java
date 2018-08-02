package org.apache.jsp.logon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.db.*;
import com.sinosoft.lis.encrypt.*;
import com.sinosoft.lis.logon.*;
import com.sinosoft.lis.menumang.*;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.lis.schema.*;
import com.sinosoft.utility.*;

public final class LogonSubmit_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<style type=\"text/css\">\n");
      out.write("<!--\n");
      out.write(".style4 {color: #FF0000}\n");
      out.write(".style5 {\n");
      out.write("    font-weight: bold;\n");
      out.write("    font-size: 36px;\n");
      out.write("    color: #CC3333;\n");
      out.write("    font-family: \"方正舒体\", \"华文隶书\", \"隶书\";\n");
      out.write("}\n");
      out.write("-->\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("\n");

//******************************************************
// 程序名称：LogonSubmit.jsp
// 程序功能:：处理用户登录提交
// 最近更新人：DingZhong
// 最近更新日期：2002-10-15
//******************************************************//

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

boolean bSuccess = false;
String sErrorMsg = new String("");
//用户名称和密码
String UserCode = request.getParameter("UserCode");

if( UserCode != null && !UserCode.equals("") ) {
  UserCode = UserCode.trim();
}

String Password = request.getParameter("PWD");
LisIDEA tIdea = new LisIDEA();
Password = tIdea.encryptString(Password);
String StationCode = request.getParameter("StationCode");
String ClientURL = request.getParameter("ClientURL");   //LQ 2004-04-19
//System.out.println("Password:" + Password + "1");

//用户IP
String Ip = request.getRemoteAddr();
//System.out.println("++++++++++++++++++IP :" + Ip);
String ls;  //返回的字符串
if (Password.length() == 0 || UserCode.length() == 0)
{
    bSuccess = false;
}
else
{
    VData tVData = new VData();
    LDUserSchema tLDUserSchema = new LDUserSchema();
    tLDUserSchema.setUserCode(UserCode);
    tLDUserSchema.setPassword(Password);
    tLDUserSchema.setComCode(StationCode);
    tVData.add(tLDUserSchema);
    LDUserUI tLDUserUI = new LDUserUI();
    bSuccess=tLDUserUI.submitData(tVData,"query");
    //XinYQ added on 2006-09-04
    if (!bSuccess)
    {
        sErrorMsg = tLDUserUI.mErrors.getFirstError();
    }
}
String title = UserCode + "您好，欢迎登录本系统！";
GlobalInput tG = new GlobalInput();
tG.Operator = UserCode;
tG.ComCode  = StationCode;
tG.ManageCom = StationCode;
session.putValue("GI",tG);
session.putValue("ClientURL",ClientURL);    //LQ 2004-04-19
GlobalInput tG1 = new GlobalInput();
tG1=(GlobalInput)session.getValue("GI");
//System.out.println("Current Operate is "+tG1.Operator);
//System.out.println("Current ComCode is "+tG1.ComCode);
if(bSuccess == true)
{
    //register info into lduserlog
    LDUserLogDB tLDUserLogDB = new LDUserLogDB();
//  String maxno = PubFun1.CreateMaxNo("LOGNO",10);
    String maxno = PubFun.getSeqNo("SEQ_LOGNO");
    if("-1".equals(maxno))
    {
        session.putValue("GI",null);
    }

    tLDUserLogDB.setLogNo(maxno);
    tLDUserLogDB.setManageCom(StationCode);
    tLDUserLogDB.setOperator(UserCode);
    tLDUserLogDB.setCientIP(Ip);
    tLDUserLogDB.setMakeDate(PubFun.getCurrentDate());
    tLDUserLogDB.setMakeTime(PubFun.getCurrentTime());
    tLDUserLogDB.insert();
    out.print(title);
    //进行解锁操作
//  System.out.println("start unlock operate...");
    //VData inputData = new VData();
    //inputData.addElement(tG1);
    //logoutUI tlogoutUI = new logoutUI();
    //tlogoutUI.submitData(inputData,"LogOutProcess");
    //System.out.println("completed clear data");

      out.write("\n");
      out.write("<script language=javascript>\n");
      out.write("if(parent.fraMain.rows == \"0,0,0,0,*\")\n");
      out.write("    parent.document.frames('fraTitle').showTitle();\n");
      out.write("if(parent.fraSet.cols== \"0%,*,0%\")\n");
      out.write("    parent.document.frames('fraTitle').showHideFrame();\n");
      out.write("parent.fraMenu.window.location=\"./menu2.jsp?userCode=");
      out.print(UserCode);
      out.write("&Ip=");
      out.print(Ip);
      out.write("\";\n");
      out.write("</script>\n");

}
else
{
    session.putValue("GI",null);

      out.write("\n");
      out.write("<script language=javascript>\n");
      out.write("alert(\"用户名/密码/管理机构输入不正确！\\n\\n可能的原因是：\" + \"");
      out.print(sErrorMsg);
      out.write("\");\n");
      out.write("parent.window.location =\"../indexlis.jsp\";\n");
      out.write("</script>\n");

}

      out.write("\n");
      out.write("\n");
      out.write("<script src=\"../common/javascript/Common.js\"></script>\n");
      out.write("<script src=\"../common/cvar/CCodeOperate.js\"></script>\n");
      out.write("<script src=\"../common/javascript/EasyQuery.js\"></script>\n");
      out.write("<script src=\"../common/easyQueryVer3/EasyQueryVer3.js\"></script>\n");
      out.write("\n");
      out.write("<body onload=\"initName()\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div>\n");
      out.write("        <center><iframe src=\"\" frameborder=\"no\" scrolling=\"no\" height=\"90%\" width=\"100%\"></iframe></center>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("<form name=\"fm\">\n");
      out.write("    <input type=\"hidden\" name=\"VirtualCode\" value=\"0\" />\n");
      out.write("    <input type=\"hidden\" name=\"VirtualName\" value=\"\" />\n");
      out.write("\n");
      out.write("</form>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("<script language=\"javascript\">\n");
      out.write("    function initName()\n");
      out.write("    {\n");
      out.write("        //反洗钱项目不需要这些，注释掉\n");
      out.write("        //showOneCodeName('province','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('city','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('district','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('incomeway','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('comcode','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('sellType','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('vipvalue','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('IDType','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('Sex','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('Marriage','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('NativePlace','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('OccupationCode','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('LicenseType','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('paymode','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('continuepaymode','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('bank','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('SequenceNo','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('vipvalue','VirtualCode','VirtualName');\n");
      out.write("        //showOneCodeName('Relation','VirtualCode','VirtualName');\n");
      out.write("    }\n");
      out.write("\n");
      out.write("</script>\n");
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
