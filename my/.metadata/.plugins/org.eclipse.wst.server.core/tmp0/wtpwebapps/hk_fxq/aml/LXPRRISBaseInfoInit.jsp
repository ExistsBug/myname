<%
//程序名称：LXPRRISBaseInfoInit.jsp
//程序功能：
//创建日期：
//创建人  ：
//更新记录：  
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<%
     //添加页面控件的初始化。
%>                            

<script language="JavaScript">
function initInpBox()
{ 
  try
  { 
	  fm.all('MngCom').value       = '';
	  fm.all('MngComName').value   = '';
	  fm.all('StartDate').value    ='';
	  fm.all('EndDate').value      ='';
	  fm.all('CustomerName').value ='';
  }
  catch(ex)
  {
    alert("在LXPRRISBaseInfoInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }      
}                                     

function initForm()
{
  try
  {
    initInpBox();
  }
  catch(re)
  {
    alert("在LXPRRISBaseInfoInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}
</script>