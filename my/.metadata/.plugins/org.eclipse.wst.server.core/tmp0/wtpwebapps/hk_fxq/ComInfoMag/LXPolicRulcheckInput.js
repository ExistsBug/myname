//���ļ��а����ͻ�����Ҫ����ĺ������¼�
var turnPage = new turnPageClass();
var turnPageInfo = new turnPageClass();



//�ύǰ��У�顢����
function beforeSubmit()
{
   //��Ӳ��� �ǿգ���ʽУ�� 
   if (!verifyInput2()) { 
      return false;
   }
    //������ʽ��֤(���� ���޸�)
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

//�ύ�����水ť��Ӧ����
function submitForm(oper)
{
	var checkFlag = 0;
	//ȡ�õ�ǰ������к�
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//ȡ����������
	var infoStyle = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 9);
	//ȡ��mulline�����ص�����
	var IDX = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 8);
	//��Ϊ������save�д���
    var i = 0;
    var showStr="���ڱ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + showStr ;
    showInfo=window.showModelessDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:250px");
    try{
       fm.action="./LXPolicRulcheckSave.jsp?hideOperate="+oper+"&IDX="+IDX+"&infoStyle="+infoStyle;
       fm.submit(); //�ύ
    }catch(ex){alert(ex);}
}

//��ѯ�ͻ������Ϣ
function easyQuery()
{
	//��ʼ��mulline
	//alert("aaaaa");
	 initLXPolicRulcheckGrid();
	 //������ܹ�˾��½��ֻ����˷ֹ�˾����Ϣ
	 if(comcode=="86"){
		 queryInfoB();
	 }else{
	//����Ƿֹ�˾��½����ѯ��֧��˾�ļ�¼
		  queryInfo()
	 }
}

//ʵ�ֹ�˾¼���ܹ�˾���
function queryInfoB(){
	 var InfoStyle = fm.all("InfoStyleCode").value;
	 if(InfoStyle=="03"){
		//alert("aaa");
	//=========����Ϣ����Ϊ���߷���ʱ============
	//��ѯsql���
	var strSQL = " select "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
        + "(select name from ldcom where comcode=a.PubCom),"
    	+ "PubContent,PubUnit,"
    	+ "BAK4,HeadLine,"
    	+ "(case when  BAK3 is null then '��' else '��' end)," 
    	+ "IDX,a.BAK2, "//=========�����ֶ�
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
	  //����===========������֪ͨ
	  var strSQL = " select  (select name from ldcom where comcode=a.MangeCom),(select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
      + "PubCont,"
      + "(select name from ldcom where comcode=a.MangeCom),"
      + "SDate,"
      + "TitleName,"
      + "(case  when Append is null then '��' else '��' end),"
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
	  //����===========�����ǹ����ƶ�
	  var strSQL = " select (select name from ldcom where comcode=a.AnnounceDept), "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
    	+ "Contain,AnnounceDept,"
    	+ "RReportDate,Title,"
    	+ "(case when  UploadAddress is null then '��' else '��' end)," 
    	+ "IndexNo,a.PublishType, "//=========�����ֶ�
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
	  //����===========����Ϊ֪ʶ԰��
	  var strSQL=
	  		"select (select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end)," +
	  		" ''," +
	  		"(select name from ldcom where comcode=a.managecom)," +
			"a.SDate,a.Keyword,decode(a.FilePath,'','��','��')," +
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
	  var strSQL = " select (select name from ldcom where comcode=a.PubCom),"   //----����03--���߷���ʱ--------//
			+ "(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
	    	+ "PubContent,PubUnit,"
	    	+ "BAK4,HeadLine,"
	    	+ "(case when  BAK3 is null then '��' else '��' end)," 
	    	+ "IDX,a.BAK2, "//=========�����ֶ�
	        + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
	    	+ "from LXPolicRulmage a "
	        + "where 1=1 and (a.State='R02' or a.State='R03') "
	        + "and length(a.PubCom)<=4 "
	        + "and a.HeadLine like '%"+ fm.all('HeadLine').value +"%' "
	        + getWherePart('a.State','State')
	        + getWherePart('a.PubCom','ManageComCode')
	        + getWherePart("a.BAK4", "StartDate", ">=")
		    + getWherePart("a.BAK4", "EndDate", "<=")
		    +  " union all "+     //-----����01--֪ͨ------------//
		    " select (select name from ldcom where comcode=a.MangeCom), (select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
		      + "PubCont,"
		      + "(select name from ldcom where comcode=a.MangeCom),"
		      + "SDate,"
		      + "TitleName,"
		      + "(case  when Append is null then '��' else '��' end),"
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
	           +  " union all "+     //-----����01--�����ƶ�------------//
	           " select (select name from ldcom where comcode=a.AnnounceDept),(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
	           + "Contain,AnnounceDept,"
	           + "RReportDate,Title,"
	         	+ "(case when  UploadAddress is null then '��' else '��' end)," 
	         	+ "IndexNo,a.PublishType, "//=========�����ֶ�
	            + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
	        	+ "from RulesAndRegulations a "
	           + "where 1=1 and (a.State='R02' or a.State='R03') "
	           + "and length(a.AnnounceDept)<=4 "
	           +" and a.Title like '%"+ fm.all('HeadLine').value +"%'"
	           + getWherePart('a.State','State')
	         	+getWherePart("a.AnnounceDept", "ManageComCode")
	         	+getWherePart("a.RReportDate", "StartDate", ">=")
	   	  	   +getWherePart("a.RReportDate", "EndDate", "<=")
	           +  " union all "+     //-----����04--֪ʶ԰��------------//
	           "select (select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end)," +
		  		" ''," +
		  		"(select name from ldcom where comcode=a.managecom)," +
				"a.SDate,a.Keyword,decode(a.FilePath,'','��','��')," +
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


//ʵ��֧��˾��˾¼��ֹ�˾���
function queryInfo(){
	var InfoStyle = fm.all("InfoStyleCode").value;
	 if(InfoStyle=="03"){
	//=========����Ϣ����Ϊ���߷���ʱ============
	//alert("aaa");
	//��ѯsql���
	var strSQL = " select "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
        + "(select name from ldcom where comcode=a.PubCom),"
    	+ "PubContent,PubUnit,"
    	+ "BAK4,HeadLine,"
    	+ "(case when  BAK3 is null then '��' else '��' end)," 
    	+ "IDX,a.BAK2,"//=========�����ֶ�
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
	  //����===========������֪ͨ
	  var strSQL = " select  (select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
      + "(select name from ldcom where comcode=a.MangeCom),"
      + "PubCont,"
      + "(select name from ldcom where comcode=a.MangeCom),"
      + "SDate,"
      + "TitleName,"
      + "(case  when Append is null then '��' else '��' end),"
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
	  //����===========�����ǹ����ƶ�
	 
	  var strSQL = " select "
		+ "(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
        + "(select name from ldcom where comcode=a.AnnounceDept),"
    	+ "Contain,AnnounceDept,"
    	+ "RReportDate,Title,"
    	+ "(case when  UploadAddress is null then '��' else '��' end)," 
    	+ "IndexNo,a.PublishType ,"//=========�����ֶ�
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
	  //����===========����Ϊ֪ʶ԰��
	  var strSQL=
	  		"select (case a.Pubtype when '04' then '֪ʶ԰��' end)," +
	  		"(select name from ldcom where comcode=a.managecom)," +
	  		" ''," +
	  		"(select name from ldcom where comcode=a.managecom)," +
			"a.SDate,a.Keyword,decode(a.FilePath,'','��','��')," +
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
	  alert("��ѡ��Ҫ��ѯ��Ϣ�����ͣ�");
  }
}

//��ҳ�����������������Ϊ��
function setEmpty() {
	//������е���Ϣ
	fm.reset();
	//��ʼ��mulline
	initLXPolicRulcheckGrid();
	//��ʼ��������Ϣ
	 initButton();
	 initForm();
	fm.all("State").value="R02";
  	fm.all("StateName").value="�����";
	//fm.all("InfoStyleCode").value="01";
	//fm.all("InfoStyle").value="֪ͨ����";
}


function setEmpty1() {
	//������е���Ϣ
	//fm.reset();
	//��ʼ��mulline
	initLXPolicRulcheckGrid();
	//��ʼ��������Ϣ
	fm.all("CheckOption").value="";
}
//��ʾ��ϸ��Ϣ ����ҳ����ת
function queryDetailInfo(){
	
	var checkFlag = 0;
	//ȡ�õ�ǰ������к�
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//�ж��Ƿ�ѡ��һ�������Ϣ
	if(checkFlag>0){
		//ȡ����������
		var infoStyle = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 9);
	
		//ȡ��mulline�����ص�����
	    var IDX = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 8);
	//    alert(IDX);
	 	if(infoStyle=="03"){
	 	//======================���߷���ҳ��
		   var sOpenWinURL = "./LXPolicRulmageDetial.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
		} else if(infoStyle=="01"){
	  	//����===========������֪ͨ�Ľ���
		   var sOpenWinURL = "./CopyNotificationDetial.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
  		} else if(infoStyle=="02"){
	  //����===========�����ǹ����ƶȵ�ҳ����ת
  		   var sOpenWinURL = "./RulesAndRegulationsQueryDetial.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
  		}else if(infoStyle=="04"){
	  //����===========����Ϊ֪ʶ԰�ص�ҳ����ת
	  	var sOpenWinURL = "./LXKnowledgeFieldDetail.jsp";
		   var sParameters = "infoStyle=" + infoStyle;
		   sParameters+="&IDX="+IDX;
		   OpenWindowNew(sOpenWinURL + "?" + sParameters, "��ҳ��", "left");
  		}
	}else{
		alert("��ѡ��һ����Ϣ�鿴��");
		return false;
	}
}

//��˹���
function  GoToCheckPass(oper){
	 var checkFlag=0 ;
     checkFlag = LXPolicRulcheckGrid.getSelNo();
      if (checkFlag>0) {
    	 //���ǰ��֤
   		 if(!beforeSubmit()) {
      		 return false;
   		 }
		  submitForm(oper);
		  setEmpty1();
		    initButton();
		  easyQuery();
      }	
      else {
         alert("����ѡ��һ��������Ϣ��");
         return;
      }   
}
function initButton(){
	
	fm.all("Pass").disabled = false;
    fm.all("NoPass").disabled = false;
	fm.all("CheckOption").disabled = false;
	fm.all("ReturnModify").disabled = false;
}
// ���뷵���޸ģ��ܹ�˾��ͨ���ģ�
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
         alert("����ѡ��һ��������Ϣ��");
         return;
      }   
}
//��˲�ͨ������
function  GoToCheckNo(oper){
	 var checkFlag ;
      checkFlag = LXPolicRulcheckGrid.getSelNo();
      if (checkFlag>0) {
    	  //���ǰ��֤
   		 if(!beforeSubmit()) {
      		 return false;
   		 }
		  submitForm(oper);	
		  setEmpty1();
		   initButton();
		  easyQuery();
      }	
      else {
         alert("����ѡ��һ��������Ϣ��");
         return;
      }   
}

//���ظ���
function GoToDownLoad(oper){
	var checkFlag = 0;
	//ȡ�õ�ǰ������к�
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//�ж��Ƿ�ѡ��һ�������Ϣ
	if(checkFlag>0){
		//ȡ����������
		var infoStyle = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 9);
	
		//ȡ��mulline�����ص�����
	    var IDX = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 8);
	//    alert(IDX);
	 	if(infoStyle=="03"){
		 	//======================���߷��渽������
		 	var QuerySQL1="select BAK3 from LXPolicRulmage where IDX='"+IDX+"'";
		  	var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    //alert(arrSelected);
		  	var fileName = arrSelected[0][0];
		    //�ж��Ƿ��и���
			 if (fileName==""||fileName==null) {
					   alert("�����ݲ����ڸ�����");
					   return false;
			 }
			 var filePath =  arrSelected[0][0];
			 
			 var fileName =filePath.substring(filePath.lastIndexOf("/"));
		  	//location.href= "../aml/Information" + fileName;
			 window.open( "../aml/Information/" + fileName);
		} else if(infoStyle=="01"){
	  	//����===========������֪ͨ��������
			var QuerySQL1="select Append from LXNotification where IDX='"+IDX+"'";
		  	var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    //alert(arrSelected);
		  	var fileName = arrSelected[0][0];
		    //�ж��Ƿ��и���
			 if (fileName==""||fileName==null) {
					   alert("�����ݲ����ڸ�����");
					   return false;
			 }
			 var filePath =  arrSelected[0][0];
			 var fileName =filePath.substring(filePath.lastIndexOf("/"));
		  	//location.href= "../aml/Information" + fileName;
			 window.open( "../aml/Information/" + fileName);
  		} else if(infoStyle=="02"){
		  //����===========�����ǹ����ƶȸ�������
  			 var QuerySQL1="select UploadAddress,EXTEND1 from RulesAndRegulations where IndexNo='"+IDX+"'";
  			  var arrSelected  = new Array();
  			    arrSelected = easyExecSql(QuerySQL1);
  			    //alert(arrSelected);
  			    //�ж��Ƿ��ѯ�ɹ�
  				 if (!arrSelected[0][0]) {
  						   alert("�����ݲ����ڸ�����");
  						   return false;s
  				 }
  				  var filename=arrSelected[0][0];
  				 // alert(filename);
  			      filename=filename.substring(filename.lastIndexOf('/')+1);
  				 // location.href= "../aml/Information/"+ filename;
  			    window.open( "../aml/Information/" + filename);
  		}else if(infoStyle=="04"){
		  //����===========����Ϊ֪ʶ԰�ظ�������
	  			var QuerySQL1 = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a  "
		                       + "where 1=1 and a.IDX= '"+IDX+ "' ";
	          var arrSelected  = new Array();
	          arrSelected = easyExecSql(QuerySQL1);
	          var filename=arrSelected[0][5];
	          filename=filename.substring(filename.lastIndexOf('/')+1);
	          if(filename==""||filename==null)
	          {
	        	  alert("û�и����� ");
	              return false;
	          }
	          // location.href="../ComInfoMag/send/" + filename;
	        	  filename="../aml/Information/" + filename;
	             // location.href=filename;
	        	  window.open(filename);
	  		}
	}else{
		alert("��ѡ��һ����Ϣ�鿴��");
		return false;
	}
}
//���GID�����ĺ���
function GotoInitButton(){
	var checkFlag = 0;
	//ȡ�õ�ǰ������к�
	checkFlag = LXPolicRulcheckGrid.getSelNo();
	//ȡ����������
	var State = LXPolicRulcheckGrid.getRowColData(checkFlag - 1, 10);
	//ȡ��mulline�����ص�����
	 if("���ͨ��"==State){
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