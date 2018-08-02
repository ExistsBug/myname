 //该文件中包含客户端需要处理的函数和事件
var showInfo;
var mDebug="0";
var saveClick=false;
var arrDataSet;
var turnPage = new turnPageClass();


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
  }
}

//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
  initForm();
} 

 
//提交前的校验、计算  
function beforeSubmit()
{
		if(fm.MngCom.value==null ||fm.MngCom.value=="")
		{
			alert("管理机构不能为空!");
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
		return true;
}           

        
function submitSave()
{  
    if(!beforeSubmit())
    {
    	return;
    }
    fm.action="LXPRRISDetailSave.jsp";
    fm.submit();
    return ;
}