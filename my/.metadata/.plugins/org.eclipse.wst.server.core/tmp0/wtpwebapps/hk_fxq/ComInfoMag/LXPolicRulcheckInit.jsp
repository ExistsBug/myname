<%@page contentType="text/html;charset=GBK" %>
<script language="JavaScript">

function initForm()
{
	//��ʼ��ҳ����Ϣ

	fm.all("State").value="R02";
   fm.all("StateName").value="�����";

  try
  {
    initLXPolicRulcheckGrid();
      easyQuery1();
    //easyQuery();
  }
  catch(re)
  {
    alert("��LXLXCustomerRiskInfoInput.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

//�ֲ�������Ϣ
function initLXPolicRulcheckGrid()
{
    var iArray = new Array();
    try
    {
        iArray[0]=new Array();
        iArray[0][0]="���";
        iArray[0][1]="30px";
        iArray[0][2]=30;
        iArray[0][3]=0;
        
        iArray[1]=new Array();    
        iArray[1][0]="��������";
        iArray[1][1]="120px";
        iArray[1][2]=150;
        iArray[1][3]=0;

        iArray[2]=new Array();    
        iArray[2][0]="��Ϣ����";
        iArray[2][1]="60px";
        iArray[2][2]=100;
        iArray[2][3]=0;
        
        iArray[3]=new Array();    
        iArray[3][0]="Ҫ������";
        iArray[3][1]="0px";
        iArray[3][2]=200;
        iArray[3][3]=3;
        
        iArray[4]=new Array();    
        iArray[4][0]="������λ";
        iArray[4][1]="0px";
        iArray[4][2]=150;
        iArray[4][3]=3;
        

        iArray[5]=new Array();    
        iArray[5][0]="�ϱ�����";
        iArray[5][1]="60px";
        iArray[5][2]=150;
        iArray[5][3]=0;
        
        
        iArray[6]=new Array();    
        iArray[6][0]="����";
        iArray[6][1]="100px";
        iArray[6][2]=150;
        iArray[6][3]=0;

        iArray[7]=new Array();    
        iArray[7][0]="����";
        iArray[7][1]="60px";
        iArray[7][2]=150;
        iArray[7][3]=0;
        
        iArray[8]=new Array();    
        iArray[8][0]="����";
        iArray[8][1]="0px";
        iArray[8][2]=150;
        iArray[8][3]=3;
		
		 iArray[9]=new Array();    
        iArray[9][0]="��Ϣ����";
        iArray[9][1]="0px";
        iArray[9][2]=150;
        iArray[9][3]=3;
        
         iArray[10]=new Array();    
        iArray[10][0]="����״̬";
        iArray[10][1]="80px";
        iArray[10][2]=150;
        iArray[10][3]=0;
		
        
        LXPolicRulcheckGrid = new MulLineEnter( "fm" , "LXPolicRulcheckGrid" );
        //��Щ���Ա�����loadMulLineǰ
        LXPolicRulcheckGrid.mulLineCount = 0;
        LXPolicRulcheckGrid.displayTitle = 1;
        LXPolicRulcheckGrid.locked = 0;
        LXPolicRulcheckGrid.hiddenPlus = 1;
        LXPolicRulcheckGrid.hiddenSubtraction = 1;
        LXPolicRulcheckGrid.canChk = 0;
        LXPolicRulcheckGrid.canSel = 1;

        LXPolicRulcheckGrid.selBoxEventFuncName ="GotoInitButton" ;   //���RadioBoxʱ��Ӧ��JS����
        LXPolicRulcheckGrid.loadMulLine(iArray);
    }
    catch(ex)
    {
      alert(ex);
    }
}
//��ѯ�ͻ������Ϣ	  
function easyQuery1() {
	
		var strSQL1 = " select (select name from ldcom where comcode=a.MangeCom), (select codename from ldcode where codetype='publishtype' and code=ReportType) ReportType ," 
        + "PubCont,"
        + "(select name from ldcom where comcode=a.MangeCom),"
        + "SDate,"
        + "TitleName,"
        + "(case  when Append is null then '��' else '��' end),"
        + " IDX,reporttype, "
        + "(select codename from ldcode where codetype='datastate' and code=a.Stale) " 
        + " from Lxnotification a " 
        + " where 1=1 and Stale='R02' " 
      //  + "and length(a.MangeCom)<=4 "
	    +  " union all "
	    +" select (select name from ldcom where comcode=a.AnnounceDept),(select codename from ldcode where codetype='publishtype' and code=a.PublishType)," 
    	+ "Contain,AnnounceDept,"
    	+ "RReportDate,Title,"
    	+ "(case when  UploadAddress is null then '��' else '��' end)," 
    	+ "IndexNo,a.PublishType, "//=========�����ֶ�
        + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
    	+ "from RulesAndRegulations a "
        + "where 1=1 and a.State='R02'  "
       // + "and length(a.AnnounceDept)<=4 "
        +  " union all "
        +" select (select name from ldcom where comcode=a.PubCom),(select codename from ldcode where codetype='publishtype' and code=a.BAK2)," 
        + "PubContent,PubUnit,"
    	+ "BAK4,HeadLine,(case when  BAK3 is null then '��' else '��' end)," 
    	+ "IDX,a.BAK2, "//=========�����ֶ�
        + "(select codename from ldcode where codetype='datastate' and code=a.State) " 
    	+ "from LXPolicRulmage a "
        + "where 1=1 and a.State='R02' "
      //  + "and length(a.PubCom)<=4 "
        +  " union all "
        +"select (select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end)," 
        +" ''," 
        + "(select name from ldcom where comcode=a.managecom),"
        +"a.SDate,a.Keyword,decode(a.FilePath,'','��','��')," 
        +"a.idx, a.Pubtype ,(select codename from ldcode where codetype='datastate' and code=a.State) " 
	    +" from LXKnowledgeField a where 1=1 and a.PubType='04' and a.State='R02' ";
	   // +" and length(a.managecom)<=4 ";

	try {
		turnPageInfo.pageDivName = "divTurnPageLXPolicRulcheckGrid";     
        turnPageInfo.queryModal(strSQL1, LXPolicRulcheckGrid, 0, 1);
	
	} catch (ex) {
		alert(ex);
	}
}

</script>