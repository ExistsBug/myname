<%@page contentType="text/html;charset=GBK" %>
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

  
<script language="JavaScript">


function initForm(){
  try
  {
//  var arrReturn = new Array();  
//   arrReturn = getQueryResult();
//	afterQuery( arrReturn ); 
     getQueryResult();
  }
  catch(re)
  {
    alert("在LXKnowledgeFieldDetailInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

</script>