

//程序名称：LARewardPunishInput.js
//程序功能：  该文件中包含客户端需要处理的函数和事件

//创建日期：2011-12-18
//创建人  ：

//更新记录：  更新人    更新日期     更新原因/内容

var mOperate="";
var showInfo;
var turnPage = new turnPageClass();
var turnPageInfo = new turnPageClass();
var turnPageWaitForReasonGrid= new turnPageClass();



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

//提交，保存按钮对应操作

function submitForm()
{
	 if (!beforeSubmit())
	  {
	  	return false;
	  }
	  if (fm.hideOperate.value == null || fm.hideOperate.value == "")
	  {
	    alert("操作控制数据丢失！！！");
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
	  var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
	  var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
	  showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");   
	  fm.submit(); //提交
}

//提交后操作,服务器数据返回后执行的操作

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
   
    //执行下一步操作

  }
}

//提交前的校验、计算  
function beforeSubmit()
{
	 if(!verifyInput2())
		{
			return false;
		}
	  //添加操作

		 if(fm.all('ManageCom').value == '' ||fm.all('ManageCom').value==null){
			  alert("请输入管理机构代码");
			  fm.all('ManageCom').focus();
			  return false;
		  }

//		  if(fm.all('FileName').value!=''||fm.all('FileName').value!=null){
//		    	 var path=fm.all('FileName').value;
//		    	 path=path.substring(path.lastIndexOf('.')+1).toLowerCase();
//		    	 if(path!=''&&path!='doc'&&path!='xls'&&path!='ppt'&&path!='zip'&&path!='pdf'){
//		    		 alert("请上传 DOC、XLS、PPT、PDF、ZIP格式");
//		    		 return false;
//		    	 }
//		    }
	 if(fm.hideOperate.value == 'INSERT||MAIN')
		{
			  if (fm.all('FileName').value == '')
			  {
			    alert("您还没有上传附件！");
			    fm.all('FileName').focus();
			    return false;	  
			  }
			  return true
		}
	 

//	  else if(fm.hideOperate.value == 'PUBLE||MAIN')
//		{
//			if(fm.State.value !='R03')
//			{
//				alert("该信息“非待上报状态”，不能上报！");
//				return false;
//			}
//			  return true
//		}
	  
  return true	
}           

//显示frmSubmit框架，用来调试

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

//Click事件，当点击增加图片时触发该函数
function addClick()
{
	//下面增加相应的代码
	  fm.addbutton.disabled=false;
	  fm.hideOperate.value="INSERT||MAIN";
	  submitForm();
}           

//Click事件，当点击“修改”图片时触发该函数

function updateClick()
{
  //下面增加相应的代码  
	  var checkFlag ;    
    checkFlag = LXKnowledgeGrid.getSelNo();
    var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
    var QuerySQL1 = " select a.FilePath from LXKnowledgeField a where 1=1  and a.IDX= '"+ SerialNo+ "' ";
    var arrSelected  = new Array();
     arrSelected = easyExecSql(QuerySQL1);
     if(fm.all('FileName').value==''||fm.all('FileName').value==null){
          if(arrSelected[0][0]==''){
   	       alert("未上传附件！ ");
           return false;
          }
     }

    if (checkFlag>0) {
  	  if(confirm('您确定要修改吗？')){
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
  	    alert("您取消了修改操作！");
  	  }
    }	
    else {
       alert("请先选择一条信息！");
       return;
    } 
}    

//Click事件，当点击“查询”图片时触发该函数

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
    	 alert("录入起期大于录入止期");
    	 return false;
        }
     }
	   fm.hideOperate.value="QUERY||MAIN";
	   divReason.style.display='none';
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end), a.Keyword," +
	    		" (select codename from ldcode where codetype='datastate' and code=a.State) from LXKnowledgeField a "
        +    " where 1 = 1 and a.State<>'R02'and managecom like '" + comcode + "%' and a.KeyWord like '%"+ fm.all('Keyword2').value +"%' "
        QuerySQL = QuerySQL  +  getWherePart("a.State", "State")
        +  getWherePart("a.MakeDate", "KDate",">=")
        +  getWherePart("a.MakeDate", "EDate","<=")
        +   "order by a.IDX desc";
	    
	     var arrSelected  = new Array();
	     arrSelected = easyExecSql(QuerySQL);
			 //判断是否查询成功
			 if (!arrSelected) {
					   alert("所查询的信息不存在！");
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
         alert("警告：查询可选上报报文信息出现异常！ ");
      }
}

function empty(){

	fm.all('IDX').value = '';
	fm.all('ManageCom').value = comcode;
    showOneCodeName("station","ManageCom","ManageComName");
	fm.all('KeyWord').value = '';
	Upload.clear('FileName');
	 //--隐藏审核意见表-----//
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
    	 alert("录入起期大于录入止期");
    	 return false;
        }
     }
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end), a.Keyword," +
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
         alert("警告：查询可选上报报文信息出现异常！ ");
      }
}


// 选择某行，触发事件。
function queryLXKnowledgeGrid()
{  
	Upload.clear('FileName');
	divReason.style.display='none';
	var checkFlag = 0;
	fm.updatebutton.disabled=false;
	fm.addbutton.disabled=true;
	//取得当前点击的行
	checkFlag = LXKnowledgeGrid.getSelNo();
	if (checkFlag>0) { 
	     var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
	     var QuerySQL1 = " select a.IDX,  a.ManageCom, a.Keyword, a.FilePath ,a.State from LXKnowledgeField a where 1=1  and a.IDX= '"+ SerialNo+ "' ";
	     var arrSelected  = new Array();
	     arrSelected = easyExecSql(QuerySQL1);
		 fm.updatebutton.disabled=false;
			 //判断是否查询成功
			 if (!arrSelected) {
					   alert("所查询的信息不存在！");
					   return false;
			 }
			 else{	
				 
				    fm.all('IDX').value = arrSelected[0][0];
					fm.all('ManageCom').value = arrSelected[0][1];
					fm.all('Keyword').value = arrSelected[0][2];
				
					showOneCodeName('station','ManageCom','ManageComName');
			    
				    /* 此处显示审核意见列表 */
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
                           alert("警告：查询审核意见信息出现异常！ ");
                       }
                     divReason.style.display='';
				 }  
	   }
	
 }


/*==========================================================================

在mulLine中双击事件查看审核意见列表
 
===========================================================================*/
//function downloadFile2(param1)
//{
//	fm.hideOperate.value="DOWNLOAD||MAIN";
//	var row = fm.all(param1).all('LXKnowledgeGridNo').value;
//	var SerialNo = fm.all(param1).all('LXKnowledgeGrid1').value;
//	alert(fm.all(param1).all('LXKnowledgeGrid1').value);
//	 if (SerialNo == null || SerialNo < 0)
//	    {
//	       alert("您还没有查询，请先查询！");
//	       return;
//	    }
//	 else
//	 {
//		 var QuerySQL2 = "select reason,managecom,operator,dealdate,dealtime from LXISTradeMainReasonNew where DealNo='00000000000000001394' ";
//		     var arrSelected  = new Array();
//    	     arrSelected = easyExecSql(QuerySQL2);
//    	     alert(arrSelected);
//    			 //判断是否查询成功
//    			 if (!arrSelected) {
//    					   alert("目前还没有相关审核信息！");
//    					   return false;
//    			 }
//    			 else{
//    				 try
//    	             {
//    	                 turnPageWaitForReasonGrid.pageDivName = "divTurnPageWaitForReasonGrid";
//    	                 turnPageWaitForReasonGrid.queryModal(QuerySQL2, WaitForReasonGrid, 0, 1);
//    	             }catch (ex)
//    	               {
//    	               alert("警告：查询审核意见信息出现异常！ ");
//    	              } 
//    			 }
//    			 
//    			 divReason.style.display='';
//
//	 }
//	 
//}

/*==========================================================================
 
 在mulLine中双击事件下载附件  
  
===========================================================================*/
function downloadFile(param1)
{
	fm.hideOperate.value="DOWNLOAD||MAIN";
	var row = fm.all(param1).all('LXKnowledgeGridNo').value;
	var SerialNo = fm.all(param1).all('LXKnowledgeGrid1').value;
	 if (SerialNo == null || SerialNo < 0)
	    {
	       alert("您还没有查询，请先查询！");
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
        	  alert("没有附件！ ");
              return false;
          }

          filename="../aml/Information/" + filename;
          //location.href=filename;
          window.open(filename);
           
	 }
}

/*==========================================================================

点击【下载】按钮，下载附件  
 
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
//	       alert("您还没有查询，请先查询！");
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
//        	  alert("没有附件！ ");
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
 * 此方法删除硬盘中附件 
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
        	  alert("没有附件！ ");
              return false;
          }
   	 //判断是否查询成功  	
  	  if(confirm('您确定要删除附件吗？')){
  		  fm.hideOperate.value="DELETELOAD||MAIN";
  		  submitForm();
  		//  initForm(); 
  		   fm.addbutton.disabled=false;
  	  }
  	  else
  	  {
  		fm.hideOperate.value="";
  	    alert("您取消了删除操作！");
  	  }
    }	
    else {
       alert("请先选择一条信息！");
       return;
    }  
}





//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
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
    alert("在LARewardPunish.js-->resetForm函数中发生异常:初始化界面错误!");
  }
} 

//Click事件，当点击“删除”图片时触发该函数

function deleteClick()
{
	//下面增加相应的删除代码  
	  var checkFlag ;
      checkFlag = LXKnowledgeGrid.getSelNo();
      if (checkFlag>0) {
    	  if(confirm('您确定要删除吗？')){
    		  fm.hideOperate.value="DELETE||MAIN";
    		  submitForm();
    		  empty();
    		  easyQuery2();
    		  
    		  fm.addbutton.disabled=false;
    	  }
    	  else
    	  {
    		  fm.hideOperate.value="";
    	    alert("您取消了删除操作！");
    	  }
      }	
      else {
         alert("请先选择一条信息！");
         return;
      }  
} 

//上报事件
function uploadClick()
{
	//下面增加相应的删除代码  
	  var checkFlag ;
    checkFlag = LXKnowledgeGrid.getSelNo();
    if (checkFlag>0) {
  	  if(confirm('您确定要上报吗？')){
  		fm.hideOperate.value="UPLOAD||MAIN";  
  		  submitForm();
  		  empty();
  		//  initForm(); 
  	  }
  	  else
  	  {
  		fm.hideOperate.value="";
  	    alert("您取消了上报操作！");
  	  }
    }	
    else {
       alert("请先选择一条信息！");
       return;
    }  
}

//发布功能
function publeClick()
{
	{
		//下面增加相应的删除代码  
		  var checkFlag ;
	    checkFlag = LXKnowledgeGrid.getSelNo();
	    if (checkFlag>0) {
	  	  if(confirm('您确定要发布吗？')){
	  		fm.hideOperate.value="PUBLE||MAIN";  
	  		  submitForm();
	  		  empty();
	  	  }
	  	  else
	  	  {
	  		fm.hideOperate.value="";
	  	    alert("您取消了发布操作！");
	  	  }
	    }	
	    else {
	       alert("请先选择一条信息！");
	       return;
	    }  
	}
}


//当点击RadioBox时响应的JS函数
//function clickWaitForBeFileGrid()  
//{  
//	var checkFlag = 0;
//	//取得当前点击的行
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
//        alert("警告：查询审核意见信息出现异常！ ");
//    } 
//			 
//  }
//}


//显示div，第一个参数为一个div的引用，第二个参数为是否显示，如果为"true"则显示，否则不显示

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
 * 清空上传控件路径代码= 
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
	
	
	








