

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
//	  else if (fm.hideOperate.value == 'UPDATE||MAIN')
//	  {
//		    fm.all('PubType').disabled=false;
//			fm.all('ManageCom').disabled=false;
//			fm.all('State').disabled=false;
//	    return true;
//	  }
//	  else if (fm.hideOperate.value == 'UPLOAD||MAIN')
//	  {
//		    fm.all('PubType').disabled=false;
//			fm.all('ManageCom').disabled=false;
//			fm.all('State').disabled=false;
//	       return true;
//	  }
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
	  if(fm.hideOperate.value=='UPDATE||MAIN')
	    {		  
		     easyQuery2();
	          return true;
	    	} 
	   if(fm.hideOperate.value=='DELETE||MAIN')
	    {
		      easyQuery2();
	          return true;
	    	} 
	  else if(fm.hideOperate.value=='UPLOAD||MAIN')
	    {
		      easyQuery2();
	          return true;
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

		 if(fm.all('ManageCom').value == '' ||fm.all('ManageCom').value==null){
			  alert("����������������");
			  fm.all('ManageCom').focus();
			  return false;
		  }

//		  if(fm.all('FileName').value!=''||fm.all('FileName').value!=null){
//		    	 var path=fm.all('FileName').value;
//		    	 path=path.substring(path.lastIndexOf('.')+1).toLowerCase();
//		    	 if(path!=''&&path!='doc'&&path!='xls'&&path!='ppt'&&path!='zip'&&path!='pdf'){
//		    		 alert("���ϴ� DOC��XLS��PPT��PDF��ZIP��ʽ");
//		    		 return false;
//		    	 }
//		    }
	 if(fm.hideOperate.value == 'INSERT||MAIN')
		{
			  if (fm.all('FileName').value == '')
			  {
			    alert("����û���ϴ�������");
			    fm.all('FileName').focus();
			    return false;	  
			  }
			  return true
		}
	 

//	  else if(fm.hideOperate.value == 'PUBLE||MAIN')
//		{
//			if(fm.State.value !='R03')
//			{
//				alert("����Ϣ���Ǵ��ϱ�״̬���������ϱ���");
//				return false;
//			}
//			  return true
//		}
	  
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

//Click�¼������������ͼƬʱ�����ú���
function addClick()
{
	//����������Ӧ�Ĵ���
	  fm.addbutton.disabled=false;
	  fm.hideOperate.value="INSERT||MAIN";
	  submitForm();
}           

//Click�¼�����������޸ġ�ͼƬʱ�����ú���

function updateClick()
{
  //����������Ӧ�Ĵ���  
	  var checkFlag ;    
    checkFlag = LXKnowledgeGrid.getSelNo();
    var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
    var QuerySQL1 = " select a.FilePath from LXKnowledgeField a where 1=1  and a.IDX= '"+ SerialNo+ "' ";
    var arrSelected  = new Array();
     arrSelected = easyExecSql(QuerySQL1);
     if(fm.all('FileName').value==''||fm.all('FileName').value==null){
          if(arrSelected[0][0]==''){
   	       alert("δ�ϴ������� ");
           return false;
          }
     }

    if (checkFlag>0) {
  	  if(confirm('��ȷ��Ҫ�޸���')){
  		fm.hideOperate.value="UPDATE||MAIN"; 
		fm.all('ManageCom').disabled=false;
		fm.all('KeyWord').disabled=false;
  		  submitForm();
  		//  initForm(); 
  	  }
  	  else
  	  {
  		fm.all('ManageCom').disabled=true;
  		fm.hideOperate.value="";
  	    alert("��ȡ�����޸Ĳ�����");
  	  }
    }	
    else {
       alert("����ѡ��һ����Ϣ��");
       return;
    } 
}    

//Click�¼������������ѯ��ͼƬʱ�����ú���

function easyQuery()
{     
	 empty();
	 divReason.style.display='none';
	 var date1,date2;
     date1=fm.all('KDate').value;
     date2=fm.all('EDate').value;
     if(date1!=''&&date2!='')
     {
        if(date1>date2){
    	 alert("¼�����ڴ���¼��ֹ��");
    	 return false;
        }
     }
	   fm.hideOperate.value="QUERY||MAIN";
	   divReason.style.display='none';
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end), a.Keyword," +
	    		" (select codename from ldcode where codetype='datastate' and code=a.State) from LXKnowledgeField a "
        +    " where 1 = 1 and a.State<>'R02'and managecom like '" + comcode + "%' and a.KeyWord like '%"+ fm.all('Keyword2').value +"%' "
        QuerySQL = QuerySQL  +  getWherePart("a.State", "State")
        +  getWherePart("a.MakeDate", "KDate",">=")
        +  getWherePart("a.MakeDate", "EDate","<=")
        +   "order by a.IDX desc";
	    
	     var arrSelected  = new Array();
	     arrSelected = easyExecSql(QuerySQL);
			 //�ж��Ƿ��ѯ�ɹ�
			 if (!arrSelected) {
					   alert("����ѯ����Ϣ�����ڣ�");
					   initLXKnowledgeGrid();
					   return false;
			 }
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

function empty(){

	fm.all('IDX').value = '';
	fm.all('ManageCom').value = comcode;
    showOneCodeName("station","ManageCom","ManageComName");
	fm.all('KeyWord').value = '';
	Upload.clear('FileName');
	 //--������������-----//
    divReason.style.display='none';
}



function easyQuery2()
{     
	 var date1,date2;
     date1=fm.all('KDate').value;
     date2=fm.all('EDate').value;
     if(date1!=''&&date2!='')
     {
        if(date1>date2){
    	 alert("¼�����ڴ���¼��ֹ��");
    	 return false;
        }
     }
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end), a.Keyword," +
	    		" (select codename from ldcode where codetype='datastate' and code=a.State) from LXKnowledgeField a "
        +    " where 1 = 1 and a.State<>'R02'and managecom like '" + comcode + "%'and a.KeyWord like '%"+ fm.all('Keyword2').value +"%' " 
        QuerySQL = QuerySQL +  getWherePart("a.State", "State")
        +  getWherePart("a.MakeDate", "KDate",">=")
        +  getWherePart("a.MakeDate", "EDate","<=")
        +   "order by a.IDX desc";

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


// ѡ��ĳ�У������¼���
function queryLXKnowledgeGrid()
{  
	Upload.clear('FileName');
	divReason.style.display='none';
	var checkFlag = 0;
	fm.updatebutton.disabled=false;
	fm.addbutton.disabled=true;
	//ȡ�õ�ǰ�������
	checkFlag = LXKnowledgeGrid.getSelNo();
	if (checkFlag>0) { 
	     var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
	     var QuerySQL1 = " select a.IDX,  a.ManageCom, a.Keyword, a.FilePath ,a.State from LXKnowledgeField a where 1=1  and a.IDX= '"+ SerialNo+ "' ";
	     var arrSelected  = new Array();
	     arrSelected = easyExecSql(QuerySQL1);
		 fm.updatebutton.disabled=false;
			 //�ж��Ƿ��ѯ�ɹ�
			 if (!arrSelected) {
					   alert("����ѯ����Ϣ�����ڣ�");
					   return false;
			 }
			 else{	
				 
				    fm.all('IDX').value = arrSelected[0][0];
					fm.all('ManageCom').value = arrSelected[0][1];
					fm.all('Keyword').value = arrSelected[0][2];
				
					showOneCodeName('station','ManageCom','ManageComName');
			    
				    /* �˴���ʾ�������б� */
			        var arrSelected2  = new Array();
				    var QuerySQL2 = "select  a.CheckOption,(select name from ldcom where comcode=a.CheckCom),(select username from LDUser where usercode =a.operator),a.CheckDate,a.MakeTime from LXInformationCheck a where a.BAK1 is null and a.infostyle='04' and a.InfoIDX='"+fm.all('IDX').value+"' order by makedate desc ,maketime desc ";
				    arrSelected2 = easyExecSql(QuerySQL2);
				    if (!arrSelected2) {
						   return false;
				    }  
				     try
                      {
                   	   turnPageWaitForReasonGrid.pageDivName = "divTurnPageWaitForReasonGrid";
      	                   turnPageWaitForReasonGrid.queryModal(QuerySQL2, WaitForReasonGrid, 0, 1);      	              
                     }
                      catch (ex)
                       {
                           alert("���棺��ѯ��������Ϣ�����쳣�� ");
                       }
                     divReason.style.display='';
				 }  
	   }
	
 }


/*==========================================================================

��mulLine��˫���¼��鿴�������б�
 
===========================================================================*/
//function downloadFile2(param1)
//{
//	fm.hideOperate.value="DOWNLOAD||MAIN";
//	var row = fm.all(param1).all('LXKnowledgeGridNo').value;
//	var SerialNo = fm.all(param1).all('LXKnowledgeGrid1').value;
//	alert(fm.all(param1).all('LXKnowledgeGrid1').value);
//	 if (SerialNo == null || SerialNo < 0)
//	    {
//	       alert("����û�в�ѯ�����Ȳ�ѯ��");
//	       return;
//	    }
//	 else
//	 {
//		 var QuerySQL2 = "select reason,managecom,operator,dealdate,dealtime from LXISTradeMainReasonNew where DealNo='00000000000000001394' ";
//		     var arrSelected  = new Array();
//    	     arrSelected = easyExecSql(QuerySQL2);
//    	     alert(arrSelected);
//    			 //�ж��Ƿ��ѯ�ɹ�
//    			 if (!arrSelected) {
//    					   alert("Ŀǰ��û����������Ϣ��");
//    					   return false;
//    			 }
//    			 else{
//    				 try
//    	             {
//    	                 turnPageWaitForReasonGrid.pageDivName = "divTurnPageWaitForReasonGrid";
//    	                 turnPageWaitForReasonGrid.queryModal(QuerySQL2, WaitForReasonGrid, 0, 1);
//    	             }catch (ex)
//    	               {
//    	               alert("���棺��ѯ��������Ϣ�����쳣�� ");
//    	              } 
//    			 }
//    			 
//    			 divReason.style.display='';
//
//	 }
//	 
//}

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
          //location.href=filename;
          window.open(filename);
           
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
/*==================================================
 * �˷���ɾ��Ӳ���и��� 
 ===================================================*/ 
function deleteloadFile()
{
	var checkFlag ;
    checkFlag = LXKnowledgeGrid.getSelNo();
    if (checkFlag>0) {
        var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
   	     var QuerySQL1 = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a where 1=1  and a.IDX= '"+ SerialNo+ "' ";
         var arrSelected  = new Array();
          arrSelected = easyExecSql(QuerySQL1);
          if(arrSelected[0][5]==''){
        	  alert("û�и����� ");
              return false;
          }
   	 //�ж��Ƿ��ѯ�ɹ�  	
  	  if(confirm('��ȷ��Ҫɾ��������')){
  		  fm.hideOperate.value="DELETELOAD||MAIN";
  		  submitForm();
  		//  initForm(); 
  		   fm.addbutton.disabled=false;
  	  }
  	  else
  	  {
  		fm.hideOperate.value="";
  	    alert("��ȡ����ɾ��������");
  	  }
    }	
    else {
       alert("����ѡ��һ����Ϣ��");
       return;
    }  
}





//���ð�ť��Ӧ����,Form�ĳ�ʼ�������ڹ�����+Init.jsp�ļ���ʵ�֣�����������ΪinitForm()
function resetForm()
{

  try
  {
	   fm.all('ManageCom').disabled=false;
		fm.all('KeyWord').disabled=false;
		fm.deletebutton.disabled=false;
		fm.uploadbutton.disabled=false;
		fm.publebutton.disabled=false;
		fm.all('KeyWord').readOnly=false;
		fm.all('ManageCom').readOnly=false;
	    initForm();
	    divReason.style.display='none';
	    fm.addbutton.disabled=false;


  }
  catch(re)
  {
    alert("��LARewardPunish.js-->resetForm�����з����쳣:��ʼ���������!");
  }
} 

//Click�¼����������ɾ����ͼƬʱ�����ú���

function deleteClick()
{
	//����������Ӧ��ɾ������  
	  var checkFlag ;
      checkFlag = LXKnowledgeGrid.getSelNo();
      if (checkFlag>0) {
    	  if(confirm('��ȷ��Ҫɾ����')){
    		  fm.hideOperate.value="DELETE||MAIN";
    		  submitForm();
    		  empty();
    		  easyQuery2();
    		  
    		  fm.addbutton.disabled=false;
    	  }
    	  else
    	  {
    		  fm.hideOperate.value="";
    	    alert("��ȡ����ɾ��������");
    	  }
      }	
      else {
         alert("����ѡ��һ����Ϣ��");
         return;
      }  
} 

//�ϱ��¼�
function uploadClick()
{
	//����������Ӧ��ɾ������  
	  var checkFlag ;
    checkFlag = LXKnowledgeGrid.getSelNo();
    if (checkFlag>0) {
  	  if(confirm('��ȷ��Ҫ�ϱ���')){
  		fm.hideOperate.value="UPLOAD||MAIN";  
  		  submitForm();
  		  empty();
  		//  initForm(); 
  	  }
  	  else
  	  {
  		fm.hideOperate.value="";
  	    alert("��ȡ�����ϱ�������");
  	  }
    }	
    else {
       alert("����ѡ��һ����Ϣ��");
       return;
    }  
}

//��������
function publeClick()
{
	{
		//����������Ӧ��ɾ������  
		  var checkFlag ;
	    checkFlag = LXKnowledgeGrid.getSelNo();
	    if (checkFlag>0) {
	  	  if(confirm('��ȷ��Ҫ������')){
	  		fm.hideOperate.value="PUBLE||MAIN";  
	  		  submitForm();
	  		  empty();
	  	  }
	  	  else
	  	  {
	  		fm.hideOperate.value="";
	  	    alert("��ȡ���˷���������");
	  	  }
	    }	
	    else {
	       alert("����ѡ��һ����Ϣ��");
	       return;
	    }  
	}
}


//�����RadioBoxʱ��Ӧ��JS����
//function clickWaitForBeFileGrid()  
//{  
//	var checkFlag = 0;
//	//ȡ�õ�ǰ�������
//	checkFlag = LXKnowledgeGrid.getSelNo();
//	if (checkFlag>0) { 
//	     var dealNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
//	     
//	     var QuerySQL = "select reason,managecom,operator,dealdate,dealtime from LXISTradeMainReasonNew where DealNo='"
//	    	  			 + dealNo+"' ";
//    try
//    {
//        turnPageWaitForReasonGrid.pageDivName = "divTurnPageWaitForReasonGrid";
//        turnPageWaitForReasonGrid.queryModal(QuerySQL, WaitForReasonGrid, 0, 1);
//    }
//    catch (ex)
//    {
//        alert("���棺��ѯ��������Ϣ�����쳣�� ");
//    } 
//			 
//  }
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


/*==================================================
 * ����ϴ��ؼ�·������= 
 ===================================================*/ 
var Upload = { 
		clear: function(id){ 
		var up = (typeof id=="string")?document.getElementById(id):id; 
		if (typeof up != "object") return null; 
		var tt = document.createElement("span"); 
		tt.id = "__tt__"; 
		up.parentNode.insertBefore(tt,up); 
		var tf = document.createElement("form"); 
		tf.appendChild(up); 
		document.getElementsByTagName("body")[0].appendChild(tf); 
		tf.reset(); 
		tt.parentNode.insertBefore(up,tt); 
		tt.parentNode.removeChild(tt); 
		tt = null; 
		tf.parentNode.removeChild(tf); 
		}, 

		clearForm: function(){ 
		var inputs,frm; 
		if (arguments.length == 0) 
		{ 
		inputs = document.getElementsByTagName("input"); 
		}else{ 
		frm = (typeof arguments[0] == "string")?document.getElementById(arguments[0]):arguments[0]; 
		if (typeof frm != "object") return null; 
		inputs = frm.getElementsByTagName("input"); 
		} 

		var fs=[]; 
		for ( var i=0; i<inputs.length; i++ ) 
		{ 
		if (inputs[i].type == "file") fs[fs.length] = inputs[i]; 
		} 

		var tf = document.createElement("form"); 
		for ( var i=0; i<fs.length; i++ ) 
		{ 
		var tt = document.createElement("span"); 
		tt.id = "__tt__" + i; 
		fs[i].parentNode.insertBefore(tt, fs[i]); 
		tf.appendChild(fs[i]); 
		} 
		document.getElementsByTagName("body")[0].appendChild(tf); 
		tf.reset(); 
		for ( var i=0; i<fs.length; i++) 
		{ 
		var tt = document.getElementById("__tt__" + i); 
		tt.parentNode.insertBefore(fs[i],tt); 
		tt.parentNode.removeChild(tt); 
		} 
		tf.parentNode.removeChild(tf); 
		} 
	} 




function showCode(cObj,cName){

	 showCodeList('datastate',[cObj,cName],[0,1],null,'1 and code in(#R01#,#R03#,#R04#,#R05#,#R06#)','1');
}
function showCodeKey(cObj,cName){
		showCodeListKey('datastate',[cObj,cName],[0,1],null,' 1 code in(#R01#,#R03#,#R04#,#R05#,#R06#)','1');
}
	
	
	








