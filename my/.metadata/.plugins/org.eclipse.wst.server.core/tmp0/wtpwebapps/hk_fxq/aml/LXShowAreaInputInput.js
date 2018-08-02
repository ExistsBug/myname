 //               该文件中包含客户端需要处理的函数和事件

var showInfo;
var mDebug="0";
var saveClick=false;
var arrDataSet;
var turnPage = new turnPageClass();


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

	
	
	
	function returnParent(){
		 var arrReturn = new Array();
			var tSel = TradeMainGrid.getSelNo();	
			if( tSel == 0 || tSel == null )
				//top.close();
				alert( "请先选择一条记录，再点击返回按钮。" );
			else
			{
					try
					{
						arrReturn = getQueryResult();
						
							//若选择地区类别则对字符串进行拼接再返回，modify by huangchong
						if (arrReturn[0][0].substring(0,3)=="CHN")
						{
							if(fm.all("TRCDType").value!=null&&fm.all("TRCDType").value!="null"&&fm.all("TRCDType").value!="")
						        {						        	
							        arrReturn[0][0] = fm.all("TRCDType").value + arrReturn[0][0].substring(3);
						        }
						}
						//end
						var otype = fm.all("otype").value;
						top.opener.afterQueryArea( arrReturn,  otype);
					}
					catch(ex)
					{
						alert( "没有发现父窗口的afterQuery接口。" + ex );
					}
					top.close();
			}
	}
	
	function getQueryResult(){
		var arrSelected = null;
		tRow = TradeMainGrid.getSelNo();
		if( tRow == 0 || tRow == null )
		  return arrSelected;
		arrSelected = new Array();
		try{
		var strSQL = " select code1, name1 from "
				+ " ((select trim(code) country, trim(codename) countryname, '000000' province, '' provincename, case when trim(code) in ('@N', '@I', '@E') then trim(code) else trim(code)||'000000' end as code1,  trim(codename) as name1 " 
				+ " from ldcode  where codetype = 'amlcountry' and code <> 'CHN') "
				+ " union all " 
				+ " (select 'CHN', '中国', trim(code), trim(codename), 'CHN'||trim(code) ,trim(codename) "
				+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
		        + " and code1 = '" + TradeMainGrid.getRowColData(tRow-1,5) + "' "; 
		}catch(ex){
			alert(ex);
		}
		turnPage.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	  	//判断是否查询成功
	  	if (!turnPage.strQueryResult) {
	    	alert("查询失败！");
	    	return false;
	    }
		//查询成功则拆分字符串，返回二维数组
	  	arrSelected = decodeEasyQueryResult(turnPage.strQueryResult);
		return arrSelected;
	}