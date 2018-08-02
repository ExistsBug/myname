//var showInfo;
var turnPage = new turnPageClass();

function callrgtstate(obj)
{
	//alert(obj);
	fmload.DealType.value=obj.value;
	//alert(fmload.DealType.value);
}

function getin()
{
	
	if(fmload.FileName.value=="")
	{
		alert("请选择文件！");
		return;
	}





		//alert("startstr="+startstr+"endstr="+endstr);
		//var just=fmload.FileName.value.substr(fmload.FileName.value.lastIndexOf("\\")+5,fmload.FileName.value.lastIndexOf("\\")+29).toUpperCase();
		//alert(just);
		
		//alert(fmload.FileName.value.indexOf("FDSC"));
		//var strname1=fmload.FileName.value.substr(fmload.FileName.value.lastIndexOf("\\")+5,fmload.FileName.value.lastIndexOf("\\")+33);
		//alert(fmload.FileName.value.substr(fmload.FileName.value.lastIndexOf("\\")+5,fmload.FileName.value.lastIndexOf(".")));
		
		/*var startstr=fmload.FileName.value.lastIndexOf("\\")+5;
		var endstr=fmload.FileName.value.toUpperCase().lastIndexOf("XML");
		var just=fmload.FileName.value.toUpperCase().substring(startstr,endstr-1);
		var justsql="select COUNT(*) from LXReceiptFile where packagename='"+just+"' ";
		//alert(justsql);
		var countjust=easyExecSql(justsql);
		//alert(countjust);
		if(parseInt(countjust)>0)
		{
				alert("文件已导入，请不要重复导入！");
				return false;
		}
		//return false;
		if(fmload.FileName.value.indexOf("FDSC")!=-1)
		{

			fmload.DealType.value="SUCC";

		}

		if(fmload.FileName.value.indexOf("FDNF")!=-1)
		{

			fmload.DealType.value="NMFL";

		}

		if(fmload.FileName.value.indexOf("FDCF")!=-1)
		{

			fmload.DealType.value="CTFL";

		}*/

	
	fmload.action="./LXFDSCDiskSave.jsp";
	fmload.submit();
}

//提交后操作,返回
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
        goToBack();
    }
    tSaveFlag ="0";
}

function goToBack()
{
    location.href="LXFDSCImport.jsp";
}	