//var showInfo;
//var turnPage = new turnPageClass();



function getin()
{
		if(fmload.FileName.value=="")
		{
				alert("请选择文件！");
				return;
		}
		fmload.action="LXIHTradeMainDiskImportSave.jsp?DealType=DE";
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
    location.href="LXIHTradeMainDiskImport.jsp";
}	