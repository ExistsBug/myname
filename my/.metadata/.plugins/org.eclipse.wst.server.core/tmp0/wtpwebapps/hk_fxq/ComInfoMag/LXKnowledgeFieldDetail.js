//               ���ļ��а����ͻ�����Ҫ����ĺ������¼�
var showInfo;

var arrDataSet;
var turnPage = new turnPageClass();

function getQueryResult() {
	  //ȡ��ǰ����
	  var arrSelected = null;
	  arrSelected = new Array();
	  fm.all('Idx').value=tIDX;
	  var strSql=new SqlClass();
	//    var strSql = " select a.IDX, a.PubType, a.ManageCom, a.Keyword, a.State, a.FilePath from LXKnowledgeField a where 1=1  and a.IDX= '"+ tIDX+ "'";
	    var strSql = " select a.IDX,  a.PubType, '֪ʶ԰��',a.ManageCom, a.Keyword, a.State,(case a.State when'R05' then '�����ɹ�' end ) from LXKnowledgeField a where 1=1  and a.IDX= '"+ tIDX+ "'";
	    var arrSelected  = new Array();
	    arrSelected = easyExecSql(strSql);
			 //�ж��Ƿ��ѯ�ɹ�
			 if (!arrSelected) {
					   alert("����ѯ����Ϣ�����ڣ�");
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
		alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
	}
	top.close();
}
//		 turnPage.strQueryResult = easyQueryVer3(strSql.getString(), 1, 1, 1);
//		 alert(easyQueryVer3(strSql.getString(), 1, 1, 1));
//			//�ж��Ƿ��ѯ�ɹ�
//			if (!turnPage.strQueryResult) {
//				alert("��ѯʧ�ܣ�");
//				return false;
//			}
//			//��ѯ�ɹ������ַ��������ض�ά����
//alert(99999);
//			arrSelected = decodeEasyQueryResult(turnPage.strQueryResult);
//			return arrSelected;
	
	//��ѯ�ɹ������ַ��������ض�ά����


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

