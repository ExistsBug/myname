<%@page pageEncoding="GBK" contentType="text/html;charset=UTF-8" %>
<%@page import="com.sinosoft.lis.pubfun.*" %>
<%
    String gToday = PubFun.getCurrentDate();
    GlobalInput tG=(GlobalInput)session.getValue("GI");
    //String tOperator = tG.Operator;
    //String tManageCom = tG.ManageCom;
%>
<script type="text/javascript">
function initForms(){
    try{
        initfm();
    }catch(ex){
        alert("在LAAgentInputInit.jsp-->initForm函数中发生异常:初始化界面错误!");
    }
}//initForm()
function initInpBoxfm(){
    try{
        fm.reset();
        //TODO- 这里写初始化页面的代码
    }catch(ex){
        alert("在uiminiInit.jsp-->InitInpBoxfm函数中发生异常:初始化界面错误!");
    }
}
function initfm(){
    try{
        initInpBoxfm();
        initUiminiGird();
        initUiminiDetailGird();
    }catch(re){
        alert("LAAgentInputInit.jsp-->InitFormfm函数中发生异常:初始化界面错误!");
    }
}
function initUiminiGird(){
    var iArray = new Array();
    var i = 0;
    try{
        iArray[i]=new Array();
        iArray[i][0]="No."; //列名
        iArray[i][1]="30px"; //列宽
        iArray[i][2]=100; //列最大值
        iArray[i][3]=1; //是否允许输入，0表示不允许，1表示允许，2表示代码选择，3表示隐藏
        iArray[i][4]=''; //是否引用代码: null或者" "为不引用
        iArray[i][5]=i+"|"+0; //上面的列中放置引用代码中第几位值
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Agent_Code";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Agent_Name";
        iArray[i][1]="80px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Last_Monthly_Finance";
        iArray[i][1]="100px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Accumulated_Monthly_Finance";
        iArray[i][1]="120px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        UiminiGird = new MulLineEnter( "fm" , "UiminiGird" );
        //这些属性必须在loadMulLine前
        UiminiGird.mulLineCount = 1;
        UiminiGird.displayTitle = 1;
        UiminiGird.hiddenPlus = 1;
        UiminiGird.hiddenSubtraction = 1;
        UiminiGird.canChk = 0;
        UiminiGird.canSel = 1;
        UiminiGird.loadMulLine(iArray);
    }catch(ex){
        alert(ex);
    }
}
function initUiminiDetailGird(){
    var iArray = new Array();
    var i = 0;
    try{
        iArray[i]=new Array();
        iArray[i][0]="Finance Start Month"; //列名
        iArray[i][1]="110px"; //列宽
        iArray[i][2]=100; //列最大值
        iArray[i][3]=1; //是否允许输入，0表示不允许，1表示允许，2表示代码选择，3表示隐藏
        iArray[i][4]=''; //是否引用代码: null或者" "为不引用
        iArray[i][5]=i+"|"+0; //上面的列中放置引用代码中第几位值
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Validation_Requirement";
        iArray[i][1]="120px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Contract-to-month_Requirement";
        iArray[i][1]="150px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Contract-to-month_MF";
        iArray[i][1]="100px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Current_Month_Actual_Production";
        iArray[i][1]="100px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Contract-to-month_Production";
        iArray[i][1]="100px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="No._of_Payable_Month";
        iArray[i][1]="100px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Current_Month_Payment";
        iArray[i][1]="100px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        iArray[i]=new Array();
        iArray[i][0]="Contract-to-month_Payment";
        iArray[i][1]="120px";
        iArray[i][2]=100;
        iArray[i][3]=1;
        iArray[i][4]='';
        iArray[i][5]=i+"|"+0;
        iArray[i][6]='0|1';
        i++;
        UiminiDetailGird = new MulLineEnter( "fm" , "UiminiDetailGird" );
        //这些属性必须在loadMulLine前
        UiminiDetailGird.mulLineCount = 5;
        UiminiDetailGird.displayTitle = 1;
        UiminiDetailGird.hiddenPlus = 1;
        UiminiDetailGird.hiddenSubtraction = 1;
        UiminiDetailGird.canChk = 0;
        UiminiDetailGird.canSel = 1;
        UiminiDetailGird.loadMulLine(iArray);
    }catch(ex){
        alert(ex);
    }
}

</script>
