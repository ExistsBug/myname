package org.apache.jsp.common.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.utility.*;
import com.sinosoft.lis.schema.*;
import com.sinosoft.lis.pubfun.*;

public final class CodeQueryWindow_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String codeQueryKernel(String codeType, Object session) {     
  String strResult = "";
	codeType = codeType.toLowerCase().trim();  
	      
	CodeQueryUI tCodeQueryUI=new CodeQueryUI();
	VData tData=new VData();
	LDCodeSchema tLDCodeSchema =new LDCodeSchema();
	tLDCodeSchema.setCodeType(codeType);
	tData.add(tLDCodeSchema);
	
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput)session;
  tData.add(tGI);
	
	tCodeQueryUI.submitData(tData, "QUERY||MAIN");
	if (tCodeQueryUI.mErrors.needDealError()) {
	  System.out.println(tCodeQueryUI.mErrors.getFirstError()) ;
	}	else {
	  tData.clear();
	  tData=tCodeQueryUI.getResult();
	  strResult=(String)tData.get(0);
	  //strValue=StrTool.unicodeToGBK(strResult);
	  //System.out.println(strResult);
	}
	
	return strResult;
}

public String codeQueryKernel2(String codeType,String codeField,String codeCondition, Object session) {     
  String strResult = "";
  TransferData tTransferData = new TransferData();
	codeType = codeType.toLowerCase().trim();  	      
	CodeQueryUI tCodeQueryUI=new CodeQueryUI();
	VData tData=new VData();
	LDCodeSchema tLDCodeSchema =new LDCodeSchema();
	tLDCodeSchema.setCodeType(codeType);
	
	tTransferData.setNameAndValue("codeCondition",codeCondition);
	tTransferData.setNameAndValue("conditionField",codeField) ;
	
	tData.add(tTransferData);
	tData.add(tLDCodeSchema);
	
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput)session;
  tData.add(tGI);
	
	tCodeQueryUI.submitData(tData, "QUERY||MAIN");
	if (tCodeQueryUI.mErrors.needDealError()) {
	  System.out.println(tCodeQueryUI.mErrors.getFirstError()) ;
	}	else {
	  tData.clear();
	  tData=tCodeQueryUI.getResult();
	  strResult=(String)tData.get(0);
	  //strValue=StrTool.unicodeToGBK(strResult);
	  //System.out.println(strResult);
	}
	
	return strResult;
}

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/common/jsp/CodeQueryKernel.jsp");
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

      out.write("\r\n");
      out.write("\r\n");

/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软人寿保险核心业务管理系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 胡博 <HuBo@sinosoft.com.cn>, 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00, 1.10
 * @date     : 2002-10-18, 2006-06-30
 * @direction: 公用查询 LDCode 等待页面
 ******************************************************************************/

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');

//³ÌÐòÃû³Æ£ºcodeQueryKernel.jsp
//³ÌÐò¹¦ÄÜ£ºcodeQuery²éÑ¯¹¦ÄÜµÄºËÐÄ£¬ÔÝÊ±ÓÃÓÚÐ£Ñé¹¦ÄÜµÄ´úÂë²éÑ¯²¿·Ö
//´´½¨ÈÕÆÚ£º2002-10-18
//´´½¨ÈË  £ººú ²©
//¸üÐÂ¼ÇÂ¼£º  ¸üÐÂÈË    ¸üÐÂÈÕÆÚ     ¸üÐÂÔ­Òò/ÄÚÈÝ       

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    //接收数据变量
    String sCodeType = request.getParameter("codeType");
    String sCodeField = request.getParameter("codeField");
    String sCodeConditon = request.getParameter("codeConditon");
    String sQueryResult = new String("");

    //收集整理数据
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");

    //显示日志信息
    System.out.println("");
    System.out.println("========== CodeQuery BGN ==========");
    System.out.println("CodeType  : " + sCodeType);

    //调用后台查询
    try
    {
        if (sCodeField == null || sCodeField.equals("") || sCodeConditon == null || sCodeConditon.equals(""))
        {
            sQueryResult = codeQueryKernel(sCodeType, tGlobalInput);
        }
        else
        {
            sQueryResult = codeQueryKernel2(sCodeType, sCodeField, sCodeConditon, tGlobalInput);
        }
    }
    catch (Exception ex)
    {
        System.out.println("@> Errors occured when CodeQuery executing !");
    }

    System.out.println("========== CodeQuery END ==========");
    System.out.println("");
    tGlobalInput = null;

    //页面反馈信息
    out.println("<script language='JavaScript'>");
    out.println("    try");
    out.println("    {");
    if (sQueryResult == null || sQueryResult.equals(""))
    {
        out.println("        window.returnValue = 'Code Query Failed';");
    }
    else
    {
        out.println("        window.returnValue = '" + sQueryResult + "';");
    }
    out.println("        window.close();");
    out.println("    }");
    out.println("    catch (ex) {}");
    out.println("</script>");

      out.write('\r');
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
