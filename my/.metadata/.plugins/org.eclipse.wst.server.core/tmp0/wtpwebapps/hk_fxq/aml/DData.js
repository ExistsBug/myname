//程序名称：DData.js
//程序功能：大额数据确认
//创建日期：2007-07-02 11:10:36
//创建人  ：zhu
//更新记录：  更新人    更新日期     更新原因/内容

//该文件中包含客户端需要处理的函数和事件


var showInfo;
var mDebug="1";
var turnPage = new turnPageClass();


var k = 0;

//提交，保存按钮对应操作
function submitForm()
{
 alert("正在提交");

 initPolGrid();
 fm.submit(); //提交
}


//提交后操作,服务器数据返回后执行的操作
function afterSubmit( FlagStr, content)
{
    
	
   
  // 刷新查询结果

	easyQueryClickSelf();  
	
}


// 查询按钮
function easyQueryClickSelf()
{
	// 初始化表格
			//alert("querying ...");
	initPolGrid();
	
	// 书写SQL语句
	k++;
	//var inputDay=fm.StaDate.value;
	if(fm.CSNM.value==null||fm.CSNM.value=="")
	   {
	    alert("请输入查询条件！");
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
  	
   alert("没有查询到相关数据");  
     return false;
    
  }
   return true;	
}




function chk()
{
  fm.action = "../qr/DDataChk.jsp";
  

   fm.submit(); //提交
 
}


/*********************************************************************
 *  执行自动核保任务后返回
 *  参数  ：  无
 *  返回值：  无
 *  修改人：续涛
 *  时  间：2005-10-12 
 *********************************************************************
 */
function afterAutoChk(  )
{
   easyQueryClickSelf(); 

}

/*********************************************************************
 *  显示frmSubmit框架，用来调试
 *  参数  ：  无
 *  返回值：  无
 *********************************************************************
 */
function showSubmitFrame(cDebug)
{
	if( cDebug == "1" )
		parent.fraMain.rows = "0,0,50,82,*";
	else 
		parent.fraMain.rows = "0,0,0,72,*";
}

