package org.apache.jsp.CustomerRiskLever;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.GlobalInput;
import java.lang.*;
import java.util.*;
import com.sinosoft.utility.*;
import com.sinosoft.lis.schema.*;
import com.sinosoft.lis.db.*;
import com.sinosoft.lis.vschema.*;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.lis.customerrisklevel.*;
import com.sinosoft.workflow.aml.*;

public final class LXReviewInfoSave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/CustomerRiskLever/../common/jsp/UsrCheck.jsp");
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


//程序名称：LXReviewInfoSave.jsp
//程序功能：
//创建日期：
//创建人  ： 
//更新记录：  更新人    更新日期     更新原因/内容

      out.write('\n');
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
      out.write("\n");
      out.write("<!--用户校验类-->\n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("\n");

    // 输出参数
    CErrors tError = null;
    String FlagStr = "";
    String Content = "";

    //输入参数
    GlobalInput tGI = new GlobalInput();
    tGI=(GlobalInput)session.getValue("GI");
    String Operate = request.getParameter("Operation");//操作 =='one'
    String strSQL = new String();

    String contno = new String(request.getParameter("contno"));
    
    //注意：这个上面也应该加编码
    String oper = new String(request.getParameter("UserCode").getBytes("ISO-8859-1"),"GBK");
    //String oper = request.getParameter("UserCode");//当前操作者
    
    String reviewScore = new String(request.getParameter("reviewScore"));
    //String reviewLevel = request.getParameter("reviewLevel");
    String reviewLevel = new String(request.getParameter("reviewLevel").getBytes("ISO-8859-1"),"GBK");
    
    //String reviewRemark = request.getParameter("reviewRemark");
    String reviewRemark = new String(request.getParameter("reviewRemark").getBytes("ISO-8859-1"),"GBK");
    
    //String reviewLevel = request.getParameter("reviewLevel");
    //String record = new String(request.getParameter("record2").getBytes("ISO-8859-1"),"GBK");
    String record = request.getParameter("record2");
    String customerNo = new String(request.getParameter("customerNo"));
    String no = new String(request.getParameter("no"));
    System.out.println("**********************************************************************************************************");
    System.out.println(contno+"============================= contno!!");
    System.out.println("LXReviewInfoSave.jsp 页面接收的  no========== "+no+",reviewLevel========   "+reviewLevel
    		+",record======= "+record+",评论 reviewRemark========== "+reviewRemark);
    System.out.println("Save的oper===************"+oper);
    System.out.println("**********************************************************************************************************");
   
    
    VData tVData = new VData();
    LXReviewInfoUI lxReviewInfoUI = new LXReviewInfoUI();  
	LXCustomerRiskReviewSchema lxCustomerRiskReviewScheme = new LXCustomerRiskReviewSchema();
	lxCustomerRiskReviewScheme.setCONTNO(contno);
	lxCustomerRiskReviewScheme.setREVIEWSCORE(reviewScore);
	lxCustomerRiskReviewScheme.setREVIEWLEVEL(reviewLevel);
	
	lxCustomerRiskReviewScheme.setREVIEWREMARK(reviewRemark);//+
	
	
	lxCustomerRiskReviewScheme.setOPERATOR(oper);//setOPERATOR
	lxCustomerRiskReviewScheme.setCUSTOMERNO(customerNo);
	lxCustomerRiskReviewScheme.setNO(no);/////++
	
	LXCustomerRiskResultAllSchema lxCustomerRiskResultAllScheme = new LXCustomerRiskResultAllSchema();
	lxCustomerRiskResultAllScheme.setREVIEWSCORE(reviewScore);
	lxCustomerRiskResultAllScheme.setREVIEWLEVEL(reviewLevel);
	lxCustomerRiskResultAllScheme.setREVIEWREMARK(reviewRemark);
	lxCustomerRiskResultAllScheme.setOPERATOR(oper);//+setOPERATOR
	
	//lxCustomerRiskResultAllScheme.setFINALSCORE(reviewScore);
	//lxCustomerRiskResultAllScheme.setFINALLEVEL(reviewLevel);
	lxCustomerRiskResultAllScheme.setCONTNO(contno);
	lxCustomerRiskResultAllScheme.setRECORD(record);
	lxCustomerRiskResultAllScheme.setNO(no);//++
    if(tGI==null)
    {
        System.out.println("页面失效,请重新登陆");
        FlagStr = "Fail";
        Content = "页面失效,请重新登陆";
    }
    //页面有效
    else 
    {
        System.out.println("========= In LXReviewInfoSave.jsp ========== =Operate=" + Operate);
        try
        {
        	tVData.add(tGI);
        	//System.out.println(lxCustomerRiskReviewScheme.getCONTNO()+" contno!!");
            tVData.add(lxCustomerRiskReviewScheme);
            tVData.add(lxCustomerRiskResultAllScheme);
            
            lxReviewInfoUI.submitData(tVData, Operate);
        }
        catch(Exception ex)
        {
            Content = "保存失败，原因是:" + ex.toString();
            FlagStr = "Fail";
        }
        if (!FlagStr.equals("Fail"))
        {
            tError = lxReviewInfoUI.mErrors;
            if (!tError.needDealError())
            {
                Content = " 保存成功! ";
                FlagStr = "Succ";
            }
            else
            {
                Content = " 保存失败，原因是:" + tError.getFirstError();
                FlagStr = "Fail";
            }
        }
    }

  //添加各种预处理
   System.out.println(Content);
//页面有效区


      out.write("\n");
      out.write("<html>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("<!--zhangyf modify 给content增加结束符-->\n");
      out.write("        parent.fraInterface.afterSubmit(\"");
      out.print(FlagStr);
      out.write('"');
      out.write(',');
      out.write('"');
      out.print(Content);
      out.write("\");\n");
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
