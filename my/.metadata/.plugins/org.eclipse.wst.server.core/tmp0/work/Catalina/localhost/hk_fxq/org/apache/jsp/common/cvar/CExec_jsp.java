package org.apache.jsp.common.cvar;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sinosoft.lis.pubfun.*;
import com.sinosoft.lis.schema.LDCodeSchema;
import com.sinosoft.utility.*;

public final class CExec_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=GBK\">\n");
      out.write("</head>\n");

/**************************************************************
 *               Program NAME: 读取后台代码
 *                 programmer: Ouyangsheng
 *                Create DATE: 2002.04.15
 *             Create address: Beijing
 *                Modify DATE:
 *             Modify address:
 *****************************************************************
 *
 *         通用代码查询处理页面,包含在隐藏的框架中,输入
 *     过程中要显示代码清单时调用此页面
 *
 *****************************************************************/

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

//System.out.println("\n\n\n---Start InitIndex CExec.jsp---\n\n");
String codename             = "";	// 代码名称lx_code
String riskcode             = "";	// 险种代码
String framename            = "";	// Frame的名字
String strOther             = "";	// 部门代码
String strValue             = "";
String strError             = "";	// 错误信息
int    intSize              = -1;	// 记录条数信息 -1--null, 0--等于0, 1--大于0
String tStr                 = "";
String codeCondition        = "";	//代码查询条件
String conditionField       = "";	//代码查询条件对应的数据库字段
String showWidth            = "";	//下拉框的宽度
String changeEven			= "";	//下拉选择时触发的事件
String limitFlag            = "";   //是否采用系统默认结果集限制策略, XinYQ added on 2007-07-17

//得到请求页面的方式,以确定是初次下载页面,还是通过页面查询代码
String strMethod = request.getMethod();

//如果是POST方式请求页面,说明是要通过页面查询代码,执行以下查询程序,否则直接返回默认页面
/* 以POST方式请求 */
if(strMethod.equals("POST"))
{
	if( !request.getParameter( "mOperate" ).equals( "EASYQUERY" ))
	{
		//获得代码查询条件,包括代码类型,险种信息等
		codename          = request.getParameter("txtCodeName");
		tStr=codename.toLowerCase();
		framename         = request.getParameter("txtFrameName");
		strOther          = request.getParameter("txtOther");
		codename          = codename.trim();
		framename         = framename.trim();
		strOther          = strOther.trim();
		codeCondition     = request.getParameter("txtCodeCondition");
		conditionField    = request.getParameter("txtConditionField");
		showWidth         = request.getParameter("txtShowWidth");
		changeEven		  = request.getParameter("changeEven");
		limitFlag         = request.getParameter("limitFlag");

		CodeQueryUI tCodeQueryUI=new CodeQueryUI();
		VData tData=new VData();
		LDCodeSchema tLDCodeSchema =new LDCodeSchema();
		tLDCodeSchema.setCodeType(tStr);

		GlobalInput tGI = new GlobalInput();
		try
		{
			tGI = (GlobalInput)session.getValue("GI");
		}
		catch(Exception ex)
		{
			tGI = new GlobalInput();
			System.out.println("GlobalInput is null");
		}

		tData.add(tLDCodeSchema);
		tData.add(tGI);

		//传递查询条件
		TransferData tTransferData = new TransferData();
		tTransferData.setNameAndValue("codeCondition", codeCondition);
		tTransferData.setNameAndValue("conditionField", conditionField);
		tTransferData.setNameAndValue("limitFlag", limitFlag);
		tData.add(tTransferData);

		tCodeQueryUI.submitData(tData,"QUERY||MAIN");
		if (tCodeQueryUI.mErrors.needDealError())
		{
			System.out.println("CodeQueryUI throw Errors:" + tCodeQueryUI.mErrors.getFirstError()) ;
			strValue="Code Query Faile";
		}
		else
		{
			tData.clear() ;
			tData=tCodeQueryUI.getResult() ;
			strValue=(String)tData.get(0);
			//XinYQ added on 2007-07-17 : 支持单引号和空格
			strValue = strValue.replaceAll("\\s", "%20");
			strValue = strValue.replaceAll("'", "%27");
		}
	}
}
//当请求页面的方式为POST时的代码查询程序执行完毕
//strValue="0|^001|总公司|总公司描述信息^002|北京分公司|北京分公司描述信息";
//查询结束后，将查询结果放在input域传回到客户端，并且重画页面，使其恢复到初始状态

      out.write("\n");
      out.write("<form name='fm' action='CExec.jsp' method='POST'>\n");
      out.write("\t<input type='hidden' name='txtVarData' value='");
      out.print(strValue);
      out.write("'>\n");
      out.write("\t<input type='hidden' name='txtCodeName' value=''>\n");
      out.write("\t<input type='hidden' name='txtOther'>\n");
      out.write("\t<input type='hidden' name='txtFrameName'>\n");
      out.write("\t<input type='hidden' name='txtSQL'>\n");
      out.write("\t<input type='hidden' name='startIndex'>\n");
      out.write("\t<input type='hidden' name='txtQueryResult'>\n");
      out.write("\t<input type='hidden' name='mOperate'>\n");
      out.write("\t<input type='hidden' name='txtCodeCondition'>\n");
      out.write("\t<input type='hidden' name='txtConditionField'>\n");
      out.write("\t<input type='hidden' name='txtShowWidth'>\n");
      out.write("\t<input type='hidden' name='changeEven'>\n");
      out.write("\t<input type='hidden' name='limitFlag'>\n");
      out.write("</form>\n");

//执行代码清单显示和选择的客户端JavaScript函数
if(strMethod.equals("POST"))
{
	if( !request.getParameter( "mOperate" ).equals( "EASYQUERY" ))
	{
		out.println("<script language=javascript>");
		if(!strError.equals(""))
		{
			out.println("alert('"+strError+"');");
			out.println("</script>");
			return;
		}

		out.println("try{");
		out.println("  parent.document.frames('"+framename+"').initializeCode('"+codename+"', '" + codeCondition + "' , '" + conditionField + "');");
		out.println("}catch(exception){}");
		String tempStr="";
		out.println("try{");
		out.println("  parent.document.frames('"+framename+"').showCodeList('"+codename+"',null,null,null, '" + codeCondition + "' , '" + conditionField + "' , null, '" + showWidth + "',"+changeEven+","+limitFlag+");");
		out.println("}catch(exception){}");
		out.println("</script>");
	}
	else
	{
		// easyQuery部分
		String tSQL = request.getParameter( "txtSQL" );
		String tStart = request.getParameter( "startIndex" );
		Integer tIntStart = new Integer( String.valueOf( tStart ));
		//String tFrameName = request.getParameter( "txtFrameName" );
		String tResult = "";
		String tError = "";

		EasyQueryUI tEasyQueryUI = new EasyQueryUI();
		VData tVData = new VData();
		tVData.add( tSQL );
		tVData.add( tIntStart );

		tEasyQueryUI.submitData( tVData, "QUERY||MAIN" );
		if( tEasyQueryUI.mErrors.needDealError())
		{
			tError = tEasyQueryUI.mErrors.getFirstError();
		}
		else
		{
			tVData.clear() ;
			tVData = tEasyQueryUI.getResult() ;
			tResult = ( String )tVData.getObject( 0 );

      out.write("\n");
      out.write("<script language=\"javascript\">\n");
      out.write("fm.all('txtQueryResult').value = '");
      out.print( tResult );
      out.write("';\n");
      out.write("</script>\n");

		}
		out.println("<script language=javascript>");
		out.println("try{");
		out.println("  parent.fraInterface.afterEasyQuery('" + tError + "');");
		out.println("}catch(exception){}");
		out.println("</script>");
	}
}

      out.write("\n");
      out.write("<SCRIPT language=\"JavaScript1.2\">\n");
      out.write("window.status=\"finished\";\n");
      out.write("try\n");
      out.write("{\n");
      out.write("\ttop.achieveEX = true;\t//用于判断页面初始化完成\n");
      out.write("}\n");
      out.write("catch(ex)\n");
      out.write("{}\n");
      out.write("</SCRIPT>\n");
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
