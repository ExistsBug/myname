<%@include file="../common/jsp/UsrCheck.jsp"%> 
<%
//程序名称：KDataInit.jsp; 
//程序功能：个人自动核保
//创建日期：2007-07-03 11:10:36
//创建人  ：zhu
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

<script language="JavaScript">

// 输入框的初始化（单记录部分）
function initInpBox()
{ 

  try
  {                                   
	// 可疑数据确认查询条件
   // alert("shj you wenti");
    fm.all('CSNM').value = '';
   // fm.all('StaDate').value = '';
   
  }
  catch(ex)
  {
    alert("在KDataInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }      
}
                          

function initForm() 
{
  try
  {
    initInpBox();

    initPolGrid();
    //easyQueryClickSelf();
	//initDDataGrid();
  }
  catch(re)
  {
    alert("KDataInit.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}


// 大额数据表信息的初始化
function initPolGrid()
  {       
   // alert(" hai shi you");                        
    var iArray = new Array();
      
      try
      {
      iArray[0]=new Array();
      iArray[0][0]="序号";         			//列名（此列为顺序号，列名无意义，而且不显示）
      iArray[0][1]="30px";            		//列宽
      iArray[0][2]=10;            			//列最大值
      iArray[0][3]=0;              			//是否允许输入,1表示允许，0表示不允许

      iArray[1]=new Array();
      iArray[1][0]="交易编号";         		//列名
      iArray[1][1]="80px";            		//列宽
      iArray[1][2]=100;            			//列最大值
      iArray[1][3]=0;              			//是否允许输入,1表示允许，0表示不允许

      iArray[2]=new Array();
      iArray[2][0]="可疑交易特征";         		//列名
      iArray[2][1]="60px";            		//列宽
      iArray[2][2]=100;            			//列最大值
      iArray[2][3]=0;              			//是否允许输入,1表示允许，0表示不允许

      iArray[3]=new Array();
      iArray[3][0]="可疑程度";    		//列名
      iArray[3][1]="80px";            		//列宽
      iArray[3][2]=100;            			//列最大值
      iArray[3][3]=0;               			//是否允许输入,1表示允许，0表示不允许

      iArray[4]=new Array();
      iArray[4][0]="采取措施";         		//列名
      iArray[4][1]="110px";            		//列宽
      iArray[4][2]=100;            			//列最大值
      iArray[4][3]=0;              			//是否允许输入,1表示允许，0表示不允许

      iArray[5]=new Array();
      iArray[5][0]="可疑行为描述";         		//列名
      iArray[5][1]="110px";            		//列宽
      iArray[5][2]=100;            			//列最大值
      iArray[5][3]=0;              			//是否允许输入,1表示允许，0表示不允许
      
      iArray[6]=new Array();
      iArray[6][0]="客户号";         		//列名
      iArray[6][1]="80px";            		//列宽
      iArray[6][2]=200;            			//列最大值
      iArray[6][3]=0;              			//是否允许输入,1表示允许，0表示不允许 
      
      iArray[7]=new Array();
      iArray[7][0]="客户姓名";         		//列名
      iArray[7][1]="110px";            		//列宽
      iArray[7][2]=200;            			//列最大值
      iArray[7][3]=0;              			//是否允许输入,1表示允许，0表示不允许 
      
      iArray[8]=new Array();
      iArray[8][0]="客户身份证件类型";         		//列名
      iArray[8][1]="80px";            		//列宽
      iArray[8][2]=60;            			//列最大值
      iArray[8][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[9]=new Array();
      iArray[9][0]="客户证件号码";         		//列名
      iArray[9][1]="100px";            		//列宽
      iArray[9][2]=60;            			//列最大值
      iArray[9][3]=0;              			//是否允许输入,1表示允许，0表示不允许 
      
      iArray[10]=new Array();
    iArray[10][0]="投保人类型";         		//列名
     iArray[10][1]="100px";            		//列宽
    iArray[10][2]=60;            			//列最大值
     iArray[10][3]=0;              			//是否允许输入,1表示允许，0表示不允许 
      
       iArray[11]=new Array();
      iArray[11][0]="客户联系电话";         		//列名
      iArray[11][1]="50px";            		//列宽
      iArray[11][2]=60;            			//列最大值
     iArray[11][3]=0;               			//是否允许输入,1表示允许，0表示不允许   
     
      
       iArray[12]=new Array();
      iArray[12][0]="客户详细地址";         		//列名
      iArray[12][1]="50px";            		//列宽
      iArray[12][2]=60;            			//列最大值
     iArray[12][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
     
       iArray[13]=new Array();
      iArray[13][0]="客户其他信息";         		//列名
      iArray[13][1]="50px";            		//列宽
      iArray[13][2]=60;            			//列最大值
     iArray[13][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[14]=new Array();
      iArray[14][0]="客户职业";         		//列名
      iArray[14][1]="50px";            		//列宽
      iArray[14][2]=60;            			//列最大值
     iArray[14][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[15]=new Array();
      iArray[15][0]="代表人姓名";         		//列名
      iArray[15][1]="50px";            		//列宽
      iArray[15][2]=60;            			//列最大值
     iArray[15][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[16]=new Array();
      iArray[16][0]="代表人身份证类型";         		//列名
      iArray[16][1]="50px";            		//列宽
      iArray[16][2]=60;            			//列最大值
     iArray[16][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[17]=new Array();
      iArray[17][0]="代表人身份证号码";         		//列名
      iArray[17][1]="50px";            		//列宽
      iArray[17][2]=60;            			//列最大值
     iArray[17][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[18]=new Array();
      iArray[18][0]="数据状态";         		//列名
      iArray[18][1]="50px";            		//列宽
      iArray[18][2]=60;            			//列最大值
     iArray[18][3]=0;               			//是否允许输入,1表示允许，0表示不允许 
      
       iArray[19]=new Array();
      iArray[19][0]="可疑交易生成日期";         		//列名
      iArray[19][1]="50px";            		//列宽
      iArray[19][2]=60;            			//列最大值
     iArray[19][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
       iArray[20]=new Array();
      iArray[20][0]="可疑交易生成时间";         		//列名
      iArray[20][1]="50px";            		//列宽
      iArray[20][2]=60;            			//列最大值
     iArray[20][3]=0;               			//是否允许输入,1表示允许，0表示不允许   
      
       iArray[21]=new Array();
      iArray[21][0]="操作员";         		//列名
      iArray[21][1]="50px";            		//列宽
      iArray[21][2]=60;            			//列最大值
     iArray[21][3]=0;               			//是否允许输入,1表示允许，0表示不允许    
      
        
      

      PolGrid = new MulLineEnter( "fm" , "PolGrid" ); 
      //这些属性必须在loadMulLine前
      PolGrid.mulLineCount = 4;   
      PolGrid.displayTitle = 1;
      PolGrid.locked = 1;
      PolGrid.canSel = 0;
      PolGrid.canChk = 1;
      PolGrid.hiddenPlus = 1;
      PolGrid.hiddenSubtraction = 1;      
      PolGrid.loadMulLine(iArray);  
      
      //这些操作必须在loadMulLine后面
      // PolGrid.setRowColData(1,1,"asdf");
      }
      catch(ex)
      {
        alert(ex);
      }
}
</script>