//               该文件中包含客户端需要处理的函数和事件
var showInfo;

var arrDataSet;
var turnPage = new turnPageClass();

function getQueryResult() {
	  //取当前年月
	  var arrSelected = null;
	  arrSelected = new Array();
	  fm.all('Idx').value=tIDX;
	  var strSql=new SqlClass();
	//    var strSql = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a where 1=1  and a.IDX= '"+ tIDX+ "'";
	    var strSql = " select a.IDX,  a.PubType, '知识园地',a.ManageCom, a.Keyword, a.State,(case a.State when'R05' then '发布成功' end ) from LXKnowledgeField a where 1=1  and a.IDX= '"+ tIDX+ "'";
	    var arrSelected  = new Array();
	    arrSelected = easyExecSql(strSql);
			 //判断是否查询成功
			 if (!arrSelected) {
					   alert("所查询的信息不存在！");
					   return false;
			 }
					fm.all('Idx').value = arrSelected[0][0];
					fm.all('PubType').value = arrSelected[0][1];
					fm.all('PubTypeName').value = arrSelected[0][2];
					fm.all('ManageCom').value = arrSelected[0][3];
					fm.all('Keyword').value = arrSelected[0][4];
					fm.all('State').value = arrSelected[0][5];
					fm.all('StateName').value = arrSelected[0][6];
					showOneCodeName('station','ManageCom','ManageComName');
}

function Return(){
	try
	{
		var arrReturn = fm.all("Idx").value;
		top.opener.afterQuery( arrReturn );
	}
	catch(ex)
	{
		alert( "没有发现父窗口的afterQuery接口。" + ex );
	}
	top.close();
}
//		 turnPage.strQueryResult = easyQueryVer3(strSql.getString(), 1, 1, 1);
//		 alert(easyQueryVer3(strSql.getString(), 1, 1, 1));
//			//判断是否查询成功
//			if (!turnPage.strQueryResult) {
//				alert("查询失败！");
//				return false;
//			}
//			//查询成功则拆分字符串，返回二维数组
//alert(99999);
//			arrSelected = decodeEasyQueryResult(turnPage.strQueryResult);
//			return arrSelected;
	
	//查询成功则拆分字符串，返回二维数组


//function afterQuery(arrQueryResult) {
//	alert(777777777);
//	var arrResult = new Array();
//	alert(arrQueryResult);
//	if (arrQueryResult != null) {
//		arrResult = arrQueryResult;
//		fm.all('IDX').value = arrResult[0][0];
//		fm.all('PubType').value = arrResult[0][1];
//		fm.all('ManageCom').value = arrResult[0][2];
//		fm.all('Keyword').value = arrResult[0][3];
//		fm.all('State').value = arrResult[0][4];
//		showOneCodeName('publetype','PubType','PubTypeName');
//		showOneCodeName('station','ManageCom','ManageComName');
//		showOneCodeName('datestate','State','StateName');
//		}
//}

