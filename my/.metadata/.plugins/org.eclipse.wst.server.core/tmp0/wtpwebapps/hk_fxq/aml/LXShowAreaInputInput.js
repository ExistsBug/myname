 //               ���ļ��а����ͻ�����Ҫ����ĺ������¼�

var showInfo;
var mDebug="0";
var saveClick=false;
var arrDataSet;
var turnPage = new turnPageClass();


window.onfocus=myonfocus;
//ʹ�ôӸô��ڵ����Ĵ����ܹ��۽�
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
				alert( "����ѡ��һ����¼���ٵ�����ذ�ť��" );
			else
			{
					try
					{
						arrReturn = getQueryResult();
						
							//��ѡ������������ַ�������ƴ���ٷ��أ�modify by huangchong
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
						alert( "û�з��ָ����ڵ�afterQuery�ӿڡ�" + ex );
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
				+ " (select 'CHN', '�й�', trim(code), trim(codename), 'CHN'||trim(code) ,trim(codename) "
				+ " from ldcode  where codetype = 'amlmanagecom' )) where 1=1 "
		        + " and code1 = '" + TradeMainGrid.getRowColData(tRow-1,5) + "' "; 
		}catch(ex){
			alert(ex);
		}
		turnPage.strQueryResult  = easyQueryVer3(strSQL, 1, 0, 1);  
	  	//�ж��Ƿ��ѯ�ɹ�
	  	if (!turnPage.strQueryResult) {
	    	alert("��ѯʧ�ܣ�");
	    	return false;
	    }
		//��ѯ�ɹ������ַ��������ض�ά����
	  	arrSelected = decodeEasyQueryResult(turnPage.strQueryResult);
		return arrSelected;
	}