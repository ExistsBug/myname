//�������ƣ�LARewardPunishInput.js
//�����ܣ�  ���ļ��а����ͻ�����Ҫ����ĺ������¼�

//�������ڣ�2011-12-18
//������  ��

//���¼�¼��  ������    ��������     ����ԭ��/����

var mOperate="";
var showInfo;
var turnPage = new turnPageClass();
var turnPageInfo = new turnPageClass();
var turnPageWaitForReasonGrid= new turnPageClass();

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

//�ύ�����水ť��Ӧ����

function submitForm()
{
	 if (!beforeSubmit())
	  {
	  	return false;
	  }
	  if (fm.hideOperate.value == null || fm.hideOperate.value == "")
	  {
	    alert("�����������ݶ�ʧ������");
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
  mOperate="";
  showInfo.close();
  if (FlagStr == "Fail" )
  {             
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;  
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px"); 
    if(fm.hideOperate.value=='INSERT||MAIN')
    {
          return true;
    	}
//    else if(fm.hideOperate.value=='UPDATE||MAIN'){
//    	 fm.all('PubType').disabled=true;
//			fm.all('ManageCom').disabled=true;
//			fm.all('State').disabled=true;
//  	}
    else if(fm.hideOperate.value=='DELETE||MAIN')
    	{
  	      fm.deletebutton.disabled=false;
  	}
    
  }
  else
  { 
    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;  
  	//parent.fraInterface.initForm();
    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px"); 
    if(fm.hideOperate.value=='INSERT||MAIN')
    {
    	 fm.addbutton.disabled=true;
    	 fm.updatebutton.disabled=false;
    	// fm.deletebutton.disabled=false;
    	}
    //showIndex();
   
    //ִ����һ������

  }
}

//�ύǰ��У�顢����  
function beforeSubmit()
{
	 if(!verifyInput2())
		{
			return false;
		}
	  //��Ӳ���
	  if(fm.all('PubType').value == ''||fm.all('PubType').value==''){
		  alert("�������ϱ�����");
		  fm.all('PubType').focus();
		  return false;
	  }
		 if(fm.all('ManageCom').value == '' ||fm.all('ManageCom').value==null){
			  alert("����������������");
			  fm.all('ManageCom').focus();
			  return false;
		  }
		  if(fm.all('State').value == ''||fm.all('State').value==null){
			  alert("����������״̬");
			  fm.all('State').focus();
			  return false;
		  }
		  if(fm.all('PubType').value == ''||fm.all('PubType').value==null){
			  alert("����������������");
			  fm.all('PubType').focus();
			  return false;
		  }
		  if(fm.all('FileName').value!=''||fm.all('FileName').value!=null){
		    	 var path=fm.all('FileName').value;
		    	 path=path.substring(path.lastIndexOf('.')+1).toLowerCase();
		    	 if(path!=''&&path!='doc'&&path!='xls'&&path!='ppt'&&path!='zip'&&path!='pdf'){
		    		 alert("���ϴ� DOC��XLS��PPT��PDF��ZIP��ʽ");
		    		 return false;
		    	 }
		    }

	  
  return true	
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



//Click�¼������������ѯ��ͼƬʱ�����ú���

function easyQuery()
{     
     var date1,date2;
     date1=fm.all('FDate').value;
     date2=fm.all('EDate').value;
     if(date1!=''&&date2!='')
     {
        if(date1>date2){
    	 alert("�������ڴ��ڷ���ֹ��");
    	 return false;
        }
     }
	   fm.hideOperate.value="QUERY||MAIN";
	   
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end), a.Keyword," +
	    		" (case a.State when 'R01'then '���ϱ�' when 'R03' then '���ͨ��' when 'R04' then '��˲�ͨ��' when 'R05' then '�ѷ���'end),Pubdate from LXKnowledgeField a "
        +    " where 1 = 1 and a.PubType='04' and a.State='R05' and managecom like '" + comcode + "%' and a.KeyWord like '%"+ fm.all('Keyword').value +"%'"
        QuerySQL = QuerySQL + getWherePart("a.ManageCom", "ManageCom")
        +      getWherePart("a.PubDate", "FDate",">=")
        +      getWherePart("a.PubDate", "EDate","<=")
      //  +   "order by a.IDX desc";
       try
     {
    	 
	    turnPageInfo.pageDivName = "divTurnPageLXKnowledgeGrid";
	    turnPageInfo.queryModal(QuerySQL, LXKnowledgeGrid, 0, 1);
        }
     catch (ex)
     {
         alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
      }
}

/*==========================================================================
 
 ��mulLine��˫���¼����ظ���  
 
===========================================================================*/
function downloadFile(param1)
{
	fm.hideOperate.value="DOWNLOAD||MAIN";
	var row = fm.all(param1).all('LXKnowledgeGridNo').value;
	var SerialNo = fm.all(param1).all('LXKnowledgeGrid1').value;
	 if (SerialNo == null || SerialNo < 0)
	    {
	       alert("����û�в�ѯ�����Ȳ�ѯ��");
	       return;
	    }
	 else
	 {
	      var QuerySQL1 = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a  "
	                       + "where 1=1 and a.IDX= '"+ SerialNo+ "' ";
          var arrSelected  = new Array();
          arrSelected = easyExecSql(QuerySQL1);
          var filename=arrSelected[0][5];
          filename=filename.substring(filename.lastIndexOf('/')+1);
          if(filename==""||filename==null)
          {
        	  alert("û�и����� ");
              return false;
          }
        	  filename="../aml/Information/" + filename;
              location.href=filename;
             // window.open(filename);
	 }
}

/*==========================================================================

��������ء���ť�����ظ���  
 
===========================================================================*/
//function downloadFile(param1)
//{
////	    var ss="jjj/kk"
////		var ee=ss.substring(ss.lastIndexOf('/')+1)
////		alert(ee);
////		var dd=ss.endsWith("/")
//	fm.hideOperate.value="DOWNLOAD||MAIN";
//	checkFlag = LXKnowledgeGrid.getSelNo();
//	var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
//	 if (SerialNo == null || SerialNo < 0)
//	    {
//	       alert("����û�в�ѯ�����Ȳ�ѯ��");
//	       return;
//	    }
//	 else
//	 {
//	      var QuerySQL1 = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a  "
//	                       + "where 1=1 and a.IDX= '"+ SerialNo+ "' ";
//          var arrSelected  = new Array();
//          arrSelected = easyExecSql(QuerySQL1);
//          var filename=arrSelected[0][5];
//          filename=filename.substring(filename.lastIndexOf('/')+1);
//          if(filename==""||filename==null)
//          {
//        	  alert("û�и����� ");
//              return false;
//          }
//          else
//          {
//        	 
//        	  filename="send/" + filename;
//              window.open(filename);
//          }
//	 }
//}


//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{
  try
  {
    initForm();

  }
  catch(re)
  {
    alert("��LARewardPunish.js-->resetForm�����з����쳣:��ʼ���������!");
  }
} 

function DetailClick(){
	
	fm.hideOperate.value="DOWNLOAD||MAIN";
	checkFlag = LXKnowledgeGrid.getSelNo();
	var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
	 if (SerialNo == null || SerialNo =='')
	    {
	       alert("����û�в�ѯ�����Ȳ�ѯ��");
	       return false;
	    }
	 else
	 {
			window.open("./LXKnowledgeFieldDetailInput.jsp?idx="+SerialNo,"�鿴֪ʶ԰����ϸ��Ϣ", "left");
	 }
	
	
}


//function afterQuery(tIdx){
//	//initTasksGrid();
//   var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end), a.Keyword," +
//	" (case a.State when 'R01'then '���ϱ�' when 'R03' then '���ͨ��' when 'R04' then '��˲�ͨ��' when 'R05' then '�ѷ���'end),Pubdate from LXKnowledgeField a "
//   +    " where 1 = 1 and a.PubType='04' and a.State='R05'  and a.IDX= '"+ tIdx+ "' ";
//    
//     turnPageLXKnowledgeGrid = new turnPageClass();
//     turnPageLXKnowledgeGrid.pageDivName = "divTurnPageLXKnowledgeGrid";
//	 turnPageLXKnowledgeGrid.queryModal(QuerySQL, LXKnowledgeGrid);	
//}

//��ʾdiv����һ������Ϊһ��div�����ã��ڶ�������Ϊ�Ƿ���ʾ�����Ϊ"true"����ʾ��������ʾ

function showDiv(cDiv,cShow)
{
  if (cShow=="true")
  {
    cDiv.style.display="";
  }
  else
  {
    cDiv.style.display="none";  
  }
}

//ʵ��ҳ����ת
function QueryDataReport(){
	//alert(1111);
	var sOpenWinURL = "../ComInfoMag/LXdataReportPassMain.jsp";
	//var sOpenWinURL = "../DataReportBackup/LXdataReportPassInput.jsp";
    OpenWindowNew(sOpenWinURL, "��ҳ��", "left");	
}



