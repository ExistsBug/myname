//�������ƣ�DData.js
//�����ܣ��������ȷ��
//�������ڣ�2007-07-02 11:10:36
//������  ��zhu
//���¼�¼��  ������    ��������     ����ԭ��/����

//���ļ��а����ͻ�����Ҫ����ĺ������¼�


var showInfo;
var mDebug="1";
var turnPage = new turnPageClass(); 
var arrDataSet;

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
	    alert("�������ѯ����  ..");
	    return false;
	    }
	var strSQL = ""; 

	strSQL = "select * from LXISTradeMain where "+k+"="+k
	         +"and LXISTradeMain.DataState='0'"

            + getWherePart('LXISTradeMain.CSNM','CSNM')
          
 			+ getWherePart('LXISTradeMain.DealDate','StaDate') 
 			+"order by  LXISTradeMain.DealNo";
   // strSQL="select * from LXIHTradeMain";
  
     
	turnPage.queryModal(strSQL, PolGrid);
	//alert("query end");
	
	
  if (!turnPage.strQueryResult) {  
  	
   alert("have no data");  
     return false;
    
  }
   return true;	
}




function chk()
{
 
  fm.action = "../qr/KDataChk.jsp";
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

