//该文件中包含客户端需要处理的函数和事件
var turnPage = new turnPageClass();
var turnPageInfo = new turnPageClass();



//提交前的校验、计算
function beforeSubmit()
{
   //添加操作 非空，格式校验 
   if (!verifyInput2()) { 
      return false;
   }
    //附件格式验证(增加 ，修改)
   return true;
}

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
		easyQuery();
	    var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ; 
	    showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");   
	  }
}

//提交，保存按钮对应操作
function submitForm(oper)
{
	var checkFlag = 0;
	//取得当前点击的行号
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//取出数据类型
	var infoStyle = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 9);
	//取出mulline中隐藏的主键
	var IDX = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 8);
	//作为参数向save中传递
    var i = 0;
    var showStr="正在保存数据，请您稍候并且不要修改屏幕上的值或链接其他页面";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    try{
       fm.action="./LXPolicRulcheckSave.jsp?hideOperate="+oper+"&IDX="+IDX+"&infoStyle="+infoStyle;
       fm.submit(); //提交
    }catch(ex){alert(ex);}
}

//查询客户相关信息
function easyQuery()
{
	//初始话mulline
	//alert("aaaaa");
	 initLXPolicRulcheckGrid();
	 //如果是总公司登陆，只能审核分公司的信息
	 if(comcode=="86"){
		 queryInfoB();
	 }else{
	//如果是分公司登陆，查询其支公司的记录
		  queryInfo()
	 }
}

//实现公司录入总公司审核
function queryInfoB(){
	 var InfoStyle = fm.all("InfoStyleCode").value;
	 if(InfoStyle=="03"){
		//alert("aaa");
	//=========当信息类型为政策法规时============
	//查询sql语句
	var strSQL = " select "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
        + "(select name from ldcom where comcode=a.PubCom),"
    	+ "PubContent,PubUnit,"
    	+ "BAK4,HeadLine,"
    	+ "(case when  BAK3 is null then '无' else '有' end)," 
    	+ "IDX,a.BAK2, "//=========隐藏字段
        + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
    	+ "from LXPolicRulmage a "
        + "where 1=1 and (a.State='R02' or a.State='R03') "
        + "and length(a.PubCom)<=4 "
        + "and a.HeadLine like '%"+ fm.all('HeadLine').value +"%' "
        + getWherePart('a.State','State')
        + getWherePart('a.PubCom','ManageComCode')
        + getWherePart("a.BAK4", "StartDate", ">=")
	    + getWherePart("a.BAK4", "EndDate", "<=");
    try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
  } else if(InfoStyle=="01"){
	  //这是===========类型是通知
	  var strSQL = " select  (select name from ldcom where comcode=a.MangeCom),(select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
      + "PubCont,"
      + "(select name from ldcom where comcode=a.MangeCom),"
      + "SDate,"
      + "TitleName,"
      + "(case  when Append is null then '无' else '有' end),"
      + " IDX,reporttype, "
       + "(select codename from ldcode where codetype='datastate' and code=a.Stale) " 
      + " from Lxnotification a " 
      + " where 1=1 and (Stale='R02' or a.Stale='R03') " 
      + "and length(a.MangeCom)<=4 "
      +" and a.TitleName like '%"+ fm.all('HeadLine').value +"%'"
      + getWherePart('a.Stale','State')
      +getWherePart("a.MangeCom", "ManageComCode")
      +getWherePart("a.SDate", "StartDate", ">=")
	  +getWherePart("a.SDate", "EndDate", "<=");
	 // alert(strSQL);
	 try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
	  
  } else if(InfoStyle=="02"){
	  //这是===========类型是规章制度
	  var strSQL = " select (select name from ldcom where comcode=a.AnnounceDept), "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
    	+ "Contain,AnnounceDept,"
    	+ "RReportDate,Title,"
    	+ "(case when  UploadAddress is null then '无' else '有' end)," 
    	+ "IndexNo,a.PublishType, "//=========隐藏字段
         + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
    	+ "from RulesAndRegulations a "
        + "where 1=1 and (a.State='R02' or a.State='R03') "
        + "and length(a.AnnounceDept)<=4 "
        +" and a.Title like '%"+ fm.all('HeadLine').value +"%'"
        + getWherePart('a.State','State')
      	+getWherePart("a.AnnounceDept", "ManageComCode")
      	+getWherePart("a.RReportDate", "StartDate", ">=")
	  	+getWherePart("a.RReportDate", "EndDate", "<=");
	 try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
	  
  }else if(InfoStyle=="04"){
	  //这是===========类型为知识园地
	  var strSQL=
	  		"select (select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end)," +
	  		" ''," +
	  		"(select name from ldcom where comcode=a.managecom)," +
			"a.SDate,a.Keyword,decode(a.FilePath,'','无','有')," +
			"a.idx, a.Pubtype ," 
			 + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
			+" from LXKnowledgeField a "
             + "where 1=1 and a.PubType='04' and (a.State='R02' or a.State='R03') " 
             + " and length(a.managecom)<=4 "
            + " AND a.KeyWord like '%"+ fm.all('HeadLine').value +"%'"
            + getWherePart('a.State','State')
		    + getWherePart("a.ManageCom", "ManageComCode")
		    + getWherePart("a.SDate", "StartDate",">=")
		    + getWherePart("a.SDate", "EndDate","<=");
	//alert(strSQL);
	 try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }	  
  }else{
	  var strSQL = " select (select name from ldcom where comcode=a.PubCom),"   //----类型03--政策法规时--------//
			+ "(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
	    	+ "PubContent,PubUnit,"
	    	+ "BAK4,HeadLine,"
	    	+ "(case when  BAK3 is null then '无' else '有' end)," 
	    	+ "IDX,a.BAK2, "//=========隐藏字段
	        + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
	    	+ "from LXPolicRulmage a "
	        + "where 1=1 and (a.State='R02' or a.State='R03') "
	        + "and length(a.PubCom)<=4 "
	        + "and a.HeadLine like '%"+ fm.all('HeadLine').value +"%' "
	        + getWherePart('a.State','State')
	        + getWherePart('a.PubCom','ManageComCode')
	        + getWherePart("a.BAK4", "StartDate", ">=")
		    + getWherePart("a.BAK4", "EndDate", "<=")
		    +  " union all "+     //-----类型01--通知------------//
		    " select (select name from ldcom where comcode=a.MangeCom), (select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
		      + "PubCont,"
		      + "(select name from ldcom where comcode=a.MangeCom),"
		      + "SDate,"
		      + "TitleName,"
		      + "(case  when Append is null then '无' else '有' end),"
		      + " IDX,reporttype, "
		       + "(select codename from ldcode where codetype='datastate' and code=a.Stale) " 
		      + " from Lxnotification a " 
		      + " where 1=1 and (Stale='R02' or a.Stale='R03') " 
		      + "and length(a.MangeCom)<=4 "
		      +" and a.TitleName like '%"+ fm.all('HeadLine').value +"%'"
		      + getWherePart('a.Stale','State')
		      +getWherePart("a.MangeCom", "ManageComCode")
		      +getWherePart("a.SDate", "StartDate", ">=")
			  +getWherePart("a.SDate", "EndDate", "<=")
	           +  " union all "+     //-----类型01--规则制度------------//
	           " select (select name from ldcom where comcode=a.AnnounceDept),(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
	           + "Contain,AnnounceDept,"
	           + "RReportDate,Title,"
	         	+ "(case when  UploadAddress is null then '无' else '有' end)," 
	         	+ "IndexNo,a.PublishType, "//=========隐藏字段
	            + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
	        	+ "from RulesAndRegulations a "
	           + "where 1=1 and (a.State='R02' or a.State='R03') "
	           + "and length(a.AnnounceDept)<=4 "
	           +" and a.Title like '%"+ fm.all('HeadLine').value +"%'"
	           + getWherePart('a.State','State')
	         	+getWherePart("a.AnnounceDept", "ManageComCode")
	         	+getWherePart("a.RReportDate", "StartDate", ">=")
	   	  	   +getWherePart("a.RReportDate", "EndDate", "<=")
	           +  " union all "+     //-----类型04--知识园地------------//
	           "select (select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end)," +
		  		" ''," +
		  		"(select name from ldcom where comcode=a.managecom)," +
				"a.SDate,a.Keyword,decode(a.FilePath,'','无','有')," +
				"a.idx, a.Pubtype ," 
				 + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
				+" from LXKnowledgeField a "
	             + "where 1=1 and a.PubType='04' and (a.State='R02' or a.State='R03') " 
	             + " and length(a.managecom)<=4 "
	            + " AND a.KeyWord like '%"+ fm.all('HeadLine').value +"%'"
	            + getWherePart('a.State','State')
			    + getWherePart("a.ManageCom", "ManageComCode")
			    + getWherePart("a.SDate", "StartDate",">=")
			    + getWherePart("a.SDate", "EndDate","<=");
		    
	    try
	    {
	        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
	        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
	    }
	    catch (ex)
	    {
	        alert(ex);
	    }
  }
}


//实现支公司公司录入分公司审核
function queryInfo(){
	var InfoStyle = fm.all("InfoStyleCode").value;
	 if(InfoStyle=="03"){
	//=========当信息类型为政策法规时============
	//alert("aaa");
	//查询sql语句
	var strSQL = " select "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
        + "(select name from ldcom where comcode=a.PubCom),"
    	+ "PubContent,PubUnit,"
    	+ "BAK4,HeadLine,"
    	+ "(case when  BAK3 is null then '无' else '有' end)," 
    	+ "IDX,a.BAK2,"//=========隐藏字段
         + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
    	+ "from LXPolicRulmage a "
        + "where 1=1 and (a.State='R02' or a.State='R03') "
        + "and a.PubCom like '" +comcode+"%'"
        + " and a.PubCom <> '" +comcode+"'"
        + " and a.HeadLine like '%"+ fm.all('HeadLine').value +"%' "
        + getWherePart('a.State','State')
        + getWherePart('a.PubCom','ManageComCode')
        + getWherePart("a.BAK4", "StartDate", ">=")
	    + getWherePart("a.BAK4", "EndDate", "<=");
    try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
  } else if(InfoStyle=="01"){
	  //这是===========类型是通知
	  var strSQL = " select  (select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
      + "(select name from ldcom where comcode=a.MangeCom),"
      + "PubCont,"
      + "(select name from ldcom where comcode=a.MangeCom),"
      + "SDate,"
      + "TitleName,"
      + "(case  when Append is null then '无' else '有' end),"
      + " IDX,reporttype ,"
       + "(select codename from ldcode where codetype='datastate' and code=a.Stale) " 
      + " from Lxnotification a " 
      + " where 1=1 and (a.Stale='R02' or a.Stale='R03') " 
      + "and a.MangeCom like '" +comcode+"%'"
       + " and a.MangeCom <> '" +comcode+"'"
      +" and a.TitleName like '%"+ fm.all('HeadLine').value +"%'"
      + getWherePart('a.Stale','State')
      +getWherePart("a.MangeCom", "ManageComCode")
      +getWherePart("a.SDate", "StartDate", ">=")
	  +getWherePart("a.SDate", "EndDate", "<=");
	 // alert(strSQL);
	 try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
	  
  } else if(InfoStyle=="02"){
	  //这是===========类型是规章制度
	 
	  var strSQL = " select "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
        + "(select name from ldcom where comcode=a.AnnounceDept),"
    	+ "Contain,AnnounceDept,"
    	+ "RReportDate,Title,"
    	+ "(case when  UploadAddress is null then '无' else '有' end)," 
    	+ "IndexNo,a.PublishType ,"//=========隐藏字段
         + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
    	+ "from RulesAndRegulations a "
        + "where 1=1 and (a.State='R02' or a.State='R03') "
        + "and a.AnnounceDept like '" +comcode+"%'"
       	+ " and a.AnnounceDept <> '" +comcode+"'"
        +" and a.Title like '%"+ fm.all('HeadLine').value +"%'"
        + getWherePart('a.State','State')
      	+getWherePart("a.AnnounceDept", "ManageComCode")
      	+getWherePart("a.RReportDate", "StartDate", ">=")
	  	+getWherePart("a.RReportDate", "EndDate", "<=");
	 try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }
	  
  }else if(InfoStyle=="04"){
	  //这是===========类型为知识园地
	  var strSQL=
	  		"select (case a.Pubtype when '04' then '知识园地' end)," +
	  		"(select name from ldcom where comcode=a.managecom)," +
	  		" ''," +
	  		"(select name from ldcom where comcode=a.managecom)," +
			"a.SDate,a.Keyword,decode(a.FilePath,'','无','有')," +
			"a.idx, a.Pubtype," 
			 + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
			+ " from LXKnowledgeField a "
             + "where 1=1 and a.PubType='04' and (a.State='R02' or a.State='R03') " 
             + "and a.managecom like '" +comcode+"%'"
        	 + " and a.managecom <> '" +comcode+"'"
             +" AND a.KeyWord like '%"+ fm.all('HeadLine').value +"%'"
             + getWherePart('a.State','State')
		    + getWherePart("a.ManageCom", "ManageComCode")
		    //+ getWherePart("a.PubType", "PubUnit")
		    + getWherePart("a.SDate", "StartDate",">=")
		    + getWherePart("a.SDate", "EndDate","<=");
	//alert(strSQL);
	 try
    {
        turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL, LXPolicRulcheckGrid, 0, 1);
    }
    catch (ex)
    {
        alert(ex);
    }	  
  }else{
	  alert("请选择要查询信息的类型！");
  }
}

//将页面输入域的内容设置为空
function setEmpty() {
	//清空所有的信息
	fm.reset();
	//初始化mulline
	initLXPolicRulcheckGrid();
	//初始话界面信息
	 initButton();
	 initForm();
	fm.all("State").value="R02";
  	fm.all("StateName").value="待审核";
	//fm.all("InfoStyleCode").value="01";
	//fm.all("InfoStyle").value="通知发布";
}


function setEmpty1() {
	//清空所有的信息
	//fm.reset();
	//初始化mulline
	initLXPolicRulcheckGrid();
	//初始话界面信息
	fm.all("CheckOption").value="";
}
//显示详细信息 进行页面跳转
function queryDetailInfo(){
	
	var checkFlag = 0;
	//取得当前点击的行号
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//判断是否选中一条审核信息
	if(checkFlag>0){
		//取出数据类型
		var infoStyle = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 9);
	
		//取出mulline中隐藏的主键
	    var IDX = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 8);
	//    alert(IDX);
	 	if(infoStyle=="03"){
	 	//======================政策法规页面
		   var sOpenWinURL = "./LXPolicRulmageDetial.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");
		} else if(infoStyle=="01"){
	  	//这是===========类型是通知的界面
		   var sOpenWinURL = "./CopyNotificationDetial.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");
  		} else if(infoStyle=="02"){
	  //这是===========类型是规章制度的页面跳转
  		   var sOpenWinURL = "./RulesAndRegulationsQueryDetial.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");
  		}else if(infoStyle=="04"){
	  //这是===========类型为知识园地的页面跳转
	  	var sOpenWinURL = "./LXKnowledgeFieldDetail.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "新页面", "left");
  		}
	}else{
		alert("请选中一条信息查看！");
		return false;
	}
}

//审核功能
function  GoToCheckPass(oper){
	 var checkFlag=0 ;
     checkFlag = LXPolicRulcheckGrid.getSelNo();
      if (checkFlag>0) {
    	 //审核前验证
   		 if(!beforeSubmit()) {
      		 return false;
   		 }
		  submitForm(oper);
		  setEmpty1();
		    initButton();
		  easyQuery();
      }	
      else {
         alert("请先选择一条报备信息！");
         return;
      }   
}
function initButton(){
	
	fm.all("Pass").disabled = false;
    fm.all("NoPass").disabled = false;
	fm.all("CheckOption").disabled = false;
	fm.all("ReturnModify").disabled = false;
}
// 申请返回修改（总公司审通过的）
function  GoToReturnModify(oper){
	var checkFlag ;
      checkFlag = LXPolicRulcheckGrid.getSelNo();
      if (checkFlag>0) {
		  submitForm(oper);	
		  easyQuery();
		  initButton();
		  setEmpty1();
      }	
      else {
         alert("请先选择一条报备信息！");
         return;
      }   
}
//审核不通过功能
function  GoToCheckNo(oper){
	 var checkFlag ;
      checkFlag = LXPolicRulcheckGrid.getSelNo();
      if (checkFlag>0) {
    	  //审核前验证
   		 if(!beforeSubmit()) {
      		 return false;
   		 }
		  submitForm(oper);	
		  setEmpty1();
		   initButton();
		  easyQuery();
      }	
      else {
         alert("请先选择一条报备信息！");
         return;
      }   
}

//下载附件
function GoToDownLoad(oper){
	var checkFlag = 0;
	//取得当前点击的行号
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//判断是否选中一条审核信息
	if(checkFlag>0){
		//取出数据类型
		var infoStyle = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 9);
	
		//取出mulline中隐藏的主键
	    var IDX = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 8);
	//    alert(IDX);
	 	if(infoStyle=="03"){
		 	//======================政策法规附件下载
		 	var QuerySQL1="select BAK3 from LXPolicRulmage where IDX='"+IDX+"'";
		  	var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    //alert(arrSelected);
		  	var fileName = arrSelected[0][0];
		    //判断是否有附件
			 if (fileName==""||fileName==null) {
					   alert("此数据不存在附件！");
					   return false;
			 }
			 var filePath =  arrSelected[0][0];
			 
			 var fileName =filePath.substring(filePath.lastIndexOf("/"));
		  	//location.href= "../aml/Information" + fileName;
			 window.open( "../aml/Information/" + fileName);
		} else if(infoStyle=="01"){
	  	//这是===========类型是通知附件下载
			var QuerySQL1="select Append from LXNotification where IDX='"+IDX+"'";
		  	var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    //alert(arrSelected);
		  	var fileName = arrSelected[0][0];
		    //判断是否有附件
			 if (fileName==""||fileName==null) {
					   alert("此数据不存在附件！");
					   return false;
			 }
			 var filePath =  arrSelected[0][0];
			 var fileName =filePath.substring(filePath.lastIndexOf("/"));
		  	//location.href= "../aml/Information" + fileName;
			 window.open( "../aml/Information/" + fileName);
  		} else if(infoStyle=="02"){
		  //这是===========类型是规章制度附件下载
  			 var QuerySQL1="select UploadAddress,EXTEND1 from RulesAndRegulations where IndexNo='"+IDX+"'";
  			  var arrSelected  = new Array();
  			    arrSelected = easyExecSql(QuerySQL1);
  			    //alert(arrSelected);
  			    //判断是否查询成功
  				 if (!arrSelected[0][0]) {
  						   alert("此数据不存在附件！");
  						   return false;s
  				 }
  				  var filename=arrSelected[0][0];
  				 // alert(filename);
  			      filename=filename.substring(filename.lastIndexOf('/')+1);
  				 // location.href= "../aml/Information/"+ filename;
  			    window.open( "../aml/Information/" + filename);
  		}else if(infoStyle=="04"){
		  //这是===========类型为知识园地附件下载
	  			var QuerySQL1 = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a  "
		                       + "where 1=1 and a.IDX= '"+IDX+ "' ";
	          var arrSelected  = new Array();
	          arrSelected = easyExecSql(QuerySQL1);
	          var filename=arrSelected[0][5];
	          filename=filename.substring(filename.lastIndexOf('/')+1);
	          if(filename==""||filename==null)
	          {
	        	  alert("没有附件！ ");
	              return false;
	          }
	          // location.href="../ComInfoMag/send/" + filename;
	        	  filename="../aml/Information/" + filename;
	             // location.href=filename;
	        	  window.open(filename);
	  		}
	}else{
		alert("请选中一条信息查看！");
		return false;
	}
}
//点击GID触发的函数
function GotoInitButton(){
	var checkFlag = 0;
	//取得当前点击的行号
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//取出数据类型
	var State = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 10);
	//取出mulline中隐藏的主键
	 if("审核通过"==State){
		    	fm.all("Pass").disabled = true;
		    	fm.all("NoPass").disabled = true;
		    	fm.all("CheckOption").disabled = true;
		    	fm.all("ReturnModify").disabled = false;
		    }else{
		    	fm.all("Pass").disabled = false;
		    	fm.all("NoPass").disabled = false;
		    	fm.all("CheckOption").disabled = false;
		    	fm.all("ReturnModify").disabled = true;
		    }
}

function showCodeb(cObj,cName){

	 showCodeList('datastate',[cObj,cName],[0,1],null,'1 and code in(#R02#,#R03#)','1');
}
function showCodeKeyb(cObj,cName){
		showCodeListKey('datastate',[cObj,cName],[0,1],null,' 1 code in(#R02#,#R03#)','1');
}