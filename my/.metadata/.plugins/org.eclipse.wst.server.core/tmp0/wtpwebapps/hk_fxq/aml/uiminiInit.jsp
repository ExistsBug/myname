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
        alert("��LAAgentInputInit.jsp-->initForm�����з����쳣:��ʼ���������!");
    }
}//initForm()
function initInpBoxfm(){
    try{
        fm.reset();
        //TODO- ����д��ʼ��ҳ��Ĵ���
    }catch(ex){
        alert("��uiminiInit.jsp-->InitInpBoxfm�����з����쳣:��ʼ���������!");
    }
}
function initfm(){
    try{
        initInpBoxfm();
        initUiminiGird();
        initUiminiDetailGird();
    }catch(re){
        alert("LAAgentInputInit.jsp-->InitFormfm�����з����쳣:��ʼ���������!");
    }
}
function initUiminiGird(){
    var iArray = new Array();
    var i = 0;
    try{
        iArray[i]=new Array();
        iArray[i][0]="No."; //����
        iArray[i][1]="30px"; //�п�
        iArray[i][2]=100; //�����ֵ
        iArray[i][3]=1; //�Ƿ��������룬0��ʾ������1��ʾ����2��ʾ����ѡ��3��ʾ����
        iArray[i][4]=''; //�Ƿ����ô���: null����" "Ϊ������
        iArray[i][5]=i+"|"+0; //��������з������ô����еڼ�λֵ
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
        //��Щ���Ա�����loadMulLineǰ
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
        iArray[i][0]="Finance Start Month"; //����
        iArray[i][1]="110px"; //�п�
        iArray[i][2]=100; //�����ֵ
        iArray[i][3]=1; //�Ƿ��������룬0��ʾ������1��ʾ����2��ʾ����ѡ��3��ʾ����
        iArray[i][4]=''; //�Ƿ����ô���: null����" "Ϊ������
        iArray[i][5]=i+"|"+0; //��������з������ô����еڼ�λֵ
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
        //��Щ���Ա�����loadMulLineǰ
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
