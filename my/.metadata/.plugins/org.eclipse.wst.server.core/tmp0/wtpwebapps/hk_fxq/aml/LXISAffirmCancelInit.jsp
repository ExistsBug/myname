<%
//程序名称：BankDealQueryListInit.jsp
//程序功能：
//创建日期：
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<%
     //添加页面控件的初始化。
%>                            

<script language="JavaScript">

// 输入框的初始化（单记录部分）
function initInpBox()
{ 

  try
  {                                   
	fm.ReMark.value="";
	fm.dealno.value=tdealno;
	fm.datastate.value=tdatastate;
	fm.oper.value=toper;
  }
  catch(ex)
  {
    alert("在LXISAffirmCancelInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }      
}

function initForm()
{
  try
  {
    initInpBox(); 
    initContent(); 
  }
  catch(re)
  {
    alert("在LXISAffirmCancelInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}
 
</script>