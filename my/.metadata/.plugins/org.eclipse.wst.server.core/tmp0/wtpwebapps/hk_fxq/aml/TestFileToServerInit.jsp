<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

<script language="JavaScript">                        

function initForm() {
  try {  	
  	initLXReceiptFileGrid();
  }
  catch(re) {
    alert("InitForm函数中发生异常:初始化界面错误!");
  }
}

// 领取项信息列表的初始化
var BankGrid;
function initLXReceiptFileGrid() {                               
  var iArray = new Array();
    
  try {
    iArray[0]=new Array();
    iArray[0][0]="序号";         			//列名（此列为顺序号，列名无意义，而且不显示）
    iArray[0][1]="30px";            	//列宽
    iArray[0][3]=0;              			//是否允许输入,1表示允许，0表示不允许

    iArray[1]=new Array();
    iArray[1][0]="数据包名";         		//列名
    iArray[1][1]="100px";            	//列宽
    iArray[1][3]=0;              			//是否允许输入,1表示允许，0表示不允许

    iArray[2]=new Array();
    iArray[2][0]="回执类型";         		//列名
    iArray[2][1]="40px";            	//列宽
    iArray[2][3]=0;              			//是否允许输入,1表示允许，0表示不允许

    iArray[3]=new Array();
    iArray[3][0]="发送文件数";         		//列名
    iArray[3][1]="80px";            	//列宽
    iArray[3][3]=0;              			//是否允许输入,1表示允许，0表示不允许

    iArray[4]=new Array();
    iArray[4][0]="错误文件名称";         		//列名
    iArray[4][1]="100px";            	//列宽
    iArray[4][3]=0;              			//是否允许输入,1表示允许，0表示不允许
    
    iArray[5]=new Array();
    iArray[5][0]="错误定位";         		//列名
    iArray[5][1]="80px";            	//列宽
    iArray[5][3]=0;              			//是否允许输入,1表示允许，0表示不允许    
    
    iArray[6]=new Array();
    iArray[6][0]="错误原因";         		//列名
    iArray[6][1]="100px";            	//列宽
    iArray[6][3]=0;              			//是否允许输入,1表示允许，0表示不允许       

    LXReceiptFileGrid = new MulLineEnter("fm" , "LXReceiptFileGrid"); 
    //这些属性必须在loadMulLine前
    LXReceiptFileGrid.mulLineCount = 0;   
    LXReceiptFileGrid.displayTitle = 1;
    LXReceiptFileGrid.hiddenPlus = 1;
    LXReceiptFileGrid.hiddenSubtraction = 1;
    LXReceiptFileGrid.canSel = 0;
    LXReceiptFileGrid.canChk = 0;
    LXReceiptFileGrid.loadMulLine(iArray);  
    
  }
  catch(ex) {
    alert(ex);
  }
}
</script>

	
