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
	  if(fm.all('PubType').value == ''||fm.all('PubType').value==''){
		  alert("请输入上报类型");
		  fm.all('PubType').focus();
		  return false;
	  }
		 if(fm.all('ManageCom').value == '' ||fm.all('ManageCom').value==null){
			  alert("请输入管理机构代码");
			  fm.all('ManageCom').focus();
			  return false;
		  }
		  if(fm.all('State').value == ''||fm.all('State').value==null){
			  alert("请输入数据状态");
			  fm.all('State').focus();
			  return false;
		  }
		  if(fm.all('PubType').value == ''||fm.all('PubType').value==null){
			  alert("请输入管理机构代码");
			  fm.all('PubType').focus();
			  return false;
		  }
		  if(fm.all('FileName').value!=''||fm.all('FileName').value!=null){
		    	 var path=fm.all('FileName').value;
		    	 path=path.substring(path.lastIndexOf('.')+1).toLowerCase();
		    	 if(path!=''&&path!='doc'&&path!='xls'&&path!='ppt'&&path!='zip'&&path!='pdf'){
		    		 alert("请上传 DOC、XLS、PPT、PDF、ZIP格式");
		    		 return false;
		    	 }
		    }

	  
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



//Click事件，当点击“查询”图片时触发该函数

function easyQuery()
{     
     var date1,date2;
     date1=fm.all('FDate').value;
     date2=fm.all('EDate').value;
     if(date1!=''&&date2!='')
     {
        if(date1>date2){
    	 alert("发布起期大于发布止期");
    	 return false;
        }
     }
	   fm.hideOperate.value="QUERY||MAIN";
	   
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end), a.Keyword," +
	    		" (case a.State when 'R01'then '待上报' when 'R03' then '审核通过' when 'R04' then '审核不通过' when 'R05' then '已发布'end),Pubdate from LXKnowledgeField a "
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
         alert("警告：查询可选上报报文信息出现异常！ ");
      }
}

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
              location.href=filename;
             // window.open(filename);
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


//重置按钮对应操作,Form的初始化函数在功能名+Init.jsp文件中实现，函数的名称为initForm()
function resetForm()
{
  try
  {
    initForm();

  }
  catch(re)
  {
    alert("在LARewardPunish.js-->resetForm函数中发生异常:初始化界面错误!");
  }
} 

function DetailClick(){
	
	fm.hideOperate.value="DOWNLOAD||MAIN";
	checkFlag = LXKnowledgeGrid.getSelNo();
	var SerialNo = LXKnowledgeGrid.getRowColData(checkFlag - 1, 1);
	 if (SerialNo == null || SerialNo =='')
	    {
	       alert("您还没有查询，请先查询！");
	       return false;
	    }
	 else
	 {
			window.open("./LXKnowledgeFieldDetailInput.jsp?idx="+SerialNo,"查看知识园地详细信息", "left");
	 }
	
	
}


//function afterQuery(tIdx){
//	//initTasksGrid();
//   var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end), a.Keyword," +
//	" (case a.State when 'R01'then '待上报' when 'R03' then '审核通过' when 'R04' then '审核不通过' when 'R05' then '已发布'end),Pubdate from LXKnowledgeField a "
//   +    " where 1 = 1 and a.PubType='04' and a.State='R05'  and a.IDX= '"+ tIdx+ "' ";
//    
//     turnPageLXKnowledgeGrid = new turnPageClass();
//     turnPageLXKnowledgeGrid.pageDivName = "divTurnPageLXKnowledgeGrid";
//	 turnPageLXKnowledgeGrid.queryModal(QuerySQL, LXKnowledgeGrid);	
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

//实现页面跳转
function QueryDataReport(){
	//alert(1111);
	var sOpenWinURL = "../ComInfoMag/LXdataReportPassMain.jsp";
	//var sOpenWinURL = "../DataReportBackup/LXdataReportPassInput.jsp";
    OpenWindowNew(sOpenWinURL, "新页面", "left");	
}



