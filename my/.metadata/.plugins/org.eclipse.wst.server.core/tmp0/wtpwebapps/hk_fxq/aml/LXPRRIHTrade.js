 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�var showInfo;
var showInfo;
var saveClick=false;
var turnPage = new turnPageClass();
window.onfocus=myonfocus;

//ʹ�ôӸô��ڵ����Ĵ����ܹ��۽�
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

//�ύ�����,���������ݷ��غ�ִ�еĲ���
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
	    //�ύ����ձ�
 		  initForm();
  }  
}
//���ð�ť��Ӧ����
function resetForm()
{
  initForm();
} 


function submitSave()
{  
			if(fm.ManageCom.value==null ||fm.ManageCom.value=="")
		{
		 alert("ͳ�ƻ�������Ϊ��!");
		 return;   
		}
   
      if((fm.StartDate.value==""))
    {
    	alert("������ͳ������!!!");
    		return;
    }
       if((fm.EndDate.value==""))
    {
    	alert("������ͳ��ֹ��!!!");
    		return;
    }
      if(fm.StartDate.value>fm.EndDate.value)
    {
    	alert("ֹ�ڲ���������֮ǰ!!!");
    		return;
    }
    	fm.action="LXPRRIHTradeSave.jsp";
      fm.submit();
      return ;
}