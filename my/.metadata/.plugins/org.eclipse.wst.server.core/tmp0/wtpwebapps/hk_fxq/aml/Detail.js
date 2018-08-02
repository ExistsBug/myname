
var turnPage = new turnPageClass();  //使用翻页功能，必须建立为全局变量
var turnPage2 = new turnPageClass();



//===================================================================================================================
function queryGrid()
{
    
    var DealType = "";
    var BackType = "";
    var DealType = fm.DealType.value;
    var BackType = fm.BackType.value;
   
    
    
    //---------------------------------------------------------------------------End
    
    initPackageGrid();
    //alert("afterinit in detail.js");
    var strSQL = "";
    //--------------------1------------------------------------------------------------------2----------------------------------------------------------3------------4----------------------------------------5-------------------------------------------------------6-----------7--------8------------9----------10------------11------------12--------
//	strSQL = "select missionprop1,(case missionprop2 when '10' then '报案' when '20' then '立案'  when '30' then '审核' when '40' then '审批' end),missionprop3,missionprop4,(case missionprop5 when '0' then '男' when '1' then '女' when '2' then '未知' end),missionprop6,missionid,submissionid,activityid,MissionProp11,MissionProp12,MissionProp13,missionprop10 from lwmission where 1=1 "
	strSQL = "select BackFileNo,BackFileType,PackageNo,PackageName,BackFileName,BackFilePath,DealState,MakeTime,MakeDate,Operator"
						+" from LXReceiptFile where dealstate='01'";
						//strSQL="select missionprop1,missionprop3,missionprop4,missionprop6,missionid,submissionid,activityid,missionprop10 ,MakeDate,missionprop20 from lwmission ";
	if(DealType=="01")
	{
		//alert("s");
		strSQL+=" and packagename like '%%IH%%' ";
		
		
	}	   
	if(DealType=="02")
	{
		strSQL+=" and packagename like '%%IS%%'";
	}	   
	if(BackType=="02")
	{
		strSQL+=" and BackFileType = '02'";
	}	 
	if(BackType=="03")
	{
		strSQL+=" and BackFileType = '03'";
	}  
	    strSQL+=" order by MakeDate DESC,MakeTime DESC ";
						//alert(strSQL);
		initSelfPackageGrid();
    turnPage.queryModal(strSQL,PackageGrid,0,1);
}

function querySelfGrid(BackFileNo)
{
	
    fm.action="./TradeMissSave.jsp?BackFileNo="+BackFileNo;
    fm.submit();	
	
	
		var BackFileNo1=BackFileNo;
    initSelfPackageGrid();
    var strSQL = "";
//	strSQL = "select missionprop1,(case missionprop2 when '10' then '报案' when '20' then '立案'  when '30' then '审核' when '40' then '审批' end),missionprop3,missionprop4,(case missionprop5 when '0' then '男' when '1' then '女' when '2' then '未知' end),missionprop6,missionid,submissionid,activityid,MissionProp11,MissionProp12,MissionProp13,missionprop10 from lwmission where 1=1 "
	strSQL = "select BackFileNo,BackInfoNo,BackInfoType,FileNum,ErrFileName,ErrLocation,ErrCause"
					+" from LXReceiptDetail where BackFileNo='"+BackFileNo1+"'";
    turnPage2.queryModal(strSQL,SelfPackageGrid,0,1);
}


function PackageGridClick()
{
	 var i = PackageGrid.getSelNo();
    if (i != '0')
    {
        i = i - 1;
        var BackFileNo = PackageGrid.getRowColData(i,1);
        //var PackageName= PackageGrid.getRowColData(i,4);
        //alert(BackFileNo);
        querySelfGrid(BackFileNo);
        //location.href="LLClaimConfirmInput.jsp?claimNo="+tClmNo+"&MissionID="+tMissionID+"&SubMissionID="+tSubMissionID+"&BudgetFlag="+tBudgetFlag+"&AuditPopedom="+tAuditPopedom+"&Auditer="+tAuditer+"&GrpRptNo=&RgtClass=1&RgtObj=1";
    }
}


function SelfPackageGridClick()
{
//    var i = SelfPackageGrid.getSelNo();
//    if (i != '0')
//    {
//        i = i - 1;
//        var ErrFileName = SelfPackageGrid.getRowColData(i,5);
//        var BackFileNo = SelfPackageGrid.getRowColData(i,1);
//        var BackInfoNo = SelfPackageGrid.getRowColData(i,2);
//        var strSQL1 ="select BackFileType from LXReceiptFile where BackFileNo='"+BackFileNo+"'";
//        var DealType=easyExecSql(strSQL1);
//        //alert(DealType);
          //jinsh modify    ||DealType=="04"
//        if(DealType=="03"||DealType=="04")
//        {
//			        //alert(BackFileNo);
//			        //alert(BackInfoNo);
//			        //location.href="TransDetail.jsp?ErrFileName="+ErrFileName+"&BackFileNo="+BackFileNo+"&BackInfoNo="+BackInfoNo;
//			        var StrURL="TransDetailFrame.jsp?ErrFileName="+ErrFileName+"&BackFileNo="+BackFileNo+"&BackInfoNo="+BackInfoNo;
//			        window.open(StrURL,"交易详细信息",'width=800,height=600,top=0,left=0,toolbar=0,location=0,directories=0,menubar=0,scrollbars=1,resizable=1,status=0,title="交易详细信息"');
//			        //window.open(StrURL,"医疗单证信息",'width=800,height=600,top=0,left=0,toolbar=0,location=0,directories=0,menubar=0,scrollbars=1,resizable=1,status=0');
//     		 }
//    }
}

function AllDone()
{
		var BackFileNo="";
		var DealType="";
		var cOperator
		var i = PackageGrid.getSelNo();
    if (i != '0')
    {
        i = i - 1; 
        BackFileNo = PackageGrid.getRowColData(i,1);       
    }
    else
  	{
  			alert("请您选择要处理的数据！");
  			return;
  	}
  	var strSQL1 ="select BackFileType from LXReceiptFile where BackFileNo='"+BackFileNo+"'";
    var tOperator=easyExecSql(strSQL1);
    cOperator=tOperator;
		//alert("cOperator"+cOperator);
    if(cOperator!="02"&&cOperator!="03"&&cOperator!="04")//增加补正报文 modify by huangchong
    {
    			alert("发生错误！");
    			return;
    }
    if(cOperator=="03")
    {
    			var strSql1="select backinfono from LXReceiptDetail where BackFileNo='"+BackFileNo+"'";
    			var backinfonolist=easyExecSql(strSql1);
    			//alert(backinfonolist.length+"===backinfonolist.length");
    			//for (var i=0;i<backinfonolist.length;i++)
    			//{
		    	//		alert(backinfonolist[i]);
    			//}
    			for (var i=0;i<backinfonolist.length;i++)
    			{
		    			var strSql2="select COUNT(*) from LXReportToTrade where BackFileNo='"+BackFileNo+"' and BackInfoNo='"+backinfonolist[i]+"' and state='00'";
		    			var count2=easyExecSql(strSql2);
		    			//alert(count2);
		    			if(parseInt(count2)<1)
		    			{
		    					alert("此处理为文件内容错误，您还没有处理完所有的错误！");
		    					return false;
		    			}
    		}
    }
    var StrSql="select COUNT(*) from LXReceiptFile where BackFileNo='"+BackFileNo+"' and packagename like '%%IH%%'";
    var Count=easyExecSql(StrSql);
    //alert("Count"+Count);
    if(Count=="1"||Count=='1')
    {
    	DealType="01";
    	//alert(DealType);
    }
  	else
  	{
  		DealType="02";
  	}
  	//alert("DealType"+DealType);
    //fm.action="./AllSave.jsp?DealType="
    //				 +DealType
    //				 +"&BackFileNo="
    //				 +BackFileNo
    //				 +"&cOperator="+cOperator;
    fm.action="./LXDealSaveAll.jsp?DealType="+DealType+"&BackFileNo="+BackFileNo+"&cOperator="+cOperator;
    //fm.action="./LXISModifyMainSave.jsp?dealno="+DealType+"&datastate="+DealType;
    //fm.action="./LXDealSaveAll.jsp";
    //alert(fm.action);
    fm.submit();
    //alert("submit");
}

function afterSubmit( FlagStr, content )
{
    //showInfo.close();
    if (FlagStr == "Fail" )
    {
        var urlStr="../common/jsp/MessagePage.jsp?picture=C&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
    }
    else
    {
        var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
        //initQuery();
        //fm.RptConfirm.disabled = false;
        queryGrid();
    }
    tSaveFlag ="0";
}