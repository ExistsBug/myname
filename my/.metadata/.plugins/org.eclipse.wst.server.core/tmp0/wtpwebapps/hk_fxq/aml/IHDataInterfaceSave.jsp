<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：IHDataInterfaceUISave.jsp
//程序功能：
//创建日期：2003-06-24
//创建人  ：
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="java.text.SimpleDateFormat"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
  <%@page import="com.sinosoft.lis.calfactor.*"%>
<%
  //接收信息，并作校验处理。
  //输入参数
  System.out.println("===================进入IHDataInterfaceUISave.jsp页面===================");
  DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
  Tishu_IH_ResDeal tTishu_IH_ResDeal = new Tishu_IH_ResDeal();

  //输出参数
  CErrors tError = null;
  String tOperate=request.getParameter("sFlag");
  tOperate = tOperate.trim();             
  String FlagStr = "Fail";
  String Content = "";
  GlobalInput tG = new GlobalInput();
  tG=(GlobalInput)session.getValue("GI");
  String sFlag=request.getParameter("sFlag");
  String startDate="";
  String endDate="";
  String backDate="";
  String tihoris = "";//是大额提数还是可疑提数标志
  String calmngcom = "";
  int sCount=0;
  int fCount=0;
  VData tVData = new VData();
	startDate=request.getParameter("StartDate");
	endDate=request.getParameter("EndDate");
	if(startDate.length()==8)
	{
		startDate=startDate.substring(0,4)+"-"+startDate.substring(4,6)+"-"+startDate.substring(6,8);
	}
	if(endDate.length()==8)
	{
		endDate=endDate.substring(0,4)+"-"+endDate.substring(4,6)+"-"+endDate.substring(6,8);
	}
	tihoris = "IH";
	calmngcom = tG.ComCode;//写成86是因为当时测试时写死，后来提交时忘改了。
	
	tVData.add(sFlag);
	tVData.add(startDate);
	tVData.add(endDate);
	tVData.add(tihoris);
    tVData.add(calmngcom);
	tVData.add(tG);
	System.out.println("====sFlag========"+sFlag);
	System.out.println("====startDate===="+startDate);
	System.out.println("====endDate======"+endDate);
	System.out.println("====tihoris======"+tihoris);
	System.out.println("====calmngcom===="+calmngcom);

  FlagStr="";

  try
  {
    tDataInterfaceUI.submitData(tVData,tOperate);
    sCount=tDataInterfaceUI.getSCount();
    fCount=tDataInterfaceUI.getFCount();
    System.out.println("大额提数DataInterfaceUI中返回结果= "+FlagStr.equals("Fail"));
    /*if(sFlag.equals("fillcal")||sFlag.equals("recal")){
      if(tTishu_IH_ResDeal.submitData("recal",startDate,endDate,tihoris,calmngcom,tOperate,"ebao")){
          sCount=sCount+tTishu_IH_ResDeal.GetsCount();
      }
    }else{
     if(tTishu_IH_ResDeal.submitData("cal",startDate,endDate,tihoris,calmngcom,tOperate,"ebao"))
     {sCount=sCount+tTishu_IH_ResDeal.GetsCount();}
    }*/
    System.out.println("大额提数个险中返回结果");
  }
  catch(Exception ex)
  {
    System.out.println("1111111111111");
    Content = "操作失败，原因是:" + ex.toString();
    FlagStr = "Fail";
  }
  
  if (!FlagStr.equals("Fail"))
  {
    tError = tDataInterfaceUI.mErrors;
    if (!tError.needDealError()&&sFlag.equals("cal"))
    {                          
       Content = " 操作成功! <font color=red>提取客户信息成功数目："+sCount+"条。提取客户信息失败数目："+fCount+"条</font>";
       FlagStr = "Succ";
    }
    else if (!tError.needDealError()&&sFlag.equals("recal"))
    {                          
       Content = " 操作成功! <font color=red>重新提取客户信息成功数目："+sCount+"条。重新提取客户信息失败数目："+fCount+"条</font>";
       FlagStr = "Succ";
    }
    else if (!tError.needDealError()&&sFlag.equals("fillcal"))
    {                          
       Content = " 补提客户信息成功! <font color=red>客户信息成功总数目："+sCount+"条。补提客户信息失败总数目："+fCount+"条</font>";
       FlagStr = "Succ";
    }
    else if (!tError.needDealError()&&sFlag.equals("delete"))
    {                          
       Content = " 操作成功! <font color=red>删除数据数目："+(sCount+fCount)+"条</font>";
       FlagStr = "Succ";
    }
    else                                                                           
    {
       Content = " 操作失败，原因是:" + tError.getFirstError();
       FlagStr = "Fail";
    }
  }

%>
<html>
<script language="javascript">
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>

</html>

