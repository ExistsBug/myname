 //               该文件中包含客户端需要处理的函数和事件var showInfo;
var showInfo;
var saveClick=false;
var turnPage = new turnPageClass();
window.onfocus=myonfocus;

//使得从该窗口弹出的窗口能够聚焦
function myonfocus()
{
	if(showInfo!=null)
	{
	  try
	  {
	    showInfo.focus();  
	  }
	  catch(ex)
	  {
	    showInfo=null;
	  }
	}
}

//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content )
{
  if (FlagStr == "Fail" )
  {
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
	    //提交后清空表单
 		  initForm();
  }  
}
//重置按钮对应操作
function resetForm()
{
  initForm();
} 


function submitSave()
{  
			if(fm.ManageCom.value==null ||fm.ManageCom.value=="")
		{
		 alert("统计机构不能为空!");
		 return;   
		}
   
      if((fm.StartDate.value==""))
    {
    	alert("请输入统计起期!!!");
    		return;
    }
       if((fm.EndDate.value==""))
    {
    	alert("请输入统计止期!!!");
    		return;
    }
      if(fm.StartDate.value>fm.EndDate.value)
    {
    	alert("止期不能在起期之前!!!");
    		return;
    }
    	fm.action="LXPRRIHTradeSave.jsp";
      fm.submit();
      return ;
}