//�������ƣ�DData.js
//�����ܣ��������ȷ��
//�������ڣ�2007-07-02 11:10:36
//������  ��zhu
//���¼�¼��  ������    ��������     ����ԭ��/����

//���ļ��а����ͻ�����Ҫ����ĺ������¼�


var showInfo;
var mDebug="1";
var turnPage = new turnPageClass();


var k = 0;

//�ύ�����水ť��Ӧ����
function submitForm()
{
 alert("�����ύ");

 initPolGrid();
 fm.submit(); //�ύ
}


//�ύ�����,���������ݷ��غ�ִ�еĲ���
function afterSubmit( FlagStr, content)
{
    
	
   
  // ˢ�²�ѯ���

	easyQueryClickSelf();  
	
}


// ��ѯ��ť
function easyQueryClickSelf()
{
	// ��ʼ�����
			//alert("querying ...");
	initPolGrid();
	
	// ��дSQL���
	k++;
	//var inputDay=fm.StaDate.value;
	if(fm.CSNM.value==null||fm.CSNM.value=="")
	   {
	    alert("�������ѯ������");
	    return false;
	    }
	var strSQL = ""; 

	strSQL = "select LXIHTradeMain.DealNo,LXIHTradeMain.CSNM,LXIHTradeMain.CTNM,LXIHTradeMain.CITP,LXIHTradeMain.CTID,LXIHTradeMain.CTNT ,LXIHTradeMain.HTDT,LXIHTradeMain.DataState,LXIHTradeMain.DealDate,LXIHTradeMain.DealTime,LXIHTradeMain.Operator from LXIHTradeMain where "+k+"="+k
	         +"and LXIHTradeMain.DataState='0'"

            + getWherePart('LXIHTradeMain.CSNM','CSNM')
          
 			+ getWherePart('LXIHTradeMain.HTDT','StaDate') 
 			+"order by  LXIHTradeMain.DealNo";
   // strSQL="select * from LXIHTradeMain";
  
     
	turnPage.queryModal(strSQL, PolGrid);
	//alert("query end");
	
	
  if (!turnPage.strQueryResult) {  
  	
   alert("û�в�ѯ���������");  
     return false;
    
  }
   return true;	
}




function chk()
{
  fm.action = "../qr/DDataChk.jsp";
  

   fm.submit(); //�ύ
 
}


/*********************************************************************
 *  ִ���Զ��˱�����󷵻�
 *  ����  ��  ��
 *  ����ֵ��  ��
 *  �޸��ˣ�����
 *  ʱ  �䣺2005-10-12 
 *********************************************************************
 */
function afterAutoChk(  )
{
   easyQueryClickSelf(); 

}

/*********************************************************************
 *  ��ʾfrmSubmit��ܣ���������
 *  ����  ��  ��
 *  ����ֵ��  ��
 *********************************************************************
 */
function showSubmitFrame(cDebug)
{
	if( cDebug == "1" )
		parent.fraMain.rows = "0,0,50,82,*";
	else 
		parent.fraMain.rows = "0,0,0,72,*";
}

