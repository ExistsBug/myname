<%
//程序名称：LXPRRIHTradeInit.jsp
//程序功能：
//创建日期：2007-12-04 15:39:06
//创建人  ：zhangle程序创建
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
    fm.all('ManageCom').value = '';
    fm.all('ManageComName').value = '';
    fm.all('StartDate').value ='';
    fm.all('EndDate').value ='';
    fm.all('CTNM').value ='';
  }
  catch(ex)
  {
    alert("在LXPRRIHTradeInput.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }      
}

function initSelBox()
{  
  try                 
  {
  }
  catch(ex)
  {
    alert("在LXPRRIHTradeInput.jsp-->InitSelBox函数中发生异常:初始化界面错误!");
  }
}                                        

function initForm()
{
  try
  {
    initInpBox();
    initSelBox();
  }
  catch(re)
  {
    alert("在LXPRRIHTradeInput.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}
</script>