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
		//var startstr=fmload.FileName.value.lastIndexOf("\\")+5;
		//var endstr=startstr+36;
		//var just=fmload.FileName.value.substr(startstr,startstr+1).toUpperCase();
		//var justsql="select COUNT(*) from LXReceiptFile where packagename='"+just+"' ";
		//var countjust=easyExecSql(justsql);
		//if(parseInt(countjust)>0)
		//{
		//		alert("文件已导入，请不要重复导入！");
		//		return false;
		//}
		//if(fmload.FileName.value.indexOf("FDSC")!=-1)
		//{
		//	fmload.DealType.value="SUCC";
		//}
    //
		//if(fmload.FileName.value.indexOf("FDNF")!=-1)
		//{
		//	fmload.DealType.value="NMFL";
		//}
		//if(fmload.FileName.value.indexOf("FDCF")!=-1)
		//{
		//	fmload.DealType.value="CTFL";
		//}
		//fmload.action="./LXIHTradeMainDiskSave.jsp?DealType="+fmload.DealType.value;
		fmload.action="./LXIHTradeMainDiskImportSave.jsp?DealType=KY";
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
    location.href="LXISTradeMainDiskImport.jsp";
}	