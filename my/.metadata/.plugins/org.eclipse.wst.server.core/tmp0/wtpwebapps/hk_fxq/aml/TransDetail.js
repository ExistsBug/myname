
var turnPage = new turnPageClass();  //ʹ�÷�ҳ���ܣ����뽨��Ϊȫ�ֱ���
var turnPage2 = new turnPageClass();




function queryGrid()
{
    var strSQL = "select BackFileNo,BackInfoNo,BackInfoType,FileNum,ErrFileName,ErrLocation,ErrCause"
					+" from LXReceiptDetail "
					+" where ErrFileName='"+fm.ErrFileName.value+"'"
					+" and BackInfoNo='"+fm.BackInfoNo.value+"' "
					+" and BackFileNo='"+fm.BackFileNo.value+"' ";
    turnPage.queryModal(strSQL,PackageGrid,0,1);
}

function querySelfGrid()
{
		var BackFileNo=fm.BackFileNo.value;
		var BackInfoNo=fm.BackInfoNo.value;
		var ErrFileName=fm.ErrFileName.value;
		//var Srsql=" select MAX(fileno) from lxreportdatafile"
  		//         +" where filename='"+ErrFileName+"'";
  		//var FileNo=execEasyQuery(Srsql);
  		//alert(FileNo);                 
	    if(ErrFileName==""||ErrFileName==null)
		{
		    alert("ҳ�洫�ݵĴ����ļ������ִ���");
		    return false;
		}
		var Query="select distinct reporttype from lxreportdatafile "
		         +" where filename='"+fm.ErrFileName.value+"'";
		
        var ReportType = easyExecSql(Query);

        if(ReportType==null)
        {
    	    alert("δ�鵽���ݣ�");
    	    return false;
    	}
        if(ReportType[0]=="01")//���
        {
    		initSelfPackageGrid();
    		var strSQL = "select a.fileno,a.filename,a.reporttype,"
    				+" a.datatype,"
    				+" a.dealstate,"
    				+" a.attaname,"
    				+" b.dealno ,"
    				+" c.CTNM,"
    				+" c.dealdate,"
    				+" c.dealtime,"
    				+" c.operator"
    				+" from lxreportdatafile a,lxreportdetail b ,"
    				+" LXIHTradeMain c"
    				+" where a.filename='"+ErrFileName+"' "
    				+" and a.dealstate = '02' "
    				+" and a.fileno in"
    				+" (select MAX(fileno) from lxreportdatafile where filename='"+ErrFileName+"')"
    				+" and a.fileno=b.fileno and c.dealno=b.dealno";
    				
    		turnPage2.queryModal(strSQL,SelfPackageGrid,0,1);
        }
  	    else if(ReportType[0]=="02")
  	    {
  		    initSelfPackageGrid();
      
    		var strSQL = "select a.fileno,a.filename,a.reporttype,"
    				+" a.datatype,"
    				+" a.dealstate,"
    				+" a.attaname,"
    				+" b.dealno ,"
    				+" c.CTNM,"
    				+" c.dealdate,"
    				+" c.dealtime,"
    				+" c.operator"
    				+" from lxreportdatafile a,lxreportdetail b ,"
    				+" LXISTradeMain c"
    				+" where a.filename='"+ErrFileName+"' "
    				+" and a.dealstate = '02' "
    				+" and a.fileno in"
    				+" (select MAX(fileno) from lxreportdatafile where filename='"+ErrFileName+"')"
    				+" and a.fileno=b.fileno and c.dealno=b.dealno";
    		turnPage2.queryModal(strSQL,SelfPackageGrid,0,1);
  	    }
        else 
  	    {
  		    alert("��ʼ������");
  		}
}


function PackageGridClick()
{
	 var i = PackageGrid.getSelNo();
     if (i != '0')
     {
        i = i - 1;
        var BackFileNo = PackageGrid.getRowColData(i,1);
        querySelfGrid(BackFileNo);
    }
}
function Deal()
{
        var BackFileNo = PackageGrid.getRowColData(0,1);
        var BackInfoNo= PackageGrid.getRowColData(0,2);
        fm.action="./TradeMissSave.jsp?BackFileNo="+BackFileNo+"&BackInfoNo="+BackInfoNo;
        fm.submit();	
}

function SelfPackageGridClick()
{
    var i = SelfPackageGrid.getSelNo();
    if (i != '0')
    {
        i = i - 1;
        var ErrFileName = SelfPackageGrid.getRowColData(i,5);
        
        //location.href="TransDetail.jsp?ErrFileName="+ErrFileName;
    }
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
        var urlStr="../common/jsp/MessagePage.jsp?picture=S&content=" + content ;
        showModalDialog(urlStr,window,"status:no;help:0;close:0;dialogWidth:550px;dialogHeight:350px");
        initQuery();
        //fm.RptConfirm.disabled = false;
    }
    tSaveFlag ="0";
}
function CloseWindow()
{
    try 
    {
        window.close();
    }
    catch(ex)
    {
        alert(ex);
    }
}