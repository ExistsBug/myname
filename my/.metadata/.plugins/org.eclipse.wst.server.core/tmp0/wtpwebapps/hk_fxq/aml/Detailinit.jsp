<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：
//程序功能：
//创建日期：
//创建人  ：
//更新记录：
%>
<!--用户校验类-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<script language="JavaScript">

//接收参数
function initParam()
{

}

//把null的字符串转为空
function nullToEmpty(string)
{
	if ((string == "null") || (string == "undefined"))
	{
		string = "";
	}
	return string;
}

// 输入框的初始化
function initInpBox()
{ 

  try
  {                                   
  }
  catch(ex)
  {
    alert("在DetailInit.jsp-->InitInpBox函数中发生异常:初始化界面错误!1");
  }      
}

// 下拉框的初始化
function initSelBox()
{  
  try                 
  {
//    setOption("sex","0=男&1=女&2=不详");        
  }
  catch(ex)
  {
    alert("在DetailInit.jsp-->InitSelBox函数中发生异常:初始化界面错误!2");
  }
}                                        

function initForm()
{
  try
  {
    initParam();
    //alert("1");
    initInpBox();
    //alert("2");
    initSelBox();
    //alert("3");  
    initPackageGrid();
    //alert("4");
    initSelfPackageGrid();
    //alert("5");
    //querySelfGrid();
    //alert("6");
//	initSelfPolGrid();
//	easyQueryClickSelf();
	
  }
  catch(re)
  {
    alert("DetailInit.jsp-->InitForm函数中发生异常:初始化界面错误!3");
  }
}

//清空页面
function emptyForm() 
{
	//emptyFormElements();     //清空页面所有输入框，在COMMON.JS中实现
   
	initSubInsuredGrid();
	initBnfGrid();
	initImpartGrid();
	initSpecGrid();
	initDutyGrid();
	
	//SubInsuredGrid.clearData();
	//BnfGrid.clearData();
	//ImpartGrid.clearData();
	//SpecGrid.clearData();
	//DutyGrid.clearData();
	spanDutyGrid.innerHTML="";
}

// 报案信息列表的初始化
function initPackageGrid()
{                               
    var iArray = new Array();
    
    try
    {
    iArray[0]=new Array();
    iArray[0][0]="序号";               //列名（此列为顺序号，列名无意义，而且不显示）
    iArray[0][1]="30px";                //列宽
    iArray[0][2]=10;                  //列最大值
    iArray[0][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[1]=new Array();
    iArray[1][0]="回执文件编号";             //列名
    iArray[1][1]="150px";                //列宽
    iArray[1][2]=100;                  //列最大值
    iArray[1][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[2]=new Array();
    iArray[2][0]="回执文件类型";             //列名
    iArray[2][1]="80px";                //列宽
    iArray[2][2]=100;                  //列最大值
    iArray[2][3]=2;                    //是否允许输入,1表示允许，0表示不允许
    iArray[2][4]="backfiletype";

    iArray[3]=new Array();
    iArray[3][0]="对应上报数据包编号";             //列名
    iArray[3][1]="150px";                //列宽
    iArray[3][2]=200;                  //列最大值
    iArray[3][3]=3;                    //是否允许输入,1表示允许，0表示不允许

    iArray[4]=new Array();
    iArray[4][0]="对应上报数据包名称";             //列名
    iArray[4][1]="260px";                //列宽
    iArray[4][2]=500;                  //列最大值
    iArray[4][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[5]=new Array();
    iArray[5][0]="回执文件名称";             //列名
    iArray[5][1]="300px";                //列宽
    iArray[5][2]=200;                  //列最大值
    iArray[5][3]=3; 


    iArray[6]=new Array();
    iArray[6][0]="回执文件路径";             //列名
    iArray[6][1]="150px";                //列宽
    iArray[6][2]=200;                  //列最大值
    iArray[6][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[7]=new Array();
    iArray[7][0]="处理状态";             //列名
    iArray[7][1]="60px";                //列宽
    iArray[7][2]=200;                  //列最大值
    iArray[7][3]=2;                    //是否允许输入,1表示允许，0表示不允许
    iArray[7][4]="backdealstate";

    
    
    
    iArray[8]=new Array();
    iArray[8][0]="生成时间";             //列名
    iArray[8][1]="100px";                //列宽
    iArray[8][2]=200;                  //列最大值
    iArray[8][3]=3;                    //是否允许输入,1表示允许，0表示不允许

    iArray[9]=new Array();
    iArray[9][0]="生成日期";             //列名
    iArray[9][1]="80px";                //列宽
    iArray[9][2]=200;                  //列最大值
    iArray[9][3]=0;                    //是否允许输入,1表示允许，0表示不允许            
    
    iArray[10]=new Array();
    iArray[10][0]="操作员";             //列名AccidentReason
    iArray[10][1]="50px";                //列宽
    iArray[10][2]=200;                  //列最大值
    iArray[10][3]=3;                    //是否允许输入,1表示允许，0表示不允许
    
    iArray[11]=new Array();
    iArray[11][0]="操作员";             //列名AccidentReason
    iArray[11][1]="100px";                //列宽
    iArray[11][2]=200;                  //列最大值
    iArray[11][3]=3;                    //是否允许输入,1表示允许，0表示不允许
    
    PackageGrid = new MulLineEnter( "fm" , "PackageGrid" ); 
    //这些属性必须在loadMulLine前
    PackageGrid.mulLineCount = 0;   
    PackageGrid.displayTitle = 1;
    PackageGrid.locked = 0;
//    PackageGrid.canChk = 1;
    PackageGrid.canSel =1; // 1 显示 ；0 隐藏（缺省值）
    PackageGrid.selBoxEventFuncName ="PackageGridClick"; //响应的函数名，不加扩号
//        PackageGrid.selBoxEventFuncParm =""; //传入的参数,可以省略该项     
    PackageGrid.hiddenPlus=1;
    PackageGrid.hiddenSubtraction=1;
    PackageGrid.loadMulLine(iArray); 
    }
    catch(ex)
    {
        alert(ex);
    }
}

// 报案信息列表的初始化
function initSelfPackageGrid()
{                               
    var iArray = new Array();
    
    try
    {
    iArray[0]=new Array();
    iArray[0][0]="序号";               //列名（此列为顺序号，列名无意义，而且不显示）
    iArray[0][1]="30px";                //列宽
    iArray[0][2]=10;                  //列最大值
    iArray[0][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[1]=new Array();
    iArray[1][0]="回执文件编号";             //列名
    iArray[1][1]="150px";                //列宽
    iArray[1][2]=100;                  //列最大值
    iArray[1][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[2]=new Array();
    iArray[2][0]="回执内容编号";             //列名
    iArray[2][1]="100px";                //列宽
    iArray[2][2]=100;                  //列最大值
    iArray[2][3]=3;                    //是否允许输入,1表示允许，0表示不允许

    iArray[3]=new Array();
    iArray[3][0]="回执内容类型";             //列名
    iArray[3][1]="80px";                //列宽
    iArray[3][2]=200;                  //列最大值
    iArray[3][3]=2;                    //是否允许输入,1表示允许，0表示不允许
    iArray[3][4]="backfiletype";

    iArray[4]=new Array();
    iArray[4][0]="发送文件数";             //列名
    iArray[4][1]="100px";                //列宽
    iArray[4][2]=500;                  //列最大值
    iArray[4][3]=3;                    //是否允许输入,1表示允许，0表示不允许

    iArray[5]=new Array();
    iArray[5][0]="错误文件名称";             //列名
    iArray[5][1]="300px";                //列宽
    iArray[5][2]=200;                  //列最大值
    iArray[5][3]=0; 


    iArray[6]=new Array();
    iArray[6][0]="错误定位";             //列名
    iArray[6][1]="130px";                //列宽
    iArray[6][2]=200;                  //列最大值
    iArray[6][3]=0;                    //是否允许输入,1表示允许，0表示不允许

    iArray[7]=new Array();
    iArray[7][0]="错误原因";             //列名
    iArray[7][1]="120px";                //列宽
    iArray[7][2]=200;                  //列最大值
    iArray[7][3]=0;                    //是否允许输入,1表示允许，0表示不允许
    
  
    
    SelfPackageGrid = new MulLineEnter( "fm" , "SelfPackageGrid" ); 
    //这些属性必须在loadMulLine前
    SelfPackageGrid.mulLineCount = 0;   
    SelfPackageGrid.displayTitle = 1;
    SelfPackageGrid.locked = 0;
//    SelfPackageGrid.canChk = 1;
    SelfPackageGrid.canSel =1; // 1 显示 ；0 隐藏（缺省值）
    SelfPackageGrid.selBoxEventFuncName ="SelfPackageGridClick"; //响应的函数名，不加扩号
//        SelfPackageGrid.selBoxEventFuncParm =""; //传入的参数,可以省略该项    
    SelfPackageGrid.hiddenPlus=1;
    SelfPackageGrid.hiddenSubtraction=1;
    SelfPackageGrid.loadMulLine(iArray);  

    }
    catch(ex)
    {
        alert(ex);
    }
}
</script>