//���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";                                       //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageTasksGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

//��������
function submitForm()
{
  if(!verifyForm('fm')) return false;
  
  if(!beforeSubmit()) return false;
    var End = fm.EndDate.value;
	var cur = fm.CurrentDate.value;	
	if (End > cur)
	{
		alert("������ȡֹ�ڲ��ܴ��ڽ���");
		return false;
	}	
	
  var i = 0;
  var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");    
  fm.submit(); //�ύ

}

//�ύ�����,���������ݷ��غ�ִ�еĲ���
function afterSubmit( FlagStr, content )
{
  showInfo.close();
	 
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;  
  	//parent.fraInterface.initForm();
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
  }
}

//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{
  try
  {
	  initForm();
  }
  catch(re)
  {
  	alert("��DataInterface.js-->resetForm�����з����쳣:��ʼ���������!");
  }
} 
         
//��ʾfrmSubmit��ܣ���������
function showSubmitFrame(cDebug)
{
  if(cDebug=="1")
  {
			parent.fraMain.rows = "0,0,50,82,*";
  }
 	else {
  		parent.fraMain.rows = "0,0,0,82,*";
 	}
}

//ִ������         
function CalSave()
{
	fm.sFlag.value="cal";
  submitForm();	
}   
function ReCalSave()
{
	fm.sFlag.value="recal";
  submitForm();	
}
function FillCalSave()
{
	fm.sFlag.value="fillcal";
  submitForm();	
}  
function DeleteCalSave()
{
	fm.sFlag.value="delete";
  submitForm();	
} 
function beforeSubmit()
{  
   if (fm.all('StartDate').value > fm.all('EndDate').value)
   {
   	alert("�������ڱ���С�ڵ��ڼ���ֹ�ڣ�");
        fm.all('StartDate').value = '';
        fm.all('EndDate').value = '';
   	return false;
   }
   return true;
}

function backCal()
{
  if(!verifyForm('fm1')) return false;
  	
	
  var i = 0;
  var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;  
  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");    
  fm1.submit(); //�ύ
}
function QueryGrid(){
	var QuerySQL = "select appid, "
                 +        "calcode, "
                 +        "csnm, "
                 +        "dealno, "
                 +        "flag, "
//                 +        "(select codename from ldcode where code=flag and codetype='amllxcalflag') , "         
                 +        "HTDT, "
//                 +        "modifydate, "
                 +        "(select b.remark from lxcalmode b where LXCalResult.appid=b.appid and LXCalResult.calcode=b.calcode and no='0') ,"
                 +        "ErrCause "
                 +    "from LXCalResult "
                 +    "where 1 = 1 "
                 +      getWherePart("HTDT", "StartDate1", ">=")
                 +      getWherePart("HTDT", "EndDate1", "<=")
                 +      getWherePart("Flag", "Flag")
                 +   "order by modifydate desc, flag desc, dealno ";
//    alert(QuerySQL);
    try
    {
        turnPageTasksGrid.pageDivName = "divTurnPageTasksGrid";
        turnPageTasksGrid.queryModal(QuerySQL, TasksGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ����������� ");
    }
	}
function resetform1(){
	      fm.all('StartDate1').value = '';
        fm.all('EndDate1').value = '';
        fm.all('Flag').value = '';
        fm.all('FlagName').value = '';
        resetForm();		
	}