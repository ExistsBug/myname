/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主脚本
 ******************************************************************************/

//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                     //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();               //全局变量, 查询结果翻页, 必须有
var turnPageFileMsgGrid = new turnPageClass();    //全局变量, 已申请报文查询结果翻页

/*============================================================================*/

/**
 * 提交后操作, 服务器数据返回后执行的操作
 */
function afterSubmit(DealFlag, MsgContent)
{
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            //showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }
}

/*============================================================================*/

/**
 * 查询已申请上报报文信息
 */
function queryFileMsgGrid()
{
    var QuerySQL = "select a.AppId, "
    			 +		  "a.CalCode, "
                 +        "a.CRCD, "
                 +        "a.Validity, "
                 +        "a.ReMark, "
                 +        "a.type "
                 +    "from LXCalMode a "
                 +   "where 1 = 1 "
                 +     "and a.no = '0' "
                 +     "and a.type in( 'S','C') "
                 +      getWherePart("a.CRCD", "CRCD")    
                 +      getWherePart("a.CalCode", "CalCode")
                 +      getWherePart("a.AppId", "AppId")                    
                 +   "order by a.CalCode, a.CRCD, a.Validity" ;
    //alert(QuerySQL);
    try
    {
        turnPageFileMsgGrid.pageDivName = "divTurnPageFileMsgGrid";
        turnPageFileMsgGrid.queryModal(QuerySQL, FileMsgGrid, 0, 1);
    }
    catch (ex)
    {
        alert("警告：查询已定义接口规则出现异常！ ");
    }
}

/*============================================================================*/

/**
 * 处理已申请上报报文信息
 */
function dealTheFileMsg()
{
    var nSelNo;
    try
    {
        nSelNo = FileMsgGrid.getSelNo() - 1;
    }
    catch (ex) {}
    if (nSelNo == null || nSelNo < 0)
    { var sAppId="";
    	var sCalCode="";
    	var sType="";
    	var sOpenWinURL = "DataInterfaceIdyMain.jsp";
    	var sParameters = "AppId=" + sAppId + "&CalCode=" + sCalCode+ "&Type=" + sType;
        OpenWindowNew(sOpenWinURL, "定义提数规则处理", "left");
//        window.open(sOpenWinURL);
    }
    else
    {
        var sAppId, sCalCode, sType;
        try
        {
            sAppId = FileMsgGrid.getRowColData(nSelNo, 1);
            sCalCode = FileMsgGrid.getRowColData(nSelNo, 2);
             sType = FileMsgGrid.getRowColData(nSelNo, 6);
        }
        catch (ex) {}
        if (sAppId == null || sAppId.trim() == "")
        {
            alert("请先选择一个有效的规则编号！ ");
            return;
        }
        else if (sCalCode == null || sCalCode.trim() == "")
        {
            alert("请先选择一个有效的规则编号！ ");
            return;
        }        
        else
        {
            var sOpenWinURL = "DataInterfaceIdyMain.jsp";
            var sParameters = "AppId=" + sAppId + "&CalCode=" + sCalCode+ "&Type=" + sType;
            OpenWindowNew(sOpenWinURL + "?" + sParameters, "定义提数规则处理", "left");
//            window.open(sOpenWinURL + "?" + sParameters);

        }
    }
}

/**
 * 处理交易特征类型
 */
function dealCRCDType(obj){
	var DealType = document.getElementById("DealType").value;	
	if (DealType == "01"){
		try{
			showCodeList('amlbigstamp', [obj]);
		} catch(ex){
			alert(ex);
		}
	}else if (DealType == "02"){
		try{
			showCodeList('amlshadinessstamp', [obj]);		
		}catch(ex){
			alert(ex);
		}
	}else {
		document.getElementById(obj.name).value ="";
	}
}

function dealCRCDTypeKey(obj){
	var DealType = document.getElementById("DealType").value;	
	if (DealType == "01"){
		try{
			showCodeListKey('amlbigstamp', [obj]);
		} catch(ex){
			alert(ex);
		}
	}else if (DealType == "02"){
		try{
			showCodeListKey('amlshadinessstamp', [obj]);		
		}catch(ex){
			alert(ex);
		}
	}else {
		document.getElementById(obj.name).value ="";
	}
}
/*============================================================================*/


//<!-- JavaScript Document END -->
