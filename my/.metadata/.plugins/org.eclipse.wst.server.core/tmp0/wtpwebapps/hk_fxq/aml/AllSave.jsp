<%@page contentType="text/html;charset=GBK" %>

<!--用户校验类-->
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.db.LWMissionDB"%>
<%@page import="com.sinosoft.lis.aml.*"%>


<%
System.out.println("#########################Save.jsp start#################################");
//输入参数


//输出参数
CErrors tError = null;
String FlagStr = "Fail";
String Content = "";
GlobalInput tGI = new GlobalInput();
tGI = (GlobalInput)session.getValue("GI");

BackAllDeal tBackAllDeal = new BackAllDeal(); //

//页面有效性判断
if(tGI == null)
{
    FlagStr = "Fail";
    Content = "页面失效,请重新登陆";
    System.out.println("页面失效,请重新登陆");
}
else
{
		String Operator  = tGI.Operator ; //保存登陆管理员账号
    String ManageCom = tGI.ManageCom  ; //保存登陆区站,ManageCom=内存中登陆区站代码
    String BackFileNo=request.getParameter("BackFileNo");
		String cOperator = request.getParameter("cOperator");
    String DealType = request.getParameter("DealType");

		System.out.println("BackFileNo================"+BackFileNo);
		System.out.println("cOperator================"+cOperator);
		System.out.println("DealType================"+DealType);

    TransferData tTransferData = new TransferData();
   	tTransferData.setNameAndValue("BackFileNo", BackFileNo);
    tTransferData.setNameAndValue("cOperator", cOperator);
		tTransferData.setNameAndValue("DealType", DealType);


    VData tVData = new VData();
    tVData.add(tGI);
    tVData.add(tTransferData);




        try
        {
            //数据提交

            if (!tBackAllDeal.submitData(tVData,cOperator))
            {
            		System.out.println("处理数据失败");
                Content = " 处理数据失败，原因是: " ;
                FlagStr = "Fail";
            }
            else
            {
                tVData.clear();
                Content = " 数据提交成功！";
                FlagStr = "Succ";
            }
        }
        catch(Exception ex)
        {
            Content = "数据提交tTradeMissSaveBL失败，原因是:" + ex.toString();
            FlagStr = "Fail";
        }
    }

%>
<html>
<script language="javascript" >
    parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>
</html>
