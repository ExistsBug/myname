 //���ļ��а����ͻ�����Ҫ����ĺ������¼�
var showInfo;
var mDebug="0";
var saveClick=false;
var arrDataSet;
var turnPage = new turnPageClass();


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
  }
}

//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{
  initForm();
} 

 
//�ύǰ��У�顢����  
function beforeSubmit()
{
		if(fm.MngCom.value==null ||fm.MngCom.value=="")
		{
			alert("�����������Ϊ��!");
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